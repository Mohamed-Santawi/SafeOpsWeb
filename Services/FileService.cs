using System.IO;
using System.Threading.Tasks;
using Microsoft.Maui.Storage;
using SafeOpsWeb.Interfaces;

namespace YourNamespace.Platforms.Windows
{
    public class FileService : IFileService
    {
        public async Task SaveFileAsync(string fileName, string base64Content)
        {
            var bytes = Convert.FromBase64String(base64Content);
            var path = Path.Combine(FileSystem.Current.AppDataDirectory, fileName);

            await File.WriteAllBytesAsync(path, bytes);

            await Launcher.Default.OpenAsync(new OpenFileRequest
            {
                File = new ReadOnlyFile(path)
            });
        }
    }
}
