using Microsoft.AspNetCore.Identity;
using AuthServer.Entity;
using AuthServer.Services;

namespace AuthServer.Services
{
    public class IdentityEmailSender : IEmailSender<AppUserEntity>
    {
        private readonly IEmailService _emailService;

        public IdentityEmailSender(IEmailService emailService)
        {
            _emailService = emailService;
        }

        public Task SendEmailAsync(AppUserEntity user, string subject, string htmlMessage)
        {
            _emailService.SendEmail(user.Email, subject, htmlMessage);
            return Task.CompletedTask;
        }

        public Task SendConfirmationLinkAsync(AppUserEntity user, string email, string confirmationLink)
        {
            _emailService.SendEmail(email, "Confirm your email", $"Please confirm your account by clicking this link: {confirmationLink}");
            return Task.CompletedTask;
        }

        public Task SendPasswordResetLinkAsync(AppUserEntity user, string email, string resetLink)
        {
            _emailService.SendEmail(email, "Reset your password", $"Please reset your password by clicking this link: {resetLink}");
            return Task.CompletedTask;
        }

        public Task SendPasswordResetCodeAsync(AppUserEntity user, string email, string resetCode)
        {
            _emailService.SendEmail(email, "Reset your password", $"Your password reset code is: {resetCode}");
            return Task.CompletedTask;
        }
    }
}
