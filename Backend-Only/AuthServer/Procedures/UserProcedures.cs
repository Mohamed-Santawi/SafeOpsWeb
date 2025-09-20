using AuthServer.Entity;
using AuthServer.Manager;
using AuthShared.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Identity.Client;

namespace AuthServer.Procedures
{
    public class UserProcedures
    {
        #region Fields

        private readonly UserManager<AppUserEntity> _userManager;
        private readonly MajorProcedures _majorProcedures;
        private readonly RoleProcedure _roleProcedures;
        private readonly EmailProcedures _emailProcedures;
        private readonly PasswordProcedures _passwordProcedures;

        #endregion

        #region Constructor

        public UserProcedures(UserManager<AppUserEntity> userManager,
            RoleProcedure roleProcedures,
            MajorProcedures majorProcedures,
            EmailProcedures emailProcedures,
            PasswordProcedures passwordProcedures)
        {
            _userManager = userManager;
            _roleProcedures = roleProcedures;
            _majorProcedures = majorProcedures;
            _emailProcedures = emailProcedures;
            _passwordProcedures = passwordProcedures;
        }

        #endregion


        #region Methods

        public async Task<(bool Success, string Message)> LockOrUnlockUserAsync(UserLockModel model)
        {
            if (model == null || string.IsNullOrEmpty(model.UserId))
            {
                return (false, "Invalid request. UserId is required.");
            }

            var user = await _userManager.FindByIdAsync(model.UserId);

            if (user == null)
            {
                return (false, "User not found.");
            }

            if (model.LockDurationInMinutes > 0)
            {
                var lockoutEnd = DateTime.UtcNow.AddMinutes(model.LockDurationInMinutes);
                await _userManager.SetLockoutEnabledAsync(user, true);
                await _userManager.SetLockoutEndDateAsync(user, lockoutEnd);

                return (true, $"User locked until {lockoutEnd} UTC.");
            }
            else
            {
                await _userManager.SetLockoutEnabledAsync(user, false);
                await _userManager.SetLockoutEndDateAsync(user, null);

                return (true, "User unlocked successfully.");
            }
        }


        //get all users count
        public async Task<int> GetAllUsersCountAsync()
        {
            return await _userManager.Users.CountAsync();
        }





        /// <summary>
        /// this function will update the user informations by id
        /// </summary>
        /// <param name="userInformations"></param>
        /// <returns></returns>
        /// <exception cref="ArgumentNullException"></exception>
        public async Task<bool> UpdateUserInformationAsync(UserInformations userInformations,bool byHighRole)
        {
            if (userInformations == null)
            {
                throw new ArgumentNullException(nameof(userInformations));
            }


            if (string.IsNullOrEmpty(userInformations.Id))
            {
                throw new ArgumentNullException(nameof(userInformations.Id));
            }


            var user = await _userManager.FindByIdAsync(userInformations.Id);

            var majors = await _majorProcedures.GetUserMajorsAsync();


            // Update SecurityStamp for increased security (optional but recommended)
            user.SecurityStamp = Guid.NewGuid().ToString();

            //userName
            user.UserName = userInformations.UserName;


            //names
            user.Firstname = userInformations.FirstName;
            user.Middlename = userInformations.MiddleName;
            user.Lastname = userInformations.LastName;



            if (userInformations.Email != user.Email || userInformations.Email.Contains("[renew]"))
            {
                var password = new PasswordManager().GeneratePassword(10);
                bool result = await _emailProcedures.UpdateEmailAsync(userInformations.Email.Replace("[renew]",""), password, user);

                if (result)
                {
                    bool resultPasswordUpdate = await _passwordProcedures.UpdatePassword(userInformations.Email.Replace("[renew]",""), password);
                }
            }

            //phone
            user.PhoneNumber = userInformations.PhoneNumber;
            user.PhoneCode = userInformations.PhoneCode;


            if (byHighRole)
            {
                //role
                if (!string.IsNullOrEmpty(userInformations.Role))
                {
                    await _roleProcedures.AddUserToRoleAsync(userInformations.Role, user);
                }



                //userMajor


                await _majorProcedures.UpdateUserMajorAsync(userInformations.Major, userInformations.Id);



            }
            await _userManager.UpdateAsync(user);

            return true;
        }

        #endregion
    }
}
