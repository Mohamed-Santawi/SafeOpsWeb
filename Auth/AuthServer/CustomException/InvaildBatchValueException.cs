namespace AuthServer.CustomException
{
    public class InvaildBatchValueException : System.Exception
    {
        internal InvaildBatchValueException(string message = "Invalid batch number: the value must be greater than 1") : base(message)
        {
        }
    }
}
