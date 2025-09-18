using System.Text;
using AuthServer.CustomException;
using AuthServer.Data;
using AuthServer.Entity;
using AuthServer.Models;
using AuthServer.Procedures;
using AuthServer.Services;
using AuthShared.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SixLabors.ImageSharp;

namespace AuthServer.Controllers
{
    public class TraineeController : Controller
    {
        #region Fields

        TraineeProcedures _traineeProcedures;
        UploadService _uploadService;
        DownloadService _downloadService;
        IConfiguration _configuration;

        #endregion

        #region Constructors

        public TraineeController(TraineeProcedures traineeProcedures,UploadService uploadService, 
            DownloadService downloadService,
            IConfiguration configuration)
        {
            _traineeProcedures = traineeProcedures;
            _uploadService = uploadService;
            _downloadService = downloadService;
            _configuration = configuration;
        }

        #endregion

        #region Controller Methods

        [HttpGet]
        [Route("trainee/GetById/{id}")]
        [Authorize]
        public async Task<ActionResult<TraineeShared>> GetTraineeById(int id)
        {
            try
            {
                var trainee = await _traineeProcedures.GetTraineeById(id);
                var image = await _downloadService.GetImageFromLocalServer(trainee.ProfileImage, _configuration["profileImageType"]);
                trainee.ProfileImage = Convert.ToBase64String(image);
                return Ok(trainee);
            }
            catch (NoTrainnesFoundException traineeNotFoundException)
            {
                return NotFound("Trainee not found");
            }
            catch (System.Exception ex)
            {
                return StatusCode(500);
            }
        }

        //delete trainee by id
        [HttpDelete]
        [Route("trainee/Delete/{id}")]
        [Authorize]
        public async Task<ActionResult<ServerResponse>> DeleteTrainee(int id)
        {
            try
            {
                bool result = await _traineeProcedures.DeleteTrainee(id);
                ServerResponse serverResponse = new ServerResponse()
                {
                    Detail = "Trainee deleted Successfully",
                    Status = 200,
                    Title = "Trainee Deleted"
                };
                if (result)
                    return Ok(serverResponse);
                else return StatusCode(500,"unusual problem");
            }
            catch (TraineeNotDeletedException notDeletedException)
            {
                ServerResponse serverResponse = new ServerResponse()
                {
                    Detail = notDeletedException.Message,
                    Status = 404,
                    Title = "Trainee Not Deleted"
                };
                return BadRequest(serverResponse);
            }
            catch (System.Exception ex)
            {
                ServerResponse serverResponse = new ServerResponse()
                {
                    Detail = "There is error by the server",
                    Status = 500,
                    Title = "Trainee Not Deleted"
                };
                return StatusCode(500);
            }

        }


        //by name
        [HttpGet]
        [Route("trainee/GetByName")]
        [Authorize]
        public async Task<ActionResult<IEnumerable<TraineeShared>>> GetTraineeByName(string name,int current,int max)
        {
            try
            {
                var trainees = await _traineeProcedures.GetTraineeByName(name,current,max);

                for (int i = 0; i < trainees.Trainees.ToList().Count; i++)
                {
                    var image = await _downloadService.GetImageFromLocalServer(trainees.Trainees.ToList()[i].ProfileImage, _configuration["profileImageType"]);
                    trainees.Trainees.ToList()[i].ProfileImage = Convert.ToBase64String(image);
                }


               if(trainees.HasNext)
                {
                    return StatusCode(206, trainees.Trainees);
                }
                else
                {
                    return Ok(trainees.Trainees);
                }
            }
            catch (NoTrainnesFoundException traineeNotFoundException)
            {
                return NotFound("Trainee not found");
            }
            catch(InvaildBatchValueException invaildBatchValueException)
            {
                return BadRequest("Invalid batch number: the value must be greater than 1 (batch is (current,max))");
            }
            catch (System.Exception ex)
            {
                return StatusCode(500);
            }
        }

        //By national Id
        [HttpGet]
        [Route("trainee/GetByNationalId/{nationalId}")]
        
        [Authorize]
        public async Task<ActionResult<TraineeShared>> GetTraineeByNationalId(int nationalId)
        {
            try
            {
                var trainee = await _traineeProcedures.GetTraineeByNationalId(nationalId);
                var image = await _downloadService.GetImageFromLocalServer(trainee.ProfileImage, _configuration["profileImageType"]);

                trainee.ProfileImage = Convert.ToBase64String(image);
                return Ok(trainee);
            }
            catch (NoTrainnesFoundException traineeNotFoundException)
            {
                return NotFound("Trainee not found");
            }
            catch (System.Exception ex)
            {
                return StatusCode(500);
            }
        }

        // Get all trainees from the database
        [HttpGet]
        [Route("trainee/GetAll")]
        [Authorize]
        public async Task<ActionResult<IEnumerable<TraineeShared>>> GetAllTrainees(int current,int max)
        {
            try
            {

                var traineesBatch = await _traineeProcedures.GetAllTrainees(current,max);


                //get the image name from client side and download the image from the server
                //(for loop is the best way to do this for better performance)
                for (int i = 0; i < traineesBatch.Trainees.Count; i++)
                {
                    var image = await _downloadService.GetImageFromLocalServer(traineesBatch.Trainees[i].ProfileImage, _configuration["profileImageType"]);


                    traineesBatch.Trainees[i].ProfileImage = Convert.ToBase64String(image);

                }



                if (!traineesBatch.HasNext)
                {
                    return Ok(traineesBatch.Trainees);
                }
                else
                {
                    return StatusCode(206,traineesBatch.Trainees);
                }
            }
            catch(InvaildBatchValueException invaildBatchValueException)
            {
                return BadRequest("Invalid batch number: the value must be greater than 1 (batch is parameters");
            }
            catch (NoTrainnesFoundException noTrainnesFoundException)
            {
                return NotFound("There is no trainees in the system ");
            }
            catch (System.Exception ex)
            {
                return StatusCode(500);
            }

            return BadRequest();

        }

        [HttpPut]
        [Route("Trainee/Update")]
        public async Task<ActionResult<ServerResponse>> UpdateTrainee([FromBody] TraineeShared traineeShared)
        {
            try
            {
                var uploadImageResultModel = await _uploadService.UploadImage(traineeShared.ProfileImage);

                if (uploadImageResultModel.IsSuccess = false || uploadImageResultModel is null)
                {
                    ServerResponse serverResponse1 = new ServerResponse()
                    {
                        Detail = uploadImageResultModel.Reason,
                        Status = 404,
                        Title = "Image uploading problem"
                    };
                    return BadRequest(serverResponse1);
                }


                    traineeShared.ProfileImage = uploadImageResultModel.FileName;
                bool result = await _traineeProcedures.UpdateTrainee(traineeShared);
                ServerResponse serverResponse = new ServerResponse()
                {
                    Detail = "Trainee updated Successfully",
                    Status = 200,
                    Title = "Trainee Updated"
                };
                if (result)
                    return Ok(serverResponse);
            }
            catch (TraineeNotUpdatedException notUpdatedException)
            {
                ServerResponse serverResponse = new ServerResponse()
                {
                    Detail = notUpdatedException.Message,
                    Status = 404,
                    Title = "Trainee Not Updated"
                };
                return BadRequest(serverResponse);
            }
            catch (System.Exception ex)
            {
                ServerResponse serverResponse = new ServerResponse()
                {
                    Detail = "There is error by the server",
                    Status = 500,
                    Title = "Trainee Not Updated"
                };
                return StatusCode(500);
            }
            return Ok("Trainee updated Successfully");
        }

        //add a new trainee to the database
        [HttpPost]
        [Route("trainee/Add")]
        public async Task<ActionResult<ServerResponse>> AddTrainee([FromBody] TraineeShared traineeShared)
        {
            try
            {

               var uploadImageResultModel = await _uploadService.UploadImage(traineeShared.ProfileImage);


                if(uploadImageResultModel.IsSuccess == false || uploadImageResultModel is null)
                {
                    ServerResponse serverResponse1 = new ServerResponse()
                    {
                        Detail = uploadImageResultModel.Reason,
                        Status = 404,
                        Title = "Image uploading problem"
                    };
                    return BadRequest(serverResponse1);
                }


                traineeShared.ProfileImage = uploadImageResultModel.FileName;

                bool result = await _traineeProcedures.AddTrainee(traineeShared);

                ServerResponse serverResponse = new ServerResponse()
                {
                    Detail = "Trainee added Successfully",
                    Status = 200,
                    Title = "Trainee Added"
                };

                if (result)
                    return Ok(serverResponse);


            }

            catch (TraineeNotAddedException notAddedException)
            {
                ServerResponse serverResponse = new ServerResponse()
                {
                    Detail = notAddedException.Message,
                    Status = 404,
                    Title = "Trainee Not Added"
                };
                return BadRequest(serverResponse);
            }
            catch (System.Exception ex)
            {
                ServerResponse serverResponse = new ServerResponse()
                {
                    Detail = "There is error by the server",
                    Status = 500,
                    Title = "Trainee Not Added"
                };
                return StatusCode(500);
            }
            return Ok("Trainee added Successfully");
        }

        //get all trainees count
        [HttpGet]
        [Route("trainee/GetAllCount")]
        [Authorize]
        public async Task<ActionResult<int>> GetAllTraineesCount()
        {
            try
            {
                return Ok(await _traineeProcedures.GetAllTraineesCount());
            }
            catch (System.Exception ex)
            {
                return StatusCode(500);
            }
        }

        #endregion
    }
}
