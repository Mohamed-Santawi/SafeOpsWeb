using System.ComponentModel.DataAnnotations.Schema;

namespace AuthServer.Entity
{
    public class RoleViolationLevelEntity
    {
        public int Id { get; set; }
        [Column(TypeName = "nvarchar(450)")]
        public string RoleId { get; set; }
        [Column(TypeName = "int")]
        public int ViolationLevelId { get; set; }
    }
}
