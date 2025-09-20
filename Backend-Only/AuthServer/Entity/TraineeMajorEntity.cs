using System.ComponentModel.DataAnnotations;

namespace AuthServer.Entity
{
    public class TraineeMajorEntity
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
    }
}
