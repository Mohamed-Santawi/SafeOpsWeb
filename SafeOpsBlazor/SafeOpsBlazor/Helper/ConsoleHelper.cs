using Microsoft.JSInterop;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SafeOpsBlazor.Helper
{
    public class ConsoleHelper
    {
        private readonly IJSRuntime _jsRuntime;

        public ConsoleHelper(IJSRuntime jsRuntime)
        {
            _jsRuntime = jsRuntime;
        }

        public async Task Log(string message)
        {
            await _jsRuntime.InvokeVoidAsync("console.log", message);
        }

        public async Task Warn(string message)
        {
            await _jsRuntime.InvokeVoidAsync("console.warn", message);
        }

        public async Task Error(string message)
        {
            await _jsRuntime.InvokeVoidAsync("console.error", message);
        }
    }
}
