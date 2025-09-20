using System.ComponentModel.DataAnnotations.Schema;
using AuthShared.Enums;

namespace AuthServer.Entity;

public class MaintenanceOrderEntity
{
    public int Id { get; set; } 
    public string Title { get; set; }
    public string Description { get; set; }

#warning don't forget to add the foreign key manually in sql server (MaintenanceOrder)

    [Column(TypeName = "nvarchar(450)")]
    public string UserId { get; set; }

    public MaintenanceOrderStatus Status { get; set; }
    public string FileName { get; set; }

    public string NotPrecededReason { get; set; }

}