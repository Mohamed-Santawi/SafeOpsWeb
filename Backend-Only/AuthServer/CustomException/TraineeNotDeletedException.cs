namespace AuthServer.CustomException
{
    public class TraineeNotDeletedException : System.Exception
    {

        public TraineeNotDeletedException()
        {
        }
        public TraineeNotDeletedException(string message) : base(message)
        {
        }

    }
}
