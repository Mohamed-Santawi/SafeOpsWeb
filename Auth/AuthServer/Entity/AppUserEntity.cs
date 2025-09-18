using AuthShared.Interfaces;
using Microsoft.AspNetCore.Identity;

namespace AuthServer.Entity
{
    public class AppUserEntity : IdentityUser, IAppUser
    {
        //public int NationalId { get; set; }

        public string Firstname { get; set; }
        public string Middlename { get; set; }
        public string Lastname { get; set; }
        public string PhoneCode { get; set; }

        public int JobNumber { get; set; }

    }
}
