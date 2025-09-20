using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AuthShared.Models
{
    public class RoleViolationRate
    {
        public int Id { get; set; }
        public string Role { get; set; }
        public int ViolationRate { get; set; }
    }
}
