using AuthShared.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace AuthServer.Controllers
{
    [Route("manage/[controller]")]
    public class RoleController : Controller
    {

        #region Fields

        public RoleManager<IdentityRole> _roleManager { get; set; }

        #endregion

        #region Constructor

        public RoleController(RoleManager<IdentityRole> roleManager)
        {
            _roleManager = roleManager;
        }


        #endregion


        #region Methods

        [HttpGet("GetRoles")]
        [Authorize]
        public async Task<ActionResult<IEnumerable<RoleSharedModel>>> GetRoles()
        {

            try
            {
                var roles = _roleManager.Roles.ToList();

                var roleSharedModels = roles.Select(x => new RoleSharedModel
                {
                    Id = x.Id,
                    Name = x.Name,
                });


                if (!roleSharedModels.Any())
                {
                    return NotFound("No roles found");
                }

                return Ok(roleSharedModels);
            }
            catch (Exception ex)
            {
                return StatusCode(500);

               #if DEBUG 

                return StatusCode(500, ex.Message);

                #endif
            }
        }

        #endregion
    }
}
