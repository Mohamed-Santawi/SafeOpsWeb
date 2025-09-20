using System.ComponentModel.DataAnnotations;

namespace AuthServer.Entity
{
    public class UserActionsEntitiy
    {
        [Key]
        public int Id { get; set; }
#warning don't forget to add the foreign key manually in sql server (UserActions)
        public string UserId { get; set; } // foreign key to AspNetUsers

        public string Action { get; set; }
        public DateOnly Date { get; set; }
    }
}
