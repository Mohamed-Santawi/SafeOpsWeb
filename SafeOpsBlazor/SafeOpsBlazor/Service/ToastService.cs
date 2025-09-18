using Plugin.Maui.Audio;
using SafeOpsBlazor.Provider;
using Syncfusion.Blazor.Notifications;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SafeOpsBlazor.Service
{
    public  class ToastService
    {

        #region Fields

        private SafeOpsBlazor.Manager.AudioManager audioManager;

        #endregion

        #region Properties

        #endregion

        #region Constructor

        public ToastService(SafeOpsBlazor.Manager.AudioManager audioManager)
        {

            this.audioManager = audioManager;

            if (this.audioManager is null)
            {
                throw new ArgumentNullException("AudioManager is null, you need to register the audio manager as service");
            }
        }

        #endregion

        #region Methods

        public async Task ShowSuccess(SfToast sfToast,string message,string title)
        {
            audioManager.PlayAudio("notesound1.mp3");
            ToastModel toastModel = new ToastModel()
            {
                Content = message,
                Icon = "e-success",
                Title = title,
                ShowCloseButton = true,
                Timeout = 5000,
                CssClass = "e-toast-success",
                ShowProgressBar = true
            };


            await sfToast.ShowAsync(toastModel);

        }

        public async Task ShowWarning(SfToast sfToast,string message, string title)
        {
            audioManager.PlayAudio("notesound1.mp3");
            ToastModel toastModel = new ToastModel()
            {
                Content = message,
                Icon = "bi bi-bug-fill",
                Title = title,
                ShowCloseButton = true,
                Timeout = 5000,
                CssClass = "e-toast-warning",
                ShowProgressBar = true
            };

            

            await sfToast.ShowAsync(toastModel);

        }

        public async Task ShowError(SfToast sfToast,string message, string title)
        {
            audioManager.PlayAudio("notesound1.mp3");
            ToastModel toastModel = new ToastModel()
            {
                Content = message,
                Icon = "bi bi-bug-fill",
                Title = title,
                ShowCloseButton = true,
                Timeout = 5000,
                CssClass = "e-toast-danger",
                ShowProgressBar = true
            };

            await sfToast.ShowAsync(toastModel);
        }

        #endregion
    }
}
