using AuthServer.Models;

namespace AuthServer.Services
{
    public interface IEmailService
    {
        void SendEmail(string recipient, string subject, string body);
    }
}
