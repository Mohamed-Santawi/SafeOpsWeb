using System.Net;
using AuthShared.Models;

namespace SafeOpsBlazor.Model;

public class TraineeMajorResult
{
    public IEnumerable<TraineeMajorShared> TraineeMajors { get; set; }
    public HttpStatusCode StatusCode { get; set; }
}