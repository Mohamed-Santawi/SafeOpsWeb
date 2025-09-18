using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http.Json;
using System.Text;
using System.Threading.Tasks;
using AuthShared.Enums;
using AuthShared.Models;

namespace SafeOpsBlazor.Service
{
    internal class MaintenaceClientService
    {
        #region Fields

        private readonly HttpClient _httpClient;

        #endregion

        #region Event

        public event EventHandler OnUnAuth;

        #endregion

        #region Constructor

        public MaintenaceClientService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        #endregion

        #region Methods


        //get maintenance count
        public async Task<int> GetMaintenanceCount()
        {
            var response = await _httpClient.GetAsync("Maintenance/GetMaintenanceCount");
            if (response.IsSuccessStatusCode)
            {
                return await response.Content.ReadFromJsonAsync<int>();
            }
            if (response.StatusCode == HttpStatusCode.Unauthorized)
            {
                OnUnAuth?.Invoke(this, null);
            }
            return 0;
        }

        public async Task<HttpResponseMessage> AddMaintenanceOrder(MaintenanceOrderSharedModel maintenanceOrderSharedModel)
        {
            if (maintenanceOrderSharedModel is null)
            {
                throw new ArgumentNullException(nameof(maintenanceOrderSharedModel));
            }
            var response = await _httpClient.PostAsJsonAsync<MaintenanceOrderSharedModel>("Maintenance/Post", maintenanceOrderSharedModel);

            return response;
        }

        public async Task<MaintenanceOrderResult> GetOrders(int current, int max,MaintenanceOrderStatus maintenanceOrderStatus,int? id = null)
        {
            var response = await _httpClient.GetAsync($"Maintenance/GetOrders?current={current}&max={max}&maintenanceOrderStatus={maintenanceOrderStatus}&Id={id}");


            if (response.IsSuccessStatusCode)
            {
                return await response.Content.ReadFromJsonAsync<MaintenanceOrderResult>();
            }

            if(response.StatusCode == HttpStatusCode.Unauthorized)
            {
                OnUnAuth?.Invoke(this, null);
            }

            return null;


        }


        public async Task<HttpResponseMessage> EditOrderAsync(MaintenanceOrderSharedModel maintenanceOrderSharedModel)
        {
            if (maintenanceOrderSharedModel is null)
            {
                throw new ArgumentNullException(nameof(maintenanceOrderSharedModel));
            }

            var response = await _httpClient.PostAsJsonAsync<MaintenanceOrderSharedModel>("Maintenance/EditOrder", maintenanceOrderSharedModel);

            if(response.StatusCode == HttpStatusCode.Unauthorized)
            {
                OnUnAuth?.Invoke(this, null);
            }

            return response;
        }




        #endregion

    }

}
