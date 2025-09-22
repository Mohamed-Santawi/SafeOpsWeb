using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SafeOpsWeb.Helper
{
    public class RandomHelper
    {

        #region Enums
        public enum RandomType
        {
            Alphabet,
            Numbers,
            Both
        }
        #endregion
        #region Fields

        //pattern for random string
        string alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        string numbers = "0123456789";
        string both = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

        #endregion


        #region Constructor


        #endregion


        #region Methods 

        public string GetRandomString(RandomType randomType, int length)
        {
            Random random = new Random();
            StringBuilder stringBuilder = new StringBuilder();
            for (int i = 0; i < length; i++)
            {
                switch(randomType)
                {
                    case RandomType.Alphabet:
                        stringBuilder.Append(alphabet[random.Next(alphabet.Length)]);
                        break;
                    case RandomType.Numbers:
                        stringBuilder.Append(numbers[random.Next(numbers.Length)]);
                        break;
                    case RandomType.Both:
                        stringBuilder.Append(both[random.Next(both.Length)]);
                        break;
                }
            }
            return stringBuilder.ToString();
        }

        #endregion


    }
}
