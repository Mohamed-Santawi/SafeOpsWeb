namespace AuthServer.CustomException
{
    public class NoInfrigementRatesFoundException : Exception
    {
        public NoInfrigementRatesFoundException(string message) : base(message)
        {
        }
    }
}
