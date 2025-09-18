using System.Net;
using AuthShared.Models;

namespace SafeOpsBlazor.Model;

public class TraineeResult
{
    public IEnumerable<TraineeShared> Trainees { get; set; }
    public HttpStatusCode StatusCode { get; set; }
}