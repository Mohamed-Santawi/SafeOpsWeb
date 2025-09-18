using AuthShared.Resources;
using System.ComponentModel.DataAnnotations;

namespace SafeOpsBlazor.Model;

public class RegisterModel
{
    [Required]
    //without special characters
    [RegularExpression(@"^[a-zA-Z0-9]+$", ErrorMessageResourceType = typeof(ValidationMessages),
    ErrorMessageResourceName = "UsernameError")]
    public string Username { get; set; }
    [Required]
    [RegularExpression(@"^[0-9]+$")]
    public int JobNumber { get; set; }
    [Required]
    [EmailAddress(ErrorMessageResourceType = typeof(ValidationMessages),
        ErrorMessageResourceName = "EmailError")]
    public string Email { get; set; }
    [Length(6, 12, ErrorMessageResourceType = typeof(ValidationMessages),
        ErrorMessageResourceName = "PasswordLengthError")]
/*    [Required]
    public string Password { get; set; }
    [Required]
    [Compare("Password", ErrorMessageResourceType = typeof(ValidationMessages),
        ErrorMessageResourceName = "PasswordMatchError")]
    public string VerifyPassword { get; set; }*/
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
    [Phone(ErrorMessageResourceType = typeof(ValidationMessages),
        ErrorMessageResourceName = "PhoneNumberError")]
    public int PhoneNumber { get; set; }
    [Required]
    public int PhoneCode { get; set; }
    [Required]
    public int Section { get; set; }
    [Required] 
    public string Major { get; set; }


    // check if all fields are valid
    public bool IsValid()
    {
        return Validator.TryValidateObject(this, new ValidationContext(this), null, true);
    }
}