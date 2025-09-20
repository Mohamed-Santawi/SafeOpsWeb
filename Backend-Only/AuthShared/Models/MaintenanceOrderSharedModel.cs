using AuthShared.Enums;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AuthShared.Models
{

    public class MaintenanceOrderSharedModel
    {
        public int Id { get; set; }
        [Required]
        public string Title { get; set; }
        [Required]
        public string Description { get; set; }
        public string FileName { get; set; }

        public string File { get; set; }
        public string FileExtension { get; set; }
        [Required]

        public MaintenanceOrderStatus Status { get; set; }
        public string NotProcessedReason { get; set; }

        public UserInformations OrderBy { get; set; }
    }
}
