using AuthServer.Entity;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

namespace AuthServer.Data;


public class ApplicationDbContext : DbContext
{
    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) { }

    public DbSet<AppSectionsEntity> AppSections { get; set; }
    public DbSet<UserSectionEntity> UserSection { get; set; }
    public DbSet<InfringementEntity> Infringements { get; set; }
    public DbSet<ForwardEntity> Forward { get; set; }


    public DbSet<TraineeEntity> Trainee { get; set; }
    public DbSet<TraineeMajorEntity> TraineeMajor { get; set; }


    public DbSet<UserMajorEntity> UserMajor { get; set; }
    public DbSet<MajorEntity> Major { get; set; }

    public DbSet<UserActionsEntitiy> UserActions { get; set; }

    public DbSet<InfringementAttachmentEntity> InfringementAttachment { get; set; }

    public DbSet<BuildingEntity> Building { get; set; }

    public DbSet<RegulationsEntity> Regulations { get; set; }


    public DbSet<ViolationsLevelEntity> ViolationsLevel { get; set; }

    public DbSet<ViolationProceduresEntity> ViolationProcedures { get; set; }

    public DbSet<MaintenanceOrderEntity> MaintenanceOrder { get; set; }

    public DbSet<RoleViolationLevelEntity> RoleViolationLevel { get; set; }



    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        #region Ignore

        #endregion

        #region UserMajor

        modelBuilder.Entity<UserMajorEntity>()
            .HasKey(t => t.Id);

        modelBuilder.Entity<UserMajorEntity>()
            .HasOne(u => u.Major)
            .WithMany()
            .HasForeignKey(u => u.MajorId)
            .OnDelete(DeleteBehavior.Restrict);

        #endregion


        #region Major

        modelBuilder.Entity<MajorEntity>()
            .HasKey(m => m.Id);

        modelBuilder.Entity<MajorEntity>()
            .Property(m => m.Id)
            .ValueGeneratedOnAdd();

        #endregion



        #region Forward

        modelBuilder.Entity<ForwardEntity>()
            .HasKey(f => f.Id);


        modelBuilder.Entity<ForwardEntity>()
            .Property(f => f.Id)
            .ValueGeneratedOnAdd();

        modelBuilder.Entity<ForwardEntity>()
            .HasOne(f => f.Infringement)
            .WithMany()
            .HasForeignKey(p => p.InfringementId)
            .OnDelete(DeleteBehavior.Restrict);

        modelBuilder.Entity<ForwardEntity>()
            .Property(f => f.RoleId)
            .IsRequired(false);

        modelBuilder.Entity<ForwardEntity>()
            .Property(f => f.UserId)
            .IsRequired(false);

        modelBuilder.Entity<ForwardEntity>()
            .Property(f => f.ForwardedFrom)
            .IsRequired(true);


        modelBuilder.Entity<ForwardEntity>()
            .HasOne(f => f.Trainee)
            .WithMany()
            .HasPrincipalKey(t => t.Id)
            .HasForeignKey(f => f.TraineeId)
            .OnDelete(DeleteBehavior.Restrict);


        #endregion



        #region Trainee

        modelBuilder.Entity<TraineeEntity>()
            .HasIndex(t => t.AcademyId)
            .IsUnique(true);

        modelBuilder.Entity<TraineeEntity>()
            .HasKey(t => t.Id);

        modelBuilder.Entity<TraineeEntity>()
            .Property(t => t.Id)
            .ValueGeneratedOnAdd();


        modelBuilder.Entity<TraineeEntity>()
            .Property(t => t.Id)
            .IsRequired();

        modelBuilder.Entity<TraineeEntity>()
            .HasOne(t => t.TraineeMajor)
            .WithMany()
            .HasPrincipalKey(t => t.Id)
            .HasForeignKey(t => t.Major)
            .OnDelete(DeleteBehavior.Restrict);

        #endregion





        #region Infringement

        modelBuilder.Entity<InfringementEntity>()
            .HasKey(t => t.Id);

        modelBuilder.Entity<InfringementEntity>()
            .Property(t => t.Id)
            .ValueGeneratedOnAdd();

        modelBuilder.Entity<InfringementEntity>()
            .HasOne(i => i.Trainee)
            .WithMany()
            .HasPrincipalKey(t => t.Id)
            .HasForeignKey(i => i.TraineeId)
            .OnDelete(DeleteBehavior.Restrict);

        modelBuilder.Entity<InfringementEntity>()
            .HasOne(i => i.AppSectionsEntity)
            .WithMany()
            .HasPrincipalKey(a => a.Id)
            .HasForeignKey(i => i.SectionId)
            .OnDelete(DeleteBehavior.Restrict);

        modelBuilder.Entity<InfringementEntity>()
            .HasOne(i => i.RegulationsEntity)
            .WithMany()
            .HasPrincipalKey(r => r.Id)
            .HasForeignKey(i => i.RegulationId)
            .OnDelete(DeleteBehavior.Restrict);


        modelBuilder.Entity<InfringementEntity>()
            .Property(i => i.TrainerId)
            .IsRequired();

        modelBuilder.Entity<InfringementEntity>()
            .Property(i => i.Date)
            .IsRequired();

        modelBuilder.Entity<InfringementEntity>()
            .Property(i => i.IsInfringementProceeddByTrainee)
            .IsRequired(true);

        modelBuilder.Entity<InfringementEntity>()
            .Property(i => i.IsTraineeReported)
            .IsRequired(true);

        #endregion


        //#region Ficlities



        //#endregion

        #region Sections

        modelBuilder.Entity<AppSectionsEntity>()
            .HasKey(t => t.Id);

        modelBuilder.Entity<AppSectionsEntity>()
            .Property(t => t.Id)
            .ValueGeneratedOnAdd();

        modelBuilder.Entity<AppSectionsEntity>()
         .HasOne(b => b.BuildingEntity)
         .WithMany()
         .HasPrincipalKey(b => b.Id)
         .HasForeignKey(a => a.BuildingNum)
         .OnDelete(DeleteBehavior.Restrict);

        #endregion


        #region UserSection

        modelBuilder.Entity<UserSectionEntity>()
            .Property(u => u.Id)
            .ValueGeneratedOnAdd();


        modelBuilder.Entity<UserSectionEntity>()
            .HasOne(u => u.AppSection)
            .WithMany()
            .HasPrincipalKey(a => a.Id)
            .HasForeignKey(u => u.SectionId)
            .OnDelete(DeleteBehavior.Restrict);

        #endregion

        #region UserActions

        modelBuilder.Entity<UserActionsEntitiy>()
            .HasKey(t => t.Id);

        modelBuilder.Entity<UserActionsEntitiy>()
            .Property(t => t.Id)
            .ValueGeneratedOnAdd();

        #endregion

        #region InfringementAttachment

        modelBuilder.Entity<InfringementAttachmentEntity>()
            .HasKey(t => t.Id);

        modelBuilder.Entity<InfringementAttachmentEntity>()
            .Property(t => t.Id)
            .ValueGeneratedOnAdd();

        modelBuilder.Entity<InfringementAttachmentEntity>()
            .HasOne(i => i.Infringement)
            .WithMany()
            .HasPrincipalKey(i => i.Id)
            .HasForeignKey(i => i.InfringementId)
            .OnDelete(DeleteBehavior.Restrict);

        #endregion

        #region Regulations

        modelBuilder.Entity<RegulationsEntity>()
            .HasKey(t => t.Id);

        modelBuilder.Entity<RegulationsEntity>()
            .Property(t => t.Id)
            .ValueGeneratedOnAdd();

        modelBuilder.Entity<RegulationsEntity>()
            .HasOne(r => r.ViolationsLevel)
            .WithMany()
            .HasPrincipalKey(v => v.Id)
            .HasForeignKey(r => r.ViolationLevelId)
            .OnDelete(DeleteBehavior.Restrict);

        #endregion

        #region MaintenanceOrder

        modelBuilder.Entity<MaintenanceOrderEntity>()
            .HasKey(t => t.Id);

        modelBuilder.Entity<MaintenanceOrderEntity>()
            .Property(m => m.Id)
            .ValueGeneratedOnAdd();

        #endregion

        #region ViolationsLevel

        modelBuilder.Entity<ViolationsLevelEntity>()
            .HasKey(t => t.Id);

        modelBuilder.Entity<ViolationsLevelEntity>()
            .Property(t => t.Id)
            .ValueGeneratedOnAdd();



        #endregion

        #region ViolationProcedures

        modelBuilder.Entity<ViolationProceduresEntity>()
            .HasKey(t => t.Id);
        modelBuilder.Entity<ViolationProceduresEntity>()
            .Property(t => t.Id)
            .ValueGeneratedOnAdd();
        modelBuilder.Entity<ViolationProceduresEntity>()
            .HasOne(v => v.RegulationsEntity)
            .WithMany()
            .HasPrincipalKey(r => r.Id)
            .HasForeignKey(v => v.RegulationId)
            .OnDelete(DeleteBehavior.Restrict);
        #endregion

        #region RoleViolationLevel

        modelBuilder.Entity<RoleViolationLevelEntity>()
            .HasKey(t => t.Id);

        modelBuilder.Entity<RoleViolationLevelEntity>()
            .Property(t => t.Id)
            .ValueGeneratedOnAdd();


        #endregion

    }
}

