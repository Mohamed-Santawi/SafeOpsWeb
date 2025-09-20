using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using AuthServer.Entity;
using AuthShared.Enums;
using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace AuthServer.Entity
{
    public class InfringementEntity
    {
        [Key]
        public int Id { get; set; }
        public int TraineeId { get; set; } // this is a index


        public TraineeEntity Trainee { get; set; }
        public int SectionId { get; set; }

        public AppSectionsEntity AppSectionsEntity { get; set; }
        public int RegulationId { get; set; }
       
        public RegulationsEntity RegulationsEntity { get; set; }
        public int Rate { get; set; }
        public bool IsTraineeReported { get; set; }
        public bool IsInfringementProceeddByTrainee { get; set; }
        public InfringementProcess InfringementProcess { get; set; }

        public int InfringementCount { get; set; }
        public DateOnly Date { get; set; }
#warning don't forget to add the foreign key manually in sql server (Infringement)
        [Column(TypeName = "nvarchar(450)")]
        public string TrainerId { get; set; }
        public string Note { get; set; }

    }



}
