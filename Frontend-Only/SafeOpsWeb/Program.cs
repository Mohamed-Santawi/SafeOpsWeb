using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Components.WebAssembly.Hosting;
using SafeOpsWeb;
using SafeOpsWeb.Services;
using SafeOpsWeb.Handler; // Add this line
using Syncfusion.Blazor;
using Microsoft.AspNetCore.Components.Authorization;
using Microsoft.Extensions.Localization;

var builder = WebAssemblyHostBuilder.CreateDefault(args);
builder.RootComponents.Add<App>("#app");
builder.RootComponents.Add<HeadOutlet>("head::after");

// Configure HttpClient with your API base URL
builder.Services.AddScoped(sp => new HttpClient {
    BaseAddress = new Uri("https://authserver-production-4ea8.up.railway.app/") // Update this URL
});

// Add services
builder.Services.AddScoped<AuthService>();
builder.Services.AddScoped<UserClientService>();
builder.Services.AddScoped<MaintenaceClientService>();
builder.Services.AddScoped<TraineeClientService>();
builder.Services.AddScoped<ViolationClientService>();
builder.Services.AddScoped<SectionClientService>();
builder.Services.AddScoped<MajorClientService>();
builder.Services.AddScoped<RoleClientService>();
builder.Services.AddScoped<ToastService>();
builder.Services.AddScoped<FileService>();
builder.Services.AddScoped<EmailClientService>();
builder.Services.AddScoped<TraineeSearchService>();

// Add authentication
builder.Services.AddAuthorizationCore();
builder.Services.AddScoped<AuthenticationStateProvider, ApiAuthenticationStateProvider>();

// Add localization
builder.Services.AddLocalization();

// Add Syncfusion
builder.Services.AddSyncfusionBlazor();

await builder.Build().RunAsync();
