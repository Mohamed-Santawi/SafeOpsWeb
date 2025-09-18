using AuthServer.Data;
using AuthServer.Entity;
using AuthServer.Procedures;
using AuthShared.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace AuthServer.Controllers
{
    public class MajorController : Controller
    {
        #region Fields

        MajorProcedures _majorProcedures;

        #endregion

        #region Constructors

        public MajorController(MajorProcedures majorProcedures)
        {
            _majorProcedures = majorProcedures;
        }

        #endregion


        #region Methods

        [HttpGet]
        [Route("major/User/GetAll")]
        public async Task<ActionResult<IEnumerable<UserMajorSharedModel>>> GetUserMajors()
        {
            return Ok(await _majorProcedures.GetUserMajorsAsync());
        }

        [HttpGet]
        [Route("major/GetAll")]
        public async Task<ActionResult<IEnumerable<MajorEntity>>> GetMajors()
        {
            return Ok(await _majorProcedures.GetMajorsAsync());
        }

        [HttpGet]
        [Route("major/Trainee/GetAll")]
        public async Task<ActionResult<IEnumerable<TraineeMajorEntity>>> GetAllMajors()
        {
            return Ok(await _majorProcedures.GetAllMajors());
        }

        #endregion
    }
}
