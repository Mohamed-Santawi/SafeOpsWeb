namespace AuthServer.Helper
{
    public class UriBuilderHelper
    {
        #region Fields

        #endregion


        #region Constructor

        #endregion


        #region Methods


        public static string BuildResetPasswordUrl(string appUrl,string email,string token,string newPassword)
        {
            var uriBuilder = new UriBuilder(appUrl)
            {
                Path = "manage/User/ConfirmResetPassword"
            };

            var query = QueryString.Create(new[]
            {
                new KeyValuePair<string, string>("Email", email),
                new KeyValuePair<string, string>("Token", token),
                new KeyValuePair<string, string>("NewPassword", newPassword)
            });

            uriBuilder.Query = query.ToUriComponent();
            var resetLink = uriBuilder.ToString();

            return resetLink;
        }

        #endregion


    }
}
