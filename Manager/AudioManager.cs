using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.JSInterop;

namespace SafeOpsWeb.Manager
{
    public class AudioManager
    {
        #region Fields
        private readonly IJSRuntime jsRuntime;
        #endregion

        public AudioManager(IJSRuntime jsRuntime)
        {
            this.jsRuntime = jsRuntime;
        }

        public async Task PlayAudio(string audioPath)
        {
            try
            {
                await jsRuntime.InvokeVoidAsync("playAudio", audioPath);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error playing audio: {ex.Message}");
            }
        }
    }
}
