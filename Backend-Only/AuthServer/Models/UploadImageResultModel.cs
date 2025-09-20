namespace AuthServer.Models
{
    public class UploadFileResultModel
    {
        public bool IsSuccess { get; set; }
        public string FileName { get; set; }
        public string Reason { get; set; }
    }
}
