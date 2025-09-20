using System.ComponentModel.DataAnnotations;

namespace AuthShared.Models;

public class ResendEmailModel
{
    [Required]
    [EmailAddress(ErrorMessageResourceName = "ValidationMessages", 
        ErrorMessageResourceType = typeof(Resources.ValidationMessages),
        ErrorMessage = "EmailError")]
    public string Email { get; set; }
}