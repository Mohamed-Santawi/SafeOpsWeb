using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SafeOpsBlazor.Handler
{
    public class SearchHandler<T>
    {
        private readonly Func<string, Task<HttpResponseMessage>> _searchFunction;
        private readonly Func<HttpResponseMessage, Task<T>> _parseResponse;
        private readonly Func<Task> _notFoundCallback;

        public SearchHandler(
            Func<string, Task<HttpResponseMessage>> searchFunction,
            Func<HttpResponseMessage, Task<T>> parseResponse,
            Func<Task> notFoundCallback)
        {
            _searchFunction = searchFunction;
            _parseResponse = parseResponse;
            _notFoundCallback = notFoundCallback;
        }

        public async Task<IQueryable<T>> PerformSearchAsync(string searchText)
        {
            if (string.IsNullOrEmpty(searchText))
            {
                throw new ArgumentException("Search text cannot be null or empty");
            }

            var result = await _searchFunction(searchText);

            if (result.StatusCode == System.Net.HttpStatusCode.OK)
            {
                var data = await _parseResponse(result);
                return new List<T> { data }.AsQueryable();
            }
            else if (result.StatusCode == System.Net.HttpStatusCode.NotFound)
            {
                await _notFoundCallback();
                return Enumerable.Empty<T>().AsQueryable();
            }

            throw new InvalidOperationException("Unhandled status code during search.");
        }
    }

}
