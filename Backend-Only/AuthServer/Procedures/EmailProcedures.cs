using AuthServer.CustomException;
using AuthServer.Entity;
using AuthServer.InfterFace;
using AuthServer.Manager;
using Microsoft.AspNetCore.Identity;

namespace AuthServer.Procedures
{
    public class EmailProcedures
    {
        #region Fields

        private readonly UserManager<AppUserEntity> _userManager;
        private readonly IEmailConfirmationService _emailConfirmationService;

        #endregion


        #region Constructor

        public EmailProcedures(UserManager<AppUserEntity> userManager,
            IEmailConfirmationService emailConfirmationService)
        {
            _userManager = userManager;
            _emailConfirmationService = emailConfirmationService;
        }

        #endregion


        #region Methods


       

        public async Task<bool> UpdateEmailAsync(string email,string password,AppUserEntity user)
        {

            if (string.IsNullOrEmpty(email))
            {
                throw new ArgumentNullException(nameof(email));
            }

            var userEmail =  await _userManager.FindByEmailAsync(email);

            if (userEmail is not null && userEmail.Id != user.Id)
                throw new EmailExistsException("Email already exists");

            user.Email = email;



            user.EmailConfirmed = false;

            await _emailConfirmationService.SendConfirmationEmailAsync(user, password);

            await _userManager.UpdateAsync(user);


            return true;
        }

        #endregion
    }
}
