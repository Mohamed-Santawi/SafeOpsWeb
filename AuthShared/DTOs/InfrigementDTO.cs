using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AuthShared.Enums;


namespace AuthShared.DTOs
{
    public class InfrigementDTO
    {
        public int id { get; set; }
        public int regulationId { get; set; }
        public int traineeId { get; set; }
        public int rate { get; set; }
        public bool isTraineeReported { get; set; }
        public InfringementProcess infringementProcess { get; set; }
        public int infringementCount { get; set; }
        public DateOnly date { get; set; }
        public TraineeDTO trainee { get; set; }
        public string Note { get; set; }


    }


}
