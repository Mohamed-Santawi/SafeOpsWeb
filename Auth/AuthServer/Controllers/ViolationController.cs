using System.Diagnostics;
using AuthServer.CustomException;
using AuthServer.CustomExceptions;
using AuthServer.Data;
using AuthServer.Entity;
using AuthServer.Procedures;
using AuthShared.DTOs;
using AuthShared.Enums;
using AuthShared.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace AuthServer.Controllers
{
    public class ViolationController : Controller
    {
        #region Fields      

        private readonly ApplicationDbContext _context;
        //get identity user with app user
        private readonly UserManager<AppUserEntity> _userManager;
        private readonly ILogger<ViolationController> _logger;
        private readonly RoleManager<IdentityRole> _roleManager;



        //procedures
        private InfrigementProcedures _infrigementProcedures;


        #endregion


        #region Constructors

        public ViolationController(ApplicationDbContext applicationDbContext, 
            UserManager<AppUserEntity> userManager,
            ILogger<ViolationController> logger, 
            InfrigementProcedures infrigementProcedures,
            RoleManager<IdentityRole> roleManager)
        {
            _context = applicationDbContext;
            _userManager = userManager;
            _logger = logger;
            _infrigementProcedures = infrigementProcedures;
            this._roleManager = roleManager;
        }

        #endregion


        [HttpGet]
        [Route("violation/GetViolationProceduresByRegulationId/{regulaitonId}")]
        [Authorize]
        public async Task<ActionResult<IEnumerable<ViolationProcedureSharedModel>>> GetViolationProcedureByRegulationId(int regulaitonId)
        {
            try
            {
                var violationProcedures = await _infrigementProcedures.GetInfrigementByRegulationId(regulaitonId);



                if (violationProcedures == null)
                {
                    return StatusCode(404, "Violation procedure not found");
                }


                return Ok(violationProcedures);

            }

            catch (Exception exception)
            {
                return StatusCode(500, exception.Message);
            }




        }


        //get all violation count
        [HttpGet]
        [Route("violation/GetAllViolationCount")]
        [Authorize]
        public async Task<ActionResult<int>> GetAllViolationCount()
        {
            try
            {
                var violationCount = await _infrigementProcedures.GetInfringementCount();
                return Ok(violationCount);
            }
            catch (Exception exception)
            {
                return StatusCode(500, exception.Message);
            }
        }


        //get forwarded violations
        [HttpGet]
        [Route("violation/GetForwardViolations")]
        [Authorize]
        public async Task<ActionResult<IEnumerable<ForwardedInfrigementSharedModel>>> GetForwardedViolations(InfrigementForwardOptions infrigementForwardOptions)
        {
            try
            {
                var forwardedViolations = await _infrigementProcedures.GetForwardedInfringements(User.Identity.Name);

                //get user id from forwarded violations and assign it to forwarded infrigement shared model
                foreach (var forwardedViolation in forwardedViolations)
                {
                    var user = await _userManager.FindByIdAsync(forwardedViolation.ForwardedFrom);
                    forwardedViolation.ForwardedFrom = user.Firstname;
                }


                if (forwardedViolations == null)
                {
                    return StatusCode(404, "No forwarded violations found");
                }
                return Ok(forwardedViolations);
            }
            catch (Exception exception)
            {
                return StatusCode(500, exception.Message);
            }
        }


        [HttpGet]
        [Authorize]
        [Route("violation/Get")]
        public async Task<ActionResult<IEnumerable<InfrigementDTO>>> GetInfringements(
            [FromQuery] int current,
            [FromQuery] int max,
            [FromQuery] InfringementProcess? infringementProcess,
            [FromQuery] int? id,
            [FromQuery] string name = null,
            [FromQuery] int? nationalId = null)
        {
            try
            {

                var infringements = await _infrigementProcedures.GetInfrigementByCurrentUser(
                    await _userManager.GetUserAsync(HttpContext.User),
                    current,
                    max,
                    infringementProcess,
                    id,
                    name,
                    nationalId);

                return Ok(infringements);
            }
            catch(UserNotFoundException ex)
            {
                return StatusCode(404, ex.Message);
            }
            catch (System.Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        //close violation
        [HttpPost]
        [Route("violation/CloseViolation")]
        [Authorize]
        public async Task<ActionResult> CloseViolation([FromBody] CloseInfrigementModel closeInfrigementModel)
        {
            try
            {
               bool result = await _infrigementProcedures.CloseInfringement(closeInfrigementModel.InfrigementId, 
                   closeInfrigementModel.InfringementProcess);

                if (!result)
                {
                    return StatusCode(404, "Violation not found");
                }


            }
            catch (System.Exception ex)
            {
                return StatusCode(500, ex.Message);
            }


            return Ok("Violation closed successfully");
        }

        //update infringement
        [HttpPut]
        [Route("violation/UpdateViolation")]
        [Authorize]
        public async Task<ActionResult> UpdateViolation([FromBody] InfringementShared infringement)
        {
            try
            {
                bool result = await _infrigementProcedures.UpdateInfringement(infringement);
                if (!result)
                {
                    return StatusCode(404, "Violation not found");
                }
            }
            catch (System.Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
            return Ok("Violation updated successfully");
        }


        //get infringement by id
        [HttpGet]
        [Route("violation/GetViolationById/{id}")]
        [Authorize]
        public async Task<ActionResult<InfrigementDTO>> GetInfringementById(int id)
        {
            try
            {
                var infringement = await _infrigementProcedures.GetInfrigementById(id);
                if (infringement == null)
                {
                    return StatusCode(404, "Violation not found");
                }
                return Ok(infringement);
            }
            catch (System.Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        //Post Infringement to the database
        [HttpPost]
        [Route("violation/Post")]
        [Authorize]
        public async Task<ActionResult<InfringementShared>> PostViolation([FromBody] InfringementShared infringement)
        {
            try
            {
                var newInfringement = await _infrigementProcedures.AddInfringement(infringement, User.Identity.Name);

                if(newInfringement == null)
                {
                    return StatusCode(400, "Violation not Added");
                }

                return Ok(newInfringement);

            }
            catch (NullReferenceException nullReferenceException)
            {
                return StatusCode(400, nullReferenceException.Message);
            }
            catch (System.Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpGet]
        [Route("violation/GetViolationRateByRole")]
        [Authorize]
        public async Task<IEnumerable<InfrigementRateSharedModel>> GetViolationRatesByRoleAsync()
        {
           
            //get violation rate by role
            var violationRate = await _infrigementProcedures
                .GetViolationRateByRole(User.Identity.Name);

            return violationRate;
        }

        //get all violation rates
        [HttpGet]
        [Route("violation/GetAllViolationRates")]
        [Authorize(Roles = "Admin")]
        public async Task<ActionResult<IEnumerable<InfrigementRateSharedModel>>> GetAllViolationRates()
        {
            try
            {
                var violationRates = await _infrigementProcedures.GetAllViolationsLevel();

                return Ok(violationRates);  
            }
            catch (NoInfrigementRatesFoundException noInfrigementRatesFoundException)
            {
                return StatusCode(404, noInfrigementRatesFoundException.Message);
            }
            catch (System.Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }


        //get all regulations by violation level id
        [HttpGet]
        [Route("violation/GetRegulationByInfringementId/{InfringementLevelId}")]
        public async Task<ActionResult<IEnumerable<RegulationsSharedModel>>>
            GetRegulationByInfringementId(int InfringementLevelId)
        {
            try
            {
                var regulations = await _infrigementProcedures.GetRegulationByInfringementId(InfringementLevelId);

                IEnumerable<RegulationsSharedModel> regulationsSharedModel = regulations.Select(regulation => new RegulationsSharedModel
                {
                    Id = regulation.Id,
                    Title = regulation.Title,
                    Description = regulation.Description,
                    ViolationLevelId = regulation.ViolationLevelId,
                    Point = regulation.Point
                });

                return Ok(regulationsSharedModel);
            }
            catch (NoRegulationsFoundException regulationsFoundException)
            {
                return StatusCode(404, regulationsFoundException.Message);
            }
            catch (System.Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }





        //foward violation to the next level
        [HttpPost]
        [Route("violation/ForwardViolation")]
        [Authorize]
        public async Task<ActionResult> ForwardViolation([FromBody] ForwardInfrigementModel forwardInfrigementModel)
        { 
            try
            {

                _logger.LogInformation($"Forward infringement model info: {forwardInfrigementModel.ToString()}");


                bool result = await _infrigementProcedures.ForwardInfringement(forwardInfrigementModel.InfrigementId,
                   forwardInfrigementModel.InfrigementFowardOptions,
                   forwardInfrigementModel.TraineeId,
                   User.Identity.Name);

                if (!result)
                {
                    return StatusCode(500, "something went wrong");
                }
            }

            catch(NoTrainnesFoundException noTrainnesFoundException)
            {
                return StatusCode(404, noTrainnesFoundException.Message);
            }

            catch (System.Exception ex)
            {
                return StatusCode(500, ex.Message);
            }

            return Ok("Violation forwarded successfully");
        }

        //get forwarded violations count
        [HttpGet]
        [Route("violation/GetForwardedViolationsCount")]
        [Authorize]
        public async Task<ActionResult<int>> GetForwardedViolationsCount()
        {
            try
            {
                var forwardedViolationsCount = await _infrigementProcedures.GetForwardedInfringementsCount();
                return Ok(forwardedViolationsCount);
            }
            catch (System.Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

    }
}
