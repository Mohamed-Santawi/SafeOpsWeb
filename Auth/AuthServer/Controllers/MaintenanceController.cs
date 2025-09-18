using AuthServer.CustomException;
using AuthServer.Models;
using AuthServer.Procedures;
using AuthServer.Services;
using AuthShared.Enums;
using AuthShared.Models;
using Microsoft.AspNetCore.Components.Forms;
using Microsoft.AspNetCore.Mvc;

namespace AuthServer.Controllers
{
    public class MaintenanceController : Controller
    {
        #region Fields
        MaintenanceProcedure _maintenanceProcedure;
        UploadService _uploadService;
        DownloadService _downloadService;

        #endregion

        #region Constructor

        public MaintenanceController(MaintenanceProcedure maintenanceProcedure,
            UploadService uploadService,
            DownloadService downloadService)
        {
            _maintenanceProcedure = maintenanceProcedure;
            _uploadService = uploadService;
            _downloadService = downloadService;
        }

        #endregion

        #region Methods

        [HttpPost]
        [Route("Maintenance/Post")]
        public async Task<IActionResult> Post([FromBody] MaintenanceOrderSharedModel maintenanceOrderSharedModel)
        {

            try
            {
                UploadFileResultModel uploadResult = new();
                if (!string.IsNullOrEmpty(maintenanceOrderSharedModel.File) && !string.IsNullOrEmpty(maintenanceOrderSharedModel.FileExtension))
                {
                     uploadResult = await _uploadService.UploadFile(maintenanceOrderSharedModel.File,
                        maintenanceOrderSharedModel.FileExtension);
                }
              


                maintenanceOrderSharedModel.FileName = uploadResult.FileName ?? "There is no file";
                maintenanceOrderSharedModel.FileExtension = maintenanceOrderSharedModel.FileExtension ?? "\t";

                var result = await _maintenanceProcedure.AddMaintenanceOrderAsync(User.Identity.Name, maintenanceOrderSharedModel);

                if (result)
                    return Ok();
                else
                    return StatusCode(500, "there is problem while adding order");

            }
            catch (ProhibitedFileException prohibitedFileException)
            {
                return BadRequest(prohibitedFileException.Message);
            }
            catch (ArgumentException arugmentExceptipon)
            {
                return BadRequest(arugmentExceptipon.Message);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }


        [HttpPost("Maintenance/EditOrder")]
        public async Task<ActionResult> EditOrder([FromBody] MaintenanceOrderSharedModel maintenanceOrderSharedModel)
        {
            try
            {
                var result = await _maintenanceProcedure.EditOnOrderAsync(maintenanceOrderSharedModel);

                if (result)
                {
                    return Ok("Order successfully edited");
                }
                else
                {
                    return BadRequest("Failed to edit order");
                }
            }
            catch (NoMaintenanceOrder noOrder)
            {
                return NotFound("cannot find order");
            }

            catch (Exception e)
            {
                return StatusCode(500, "An error occurred while processing your request");
            }
        }


        //get maintenance orders api
        [HttpGet("Maintenance/GetOrders")]
        public async Task<ActionResult<MaintenanceOrderSharedModel>> GetMaintenanceOrders(
        [FromQuery] int current, 
        [FromQuery] int max,
        [FromQuery]MaintenanceOrderStatus maintenanceOrderStatus, 
        [FromQuery] int? Id = null)
        {
            try
            {
                var orders = await _maintenanceProcedure.GetOrdersAsync(current, max,maintenanceOrderStatus,Id);

                return Ok(orders);
            }

            catch (NoMaintenanceOrder noOrders)
            {
                return NotFound(noOrders.Message);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        //get maintenance count
        [HttpGet("Maintenance/GetMaintenanceCount")]
        public async Task<ActionResult<int>> GetMaintenanceCount()
        {
            try
            {
                var count = await _maintenanceProcedure.GetMaintenanceCountAsync();
                return Ok(count);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        #endregion

    }
}
