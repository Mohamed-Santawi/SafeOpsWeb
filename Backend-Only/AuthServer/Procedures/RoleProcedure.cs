using AuthServer.Entity;
using Microsoft.AspNetCore.Identity;
using Microsoft.IdentityModel.Tokens;
using System.Data;

namespace AuthServer.Procedures
{
    public class RoleProcedure
    {
        #region Fields

        UserManager<AppUserEntity> _userManager;
        RoleManager<IdentityRole> _roleManager;

        #endregion

        #region Constructor 

        public RoleProcedure(UserManager<AppUserEntity> userManager,
            RoleManager<IdentityRole> roleManager)
        {
            _userManager = userManager;
            _roleManager = roleManager;
        }

        #endregion

        #region Methods

        public async Task<bool> AddUserToRoleAsync(string roleName,AppUserEntity user)
        {
            if(string.IsNullOrEmpty(roleName))
                throw new ArgumentNullException(nameof(roleName));

            await _userManager.AddToRoleAsync(user, roleName);


           var identityResult = await _userManager.UpdateAsync(user);

            if (identityResult.Succeeded) return true;

            else return false;

        }



        public async Task<bool> RemoveUserFromRoleAsync(string[] roles,AppUserEntity user)
        {

            if (roles is null || roles.Length <= 0)
                throw new ArgumentNullException(nameof(roles));

            if (user is null)
                throw new ArgumentNullException(nameof(user));

            foreach (string role in roles)
            {
                if (string.IsNullOrEmpty(role))
                    throw new ArgumentNullException(nameof(role));



                var identityResult = await _userManager.RemoveFromRoleAsync(user, role);

                if (identityResult.Succeeded) continue;

                else return false;
            }

            return true;
        }

        #endregion
    }
}
