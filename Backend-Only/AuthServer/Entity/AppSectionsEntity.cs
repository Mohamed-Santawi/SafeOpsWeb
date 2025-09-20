using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AuthServer.Entity
{
    public class AppSectionsEntity
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public int BuildingNum { get; set; }    

        public BuildingEntity BuildingEntity { get; set; }
    }
}
