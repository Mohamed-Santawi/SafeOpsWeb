using System.Text.RegularExpressions;
using AuthServer.Data;
using AuthServer.Models;
using Microsoft.AspNetCore.Mvc;
using AuthShared;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using AuthServer.Services;
using AuthShared.Models;
using Microsoft.EntityFrameworkCore;
using AuthServer.Entity;
using AuthServer.Manager;
using System.Collections;
using AuthServer.Procedures;
using AuthShared.Enums;
using AuthServer.CustomException;
using AuthServer.CustomExceptions;

namespace AuthServer.Controllers
{
    [ApiController]
    [Route("manage/[controller]")]
    [Authorize]
    public class UserController : ControllerBase
    {
        #region Fields
        private readonly UserManager<AppUserEntity> _userManager;
        private readonly IEmailService _emailService;
        private readonly ApplicationDbContext _context;
        private readonly MajorProcedures _majorProcedures;
        private readonly SectionProcedures _sectionProcedures;
        private readonly UserProcedures _userProcedures;
        private readonly RoleProcedure _roleProcedure;
        private readonly PasswordProcedures _passwordProcedures;


        private readonly IConfiguration _configuration;
        private readonly ILogger<UserController> _logger;
        private readonly PasswordService _passwordService;

        private readonly string? AppName;



        //Pattern for the UserController constructor

        private string _passwordPattern = @"^[a-zA-Z0-9\-_\.\~]*$";
        #endregion

        public UserController(UserManager<AppUserEntity> userManager,
            IEmailService emailService, ApplicationDbContext context
            , IConfiguration configuration,
            ILogger<UserController> iLogger,
            RoleManager<IdentityRole> roleManager,
            SectionProcedures sectionProcedures,
            MajorProcedures majorProcedures,
            UserProcedures userProcedures,
            RoleProcedure roleProcedure,
            PasswordProcedures passwordProcedures,
            PasswordService passwordService)
        {
            _userManager = userManager;
            _emailService = emailService;
            _context = context;
            _majorProcedures = majorProcedures;
            _sectionProcedures = sectionProcedures;
            _userProcedures = userProcedures;
            _roleProcedure = roleProcedure;
            _passwordProcedures = passwordProcedures;

            _configuration = configuration;

            _logger = iLogger;
            _passwordService = passwordService;

            AppName = _configuration["AppName"];
            _passwordService = passwordService;
        }

        [HttpGet("GetUserInfo")]
        [Authorize]
        public async Task<ActionResult<UserInformations>> GetUserInformation()
        {
            var identityUser = await _userManager.FindByNameAsync(User.Identity.Name);
            if (identityUser == null)
            {
                return NotFound();
            }

            var roles = await _userManager.GetRolesAsync(identityUser);
            var userMajor = await _context.UserMajor.FirstOrDefaultAsync(x => x.UserId == identityUser.Id);
            var userSection = await _context.UserSection.FirstOrDefaultAsync(x => x.UserId == identityUser.Id);


            var major = _context.Major.FirstOrDefault(x => x.Id == userMajor.MajorId);

            var section = _context.AppSections.FirstOrDefault(x => x.Id == userSection.SectionId);

            SectionSharedModel sectionMoel = new SectionSharedModel
            {
                id = userSection.SectionId,
                name = section.Name
            };

            MajorSharedModel majorModel = new MajorSharedModel
            {
                id = userMajor.MajorId,
                name = major.Name
            };

            var userInformations = new UserInformations
            {
                Email = identityUser.Email,
                UserName = identityUser.UserName,
                Role = roles.FirstOrDefault(),
                FirstName = identityUser.Firstname,
                MiddleName = identityUser.Middlename,
                LastName = identityUser.Lastname,
                PhoneNumber = identityUser.PhoneNumber,
                PhoneCode = identityUser.PhoneCode,
                Section = sectionMoel,
                Major = majorModel
            };

            return Ok(userInformations);
        }



        [HttpGet("GetUsers")]
        [Authorize]
        public async Task<ActionResult<IEnumerable<UserInformations>>> GetUsers()
        {

            try
            {
                var users = await _userManager.Users.ToListAsync();

                if (users == null || users.Count == 0)
                {
                    return NotFound("There are no users in the system.");
                }


                var userIds = users.Select(u => u.Id).ToList();


                var userMajors = await _context.UserMajor
                    .Where(um => userIds.Contains(um.UserId))
                    .ToListAsync();

                var majors = await _context.Major
                    .Where(m => userMajors.Select(um => um.MajorId).Contains(m.Id))
                    .ToListAsync();

                var userSections = await _context.UserSection
                    .Where(us => userIds.Contains(us.UserId))
                    .ToListAsync();

                var sections = await _context.AppSections
                    .Where(s => userSections.Select(us => us.SectionId).Contains(s.Id))
                    .ToListAsync();


                var userInformations = new List<UserInformations>();

                foreach (var user in users)
                {
                    var roles = await _userManager.GetRolesAsync(user);

                    var userMajor = userMajors.FirstOrDefault(um => um.UserId == user.Id);
                    var major = userMajor != null ? majors.FirstOrDefault(m => m.Id == userMajor.MajorId) : null;

                    var userSection = userSections.FirstOrDefault(us => us.UserId == user.Id);
                    var section = userSection != null ? sections.FirstOrDefault(s => s.Id == userSection.SectionId) : null;

                    userInformations.Add(new UserInformations
                    {
                        Id = user.Id,
                        UserName = user.UserName ?? string.Empty,
                        Email = user.Email ?? string.Empty,
                        PhoneNumber = user.PhoneNumber ?? string.Empty,
                        FirstName = user.Firstname ?? string.Empty,
                        MiddleName = user.Middlename ?? string.Empty,
                        LastName = user.Lastname ?? string.Empty,
                        PhoneCode = user.PhoneCode ?? string.Empty,
                        IsUserLocked = user.LockoutEnabled,
                        Role = roles.FirstOrDefault() ?? string.Empty,

                        Major = userMajor != null
                            ? new MajorSharedModel { id = userMajor.MajorId, name = major?.Name ?? "No Major Assigned" }
                            : new() { id = 0, name = "" },

                        Section = userSection != null
                            ? new SectionSharedModel { id = userSection.SectionId, name = section?.Name ?? "No Section Assigned" }
                            : new() { id = 0, name = "" }
                    });
                }

                return Ok(userInformations);

            }
            catch (Exception exception)
            {
                return StatusCode(500);
#if DEBUG
                return StatusCode(500, exception.Message);
#endif
            }

        }







        //forgot password reset controller
        [HttpPost("ResetPassword")]
        [AllowAnonymous]
        public async Task<ActionResult<ServerResponse>> ResetPassword([FromBody] ForgotPasswordModel forgotPasswordModel)
        {
            try
            {

                var appUrl = $"{Request.Scheme}://{Request.Host.Value}";
                var appName = _configuration["AppName"];


                bool result = await _passwordService.UpdatePasswordAsync(
                    forgotPasswordModel.Email,
                    forgotPasswordModel.NewPassword,
                    appUrl,
                    appName
                );

                if (result)
                {
                    return Ok(new ServerResponse
                    {
                        Type = "Success",
                        Title = "Email Sent",
                        Status = 200,
                        Detail = "The reset password link has been sent to the user's email."
                    });
                }
                else
                {
                    return BadRequest(new ServerResponse
                    {
                        Type = "Field",
                        Title = "Email sent",
                        Status = 404,
                        Detail = "The reset password link has not been reset"
                    });
                }
            }
            catch (UserNotFoundException ex)
            {

                return NotFound(new ServerResponse
                {
                    Type = "Error",
                    Title = "User Not Found",
                    Status = 404,
                    Detail = ex.Message
                });
            }
            catch (InvaildPatternException ex)
            {

                return BadRequest(new ServerResponse
                {
                    Type = "Error",
                    Title = "Invalid Password",
                    Status = 400,
                    Detail = ex.Message
                });
            }
            catch (Exception ex)
            {

                return StatusCode(500, new ServerResponse
                {
                    Type = "Error",
                    Title = "Internal Server Error",
                    Status = 500,
                    Detail = ex.Message
                });
            }
        }


        ////reset password controller
        //[HttpPost("ResetPassword")]
        //[AllowAnonymous]
        //public async Task<ActionResult<ServerResponse>> ResetPassword([FromQuery] ResetPasswordModel resetPasswordModel)
        //{
        //    var user = await _userManager.FindByEmailAsync(resetPasswordModel.Email);
        //    if (user == null)
        //    {
        //        return NotFound();
        //    }

        //    var result = await _userManager.ResetPasswordAsync(user, resetPasswordModel.Token, resetPasswordModel.NewPassword);
        //    if (result.Succeeded)
        //    {
        //        return Ok(new ServerResponse { Type = "Success", Title = "Password Reset", Status = 200, Detail = "Password reset successfully" });
        //    }
        //    return BadRequest(new ServerResponse { Type = "Error", Title = "Password Not Reset", Status = 400, Detail = result.Errors.ToList()[0].Description });
        //}


        [HttpPut("UpdateUser")]
        [Authorize]
        public async Task<ActionResult> UpdateUserInfo([FromQuery] RoleDeleteType roleDeleteType,
            UserInformations userInformations)
        {

            var user = await _userManager.FindByIdAsync(userInformations.Id);

            if (userInformations == null)
            {
                return BadRequest();
            }

            switch (roleDeleteType)
            {
                case RoleDeleteType.All:

                    try
                    {
                        var roles = await _userManager.GetRolesAsync(user);

                        await _roleProcedure.RemoveUserFromRoleAsync(roles.ToArray(), user);
                    }
                    catch(ArgumentNullException aurgmentNullExeption)
                    {

                    }

                    break;



            }

            try
            {
                await _userProcedures.UpdateUserInformationAsync(userInformations,true);
            }

            catch (EmailExistsException emailExistsException)
            {
                return Conflict("Email already exists");
            }
            catch (Exception exception)
            {
                return StatusCode(500);

#if DEBUG

                return StatusCode(500, exception.Message);

#endif
            }




            return Ok("updated user information successfully");

        }


        //get all users count
        [HttpGet("GetAllUsersCount")]
        [Authorize]
        public async Task<ActionResult<int>> GetAllUsersCount()
        {
            return await _userProcedures.GetAllUsersCountAsync();
        }

        [HttpPut("UpdateCurrentUser")]
        [Authorize]
        public async Task<ActionResult> UpdateCurrentUserInfo(
          [FromBody] UserInformations userInformations)
        {

            var user = await _userManager.FindByNameAsync(User.Identity.Name);

            if (userInformations == null)
            {
                return BadRequest();
            }

            try
            {
                userInformations.Id = user.Id;
                await _userProcedures.UpdateUserInformationAsync(userInformations, false);
            }

            catch (EmailExistsException emailExistsException)
            {
                return Conflict("Email already exists");
            }
            catch (Exception exception)
            {
                return StatusCode(500);

#if DEBUG

                return StatusCode(500, exception.Message);

#endif
            }




            return Ok("updated user information successfully");

        }

        [HttpPost("LockUser")]
        public async Task<IActionResult> LockUser([FromBody] UserLockModel model)
        {
            var (success, message) = await _userProcedures.LockOrUnlockUserAsync(model);

            if (success)
            {
                return Ok(new { Message = message });
            }
            else
            {
                return BadRequest(new { Message = message });
            }
        }


        //logout controller
        [HttpPost("Logout")]
        [Authorize]
        public async Task<ActionResult<ServerResponse>> Logout()
        {
            await _userManager.UpdateSecurityStampAsync(await _userManager.FindByNameAsync(User.Identity.Name));
            return Ok(new ServerResponse { Type = "Success", Title = "Logout", Status = 200, Detail = "Logout successfully" });
        }

        //create register user controller with register model

        [HttpPost("Register")]
        [AllowAnonymous]
        public async Task<ActionResult<ServerResponse>> Register([FromBody] RegisterModelShared registerModel)
        {
            var user = new AppUserEntity()
            {
                Email = registerModel.Email!,
                UserName = registerModel.Username!,
                Firstname = registerModel.FirstName!,
                Middlename = registerModel.MiddleName!,
                Lastname = registerModel.LastName!,
                PhoneCode = registerModel.phoneCode.ToString()!,
                PhoneNumber = registerModel.PhoneNumber.ToString()!,
                JobNumber = Convert.ToInt32(registerModel.JobNumber),
            };

            //Generate password to send it to the user by email
            var password = new PasswordManager().GeneratePassword(10);


#if DEBUG
            _logger.LogInformation($"Password: {password}");
#endif

            var userSection = new UserSectionEntity()
            {
                UserId = user.Id,
                SectionId = registerModel.SectionId,
                
            };

            var userMajor = new UserMajorEntity()
            {
                UserId = user.Id,
                MajorId = registerModel.MajorId
            };

            var userExists = await _userManager.FindByNameAsync(user.UserName);

            if (userExists is not null)
            {
                return BadRequest(new ServerResponse { Type = "Error", Title = "User Not Created", Status = 400, Detail = "Username already exists" });
            }

            var phoneExists = await _userManager.Users.FirstOrDefaultAsync(x => x.PhoneNumber == user.PhoneNumber);

            if (phoneExists is not null)
            {
                return BadRequest(new ServerResponse { Type = "Error", Title = "User Not Created", Status = 400, Detail = "Phone number already exists" });
            }


            var jobNumbr = _userManager.Users.FirstOrDefault(j => j.JobNumber == user.JobNumber);

            if(jobNumbr is not null)
            {
                return BadRequest(new ServerResponse { Type = "Error", Title = "User Not Created", Status = 400, Detail = "job number already exists" });

            }


            if (_context.Major.FirstOrDefault(x => x.Id == registerModel.MajorId) == null)
            {
                return BadRequest(new ServerResponse { Type = "Error", Title = "User Not Created", Status = 400, Detail = "Major not found" });
            }

            if (_context.AppSections.FirstOrDefault(x => x.Id == registerModel.SectionId) == null)
            {
                return BadRequest(new ServerResponse { Type = "Error", Title = "User Not Created", Status = 400, Detail = "Section not found" });
            }

            var result = await _userManager.CreateAsync(user, password);
            if (result.Succeeded)
            {


                await _context.UserSection.AddAsync(userSection);

                await _context.UserMajor.AddAsync(userMajor);

                await _context.SaveChangesAsync();

                await _roleProcedure.AddUserToRoleAsync(registerModel.Role, user);

                //send email
                var token = await _userManager.GenerateEmailConfirmationTokenAsync(user);
                var confirmationLink = Url.Action("ConfirmEmail", "User", new { email = user.Email, token }, Request.Scheme);
                _emailService.SendEmail(user.Email, $"{AppName} Confirm Email", confirmationLink + $"\n \n <h1> Your Password is :{password} </h1>");
                return Ok(new ServerResponse { Type = "Success", Title = "User Created", Status = 200, Detail = "User created successfully" });
            }
            return BadRequest(new ServerResponse { Type = "Error", Title = "User Not Created", Status = 400, Detail = result.Errors.ToList()[0].Description });
        }

        // Confirm email send
        [HttpPost("SendConfirmEmail")]
        [AllowAnonymous]
        public async Task<ActionResult<ServerResponse>> SendConfirmEmail([FromQuery] string email)
        {
            var user = await _userManager.FindByEmailAsync(email);
            if (await _userManager.IsEmailConfirmedAsync(user))
            {
                return StatusCode(304, "Email already confirmed");
            }
            if (user == null)
            {
                return NotFound();
            }

            var token = await _userManager.GenerateEmailConfirmationTokenAsync(user);
            var confirmationLink = Url.Action("ConfirmEmail", "User", new { email, token }, Request.Scheme);
            _emailService.SendEmail(email, $"{AppName} Confirm Email", confirmationLink + " \n \n <h1 style=\"color:Red\">" +
                                                                       "if you are Looking for password check the first email we sent to ya");
            return Ok(new ServerResponse { Type = "Success", Title = "Email Sent", Status = 200, Detail = confirmationLink });
        }



        [HttpGet("ConfirmResetPassword")]
        [AllowAnonymous]
        public async Task<ActionResult<string>> ConfirmResetPassword([FromQuery] string email, [FromQuery] string token,
            [FromQuery] string newPassword)
        {
            if (string.IsNullOrEmpty(email))
            {
                return BadRequest(new ServerResponse { Type = "Error", Title = "Invalid Input", Status = 400, Detail = "Email is required" });
            }

            if (string.IsNullOrEmpty(token))
            {
                return BadRequest(new ServerResponse { Type = "Error", Title = "Invalid Input", Status = 400, Detail = "Token is required" });
            }

            if (string.IsNullOrEmpty(newPassword))
                return BadRequest(new ServerResponse { Type = "Error", Title = "Invalid Input", Status = 400, Detail = "New password is required" });

            var result = await _passwordProcedures.UpdatePasswordAsync(email, token, newPassword);
            if (result)
            {
                return Ok(result);
            }

            else
            {
                return StatusCode(500);
            }


        }
        // Confirm email
        [HttpGet("ConfirmEmail")]
        [AllowAnonymous]
        public async Task<ActionResult<String>> ConfirmEmail([FromQuery] string email, [FromQuery] string token)
        {
            var user = await _userManager.FindByEmailAsync(email);
            if (user == null)
            {
                return NotFound();
            }

            var result = await _userManager.ConfirmEmailAsync(user, token);

            if (result.Succeeded)
            {
                var htmlContent = "<h1>Yay, email confirmed 😁</h1>";
                return new ContentResult
                {
                    Content = htmlContent,
                    ContentType = "text/html",
                    StatusCode = 200
                };
            }
            else
            {
                var htmlContent = "<h1>Oops, email not confirmed 😭</h1>";

                return new ContentResult
                {
                    Content = htmlContent,
                    ContentType = "text/html",
                    StatusCode = 400
                };
            }
        }
    }
}
