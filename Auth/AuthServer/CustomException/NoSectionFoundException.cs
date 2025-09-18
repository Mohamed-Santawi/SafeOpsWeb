namespace AuthServer.CustomException
{
    public class NoSectionFoundException : System.Exception
    {
        public NoSectionFoundException(string message) : base(message)
        {
        }
    }
}
