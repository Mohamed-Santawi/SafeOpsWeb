using AuthServer.Data;
using AuthServer.Entity;
using AuthServer.Procedures;
using AuthShared.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace AuthServer.Controllers
{
    public class SectionController : Controller
    {
        #region Fields

        private SectionProcedures _sectionProcedures;

        #endregion

        #region Constructors

        public SectionController(SectionProcedures sectionProcedures)
        {
            _sectionProcedures = sectionProcedures;
        }

        #endregion

        #region Methods

        [HttpGet]
        [Route("section/GetAll")]
        public async Task<ActionResult<IEnumerable<AppSectionSharedModel>>> GetSections()
        { 
            return Ok(await _sectionProcedures.GetSections());
        }

        #endregion
    }
}
