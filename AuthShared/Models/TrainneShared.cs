using AuthShared.Interfaces;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AuthShared.Models
{
    public class TraineeShared
    {

        public int Id { get; set; }

        [Required]
        [RegularExpression(@"^[0-9]*$", ErrorMessage = "Trainee id must be numeric.")]
        public int AcademyId { get; set; }

        [Required]
        [RegularExpression(@"^[0-9]*$", ErrorMessage = "National id must be numeric.")]
        public int NationalId { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "Name is too long.")]
        [RegularExpression(@"^[a-zA-Z\s]*$", ErrorMessage = "Name must be alphabetic.")]
        public string Name { get; set; }

        [Required] public int MajorId { get; set; }

        public string Major { get; set; }

        [Required]
        [EmailAddress(ErrorMessage = "Invalid Email Address")]
        public string Email { get; set; }

        [Phone(ErrorMessage = "Invalid phone number.")]
        public string Phone { get; set; }

        [StringLength(200, ErrorMessage = "Address is too long.")]
        public string Address { get; set; }

        [StringLength(50, ErrorMessage = "City name is too long.")]
        public string City { get; set; }

        [StringLength(50, ErrorMessage = "State name is too long.")]
        public string State { get; set; }

        [RegularExpression(@"^[0-9]*$", ErrorMessage = "Zip must be numeric.")]
        [StringLength(10, ErrorMessage = "Zip code is too long.")]
        public string Zip { get; set; }

        [Range(0, 100, ErrorMessage = "Behavior score must be between 0 and 100.")]
        public double BehaviorScore { get; set; }


        public string ProfileImage { get; set; }




    }
}
