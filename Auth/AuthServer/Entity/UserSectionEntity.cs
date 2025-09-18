using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AuthServer.Entity
{
    public class UserSectionEntity
    {
        [Key]
        public int Id { get; set; }

        [Column(TypeName = "nvarchar(450)")]
        public string UserId { get; set; }
        
        public int SectionId { get; set; }

 
        public AppSectionsEntity? AppSection { get; set; }

        public bool IsHead { get; set; }

    }
}
