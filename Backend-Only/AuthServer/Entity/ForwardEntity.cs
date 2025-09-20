using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNetCore.Identity;

namespace AuthServer.Entity
{
    public class ForwardEntity
    {
        [Key]
        public int Id { get; set; }
#warning don't forget to add the foreign key manually in sql server (Forward) User Id ForeignKey

        [Column(TypeName = "nvarchar(450)")]
        public string ForwardedFrom { get; set; }

#warning don't forget to add the foreign key manually in sql server (Forward) User Id ForeignKey
        [Column(TypeName = "nvarchar(450)")]
        public string UserId { get; set; }

#warning don't forget to add the foreign key manually in sql server (Forward Role) Role Id ForeignKey

        [Column(TypeName = "nvarchar(450)")]
        public string RoleId { get; set; }


        public DateOnly Date { get; set; }

        // المفتاح الأجنبي لـ Infringement
        public int InfringementId { get; set; }

        public int TraineeId { get; set; }

        public TraineeEntity Trainee { get; set; }



        public InfringementEntity Infringement { get; set; }
    }
}