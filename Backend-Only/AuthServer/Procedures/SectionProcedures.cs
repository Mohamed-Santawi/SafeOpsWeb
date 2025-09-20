using AuthServer.Data;
using AuthServer.Entity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace AuthServer.Procedures
{
    public class SectionProcedures
    {
        #region Fields
        private readonly ApplicationDbContext _context;
        #endregion
        #region Constructors
        public SectionProcedures(ApplicationDbContext applicationDbContext)
        {
            this._context = applicationDbContext;
        }
        #endregion
        #region Methods
        public async Task<IEnumerable<AppSectionsEntity>> GetSections() 
            => await _context.AppSections.ToListAsync();
        #endregion
    }
}
