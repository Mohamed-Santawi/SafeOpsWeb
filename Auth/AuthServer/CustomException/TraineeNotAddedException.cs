namespace AuthServer.CustomException;

public class TraineeNotAddedException : System.Exception
{
    public TraineeNotAddedException(string message) : base(message)
    {
    }
}