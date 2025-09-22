using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AuthShared.Models
{
    public class UserInformations
    {
        public string Id { get; set; }
        [Required]
        [EmailAddress]
        public string Email { get; set; }
        [Required]
        [MinLength(3)]
        [MaxLength(20)]
        public string UserName { get; set; }
        public string Role { get; set; }
        [Required]
        public string FirstName { get; set; }
        [Required]
        public string MiddleName { get; set; }
        [Required]
        public string LastName { get; set; }
        [Required]
        //[RegularExpression("^\\d+$")]
        public string PhoneNumber { get; set; }
        [Required]
        //[RegularExpression("^\\d+$")]
        public string PhoneCode { get; set; }
        public MajorSharedModel Major { get; set; }
        public SectionSharedModel Section { get; set; }
        public bool IsUserLocked { get; set; }



    }
}
