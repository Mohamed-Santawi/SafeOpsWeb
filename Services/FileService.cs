using System.IO;
using System.Threading.Tasks;
using SafeOpsWeb.Interfaces;

namespace SafeOpsWeb.Services
{
    public class FileService : IFileService
    {
        public async Task SaveFileAsync(string fileName, string base64Content)
        {
            var bytes = Convert.FromBase64String(base64Content);
            
            // For Blazor WebAssembly, we'll trigger a download
            await DownloadFileAsync(fileName, bytes);
        }

        private async Task DownloadFileAsync(string fileName, byte[] fileBytes)
        {
            // Create a blob URL and trigger download
            var jsRuntime = Microsoft.JSInterop.JSRuntime.Current;
            await jsRuntime.InvokeVoidAsync("downloadFileFromStream", fileName, Convert.ToBase64String(fileBytes));
        }
    }
}
