using System.ComponentModel.DataAnnotations;

namespace AuthServer.Entity
{
    public class FacilitiesEntity
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
    }
}
