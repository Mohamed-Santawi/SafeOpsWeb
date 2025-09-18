using AuthShared.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SafeOpsBlazor.Helper
{
    public class RegisterHelper
    {
        #region Fields

        private RandomHelper RandomHelper = new RandomHelper();

        #endregion

        #region Properties

#if DEBUG

        public RegisterModelShared RandomRegisterModelSharedValue
        {
            get
            {
                RegisterModelShared registerModelShared = new RegisterModelShared
                {
                    Username = RandomHelper.GetRandomString(RandomHelper.RandomType.Alphabet, 12),
                    JobNumber = RandomHelper.GetRandomString(RandomHelper.RandomType.Numbers, 12),
                    Email = RandomHelper.GetRandomString(RandomHelper.RandomType.Alphabet, 12),
                    FirstName = RandomHelper.GetRandomString(RandomHelper.RandomType.Alphabet, 12),
                    MiddleName = RandomHelper.GetRandomString(RandomHelper.RandomType.Alphabet, 12),
                    LastName = RandomHelper.GetRandomString(RandomHelper.RandomType.Alphabet, 12),
                    PhoneNumber = RandomHelper.GetRandomString(RandomHelper.RandomType.Numbers, 12),
                    phoneCode = RandomHelper.GetRandomString(RandomHelper.RandomType.Numbers, 12),
                };

                return registerModelShared;
            }

#endif

            #endregion


            #region Constructor 

            #endregion

            #region Methods



            #endregion
        }
    }
}
