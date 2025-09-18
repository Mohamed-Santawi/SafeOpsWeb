using SafeOpsBlazor.Auth;
using Microsoft.AspNetCore.Components.Authorization;
using Microsoft.Extensions.Logging;
using SafeOpsBlazor.Service;
using Syncfusion.Blazor;
using SafeOpsBlazor.Services;
using Plugin.Maui.Audio;
using CommunityToolkit.Maui;
using SafeOpsBlazor.Provider;
using SafeOpsBlazor.data;
using Microsoft.Extensions.Configuration;
using SafeOpsBlazor.Helper;
namespace SafeOpsBlazor
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder.UseMauiApp<App>()
                .UseMauiCommunityToolkit()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                });

            builder.Services.AddMauiBlazorWebView();


            //helpers
            builder.Services.AddSingleton<ConsoleHelper>();

            //auth
            builder.Services.AddAuthorizationCore();


            //localizer
            builder.Services.AddLocalization();


            //configration manager
            builder.Configuration.AddJsonFile("appsettings.json", optional: false, reloadOnChange: true);
            builder.Services.AddSingleton<IConfiguration>(builder.Configuration);



            //Singletons Services
            builder.Services.AddSingleton<UserClientService>();
            builder.Services.AddSingleton<MaintenaceClientService>();
            builder.Services.AddSingleton<TraineeDataService>();
            builder.Services.AddSingleton(AudioManager.Current);
            builder.Services.AddSingleton<SafeOpsBlazor.Manager.AudioManager>();
            builder.Services.AddSingleton<ToastService>();
            builder.Services.AddSingleton<ILoggerFactory, LoggerFactory>();
            builder.Services.AddSingleton(typeof(ILogger<>), typeof(Logger<>));
            builder.Services.AddSingleton<IEmailClientService, EmailClientService>();
            builder.Services.AddSingleton<AuthenticationStateProvider, ApiAuthenticationStateProvider>();
            builder.Services.AddSingleton<SectionClientService>();
            builder.Services.AddSingleton<MajorClientService>();
            builder.Services.AddSingleton<ViolationClientService>();
            builder.Services.AddSingleton<TraineeClientService>();
            builder.Services.AddSingleton<RoleClientService>();
            builder.Services.AddSingleton<AuthService>();
            builder.Services.AddSingleton<HttpClient>(h => new HttpClient()
            {
                BaseAddress = new Uri("https://localhost:7003/")
            });
            

#if DEBUG
            builder.Services.AddBlazorWebViewDeveloperTools();
    		builder.Logging.AddDebug();
#endif


            builder.Services.AddSyncfusionBlazor();

            ServiceLocator.ServiceProvider = builder.Services.BuildServiceProvider();

            //register license key syncfusion

            return builder.Build();
        }
    }
}
