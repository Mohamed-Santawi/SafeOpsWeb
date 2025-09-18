using AuthServer.Analysis;
using AuthServer.CustomException;
using AuthServer.Models;
using SixLabors.ImageSharp;
namespace AuthServer.Services
{
    public class UploadService
    {
        #region Fields  

        private readonly IConfiguration _configuration;

        #endregion

        #region Properties

        #endregion

        #region Constructor
        public UploadService(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        #endregion

        #region Methods


        public async Task<UploadFileResultModel> UploadFile(string file,string fileExtenstion)
        {
            try
            {

                if (FileAnalyser.IsProhibitedExtension(fileExtenstion))
                {
                    throw new ProhibitedFileException("Prohibited File Extension");
                }

                if (string.IsNullOrEmpty(file))
                {
                    throw new ArgumentException ("Invalid File");
                }


                if(string.IsNullOrEmpty(fileExtenstion))
                {
                    throw new ArgumentException("Invalid File Extension");
                }


                byte[] fileBytes = Convert.FromBase64String(file);

                if (fileBytes.Length > 0)
                {
                    Random random = new Random();

                    string fileName = random.Next(0, 1000000).ToString();

                    var uploadPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "Uploads"
                        , "Files", fileName + fileExtenstion);


                   

                    using (FileStream fs = new FileStream(uploadPath, FileMode.Create))
                    {
                        fs.Write(fileBytes, 0, fileBytes.Length);
                    }

                    return new UploadFileResultModel()
                    {
                        IsSuccess = true,
                        FileName = fileName,
                        Reason = "Valid File"
                    };
                }
                else
                {
                    return new UploadFileResultModel()
                    {
                        IsSuccess = false,
                        FileName = "",
                        Reason = "Invalid File"
                    };
                }
            }
            catch (Exception ex)
            {
                return new UploadFileResultModel()
                {
                    IsSuccess = false,
                    FileName = "",
                    Reason = "Error"
                };
            }
        }

        public async Task<UploadFileResultModel> UploadImage(string base64Image)
        {
            try
            {
                {
                    Random random = new Random();

                    string fileName = random.Next(0, 1000000).ToString();

                    var uploadPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "Uploads"
                        , "Images",fileName);
                    byte[] imageBytes = Convert.FromBase64String(base64Image);


                    //check if the file is really an image

                    using (MemoryStream ms = new MemoryStream(imageBytes))
                    {
                        using (var img = Image.Load(ms))
                        {
                            
                            img.Save(uploadPath + _configuration["profileImageType"]);
                        }
                    }


                    return new UploadFileResultModel()
                    {
                        IsSuccess = true,
                        FileName =  fileName,
                        Reason = "Valid Image"
                    };

                }

            }
            catch (ImageFormatException ex)
            {
                return new UploadFileResultModel()
                {
                    IsSuccess = false,
                    FileName = "",
                    Reason = "Invalid Image"
                };
            }
            catch (Exception ex)
            {
                return new UploadFileResultModel()
                {
                    IsSuccess = false,
                    FileName = "",
                    Reason = "Error"
                };
            }
        }


     



        #endregion
    }
}
