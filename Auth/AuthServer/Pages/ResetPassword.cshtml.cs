using System.ComponentModel.DataAnnotations;
using AuthServer.Entity;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.JSInterop;

namespace AuthServer.Pages
{
    public class ResetPasswordModel : PageModel
    {
        #region Fields

        string _email;
        string _token;
        string _newPassword;
        UserManager<AppUserEntity> _userManager;

        #endregion


        public ResetPasswordModel(UserManager<AppUserEntity> userManager)
        {
            _userManager = userManager; 
        }


        public void OnGet()
        {

        }




    }
}
