using AuthServer.Entity;
using AuthServer.InfterFace;
using Microsoft.AspNetCore.Identity;

namespace AuthServer.Services
{
    public class EmailConfirmationService : IEmailConfirmationService
    {
        private readonly UserManager<AppUserEntity> _userManager;
        private readonly IEmailService _emailService;
        private readonly IConfiguration _configuration;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public EmailConfirmationService(
            UserManager<AppUserEntity> userManager,
            IEmailService emailService,
            IConfiguration configuration,
            IHttpContextAccessor httpContextAccessor)
        {
            _userManager = userManager;
            _emailService = emailService;
            _configuration = configuration;
            _httpContextAccessor = httpContextAccessor;
        }

        public async Task SendConfirmationEmailAsync(AppUserEntity user, string password)
        {
            if (user == null)
                throw new ArgumentNullException(nameof(user));

            var token = await _userManager.GenerateEmailConfirmationTokenAsync(user);

            var httpRequest = _httpContextAccessor.HttpContext.Request;

            var confirmationLink = $"{httpRequest.Scheme}://{httpRequest.Host}" +
                $"/manage/User/ConfirmEmail?email={user.Email}&token={Uri.EscapeDataString(token)}";

            var appName = _configuration["AppName"] ?? "MyApp";

            var emailBody = $"{confirmationLink}<br><br><h1>Your Password is: {password}</h1>";

            _emailService.SendEmail(user.Email, $"{appName} Confirm Email", emailBody);
        }
    }

}
