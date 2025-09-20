namespace AuthServer.CustomException
{
    public class RoleNotFoundException : Exception
    {
        public RoleNotFoundException(string message) : base(message)
        {
        }
    }
}
