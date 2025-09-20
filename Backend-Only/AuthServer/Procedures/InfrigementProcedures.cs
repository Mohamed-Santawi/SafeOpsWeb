using AuthServer.Data;
using AuthServer.Entity;
using AuthShared.DTOs;
using AuthShared.Enums;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;
using System.Linq;
using AuthServer.CustomException;
using AuthServer.CustomExceptions;
using AuthShared.Models;

namespace AuthServer.Procedures
{
    public class InfrigementProcedures
    {
        #region Fields

        ApplicationDbContext _context;  
        AppUserDataContext _appUserDataContext;
        RoleManager<IdentityRole> _roleManager;
        UserManager<AppUserEntity> _userManager;

        IConfiguration _configuration;

        #endregion

        #region Constructor

        public InfrigementProcedures(ApplicationDbContext context, 
            AppUserDataContext appUserDataContext,
            RoleManager<IdentityRole> roleManager,
            UserManager<AppUserEntity> userManager,
            IConfiguration configuration)
        {
            _context = context;
            _appUserDataContext = appUserDataContext;
            _roleManager = roleManager;
            _userManager = userManager;
            _configuration = configuration;
        }

        #endregion

        #region Methods

        //get infringement by id
        public async Task<InfrigementDTO> GetInfrigementById(int id)
        {
            var infringement = await _context.Infringements
                .Include(i => i.Trainee)
                .Where(i => i.Id == id)
                .Select(i => new InfrigementDTO()
                {
                    id = i.Id,
                    traineeId = i.TraineeId,
                    rate = i.Rate,
                    isTraineeReported = i.IsTraineeReported,
                    infringementProcess = i.InfringementProcess,
                    infringementCount = i.InfringementCount,
                    Note = i.Note,
                    regulationId = i.RegulationId,
                    trainee = new TraineeDTO()
                    {
                        name = i.Trainee.Name,
                        nationalId = i.Trainee.NationalId,
                        academyId = i.Trainee.AcademyId
                    }
                })
                .FirstOrDefaultAsync();
            if (infringement == null)
            {
                throw new NoInfringementFoundException("Infringement not found");
            }
            return infringement;
        }

        //get forwareded infringements
        public async Task<IEnumerable<ForwardEntity>> GetForwardedInfringements(string userName)
        {


            var user = await _userManager.FindByNameAsync(userName);

            if (user == null)
            {
                throw new UserNotFoundException("User not found");
            }

            //get the role of the user
            var userRoles = await _userManager.GetRolesAsync(user);

            if (userRoles is null || userRoles.Count <= 0)
            {
                throw new RoleNotFoundException("Role not found");
            }

            var userRole = await _roleManager.FindByNameAsync(userRoles.FirstOrDefault());

            if (userRole == null)
            {
                throw new RoleNotFoundException("Role not found");
            }

            



            var taaRoleId = _configuration["UserRoles:TAA"];

            if (userRole.Id == taaRoleId)
            {
                var forwardedInfringements = await _context.Forward
                    .Where(f => f.RoleId == taaRoleId)
                    .ToListAsync();

                if(forwardedInfringements is null)
                {
                    throw new NoInfringementFoundException("No infringements found");
                }

                return forwardedInfringements;
            }

            else
            {


                var forwardedInfrigments = await _context.Forward
                    .Where(f => f.UserId == user.Id).ToListAsync();

                if(forwardedInfrigments is null || forwardedInfrigments.Count <= 0)
                {
                    throw new NoInfringementFoundException("No infringements found");
                }
                else
                {
                    return forwardedInfrigments;
                }
            }

        }

        //get all infringement count with any role
        public async Task<int> GetInfringementCount()
        {
            return await _context.Infringements
                .CountAsync();
        }

        //get forwarded infringements count
        public async Task<int> GetForwardedInfringementsCount()
        {
            return await _context.Forward
                .CountAsync();
        }





        //get violation procedures by regulation id
        public async Task<IEnumerable<ViolationProceduresEntity>> GetInfrigementByRegulationId(int regulationId) 
            =>  _context.ViolationProcedures.Where(v => v.RegulationId == regulationId).ToList();

        public async Task<IEnumerable<InfrigementDTO>> GetInfrigementByCurrentUser(AppUserEntity userEntity,
        int current,
        int max,
        InfringementProcess? infringementProcess = null,
        int? Id = null,
        string ?name = null,
        int ?nationalId = null)
        {

            AppUserEntity appUser = userEntity;




            if (appUser == null)
            {
                throw new UserNotFoundException("User not found");
            }



            var query = _context.Infringements
                .Include(i => i.Trainee)
                .AsNoTracking()
                .AsQueryable()
                .Where(i => i.Id == Id || Id == null)
                .Where(i => i.TrainerId == appUser.Id)
                .Where(i => i.Trainee.NationalId == nationalId || nationalId == null)
                .Where(i => i.Trainee.Name.Contains(name) || string.IsNullOrEmpty(name))
                .Where(I => I.InfringementProcess == infringementProcess || infringementProcess == InfringementProcess.All
                || infringementProcess == null)
                .Skip((current - 1) * max)
                .Take(max)
                .Select(i => new InfrigementDTO()
                {
                    id = i.Id,
                    traineeId = i.TraineeId,
                    rate = i.Rate,
                    isTraineeReported = i.IsTraineeReported,
                    infringementProcess = i.InfringementProcess,
                    infringementCount = i.InfringementCount,
                    Note = i.Note,
                    regulationId = i.RegulationId,
                    trainee = new TraineeDTO()
                    {
                        name = i.Trainee.Name,
                        nationalId = i.Trainee.NationalId,
                        academyId = i.Trainee.AcademyId
                    }
                });

            var infringements = await query.ToListAsync();


            return infringements;
        }


        //update the infringement
        public async Task<bool> UpdateInfringement(InfringementShared infringementShared)
        {
            var infringement = await _context.Infringements
                .Where(i => i.Id == infringementShared.Id)
                .FirstOrDefaultAsync();
            if (infringement == null)
            {
                throw new NoInfringementFoundException("Infringement not found");
            }
            infringement.Rate = infringementShared.Rate;
            infringement.IsTraineeReported = infringementShared.IsTraineeReported;
            infringement.InfringementProcess = infringementShared.InfringementProcess;
            infringement.InfringementCount = infringementShared.InfringementCount;
            infringement.Note = infringementShared.InfrigementNote;
            infringement.IsInfringementProceeddByTrainee = infringementShared.IsViolationProceedByTrainee;
            _context.Infringements.Update(infringement);
            int result = await _context.SaveChangesAsync();
            bool isUpdated = result > 0 ? true : false;
            return isUpdated;
        }

        //add a new infringement to the database
        public async Task<InfringementShared> AddInfringement(InfringementShared infringement, string userName)
        {
            if (infringement == null)
                throw new ArgumentNullException(nameof(infringement), "Infringement is null");

            
            var user = await _userManager.FindByNameAsync(userName)
                ?? throw new UserNotFoundException("User not found");

            var userSection = _context.UserSection.FirstOrDefault(us => us.UserId == user.Id)
                ?? throw new UserNotFoundException("User section not found");

           
            var trainee = await _context.Trainee.FirstOrDefaultAsync(t => t.Id == infringement.Trainee.Id)
                ?? throw new NoTrainnesFoundException("Trainee not found");

            
            var regulation = await _context.Regulations.FirstOrDefaultAsync(r => r.Id == infringement.RegulationId)
                ?? throw new NoRegulationsFoundException();

            
            var infringementCount = _context.Infringements.Count(i => i.TraineeId == infringement.Trainee.Id && i.RegulationId == infringement.RegulationId);

            
            if (trainee.BehaviorScore > 0)
            {
                trainee.BehaviorScore = Math.Max(0, trainee.BehaviorScore - regulation.Point); 
                _context.Trainee.Update(trainee);
            }


            var infringementEntity = new InfringementEntity
            {
                TraineeId = infringement.Trainee.Id,
                Rate = infringement.Rate,
                IsTraineeReported = infringement.IsTraineeReported,
                InfringementProcess = infringement.InfringementProcess,
                InfringementCount = infringementCount + 1,
                Date = DateOnly.FromDateTime(DateTime.Now),
                RegulationId = infringement.RegulationId,
                SectionId = userSection.SectionId,
                TrainerId = user.Id,
                IsInfringementProceeddByTrainee = infringement.IsViolationProceedByTrainee,
                Note = infringement.InfrigementNote,
               

            };

            // إضافة المخالفة وحفظ التغييرات
            _context.Infringements.Add(infringementEntity);
            await _context.SaveChangesAsync();


            var newInfringement = new InfringementShared()
            {
                Id = infringementEntity.Id,
                 InfrigementNote = infringement.InfrigementNote,
                  Trainee = infringement.Trainee,
                IsViolationProceedByTrainee = infringement.IsViolationProceedByTrainee,
                Rate = infringement.Rate,
                IsTraineeReported = infringement.IsTraineeReported,
                InfringementProcess = infringement.InfringementProcess,
                InfringementCount = infringementCount + 1,
                Date = DateOnly.FromDateTime(DateTime.Now),
                RegulationId = infringement.RegulationId,
            };

            return newInfringement;
        }




        public async Task<IEnumerable<InfrigementRateSharedModel>> GetViolationRateByRole(string userName)
        {
     
            var currentUser = await _userManager.FindByNameAsync(userName)
                               ?? throw new UserNotFoundException("Sorry but we cannot find your User in our system");

            
            var userRoleName = (await _userManager.GetRolesAsync(currentUser)).FirstOrDefault()
                               ?? throw new RoleNotFoundException("Role not found");

            
            var identityRole = await _roleManager.FindByNameAsync(userRoleName)
                               ?? throw new RoleNotFoundException("Role not found in the system");

           
            var roleViolationRates = _context.RoleViolationLevel
                                            .Where(r => r.RoleId == identityRole.Id)
                                            .ToList();

            
            var infringementRateSharedModels = roleViolationRates.Select(role => new InfrigementRateSharedModel
            {
                Id = role.ViolationLevelId,
                Name = _context.ViolationsLevel.FirstOrDefault(vl => vl.Id == role.ViolationLevelId)?.Name
            }).ToList();

            return infringementRateSharedModels;

        }

        public async Task<IEnumerable<ViolationsLevelEntity>> GetAllViolationsLevel()
        {



            var violationsLevel = await _context.ViolationsLevel.ToListAsync();

            if(violationsLevel is null || violationsLevel.Count <= 0)
            {
                throw new NoViolationsLevelFoundException();
            }
            else
            {
                return violationsLevel;
            }
        }

        //get all infringements levels
        public async Task<IEnumerable<InfrigementRateSharedModel>> GetAllInfrigementRates()
        {
            var infrigementRates = await _context.ViolationsLevel
                .Select(ir => new InfrigementRateSharedModel
                {
                    Id = ir.Id,
                    Name = ir.Name,
                })
                .ToListAsync();


            if (infrigementRates is null || infrigementRates.Count <= 0)
            {
                throw new NoInfrigementRatesFoundException("There no violations levels in db");
            }
            else
            {
                return infrigementRates;
            }
        }

        //close the infringement

        public async Task<bool> CloseInfringement(int infringementId,
            InfringementProcess infringementProcess)
        {
            var infringement = await _context.Infringements
                .Where(i => i.Id == infringementId)
                .FirstOrDefaultAsync();
            if (infringement == null)
            {
                throw new NoInfringementFoundException("");
            }
            infringement.InfringementProcess = infringementProcess;
            _context.Infringements.Update(infringement);
            int result = await _context.SaveChangesAsync();
            bool isUpdated = result > 0 ? true : false;
            return isUpdated;
        }

        //forward the infringement to the head section or the trainees affairs agency
        public async Task<bool> ForwardInfringement(int infringementId, 
            InfrigementForwardOptions infrigementFowardOptions,
            int traineeId,
            string userName)
        {
            //check if trainee exists
            var trainee = await _context.Trainee
                .Where(t => t.Id == traineeId)
                .FirstOrDefaultAsync() ?? throw new NoTrainnesFoundException("Trainee not found");



            //check if infringement exists
            var infringement = await _context.Infringements
                .Where(i => i.Id == infringementId)
                .FirstOrDefaultAsync() ?? throw new NoInfringementFoundException("Infringement not found");

            //check if the infringement is already forwarded



            var currentUser = await _userManager.FindByNameAsync(userName)
    ?? throw new UserNotFoundException("User not found");

            if (infrigementFowardOptions == InfrigementForwardOptions.TraineesAffairsAgency)
            {

                //check if the infringement is already forwarded to the trainees affairs agency
                var isForwarded = await _context.Forward
                    .Where(f => f.InfringementId == infringementId && f.RoleId == _configuration["UserRoles:TAA"])
                    .FirstOrDefaultAsync();

                if (isForwarded is not null)
                    return false;

                var roleId = await _roleManager.Roles
                    .Where(r => r.Id == _configuration["UserRoles:TAA"])
                    .Select(r => r.Id)
                    .FirstOrDefaultAsync();

                if(string.IsNullOrEmpty(roleId))
                {
                    throw new RoleNotFoundException($"Role {_configuration["UserRoles:TAA"]} not found");
                }

                ForwardEntity forwardEntity = new ForwardEntity
                {
                    InfringementId = infringementId,
                    RoleId = roleId,
                    Date = DateOnly.FromDateTime(DateTime.Now),
                     ForwardedFrom = currentUser.Id,
                    TraineeId = traineeId
                };

                _context.Forward.Add(forwardEntity);
                int result = await _context.SaveChangesAsync();

                bool isAdded = result > 0 ? true : false;

                return isAdded;
            }



            if (infrigementFowardOptions == InfrigementForwardOptions.HeadSection)
            {



                var sectionId =  _context.UserSection
                    .Where(us => us.UserId == currentUser.Id)
                    .FirstOrDefault().SectionId;


                if(sectionId == null || sectionId <= 0)
                {
                    throw new NoSectionFoundException("Section not found");
                }

                
                var headSectionUserId = _context.UserSection
                    .Where(us => us.SectionId == sectionId && us.IsHead == true)
                    .FirstOrDefault().UserId;

                //check if the infringement is already forwarded to the head section
                var isForwarded = await _context.Forward
                    .Where(f => f.InfringementId == infringementId && f.UserId == headSectionUserId)
                    .FirstOrDefaultAsync();

                if (isForwarded is not null)
                    return false;

                if (string.IsNullOrEmpty(headSectionUserId))
                {
                    throw new UserNotFoundException("Head section user not found");
                }

                ForwardEntity forwardEntity = new ForwardEntity
                {
                    InfringementId = infringementId,
                    UserId = headSectionUserId,
                    Date = DateOnly.FromDateTime(DateTime.Now),
                    ForwardedFrom = currentUser.Id,
                    TraineeId = traineeId
                };

                _context.Forward.Add(forwardEntity);
                int result = await _context.SaveChangesAsync();

                bool isAdded = result > 0 ? true : false;

                return isAdded;
            }


            return false;
        }

        public async Task<IEnumerable<RegulationsEntity>> GetRegulationByInfringementId(int violationLevelId)
        {
            var regulations = await _context.Regulations
                .Where(r => r.ViolationLevelId == violationLevelId)
                .ToListAsync();

            if (regulations is null)
            {
                throw new NoRegulationsFoundException();
            }
            else
            {
                return regulations;
            }
        }


        #endregion

    }
}
