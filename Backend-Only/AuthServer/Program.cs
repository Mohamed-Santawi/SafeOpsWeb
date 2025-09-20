#pragma warning disable CS8618 // Non-nullable field must contain a non-null value when exiting constructor. Consider declaring as nullable.
#pragma warning disable CS8602 // Dereference of a possibly null reference.
#pragma warning disable CS8603 // Possible null reference return.
#pragma warning disable CS8600 // Converting null literal or possible null value to non-nullable type.
#pragma warning disable CS8601 // Possible null reference assignment.
#pragma warning disable CS8604 // Possible null reference argument.

using AuthServer.Data;
using AuthServer.Entity;
using AuthServer.InfterFace;
using AuthServer.Procedures;
using AuthServer.Services;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Npgsql.EntityFrameworkCore.PostgreSQL;
using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.Filters;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllers();
builder.Services.AddRazorPages();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(options =>
{
    options.AddSecurityDefinition("oauth2", new Microsoft.OpenApi.Models.OpenApiSecurityScheme
    {
        In = ParameterLocation.Header,
        Description = "Please enter a valid token",
        Name = "Authorization",
        Type = SecuritySchemeType.Http,
        BearerFormat = "JWT",
        Scheme = "Bearer",
    });

    //opreation filter security requirements opreation filter
    options.OperationFilter<SecurityRequirementsOperationFilter>();
});

builder.Services.AddDbContext<AuthServer.Data.AppUserDataContext>(options =>
{
    options.UseNpgsql(builder.Configuration.GetConnectionString("DefaultConnection"));
});

builder.Services.AddDbContext<AuthServer.Data.ApplicationDbContext>(options =>
{
    options.UseNpgsql(builder.Configuration.GetConnectionString("DefaultConnection"));
});

builder.Services.AddIdentity<AppUserEntity, IdentityRole>(options =>
{
    options.Password = new()
    {
        RequireDigit = true,
        RequiredLength = 8,
        RequireLowercase = true,
        RequireNonAlphanumeric = true,
        RequireUppercase = true,
    };

    options.User = new()
    {
        AllowedUserNameCharacters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._@+",
        RequireUniqueEmail = true,
    };

    options.SignIn = new()
    {
        RequireConfirmedEmail = true,
        RequireConfirmedPhoneNumber = false
    };
}).AddRoles<IdentityRole>()
    .AddEntityFrameworkStores<AuthServer.Data.AppUserDataContext>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.MapIdentityApi<AppUserEntity>();

app.UseHttpsRedirection();

// Serve static files from both wwwroot and frontend
app.UseStaticFiles();
app.UseStaticFiles(new StaticFileOptions
{
    FileProvider = new Microsoft.Extensions.FileProviders.PhysicalFileProvider(
        Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "frontend")),
    RequestPath = "/frontend"
});

app.UseRouting();
app.UseAuthorization();

app.MapControllers();

// Add health check endpoint
app.MapGet("/health", () => "OK");
app.MapRazorPages();

// Serve frontend for non-API routes
app.MapFallbackToFile("frontend/index.html");

// Add API info endpoint
app.MapGet("/api/info", () => new { 
    message = "SafeOps API", 
    version = "1.0", 
    status = "Running",
    timestamp = DateTime.UtcNow,
    endpoints = new[] { "/health", "/api/info", "/swagger" }
});

app.Run();
