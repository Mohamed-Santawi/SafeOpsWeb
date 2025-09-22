using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AuthShared.Models
{
    public class RegulationsSharedModel
    {
        public int Id { get; set; }
        public int ViolationLevelId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public double Point { get; set; }
    }
}
