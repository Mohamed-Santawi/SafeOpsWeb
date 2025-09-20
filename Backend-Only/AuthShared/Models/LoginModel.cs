using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AuthShared.Resources;
namespace AuthShared.Models
{
    public class LoginModel
    {
        [Required(ErrorMessageResourceName = "Required", 
            ErrorMessageResourceType = typeof(Resources.ValidationMessages))]
        
        public string Email { get; set; }
        [Required(ErrorMessageResourceName = "Required",
            ErrorMessageResourceType = typeof(Resources.ValidationMessages))]
        public string Password { get; set; }

    }
}
