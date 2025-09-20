using AuthShared.Resources;
using System.ComponentModel.DataAnnotations;

namespace AuthShared.Interfaces;

public interface IRegisterModel
{
    public string Username { get; set; }
    public string Email { get; set; }
    //public string Password { get; set; }
    //public string VerifyPassword { get; set; }
    public string FirstName { get; set; }
    public string MiddleName { get; set; }
    public string LastName { get; set; }
    public string PhoneNumber { get; set; }
    public string phoneCode { get; set; }
}