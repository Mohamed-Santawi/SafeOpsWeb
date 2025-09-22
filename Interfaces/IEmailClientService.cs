using AuthShared.Models;

namespace SafeOpsWeb;

public interface IEmailClientService
{
    Task<ServerResponse> SendConfirmationEmail(string email);
    Task<ServerResponse> SendResetPasswordAsync(ForgotPasswordModel forgotPasswordModel);
}
