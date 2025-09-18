namespace AuthServer.CustomException
{
    public class NoTrainnesFoundException : System.Exception
    {
        public NoTrainnesFoundException(string message) : base(message)
        {
        }
    }
}
