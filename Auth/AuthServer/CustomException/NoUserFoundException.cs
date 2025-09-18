namespace AuthServer.CustomException
{
    public class NoUserFoundException : Exception
    {
        public NoUserFoundException(string message) : base() { }
    }
}
