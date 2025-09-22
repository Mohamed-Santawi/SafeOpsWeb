using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SafeOpsWeb.Interfaces
{
    public interface IFileService
    {
        Task SaveFileAsync(string fileName, string base64Content);
    }
}
