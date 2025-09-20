using System.ComponentModel.DataAnnotations.Schema;

namespace AuthServer.Entity
{
    public class InfringementAttachmentEntity
    {
        public int Id { get; set; }
        public int InfringementId { get; set; }
  
        public InfringementEntity Infringement { get; set; }
        public string FileName { get; set; }
        public byte[] File { get; set; }
    }
}
