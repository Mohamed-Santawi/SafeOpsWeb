using AuthShared.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SafeOpsWeb.data
{
    public class TraineeDataService
    {
        #region Fields
        public TraineeShared TraineeSharedData { get; set; }
        #endregion


        #region Const

        public TraineeDataService()
        {
            //assign values
        }

        #endregion


    }
}
