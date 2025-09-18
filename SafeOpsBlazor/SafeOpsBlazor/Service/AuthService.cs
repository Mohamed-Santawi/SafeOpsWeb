using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Net.Http.Headers;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using AuthShared.Models;
using AuthShared.DTOs;
using AuthShared.Enums;
using SafeOpsBlazor.Helpers;
using SafeOpsBlazor.Model;

namespace SafeOpsBlazor.Service
{
    public class AuthService
    {


        #region Fields

        private readonly HttpClient httpClient;

        #endregion



        #region Events

        public event LoggingHandler OnLoggingIn;
        public event EventHandler<bool> LoggedIn;
        public event LoggingHandler OnLoggingOut;
        public event EventHandler<bool> LoggedOut;
        public event ErrorEventHandler OnError;
        public event EventHandler<bool> OnUnauthorized;

        #endregion

        #region Properties


        #endregion

        #region Delegates

        public delegate void LoggingHandler(object sender);
        public delegate void ErrorEventHandler(object sender, Exception exception);

        #endregion
        public AuthService(HttpClient httpClient)
        {
            this.httpClient = httpClient;
        }


        #region Methods

        //logout



        public async Task<IEnumerable<InfrigementDTO>> GetInfringements(InfringementProcess infringementProcess
        , string name = null, int? nationalId = null)
        {
            try
            {

                //get with body


                var response = await httpClient.GetAsync(
                    $"/violation/Get?infringementProcess={infringementProcess}" +
                    $"&name={name}&nationalId={nationalId}");

                if (response.IsSuccessStatusCode)
                {
                    var responseMessage = await response.Content.ReadAsStringAsync();
                    List<InfrigementDTO> infrigementDto = JsonSerializer.Deserialize<List<InfrigementDTO>>(responseMessage);


                    return infrigementDto;
                }
                else if (response.StatusCode == System.Net.HttpStatusCode.Unauthorized)
                {
                    OnUnauthorized?.Invoke(this, true);
                }
            }

            catch (Exception exception)
            {
                OnError?.Invoke(this, exception);
            }

            return null;
        }
        public async Task<bool> IsLoggedIn() => !string.IsNullOrEmpty(await SecureStorage.GetAsync("token"));

        public async Task<bool> IsLoggedIn(string parm) => !string.IsNullOrEmpty(await SecureStorage.GetAsync(parm));


        public async Task<ServerResponse> Register(RegisterModelShared registerModel)
        {
            try
            {

                var options = new JsonSerializerOptions
                {
                    PropertyNamingPolicy = new LowerCaseNamingPolicy()
                };

                string content = JsonSerializer.Serialize(registerModel, options);
                var response = await httpClient.PostAsync("/manage/User/Register",
                    new StringContent(content, Encoding.UTF8, "application/json"));


                if (response.StatusCode == HttpStatusCode.InternalServerError)
                {
                    return new ServerResponse()
                    {
                        Detail = "Internal Server Error",
                        Status = 500
                    };
                }


                var responseMessage = await response.Content.ReadAsStringAsync();


                ServerResponse serverResponse = JsonSerializer.Deserialize<ServerResponse>(responseMessage, options);


                if (response.IsSuccessStatusCode)
                {
                    return serverResponse;
                }


                return serverResponse;


            }
            catch (Exception exception)
            {
                OnError?.Invoke(this, exception);
                return null;
            }
        }

        //public async Task<UserInformations> GetUserInformations()
        //{
        //    try
        //    {
        //        var response = await httpClient.GetAsync("");
        //        if (response.IsSuccessStatusCode)
        //        {
        //            var responseMessage = await response.Content.ReadAsStringAsync();
        //            UserInformations userInformations = JsonSerializer.Deserialize<UserInformations>(responseMessage);


        //            SecureStorage.SetAsync("userinfo", responseMessage);

        //            return userInformations;
        //        }
        //        else if (response.StatusCode == System.Net.HttpStatusCode.Unauthorized)
        //        {
        //            OnUnauthorized.Invoke(this, true);
        //        }


        //    }
        //    catch (Exception exception)
        //    {
        //        OnError?.Invoke(this, exception);
        //    }
        //    return null;
        //}



        #endregion
    }
}
