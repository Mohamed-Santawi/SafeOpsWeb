using AuthShared.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AuthShared.Models
{
    public class CloseInfrigementModel
    {
        public  int InfrigementId { get; set; }
        public InfringementProcess InfringementProcess { get; set; }
    }
}
