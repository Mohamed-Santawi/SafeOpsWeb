using System.Net;
using AuthShared.Models;

namespace SafeOpsWeb.Models;

public class TraineeResult
{
    public IEnumerable<TraineeShared> Trainees { get; set; }
    public HttpStatusCode StatusCode { get; set; }
}
