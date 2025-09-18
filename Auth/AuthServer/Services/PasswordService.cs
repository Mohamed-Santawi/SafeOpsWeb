using AuthServer.CustomException;
using AuthServer.CustomExceptions;
using AuthServer.Entity;
using AuthServer.Helper;
using Microsoft.AspNetCore.Identity;
using System.Text.RegularExpressions;

namespace AuthServer.Services
{
    public class PasswordService
    {
        #region Fields

        private readonly string passwordPattern = @"^[a-zA-Z0-9\-_\.\~]*$";


        private readonly UserManager<AppUserEntity> _userManager;
        private readonly IEmailService _emailService;

        #endregion

        #region Constructor 


        public PasswordService(UserManager<AppUserEntity> userManager, IEmailService emailService)
        {
            _userManager = userManager;
            _emailService = emailService;
        }




        #endregion


        #region Methods

        /// <summary>
        /// Ask for Updates the password for a user asynchronously.
        /// </summary>
        /// <param name="email">The email of the user.</param>
        /// <param name="newPassword">The new password to set for the user.</param>
        /// <param name="appUrl">The URL of the application.</param>
        /// <param name="appName">The name of the application.</param>
        /// <returns>
        /// A boolean indicating whether the password update was successful.
        /// </returns>
        public async Task<bool> UpdatePasswordAsync(string email, string newPassword, string appUrl, string appName)
        {
            var user = await _userManager.FindByEmailAsync(email);
            if (user == null)
            {
                throw new UserNotFoundException("Cannot find user by email.");
            }

            if (!Regex.IsMatch(newPassword, passwordPattern))
            {
                throw new InvaildPatternException(
                    "The input contains invalid characters. Please remove the following " +
                    "special characters: !, @, #, %, " +
                    "and others. Only letters, numbers, and the following " +
                    "symbols are allowed: -, _, ., ~. Please try again with a valid input."
                );
            }

            var token = await _userManager.GeneratePasswordResetTokenAsync(user);



            var resetLink = UriBuilderHelper.BuildResetPasswordUrl(appUrl, email, token, newPassword);

            // Send the reset link via email
            _emailService.SendEmail(user.Email, $"{appName} Reset Password", resetLink);

            return true;
        }

        #endregion
    }
}
