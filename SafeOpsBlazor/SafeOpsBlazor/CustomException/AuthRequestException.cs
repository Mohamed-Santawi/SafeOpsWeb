using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SafeOpsBlazor.CustomException
{
    public class AuthRequestException : Exception
    {
        public AuthRequestException()
        {
        }
        public AuthRequestException(string message) : base(message)
        {
        }
        public AuthRequestException(string message, Exception innerException) : base(message, innerException)
        {
        }
    }
}
