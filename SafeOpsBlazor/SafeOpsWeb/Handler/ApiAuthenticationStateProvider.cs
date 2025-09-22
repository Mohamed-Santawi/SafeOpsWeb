using Microsoft.AspNetCore.Components.Authorization;
using System.Net.Http.Headers;
using System.Security.Claims;
using System.Text.Json;
using AuthShared.Models;
using Microsoft.JSInterop;

namespace SafeOpsWeb.Handler
{
    public class ApiAuthenticationStateProvider : AuthenticationStateProvider
    {
        private readonly HttpClient _httpClient;
        private readonly IJSRuntime _jsRuntime;

        public ApiAuthenticationStateProvider(HttpClient httpClient, IJSRuntime jsRuntime)
        {
            _httpClient = httpClient;
            _jsRuntime = jsRuntime;
        }

        public async Task Login(LoginResponse loginResponse)
        {
            await _jsRuntime.InvokeVoidAsync("localStorage.setItem", "accessToken", loginResponse.accessToken);
            await _jsRuntime.InvokeVoidAsync("localStorage.setItem", "refreshToken", loginResponse.refreshToken);
            NotifyAuthenticationStateChanged(GetAuthenticationStateAsync());
        }

        public async Task Logout()
        {
            await _jsRuntime.InvokeVoidAsync("localStorage.removeItem", "accessToken");
            await _jsRuntime.InvokeVoidAsync("localStorage.removeItem", "refreshToken");
            _httpClient.DefaultRequestHeaders.Authorization = null;

            //assign empty claims
            NotifyAuthenticationStateChanged(GetAuthenticationStateAsync());
        }

        public override async Task<AuthenticationState> GetAuthenticationStateAsync()
        {
            var identity = new ClaimsIdentity();
            try
            {
                var accessToken = await _jsRuntime.InvokeAsync<string>("localStorage.getItem", "accessToken");

                if (!string.IsNullOrEmpty(accessToken))
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
                // For Blazor WebAssembly, we can't show alerts like in MAUI
                // Consider using a toast notification service instead
            }

            return new AuthenticationState(new ClaimsPrincipal(identity));
        }
    }
}