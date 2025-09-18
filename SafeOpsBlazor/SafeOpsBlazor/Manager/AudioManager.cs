using Plugin.Maui.Audio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SafeOpsBlazor.Manager
{
    public class AudioManager
    {
        #region Fields  
        private readonly IAudioManager audioManager;
        #endregion
        public AudioManager(IAudioManager audioManager)
        {
            this.audioManager = audioManager;
        }
        public async void PlayAudio(string audioPath)
        {
            {
                var player = audioManager.CreatePlayer(await FileSystem.OpenAppPackageFileAsync(audioPath));

                player.Play();
            }
        }
    }
}
