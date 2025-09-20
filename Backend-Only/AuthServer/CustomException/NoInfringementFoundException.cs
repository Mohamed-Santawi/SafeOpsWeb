namespace AuthServer.CustomException
{
    public class NoInfringementFoundException : Exception
    {
        public NoInfringementFoundException(string message) : base(message)
        {
        }
    }
}
