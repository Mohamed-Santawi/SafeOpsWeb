using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using AuthShared.Enums;
using Microsoft.AspNetCore.Identity;

namespace AuthServer.Entity
{
    public class UserMajorEntity
    {
        [Key]
        public int Id { get; set; }
#warning don't forget to add the foreign key manually in sql server (User Major)
        [Column(TypeName = "nvarchar(450)")]
        public string UserId { get; set; }
        public int MajorId { get; set; }
  
        public MajorEntity Major { get; set; }
    }
}
