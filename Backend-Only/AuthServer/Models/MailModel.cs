namespace AuthServer.Models
{
    public class MailModel
    {
        public string Email { get; set; }
        public string Password { get; set; }
        public int Port { get; set; }
        public bool EnableSSL { get; set; }
        public string Host { get; set; }
        public int Timeout { get; set; }
       

        public override string ToString()
        {
            return $"Email: {Email}, Password: {Password}, Port: {Port}, EnableSSL: {EnableSSL}, Host: {Host}, Timeout: {Timeout}";
        }
    }
}
