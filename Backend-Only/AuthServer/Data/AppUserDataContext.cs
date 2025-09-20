using AuthServer.Entity;
using AuthShared.Models;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace AuthServer.Data
{
    public class AppUserDataContext : IdentityDbContext<AppUserEntity>
    {
        public AppUserDataContext(DbContextOptions<AppUserDataContext> options) : base(options) { }


        override protected void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            #region AppUserEntity

            modelBuilder.Entity<AppUserEntity>()
                .Property(p => p.JobNumber)
                .IsRequired();

            modelBuilder.Entity<AppUserEntity>()
                .HasIndex(u => u.JobNumber)
                .IsUnique();

            #endregion


        }
    }
}
