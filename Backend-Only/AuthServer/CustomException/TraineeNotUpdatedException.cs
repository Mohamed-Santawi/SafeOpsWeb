namespace AuthServer.CustomException
{
    public class TraineeNotUpdatedException : System.Exception
    {
        public TraineeNotUpdatedException()
        {
        }
        public TraineeNotUpdatedException(string message) : base(message)
        {
        }
        public TraineeNotUpdatedException(string message, System.Exception inner) : base(message, inner)
        {
        }
    }
}
