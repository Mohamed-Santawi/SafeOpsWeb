using AuthShared.Resources;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AuthShared.Interfaces;

namespace AuthShared.Models
{
    public  class RegisterModelShared : IRegisterModel
    {
        [Required]
        //without special characters
        [RegularExpression(@"^[a-zA-Z0-9]+$", ErrorMessageResourceType = typeof(ValidationMessages),
            ErrorMessageResourceName = "UsernameError")]
        public string Username { get; set; }
        //[Required]
        //[RegularExpression(@"^[0-9]+$")]
        //public int NationalId { get; set; }
        [Required(ErrorMessageResourceType = typeof(ValidationMessages),
            ErrorMessageResourceName = "Required")]
        [RegularExpression(@"^[0-9]+$",
            ErrorMessageResourceName = "NumbersOnly",
            ErrorMessageResourceType = typeof(ValidationMessages))]
        [MaxLength(10)]
        public string JobNumber { get; set; }
        [Required]
        [EmailAddress(ErrorMessageResourceType = typeof(ValidationMessages),
            ErrorMessageResourceName = "EmailError")]
        public string Email { get; set; }
        //[Length(6, 12, ErrorMessageResourceType = typeof(ValidationMessages),
        //    ErrorMessageResourceName = "PasswordLengthError")]
        //[Required]
        //public string Password { get; set; }
        //[Required]
        //[Compare("Password", ErrorMessageResourceType = typeof(ValidationMessages),
        //    ErrorMessageResourceName = "PasswordMatchError")]
        //public string VerifyPassword { get; set; }
        [Required]
        // Only letters
        [RegularExpression(@"^[a-zA-Z]+$", ErrorMessageResourceType = typeof(ValidationMessages),
            ErrorMessageResourceName = "FirstNameError")]
        public string FirstName { get; set; }
        [Required]
        // Only letters
        [RegularExpression(@"^[a-zA-Z]+$", ErrorMessageResourceType = typeof(ValidationMessages),
            ErrorMessageResourceName = "MiddleNameError")]
        public string MiddleName { get; set; }
        [Required]
        // Only letters
        [RegularExpression(@"^[a-zA-Z]+$", ErrorMessageResourceType = typeof(ValidationMessages),
            ErrorMessageResourceName = "LastNameError")]
        public string LastName { get; set; }
        [Required]
        [RegularExpression(@"^[0-9]+$",
            ErrorMessageResourceName = "PhoneNumberRequired",
            ErrorMessageResourceType = typeof(ValidationMessages))]
        public string PhoneNumber { get; set; }
        [Required]
        public string phoneCode { get; set; }
        [Required]
        public int SectionId { get; set; }
        [Required]
        public int MajorId { get; set; }
        [Required]
        public string Role { get; set; }



        public override string ToString()
        {
            return $"Username: {Username}, Email: {Email}, FirstName: {FirstName}, MiddleName: {MiddleName}, LastName: {LastName}, PhoneNumber: {PhoneNumber}";
        }   
    }
}
