using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AuthShared.Models
{
    public class ForwardedInfrigementSharedModel
    {
      
        public int Id { get; set; }
        public string ForwardedFrom { get; set; }
        public DateOnly Date { get; set; }
        public int InfringementId { get; set; }
        public int TraineeId { get; set; }
    }
}
