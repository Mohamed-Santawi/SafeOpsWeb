using AuthServer.Data;
using AuthServer.Entity;
using AuthShared.Models;
using AuthShared.Enums;
using Microsoft.AspNetCore.Identity;
using AuthServer.CustomException;
using Microsoft.EntityFrameworkCore;

namespace AuthServer.Procedures
{
    public class MaintenanceProcedure
    {
        #region Fields
        ApplicationDbContext _context;
        AppUserDataContext _appUserDataContext;

        UserManager<AppUserEntity> _userManager;

        #endregion

        #region Constructor

        public MaintenanceProcedure(ApplicationDbContext context,
            AppUserDataContext appUserDataContext, UserManager<AppUserEntity> userManager)
        {
            _context = context;
            _appUserDataContext = appUserDataContext;
            _userManager = userManager;
        }

        #endregion

        #region Methods

        //get maintenance count
        public async Task<int> GetMaintenanceCountAsync()
        {
            return await _context.MaintenanceOrder.CountAsync();
        }
        public async Task<bool> EditOnOrderAsync(MaintenanceOrderSharedModel maintenanceOrderSharedModel)
        {

            var maintenanceOrder = await _context.MaintenanceOrder.FindAsync(maintenanceOrderSharedModel.Id);

            if (maintenanceOrder == null)
            {
                throw new NoMaintenanceOrder("Maintenance order not found.");
            }

            maintenanceOrder.Status = maintenanceOrderSharedModel.Status;

            if(maintenanceOrder.Status == MaintenanceOrderStatus.NotProcessed)
            {
                maintenanceOrder.NotPrecededReason = maintenanceOrderSharedModel.NotProcessedReason;
            }

            _context.MaintenanceOrder.Update(maintenanceOrder);
            var result =  await _context.SaveChangesAsync();
            if(result > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public async Task<bool> AddMaintenanceOrderAsync(string currentUser, MaintenanceOrderSharedModel maintenanceOrderSharedModel)
        {

            if (maintenanceOrderSharedModel is null || string.IsNullOrEmpty(maintenanceOrderSharedModel.Title)
                || string.IsNullOrEmpty(maintenanceOrderSharedModel.Description)
                || string.IsNullOrEmpty(maintenanceOrderSharedModel.FileName)
                || string.IsNullOrEmpty(maintenanceOrderSharedModel.FileExtension))
            {
                throw new ArgumentNullException(nameof(maintenanceOrderSharedModel));
            }



            AppUserEntity appUserEntity = await _userManager.FindByNameAsync(currentUser);





            // Add Maintenance Order
            MaintenanceOrderEntity maintenanceOrder = new MaintenanceOrderEntity()
            {
                Title = maintenanceOrderSharedModel.Title,
                Description = maintenanceOrderSharedModel.Description,
                Status = MaintenanceOrderStatus.Pending,
                FileName = maintenanceOrderSharedModel.FileName + maintenanceOrderSharedModel.FileExtension,
                UserId = appUserEntity.Id,
                NotPrecededReason = string.Empty
            };

            _context.MaintenanceOrder.Add(maintenanceOrder);

            var result = await _context.SaveChangesAsync();

            if(result > 0)
            {
                return true;
            }

            else
            {
                return false;
            }
        }


        public async Task<MaintenanceOrderResult> GetOrdersAsync(int current, int max, MaintenanceOrderStatus maintenanceOrderStatus, int? Id = null)
        {

            var query = _context.MaintenanceOrder.AsQueryable();


            if (Id.HasValue)
            {
                query = query.Where(o => o.Id == Id.Value);
            }


            if (maintenanceOrderStatus != MaintenanceOrderStatus.All)
            {
                query = query.Where(o => o.Status == maintenanceOrderStatus);
            }


            var orders = await query
                .Skip(current * max)
                .Take(max)
                .Select(o => new MaintenanceOrderSharedModel
                {
                    Id = o.Id,
                    Title = o.Title,
                    Description = o.Description,
                    Status = o.Status,
                    FileName = o.FileName,
                    OrderBy = new UserInformations
                    {
                        Id = o.UserId
                    },
                    NotProcessedReason = o.NotPrecededReason
                })
                .ToListAsync();


            if (!orders.Any())
            {
                throw new NoMaintenanceOrder("Cannot find orders");
            }


            foreach (var order in orders)
            {
                var user = await _userManager.FindByIdAsync(order.OrderBy.Id);
                order.OrderBy.FirstName = user?.Firstname;
                order.OrderBy.LastName = user?.Lastname;
            }

            // التحقق من وجود صفحات إضافية
            bool isThereNextResult = await query
                .Skip((current + 1) * max)
                .AnyAsync();

            // إعادة النتيجة
            return new MaintenanceOrderResult
            {
                isThereNextResult = isThereNextResult,
                maintenanceOrderSharedModels = orders
            };
        }



    }

    #endregion
}
