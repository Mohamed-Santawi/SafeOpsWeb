using AuthServer.CustomException;
using AuthServer.CustomExceptions;
using AuthServer.Entity;
using AuthServer.Helper;
using AuthServer.Services;
using AuthShared.Models;
using Microsoft.AspNetCore.Identity;
using System.Text.RegularExpressions;

namespace AuthServer.Procedures
{
    public class PasswordProcedures
    {
        #region Fields

        private readonly string _passwordPattern = @"^[a-zA-Z0-9\-_\.\~]*$";
        private readonly UserManager<AppUserEntity> _userManager;
        private readonly IEmailService _emailService;

        #endregion

        #region Constructor 

        public PasswordProcedures(UserManager<AppUserEntity> userManager, IEmailService emailService)
        {
            _userManager = userManager;
            _emailService = emailService;
        }

        #endregion

        #region Methods

        public async Task<bool> UpdatePasswordAsync(string email, string token, string newPassword)
        {
            if (string.IsNullOrEmpty(newPassword)) throw new ArgumentNullException(nameof(newPassword));

            var user = await _userManager.FindByEmailAsync(email);

            if (user is null)
            {
                throw new UserNotFoundException(nameof(email));
            }


            var result = await _userManager.ResetPasswordAsync(user, token, newPassword);


            if (result.Succeeded)
            {
                return true;
            }

            return false;



        }

        public async Task<bool> UpdatePassword(string email, string newPassword)
        {

            var user = await _userManager.FindByEmailAsync(email);

            if (user == null)
            {
                throw new Exception("User not found.");
            }



            var hashedPassword = _userManager.PasswordHasher.HashPassword(user, newPassword);


            user.PasswordHash = hashedPassword;


            var result = await _userManager.UpdateAsync(user);


            if (!result.Succeeded)
            {
                var errors = string.Join(", ", result.Errors.Select(e => e.Description));
                throw new Exception($"Failed to update password: {errors}");
            }

            return true;
        }





    }

    #endregion
}
