using System.ComponentModel.DataAnnotations.Schema;

namespace AuthShared.Models;

public class UserMajorSharedModel
{
    public int Id { get; set; }
    public string UserId { get; set; }
    public int MajorId { get; set; }
    public string MajorName { get; set; }
}