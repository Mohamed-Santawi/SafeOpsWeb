using Microsoft.AspNetCore.Components.Authorization;
using System.Net.Http.Headers;
using System.Runtime.InteropServices;
using System.Security.Claims;
using System.Text.Json;
using System.Text.Json.Serialization;
using AuthShared.Models;
using SafeOpsWeb.CustomException;

namespace SafeOpsWeb.Auth
{
    public class ApiAuthenticationStateProvider : AuthenticationStateProvider
    {

        HttpClient _httpClient;

        public ApiAuthenticationStateProvider(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public async Task Login(LoginResponse loginResponse)
        {
            await SecureStorage.SetAsync("accessToken", loginResponse.accessToken);
            await SecureStorage.SetAsync("refreshToken", loginResponse.refreshToken);
            NotifyAuthenticationStateChanged(GetAuthenticationStateAsync());
        }





        

        public async Task Logout()
        {
            SecureStorage.Remove("accessToken");
            SecureStorage.Remove("refreshToken");
            _httpClient.DefaultRequestHeaders.Authorization = null;
           
            //assign empty claims
            NotifyAuthenticationStateChanged(GetAuthenticationStateAsync());
        }

        public override async Task<AuthenticationState> GetAuthenticationStateAsync()
        {
            var identity = new ClaimsIdentity();
            try
            {
                var accessToken = await SecureStorage.GetAsync("accessToken");

                if (accessToken != null)
                {
                    _httpClient.DefaultRequestHeaders.Authorization =
                        new AuthenticationHeaderValue("Bearer", accessToken);
                    var response = await _httpClient.GetAsync($"/manage/User/GetUserInfo");
                    if (response.IsSuccessStatusCode)
                    {
                        var content = await response.Content.ReadAsStringAsync();
                        UserInformations userInformations = JsonSerializer.Deserialize<UserInformations>(content,
                            new JsonSerializerOptions { PropertyNameCaseInsensitive = true });

                        var claims = new[]
                        {
                            new Claim(ClaimTypes.Email, userInformations.Email),
                            new Claim(ClaimTypes.Name, userInformations.FirstName),
                            new Claim(ClaimTypes.UserData, content),
                            new Claim(ClaimTypes.Role, userInformations.Role ?? "None")
                        };
                        identity = new ClaimsIdentity(claims, "Server authentication");

                    }
                }
                else
                {
                    identity = new ClaimsIdentity();
                }
            }
            catch (HttpRequestException ex)
            {
                Console.WriteLine("Request failed:" + ex.ToString());
                await Application.Current.MainPage.DisplayAlert("Error", "Request failed check the server!!!", "OK");
            }

            return new AuthenticationState(new ClaimsPrincipal(identity));
        }
    }
}
