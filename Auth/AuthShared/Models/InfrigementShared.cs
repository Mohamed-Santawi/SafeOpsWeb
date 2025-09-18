using AuthShared.Enums;
using AuthShared.Interfaces;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AuthShared.Models
{
    public class InfringementShared
    {
        public int Id { get; set; }

        public TraineeShared Trainee { get; set; }
        [Required]
        [Range(1, int.MaxValue)]
        public int Rate { get; set; }
        [Required]
        public bool IsTraineeReported { get; set; }
        [Required]
        public bool IsViolationProceedByTrainee { get; set; }
        public InfringementProcess InfringementProcess { get; set; }
        public int InfringementCount { get; set; }
        [Range(1,int.MaxValue)]
        [Required]

        public int RegulationId { get; set; }
        [Required]
        public string InfrigementNote { get; set; }
        public DateOnly Date { get; set; }

        //convert to entity



    }

}
