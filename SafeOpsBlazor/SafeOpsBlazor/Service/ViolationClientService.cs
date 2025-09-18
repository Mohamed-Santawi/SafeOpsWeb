using System.Net.Http.Json;
using AuthServer.CustomException;
using AuthShared.Models;
using AuthShared.DTOs;
using AuthShared.Enums;
using System.Text.Json;

namespace SafeOpsBlazor.Service;

public class ViolationClientService
{
    #region Fields

    private readonly HttpClient _httpClient;

    #endregion

    #region Enums

    public enum ViolationType
    {
        Violation,
        ViolationLevel,
        Regulations
    }

    #endregion

    #region Properties

    #endregion


    #region Delegates

    public delegate void OnViolationInvokedEventHandler(object sender, HttpResponseMessage e
    ,ViolationType violationType);

    public delegate void OnViolationDeletedEventHandler(object sender, HttpResponseMessage e
    ,ViolationType violationType);

    public delegate void OnViolationCreatedEventHandler(object sender, HttpResponseMessage e,
        ViolationType violationType);

    public delegate void OnViolationInvokingEventHandler(object sender,
        ViolationType violationType);

    public delegate void OnViolationCreatingEventHandler(object sender,
        ViolationType violationType);

    public delegate void OnViolationDeletingEventHandler(object sender,
        ViolationType violationType);


    #endregion

    #region Events

    public event OnViolationCreatedEventHandler OnViolationCreated;
    public event OnViolationDeletedEventHandler OnViolationDeleted;
    public event EventHandler<HttpResponseMessage> OnError;
    public event OnViolationInvokedEventHandler OnViolationInvoked;
    public event OnViolationInvokingEventHandler OnViolationInvoking;
    public event OnViolationCreatingEventHandler OnViolationCreating;
    public event OnViolationDeletingEventHandler OnViolationDeleting;
    public event EventHandler UnAuthorized;

    #endregion

    #region Constructors

    public ViolationClientService(HttpClient httpClient)
    {
        this._httpClient = httpClient;
    }

    #endregion

    #region Methods


    //get all violations count
    public async Task<int> GetViolationsCountAsync()
    {
        var response = await _httpClient.GetAsync("violation/GetAllViolationCount");
        if (response.IsSuccessStatusCode)
        {
            return await response.Content.ReadFromJsonAsync<int>();
        }
        if (response.StatusCode == System.Net.HttpStatusCode.Unauthorized)
        {
            UnAuthorized?.Invoke(this, EventArgs.Empty);
        }
        return 0;
    }

    //get forwarded violations count
    public async Task<int> GetForwardedViolationsCountAsync()
    {
        var response = await _httpClient.GetAsync("violation/GetForwardedViolationsCount");
        if (response.IsSuccessStatusCode)
        {
            return await response.Content.ReadFromJsonAsync<int>();
        }
        if (response.StatusCode == System.Net.HttpStatusCode.Unauthorized)
        {
            UnAuthorized?.Invoke(this, EventArgs.Empty);
        }
        return 0;
    }

    //get violation by id
    public async Task<InfrigementDTO> GetInfringementByIdAsync(int id)
    {
        OnViolationInvoking?.Invoke(this, ViolationType.Violation);
        var response = await _httpClient.GetAsync($"violation/GetViolationById/{id}");
        if (response.IsSuccessStatusCode)
        {
            OnViolationInvoked?.Invoke(this, response, ViolationType.Violation);
            var infringement = await response.Content.ReadFromJsonAsync<InfrigementDTO>();
            return infringement;
        }
        else if (response.StatusCode == System.Net.HttpStatusCode.Unauthorized)
        {
            UnAuthorized?.Invoke(this, EventArgs.Empty);
            return null;
        }
        else
        {
            OnError?.Invoke(this, response);
            return null;
        }
    }

    //get forwarded violation
    public async Task<IEnumerable<ForwardedInfrigementSharedModel>> GetForwardedInfringementsAsync()
    {
        OnViolationInvoking?.Invoke(this, ViolationType.Violation);
        var response = await _httpClient
            .GetAsync($"violation/GetForwardViolations");
        if (response.IsSuccessStatusCode)
        {
            OnViolationInvoked?.Invoke(this, response, ViolationType.Violation);
            var forwardInfrigementModels = await response.Content.ReadFromJsonAsync<IEnumerable<ForwardedInfrigementSharedModel>>();
            return forwardInfrigementModels;
        }
        else if (response.StatusCode == System.Net.HttpStatusCode.Unauthorized)
        {
            UnAuthorized?.Invoke(this, EventArgs.Empty);
            return null;
        }
        else
        {
            OnError?.Invoke(this, response);
            return null;
        }
    }


    //get violation procedure by regulation id
    public async Task<IEnumerable<ViolationProcedureSharedModel>> GetViolationProceduresAsync(int regulationId)
    {
        OnViolationInvoking?.Invoke(this, ViolationType.Violation);
        var response = await _httpClient.GetAsync($"violation/GetViolationProceduresByRegulationId/{regulationId}");
        if (response.IsSuccessStatusCode)
        {
            OnViolationInvoked?.Invoke(this, response, ViolationType.Violation);
            var violationProcedures = await response.Content.ReadFromJsonAsync<IEnumerable<ViolationProcedureSharedModel>>();
            return violationProcedures;
        }
        else if (response.StatusCode == System.Net.HttpStatusCode.Unauthorized)
        {
            UnAuthorized?.Invoke(this, EventArgs.Empty);
            return null;
        }
        else
        {
            OnError?.Invoke(this, response);
            return null;
        }
    }

    //update violation
    public async Task<HttpResponseMessage> UpdateViolationAsync(InfringementShared infringementShared)
    {
        OnViolationCreating?.Invoke(this, ViolationType.Violation);
        var response = await _httpClient.PutAsJsonAsync("violation/UpdateViolation", infringementShared);
        if (response.IsSuccessStatusCode)
        {
            OnViolationCreated?.Invoke(this, response, ViolationType.Violation);
            return response;
        }
        else if (response.StatusCode == System.Net.HttpStatusCode.Unauthorized)
        {
            UnAuthorized?.Invoke(this, EventArgs.Empty);
            return null;
        }
        else
        {
            OnError?.Invoke(this, response);
            return null;
        }
    }


    //close violation
    public async Task<HttpResponseMessage> CloseViolationAsync(CloseInfrigementModel closeInfrigementModel)
    {
        OnViolationDeleting?.Invoke(this, ViolationType.Violation);

        var response = await _httpClient.PostAsJsonAsync("violation/CloseViolation", closeInfrigementModel);

        if (response.IsSuccessStatusCode)
        {
            OnViolationDeleted?.Invoke(this, response, ViolationType.Violation);
            return response;
        }
        else if (response.StatusCode == System.Net.HttpStatusCode.Unauthorized)
        {
            UnAuthorized?.Invoke(this, EventArgs.Empty);
            return null;
        }
        else
        {
            OnError?.Invoke(this, response);
            return null;
        }
    }


    //get violations
    public async Task<IEnumerable<InfrigementDTO>> GetInfringementsAsync(int current, int max,
        InfringementProcess? infringementProcess,int? id = null, string? name = null, int? nationalId = null)
    {
        OnViolationInvoking?.Invoke(this, ViolationType.Violation);
        var response = await _httpClient
            .GetAsync($"violation/Get?current={current}&max={max}&infringementProcess={infringementProcess}&name={name}&nationalId={nationalId}&id={id}");
        if (response.IsSuccessStatusCode)
        {
            OnViolationInvoked?.Invoke(this, response, ViolationType.Violation);
            var infringements = await response.Content.ReadFromJsonAsync<IEnumerable<InfrigementDTO>>();
            return infringements;
        }
        else if (response.StatusCode == System.Net.HttpStatusCode.Unauthorized)
        {
            UnAuthorized?.Invoke(this, EventArgs.Empty);
            return null;
        }
        else
        {
            OnError?.Invoke(this, response);
            return null;
        }
    }


    //forward violation
    public async Task<HttpResponseMessage> ForwardViolationAsync(ForwardInfrigementModel forwardInfrigementModel)
    {
        OnViolationCreating?.Invoke(this, ViolationType.Violation);

        var response = await _httpClient.PostAsJsonAsync("violation/ForwardViolation", forwardInfrigementModel);

        if (response.IsSuccessStatusCode)
        {
            OnViolationCreated?.Invoke(this, response, ViolationType.Violation);
            return response;
        }
        else if (response.StatusCode == System.Net.HttpStatusCode.Unauthorized)
        {
            UnAuthorized?.Invoke(this, EventArgs.Empty);
            return response;
        }
        else
        {
            OnError?.Invoke(this, response);
            return response;
        }
    }

    //post violation
    public async Task<InfringementShared> CreateViolationAsync(InfringementShared infringementShared)
    {
        OnViolationCreating?.Invoke(this, ViolationType.Violation);
        var response = await _httpClient.PostAsJsonAsync("violation/Post", infringementShared);

        


        if (response.IsSuccessStatusCode)
        {
            OnViolationCreated?.Invoke(this, response, ViolationType.Violation);
            string jsonResponse = await response.Content.ReadAsStringAsync();
            var options = new JsonSerializerOptions
            {
                PropertyNameCaseInsensitive = true 
            };

            // تحويل النص JSON إلى الكائن
            var newInfringement = JsonSerializer.Deserialize<InfringementShared>(jsonResponse, options);

            return newInfringement;
        }
        else if (response.StatusCode == System.Net.HttpStatusCode.Unauthorized)
        {
            UnAuthorized?.Invoke(this, EventArgs.Empty);
            return null;
        }
        else
        {
            OnError?.Invoke(this, response);
            return null;
        }
    }

    public async Task<IEnumerable<InfrigementRateSharedModel>> GetViolationRateByRoleAsync()
    {
        OnViolationInvoking?.Invoke(this, ViolationType.Violation);

        var response = await _httpClient.GetAsync($"violation/GetViolationRateByRole");

        if (response.IsSuccessStatusCode)
        {
            OnViolationInvoked?.Invoke(this, response, ViolationType.Violation);
            var violationRate = await response.Content.ReadFromJsonAsync<IEnumerable<InfrigementRateSharedModel>>();
            return violationRate;
        }
        else if (response.StatusCode == System.Net.HttpStatusCode.Unauthorized)
        {
            UnAuthorized?.Invoke(this, EventArgs.Empty);
            return null;
        }
        else
        {
            OnError?.Invoke(this, response);
            return null;
        }
    }

    public async Task<IEnumerable<InfrigementRateSharedModel>> GetAllViolationLevelsAsync()
    {
        OnViolationInvoking?.Invoke(this, ViolationType.ViolationLevel);
        var response = await _httpClient.GetAsync("violation/GetAllViolationRates");

        if (response.IsSuccessStatusCode)
        {
            OnViolationInvoked?.Invoke(this, response, ViolationType.ViolationLevel);
            var violationLevels = await response.Content.ReadFromJsonAsync<IEnumerable<InfrigementRateSharedModel>>();

            if (violationLevels == null)
            {
                throw new NoInfrigementRatesFoundException("No Infringement Rates Found at the server");
            }

            return violationLevels;
        }

        else if(response.StatusCode == System.Net.HttpStatusCode.Unauthorized)
        {
            UnAuthorized?.Invoke(this, EventArgs.Empty);
            return null;
        }
        else
        {
            OnError?.Invoke(this, response);
            return null;
        }
    }


    public async Task<IEnumerable<RegulationsSharedModel>> GetRegulationByInfringementId(int InfringementId)
    {
        OnViolationInvoking?.Invoke(this, ViolationType.Regulations);
        var response = await _httpClient.GetAsync($"violation/GetRegulationByInfringementId/{InfringementId}");
        if (response.IsSuccessStatusCode)
        {
            OnViolationInvoked?.Invoke(this, response, ViolationType.Regulations);
            var regulations = await response.Content.ReadFromJsonAsync<IEnumerable<RegulationsSharedModel>>();
            return regulations;
        }
        else if (response.StatusCode == System.Net.HttpStatusCode.Unauthorized)
        {
            UnAuthorized?.Invoke(this, EventArgs.Empty);
            return null;
        }
        else
        {
            OnError?.Invoke(this, response);
            return null;
        }
    }


    #endregion

}