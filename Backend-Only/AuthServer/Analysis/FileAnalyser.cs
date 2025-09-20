namespace AuthServer.Analysis
{
    public class FileAnalyser
    {
        #region Fields
        private static readonly HashSet<string> ProhibitedExtensions = new HashSet<string>(StringComparer.OrdinalIgnoreCase)
    {
        ".exe",
        ".bat",
        ".js",
        ".cmd",
        ".sh",
        ".msi",
        ".dll",
        ".vbs",
        ".ps1"
    };
        #endregion
        #region Constructor
        #endregion
        #region Method




        public static bool IsProhibitedExtension(string fileName)
        {
            
            var extension = System.IO.Path.GetExtension(fileName);

            if (string.IsNullOrEmpty(extension))
            {
                throw new ArgumentException("File does not have an extension.");
            }

            
            return ProhibitedExtensions.Contains(extension);
        }
        #endregion
    }
}
