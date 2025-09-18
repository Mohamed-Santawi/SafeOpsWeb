using AuthShared.Enums;
using AuthShared.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Json;
using System.Text;
using System.Threading.Tasks;

namespace SafeOpsBlazor.Service
{
    public class UserClientService
    {
        #region Fields

        //readonly fields
        private HttpClient _httpClient;

        #endregion

        #region Events

        public event EventHandler OnUnAuth;

        #endregion

        #region Constructor

        public UserClientService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        #endregion

        #region Methods


        public async Task<HttpResponseMessage> LockOrUnlockUserAsync(UserLockModel lockModel)
        {
            HttpResponseMessage response = await _httpClient.PostAsJsonAsync("manage/User/LockUser", lockModel);

            if(response.StatusCode == System.Net.HttpStatusCode.Unauthorized)
            {
                OnUnAuth?.Invoke(this,null);
            }

            return response;
        }


        //get users count
        public async Task<int> GetUsersCount()
        {
            var response = await _httpClient.GetAsync("manage/User/GetAllUsersCount");
            if (response.StatusCode == System.Net.HttpStatusCode.Unauthorized)
            {
                OnUnAuth?.Invoke(this, null);
            }
            if (response.IsSuccessStatusCode)
            {
                return await response.Content.ReadFromJsonAsync<int>();
            }
            else
            {
                return 0;
            }
        }


        public async Task<IEnumerable<UserInformations>> GetInformations()
        {
            var response = await _httpClient.GetAsync("manage/User/GetUsers");

            if (response.StatusCode == System.Net.HttpStatusCode.Unauthorized)
            {
                OnUnAuth?.Invoke(this, null);
            }

            if (response.IsSuccessStatusCode)
            {

                var content = await response.Content.ReadFromJsonAsync<IEnumerable<UserInformations>>();

                return content;
            }
            else
            {
                return null;
            }

        }

        public async Task<HttpResponseMessage> UpdateUserInformationsAsync(RoleDeleteType roleDeleteType,
            UserInformations userInformations)
        {
            var response = await _httpClient.PutAsJsonAsync($"manage/User/UpdateUser?roleDeleteType={roleDeleteType}",
                userInformations);


            if (response.StatusCode == System.Net.HttpStatusCode.Unauthorized)
            {
                OnUnAuth?.Invoke(this, null);
            }


            return response;
        }

        public async Task<HttpResponseMessage> UpdateCurrentUserInformationsAsync(
    UserInformations userInformations)
        {
            var response = await _httpClient.PutAsJsonAsync($"manage/User/UpdateCurrentUser",
                userInformations);


            if (response.StatusCode == System.Net.HttpStatusCode.Unauthorized)
            {
                OnUnAuth?.Invoke(this, null);
            }


            return response;
        }
        #endregion
    }
}
