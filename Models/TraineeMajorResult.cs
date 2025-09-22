using System.Net;
using AuthShared.Models;

namespace SafeOpsWeb.Models;

public class TraineeMajorResult
{
    public IEnumerable<TraineeMajorShared> TraineeMajors { get; set; }
    public HttpStatusCode StatusCode { get; set; }
}
