namespace AuthServer.CustomException
{
    public class NoUserMajorFound : Exception
    {
        public NoUserMajorFound(string message) : base(message) { }
    }
}
