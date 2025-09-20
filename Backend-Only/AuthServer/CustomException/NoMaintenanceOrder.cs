namespace AuthServer.CustomException
{
    public class NoMaintenanceOrder : Exception
    {
        public NoMaintenanceOrder(string message) : base(message) { }
}
}
