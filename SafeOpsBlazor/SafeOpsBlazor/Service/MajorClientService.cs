#pragma warning disable CS0067

using System.Reflection.Metadata.Ecma335;
using System.Text.Json;
using AuthShared.Models;
using SafeOpsBlazor.Helpers;
using SafeOpsBlazor.Model;

namespace SafeOpsBlazor.Service;

public class MajorClientService
{
    #region Fields

    private readonly HttpClient httpClient;

    private JsonSerializerOptions jsonSerializerOptions;

    #endregion

    #region Events  

    public event EventHandler<bool> MajorClientCreated;

    public event EventHandler<bool> MajorClientUpdated;

    public event EventHandler<bool> MajorClientDeleted;

    public event EventHandler<bool> MajorClientInvoked;

    public event EventHandler<bool> MajorClientError;

    public event EventHandler<bool> OnUnauthorized;

    #endregion

    #region Constructors




    public MajorClientService(HttpClient httpClient)
    {
        this.httpClient = httpClient;


        //assign
        jsonSerializerOptions = new JsonSerializerOptions(
            new JsonSerializerOptions
            {
                PropertyNamingPolicy = new LowerCaseNamingPolicy()
            });
    }

    #endregion

    #region Methods

    public async Task<MajorSharedModel> GetMajorById(int id)
    {
        try
        {
            HttpResponseMessage httpResponseMessage = await httpClient
                .GetAsync("major/GetById/" + id);
            if (httpResponseMessage.IsSuccessStatusCode)
            {
                string response = await httpResponseMessage.Content.ReadAsStringAsync();
                MajorSharedModel major = JsonSerializer.Deserialize<MajorSharedModel>(response);
                return major;
            }

            else if(httpResponseMessage.StatusCode == System.Net.HttpStatusCode.Unauthorized)
            {
                OnUnauthorized?.Invoke(this, true);
                return null;
            }
        }
        catch (Exception ex)
        {
            MajorClientError?.Invoke(this, true);
        }
        return null;
    }

    public async Task<IEnumerable<MajorSharedModel>> GetAllMajors()
    {
        try
        {
            HttpResponseMessage httpResponseMessage = await httpClient.GetAsync("major/GetAll");
            if (httpResponseMessage.IsSuccessStatusCode)
            {
                string response = await httpResponseMessage.Content.ReadAsStringAsync();
                IEnumerable<MajorSharedModel> majors = JsonSerializer
                    .Deserialize<IEnumerable<MajorSharedModel>>(response);
                return majors;
            }

            else if (httpResponseMessage.StatusCode == System.Net.HttpStatusCode.Unauthorized)
            {
                OnUnauthorized?.Invoke(this, true);

                return null;
            }
        }
        catch (Exception ex)
        {
            MajorClientError?.Invoke(this, true);
        }
        return null;
    }

    public async Task<TraineeMajorResult> GetAllTraineeMajors()
    {
        try
        {
            HttpResponseMessage httpResponseMessage = await httpClient
                .GetAsync("major/Trainee/GetAll");
            var traineeMajorResult = new TraineeMajorResult { StatusCode = httpResponseMessage.StatusCode };
            if (httpResponseMessage.IsSuccessStatusCode)
            {
                string response = await httpResponseMessage.Content.ReadAsStringAsync();
                IEnumerable<TraineeMajorShared> majors = JsonSerializer
                    .Deserialize<IEnumerable<TraineeMajorShared>>(response,jsonSerializerOptions);
                traineeMajorResult.TraineeMajors = majors;
                return traineeMajorResult;
            }

            else if (httpResponseMessage.StatusCode == System.Net.HttpStatusCode.Unauthorized)
            {
                OnUnauthorized?.Invoke(this, true);

                return null;
            }
        }
        catch (Exception ex)
        {
            MajorClientError?.Invoke(this, true);
        }
        return null;
    }



    #endregion
}