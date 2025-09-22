using AuthShared.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AuthShared.Models
{
    public  class ForwardInfrigementModel
    {
        public int InfrigementId { get; set; }
        public InfrigementForwardOptions InfrigementFowardOptions { get; set; }
        public int TraineeId { get; set; }



        public override string ToString()
        {
            return $"InfrigementId: {InfrigementId}, InfrigementFowardOptions: {InfrigementFowardOptions}, TraineeId: {TraineeId}";
        }
    }
}
