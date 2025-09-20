using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Runtime.CompilerServices;

namespace AuthServer.Entity
{
    public class TraineeEntity
    {
        [Key] public int Id { get; set; }
        public int AcademyId { get; set; } // this is a index

        public int NationalId { get; set; } // this is a index
        public string Name { get; set; }
        public int Major { get; set; } // this is a foreign key
        public TraineeMajorEntity TraineeMajor { get; set; } 
        public string Email { get; set; }
        public string Phone { get; set; }
        public string? Address { get; set; }
        public string? City { get; set; }
        public string? State { get; set; }
        public string? Zip { get; set; }

        public double BehaviorScore { get; set; }

        public string ProfileImage { get; set; }
    }

}
