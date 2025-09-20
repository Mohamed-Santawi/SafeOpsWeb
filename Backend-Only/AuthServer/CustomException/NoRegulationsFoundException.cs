namespace AuthServer.CustomException;

public class NoRegulationsFoundException : System.Exception
{
    public NoRegulationsFoundException() : base("No Regulations Found")
    {
    }
}