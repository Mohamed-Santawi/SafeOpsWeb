using AuthShared.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SafeOpsWeb.Services
{
    public class TraineeSearchService
    {
        #region Fields



        #endregion


        #region Constructor

        public TraineeSearchService()
        {

        }

        #endregion

        #region Methods

        public async Task<IQueryable<TraineeShared>> SearchByNumber(string number)
        {
            return null;
        }

        #endregion
    }
}
