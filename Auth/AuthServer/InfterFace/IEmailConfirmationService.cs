using AuthServer.Entity;
using Microsoft.AspNetCore.Identity;

namespace AuthServer.InfterFace
{
    public interface IEmailConfirmationService
    {
        Task SendConfirmationEmailAsync(AppUserEntity user, string password);
    }

}
