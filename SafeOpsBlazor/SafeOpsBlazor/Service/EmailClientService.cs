using System.Net;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Text;
using AuthShared.Models;

namespace SafeOpsBlazor.Services;

public class EmailClientService : IEmailClientService
{
    #region Fields

    private HttpClient _httpClient;
    
    #endregion
    public EmailClientService(HttpClient httpClient)
    {
        _httpClient = httpClient;
    }



    public async Task<ServerResponse> SendConfirmationEmail(string email)
    {
        HttpResponseMessage httpResponseMessage = await _httpClient.PostAsync($"/manage/User/SendConfirmEmail?email={email}", null);

        if (httpResponseMessage.IsSuccessStatusCode)
        {
            return await httpResponseMessage.Content.ReadFromJsonAsync<ServerResponse>();
        }
        else
        {
            return await httpResponseMessage.Content.ReadFromJsonAsync<ServerResponse>();
        }
    }

    
    public async Task<ServerResponse> SendResetPasswordAsync(ForgotPasswordModel forgotPasswordModel) 
    { 
        HttpResponseMessage httpResponseMessage = await _httpClient.PostAsJsonAsync($"/manage/User/ResetPassword", forgotPasswordModel);

        if (httpResponseMessage.IsSuccessStatusCode)
        {
            return await httpResponseMessage.Content.ReadFromJsonAsync<ServerResponse>();
        }
        else
        {
            if(string.IsNullOrEmpty(await httpResponseMessage.Content.ReadAsStringAsync()))
            {
                return new ServerResponse()
                {
                    Detail = "Error not assign",
                    Title = "Error",
                    Status = 500,
                };
            }
            return await httpResponseMessage.Content.ReadFromJsonAsync<ServerResponse>();
        }
    }
}