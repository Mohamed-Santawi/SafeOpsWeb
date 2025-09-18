using AuthShared.Models;

namespace SafeOpsBlazor;

public interface IEmailClientService
{
    Task<ServerResponse> SendConfirmationEmail(string email);
    Task<ServerResponse> SendResetPasswordAsync(ForgotPasswordModel forgotPasswordModel);
}