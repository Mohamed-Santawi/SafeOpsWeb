using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AuthShared.Models
{
    public class MaintenanceOrderResult
    {
        public bool isThereNextResult { get; set; }
        public IEnumerable<MaintenanceOrderSharedModel> maintenanceOrderSharedModels { get; set; }
    }
}
