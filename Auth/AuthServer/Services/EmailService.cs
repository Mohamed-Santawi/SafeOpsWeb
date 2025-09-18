using AuthServer.Models;
using System.Net.Mail;

namespace AuthServer.Services
{

    public static class EmailServiceHelper
    {
        public static IServiceCollection AddEmailService(this IServiceCollection services, EmailService.EmailServiceType emailServiceType)
        {
            IConfiguration configuration = services.BuildServiceProvider().GetService<IConfiguration>();
            services.AddScoped<IEmailService,EmailService>(Email =>
            {
                EmailService emailService = new EmailService(configuration, emailServiceType);
                return emailService;
            });
            return services;
        }
    }

    public class EmailService : IEmailService
    {
        #region Fields
        private readonly IConfiguration _configuration;
        private readonly MailModel mailModel;
        #endregion

        #region Enums
        public enum EmailServiceType
        {
            Gmail,
            Yahoo,
            Outlook
        }
        #endregion

        public EmailService(IConfiguration configuration, EmailServiceType emailServiceType)
        {
            _configuration = configuration;

          
            switch (emailServiceType)
            {
                case EmailServiceType.Gmail:

                    mailModel = new MailModel
                    {
                        Email = _configuration.GetSection("GmailServer:Email").Value,
                        Password = _configuration.GetSection("GmailServer:Password").Value,
                        Port = Convert.ToInt32(_configuration.GetSection("GmailServer:Port").Value),
                        EnableSSL = Convert.ToBoolean(_configuration.GetSection("GmailServer:EnableSSL").Value),
                        Host = _configuration.GetSection("GmailServer:Host").Value,
                        Timeout = Convert.ToInt32(_configuration.GetSection("GmailServer:Timeout").Value)
                    };

                    break;

                    
            }
        }

        public void SendEmail(string recipient, string subject, string body)
        {
            using (SmtpClient smtpClient = new SmtpClient(mailModel.Host, mailModel.Port))
            {
                smtpClient.EnableSsl = mailModel.EnableSSL;
                smtpClient.UseDefaultCredentials = false;
                smtpClient.Credentials = new System.Net.NetworkCredential(mailModel.Email, mailModel.Password);

                MailMessage mailMessage = new MailMessage
                {
                    From = new MailAddress(mailModel.Email),
                    Subject = subject,
                    Body = body
                };
                mailMessage.To.Add(recipient);

                smtpClient.Send(mailMessage);
            }
        }
    }
}
