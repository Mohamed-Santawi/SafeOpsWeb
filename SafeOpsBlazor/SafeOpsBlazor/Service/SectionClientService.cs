using System.Text.Json;
using AuthShared.Models;

namespace SafeOpsBlazor.Service;

public class SectionClientService
{
    #region Fields

    private readonly HttpClient httpClient;

    #endregion

    #region Events

    public event EventHandler<bool> SectionClientCreated;
    public event EventHandler<bool> SectionClientUpdated;
    public event EventHandler<bool> SectionClientDeleted;
    public event EventHandler<bool> SectionClientInvoked;

    public event EventHandler<bool> SectionClientError;

    public event EventHandler<bool> OnUnauthorized;

    #endregion


    #region Constructors

    public SectionClientService(HttpClient httpClient)
    {
        this.httpClient = httpClient;
    }
    #endregion

    #region Methods

    public async Task<SectionSharedModel> GetSectionById(int id)
    {
        try
        {
            HttpResponseMessage httpResponseMessage = await httpClient.GetAsync("section/GetById/" + id);
            if (httpResponseMessage.IsSuccessStatusCode)
            {
                string response = await httpResponseMessage.Content.ReadAsStringAsync();
                SectionSharedModel section = JsonSerializer.Deserialize<SectionSharedModel>(response);
                return section;
            }

            else if (httpResponseMessage.StatusCode == System.Net.HttpStatusCode.Unauthorized)
            {
                OnUnauthorized?.Invoke(this, true);
            }
        }
        catch (Exception ex)
        {
            SectionClientError?.Invoke(this, true);
        }
        return null;
    }

    public async Task<IEnumerable<SectionSharedModel>> GetAllSections()
    {
        try
        {
            HttpResponseMessage httpResponseMessage = await httpClient
                .GetAsync("section/GetAll");
            if (httpResponseMessage.IsSuccessStatusCode)
            {
                string response = await httpResponseMessage.Content.ReadAsStringAsync();
                IEnumerable<SectionSharedModel> sections = JsonSerializer.Deserialize<IEnumerable<SectionSharedModel>>(response);
                return sections;
            }

            else if (httpResponseMessage.StatusCode == System.Net.HttpStatusCode.Unauthorized)
            {
                OnUnauthorized?.Invoke(this, true);
            }
        }
        catch (Exception ex)
        {
            SectionClientError?.Invoke(this, true);
        }
        return null;
    }

    #endregion


}