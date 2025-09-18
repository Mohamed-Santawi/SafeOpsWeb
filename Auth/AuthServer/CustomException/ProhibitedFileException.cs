namespace AuthServer.CustomException
{
    public class ProhibitedFileException : System.Exception
    {
        public ProhibitedFileException(string message) : base(message)
        {
        }
    }
}
