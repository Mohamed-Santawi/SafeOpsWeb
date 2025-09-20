using AuthServer.Data;
using AuthServer.Entity;
using AuthShared.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Identity.Client;
using AuthServer.CustomException;

namespace AuthServer.Procedures
{
    public class MajorProcedures
    {
        #region Fields

        ApplicationDbContext _context;
        UserManager<AppUserEntity> _userManager;

        #endregion

        #region Constructors

        public MajorProcedures(ApplicationDbContext applicationDbContext,
            UserManager<AppUserEntity> userManager)
        {
            this._context = applicationDbContext;

            this._userManager = userManager;
        }

        #endregion

        #region Methods

        public async Task<IEnumerable<MajorEntity>> GetMajorsAsync()
        {
            return await _context.Major.ToListAsync();
        }


        public async Task<UserMajorSharedModel> GetCurrentMajorUser(string userName)
        {
            
            if(string.IsNullOrEmpty(userName))
            {
                throw new ArgumentNullException(nameof(userName));
            }


            var user = await _userManager.FindByNameAsync(userName)
                ?? throw new NoUserFoundException("");


            var userMajor =  _context.UserMajor.Where(um => um.UserId ==  user.Id).FirstOrDefault()
                ?? throw new NoUserMajorFound("No major for user");

            var major = _context.Major.Where(m => m.Id == userMajor.MajorId).FirstOrDefault() 
                ?? throw new NoMajorFoundException($"No Major found for {userMajor.MajorId}");

            var userMajorModel = new UserMajorSharedModel()
            {
                Id = major.Id,
                MajorId = major.Id,
                MajorName = major.Name,
                UserId = user.Id,
            };


            return userMajorModel;
           
        }


        public async Task<bool> UpdateUserMajorAsync(MajorSharedModel newMajor,string userId)
        {
            if(newMajor is null)
            {
                throw new ArgumentNullException($"{nameof(newMajor)}");
            }


            if (string.IsNullOrEmpty(userId))
            {
                throw new ArgumentNullException(nameof(userId));
            }

            var user = await _userManager.FindByIdAsync(userId);

            var userMajorEntity = await _context.UserMajor.FirstOrDefaultAsync(um => um.UserId == user.Id);

            if (userMajorEntity == null)
            {
                throw new InvalidOperationException("User major not found.");
            }

            
            userMajorEntity.MajorId = newMajor.id;

            _context.UserMajor.Update(userMajorEntity);
            var result = await _context.SaveChangesAsync();

            if (result >= 1)
            {
                return true;
            }
            else
                return false;
        }

        public async Task<IEnumerable<UserMajorEntity>> GetUserMajorsAsync()
        {
            return await _context.UserMajor.ToListAsync();
        }

        //Get all trainee majors from the database
        public async Task<IEnumerable<TraineeMajorEntity>> GetAllMajors()
        {
            return await _context.TraineeMajor.ToListAsync();
        }




        #endregion
    }
}
