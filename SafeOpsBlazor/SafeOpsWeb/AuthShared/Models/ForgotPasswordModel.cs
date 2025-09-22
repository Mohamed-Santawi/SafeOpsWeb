using System.ComponentModel.DataAnnotations;

namespace AuthShared.Models;

public class ForgotPasswordModel
{
    [Required]
    [EmailAddress]
    public string Email { get; set; }
    [Required]
    [MinLength(6),MaxLength(12)]
    public string NewPassword { get; set; }
    [Required]
    [Compare("NewPassword")]
    public string ConfirmPassword { get; set; }
}