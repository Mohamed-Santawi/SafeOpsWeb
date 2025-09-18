using SixLabors.ImageSharp;

namespace AuthServer.Services
{
    public class DownloadService
    {
        #region Fields

        #endregion

        #region Constructors    
        public DownloadService()
        {
            
        }
        #endregion


        #region Methods
        public async Task<byte[]> GetImageFromLocalServer(string fileName,string imageType)
        {
            try
            {
                string path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot","Uploads", "Images", $"{fileName}{imageType}");

                using (var image = Image.Load(path))
                {

                    if(image == null)
                    {
                        throw new NullReferenceException("Error loading image from local server");
                    }

                    

                    using (var memoryStream = new MemoryStream())
                    {
                        image.SaveAsJpeg(memoryStream);

                        return memoryStream.ToArray();
                    }
                    
                }
            }

            catch(Exception ex)
            {
                throw new Exception("Error downloading image from server", ex);
            }
        }

        public async Task<byte[]> GetFileFromLocalServerAsync(string fileName, string fileExtension)
        {
            try
            {
                string path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "Uploads", "Files", $"{fileName}.{fileExtension}");

                if (!File.Exists(path))
                {
                    throw new FileNotFoundException("File not found on local server", path);
                }

                return await File.ReadAllBytesAsync(path);
            }
            catch (Exception ex)
            {
                throw new Exception("Error downloading file from server", ex);
            }
        }



        #endregion


    }
}
