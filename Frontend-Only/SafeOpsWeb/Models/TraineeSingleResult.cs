using AuthShared.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace SafeOpsWeb.Models
{
    public class TraineeSingleResult
    {
        public TraineeShared Trainee { get; set; }
        public HttpStatusCode StatusCode { get; set; }
    }
}
