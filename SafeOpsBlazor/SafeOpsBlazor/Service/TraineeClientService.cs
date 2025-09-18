using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http.Json;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using AuthShared.Models;
using SafeOpsBlazor.Model;

namespace SafeOpsBlazor.Service
{
    public class TraineeClientService
    {
        #region Fields


        private readonly HttpClient httpClient;

        #endregion

        #region Properties



        #endregion

        #region Events

        public event EventHandler<TraineeShared> TraineeAdded;
        public event EventHandler<TraineeShared> TraineeUpdated;
        public event EventHandler<TraineeShared> TraineeDeleted;
        public event EventHandler OnUnauthorized;

        #endregion

        #region Constructor

        public TraineeClientService(HttpClient httpClient)
        {
            this.httpClient = httpClient;
        }

        #endregion


        #region Methods

        //get trainees count
        public async Task<int> GetTraineesCountAsync()
        {
            var response = await httpClient.GetAsync("trainee/GetAllCount");
            if (response.IsSuccessStatusCode)
            {
                return await response.Content.ReadFromJsonAsync<int>();
            }
            if (response.StatusCode == HttpStatusCode.Unauthorized)
            {
                OnUnauthorized?.Invoke(this, EventArgs.Empty);
            }
            return 0;
        }


        //update trainee
        public async Task<ServerResponse> UpdateTraineeAsync(TraineeShared trainee)
        {
            var content = new StringContent(JsonSerializer.Serialize(trainee), Encoding.UTF8, "application/json");
            var response = await httpClient.PutAsync("Trainee/Update", content);
            var responseContent = await response.Content.ReadAsStringAsync();
            if (String.IsNullOrEmpty(responseContent.ToString()))
            {
                return new ServerResponse { Detail = "Server error", Status = 500 };
            }
            ServerResponse serverResponse = JsonSerializer.Deserialize<ServerResponse>(responseContent,
                new JsonSerializerOptions { PropertyNameCaseInsensitive = true });
            if (response.IsSuccessStatusCode)
            {
                TraineeUpdated?.Invoke(this, trainee);
                return serverResponse;
            }
            else if (response.StatusCode == HttpStatusCode.Unauthorized)
            {
                OnUnauthorized?.Invoke(this, EventArgs.Empty);
                return serverResponse;
            }
            else
            {
                return serverResponse;
            }
        }

        //get by id
        public async Task<TraineeSingleResult> GetTraineeByIdAsync(int id)
        {
            var response = await httpClient.GetAsync($"trainee/GetById/{id}");
            var content = await response.Content.ReadAsStringAsync();

            if(string.IsNullOrEmpty(content))
            {
                return new TraineeSingleResult() { Trainee = null, StatusCode = HttpStatusCode.InternalServerError };
            }

            if (response.IsSuccessStatusCode)
            {
                TraineeShared traineeShared = JsonSerializer.Deserialize<TraineeShared>(content,
                    new JsonSerializerOptions { PropertyNameCaseInsensitive = true });

                return new TraineeSingleResult { Trainee = traineeShared, StatusCode = response.StatusCode };
            }
            else if (response.StatusCode == HttpStatusCode.Unauthorized)
            {
                OnUnauthorized?.Invoke(this, EventArgs.Empty);
            }

            return new TraineeSingleResult { Trainee = null, StatusCode = response.StatusCode };

        }

        //by name
        public async Task<TraineeResult> GetTraineeByNameAsync(string name,uint current,uint max)
        {
            var response = await httpClient.GetAsync($"trainee/GetByName?name={name}&current={current}&max={max}");
            var content = await response.Content.ReadAsStringAsync();

            if (string.IsNullOrEmpty(content))
            {
                return new TraineeResult() { Trainees = null, StatusCode = HttpStatusCode.InternalServerError };
            }
            if (response.IsSuccessStatusCode)
            {
                List<TraineeShared> traineeShared = JsonSerializer.Deserialize<List<TraineeShared>>(content,
                    new JsonSerializerOptions { PropertyNameCaseInsensitive = true });
                return new TraineeResult { Trainees = traineeShared, StatusCode = response.StatusCode };
            }
            else if (response.StatusCode == HttpStatusCode.Unauthorized)
            {
                OnUnauthorized?.Invoke(this, EventArgs.Empty);
            }
            return new TraineeResult { Trainees = null, StatusCode = response.StatusCode };
        }

        //by national Id
        public async Task<TraineeSingleResult> GetTraineeByNationalIdAsync(int nationalId)
        {
            var response = await httpClient.GetAsync($"trainee/GetByNationalId/{nationalId}");
            var content = await response.Content.ReadAsStringAsync();
            if (string.IsNullOrEmpty(content))
            {
                return new TraineeSingleResult() { Trainee = null, StatusCode = HttpStatusCode.InternalServerError };
            }
            if (response.IsSuccessStatusCode)
            {
                TraineeShared traineeShared = JsonSerializer.Deserialize<TraineeShared>(content,
                    new JsonSerializerOptions { PropertyNameCaseInsensitive = true });
                return new TraineeSingleResult { Trainee = traineeShared, StatusCode = response.StatusCode };
            }
            else if (response.StatusCode == HttpStatusCode.Unauthorized)
            {
                OnUnauthorized?.Invoke(this, EventArgs.Empty);
            }
            return new TraineeSingleResult { Trainee = null, StatusCode = response.StatusCode };
        }

        public async Task<TraineeResult> GetTraineesAsync(uint current,uint max)
        {
            var response = await httpClient
                .GetAsync($"trainee/GetAll?current={current}&max={max}");
            var result = new TraineeResult { StatusCode = response.StatusCode };

            if (response.IsSuccessStatusCode)
            {
                var content = await response.Content.ReadAsStringAsync();
                result.Trainees = JsonSerializer.Deserialize<IEnumerable<TraineeShared>>(content,
                    new JsonSerializerOptions { PropertyNameCaseInsensitive = true });
            }

            else if (response.StatusCode == HttpStatusCode.Unauthorized)
            {
                OnUnauthorized?.Invoke(this, EventArgs.Empty);
            }

            return result;
        }


        public async Task<ServerResponse> AddTraineeAsync(TraineeShared trainee)
        {
            var content = new StringContent(JsonSerializer.Serialize(trainee), Encoding.UTF8, "application/json");
            var response = await httpClient.PostAsync("trainee/Add", content);

            string responseContent = await response.Content.ReadAsStringAsync();

            if ( string.IsNullOrEmpty(responseContent))
            {
                return new ServerResponse { Detail = "Server error", Status = 500 };
            }

                ServerResponse serverResponse = JsonSerializer.Deserialize<ServerResponse>(responseContent,
                new JsonSerializerOptions { PropertyNameCaseInsensitive = true });

            if (response.IsSuccessStatusCode)
            {

                TraineeAdded?.Invoke(this, trainee);

                return serverResponse;
            }
            else if (response.StatusCode == HttpStatusCode.Unauthorized)
            {
                OnUnauthorized?.Invoke(this, EventArgs.Empty);
                return serverResponse;
            }
            else
            {
                return serverResponse;
            }
        }


        //delete trainee by id
        public async Task<ServerResponse> DeleteTraineeAsync(int id)
        {
            var response = await httpClient.DeleteAsync($"trainee/Delete/{id}");
            var responseContent = await response.Content.ReadAsStringAsync();
            if (string.IsNullOrEmpty(responseContent))
            {
                return new ServerResponse { Detail = "Server error", Status = 500 };
            }
            ServerResponse serverResponse = JsonSerializer.Deserialize<ServerResponse>(responseContent,
                new JsonSerializerOptions { PropertyNameCaseInsensitive = true });
            if (response.IsSuccessStatusCode)
            {
                TraineeDeleted?.Invoke(this, null);
                return serverResponse;
            }
            else if (response.StatusCode == HttpStatusCode.Unauthorized)
            {
                OnUnauthorized?.Invoke(this, EventArgs.Empty);
                return serverResponse;
            }
            else
            {
                return serverResponse;
            }
        }



        #endregion
    }
}
