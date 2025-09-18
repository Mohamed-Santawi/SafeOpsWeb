using AuthShared.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Json;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace SafeOpsBlazor.Service
{
    public class RoleClientService
    {
        #region Fields
        private readonly HttpClient _httpClient;

        #endregion

        #region Constructor
        public RoleClientService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }
        #endregion


        #region Methods

        public async Task<IEnumerable<RoleSharedModel>> GetRolesAsync()
        {
            var response = await _httpClient.GetAsync("manage/Role/GetRoles");

            if (response.IsSuccessStatusCode)
            {
                var content = await response.Content.ReadFromJsonAsync<List<RoleSharedModel>>();


                if (content.Count > 0) return content;

                else return null;
            }


            return null;
        }

        #endregion


    }
}
