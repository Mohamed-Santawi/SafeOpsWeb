namespace AuthServer.CustomException
{
    public class NoViolationsLevelFoundException : System.Exception
    {
        public NoViolationsLevelFoundException() : base("No Violations Level Found")
        {
        }
    }
}
