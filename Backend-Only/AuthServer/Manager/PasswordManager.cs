using AuthServer.Entity;
using AuthServer.Services;
using Microsoft.AspNetCore.Identity;
using System.Text;
using System.Text.RegularExpressions;

namespace AuthServer.Manager;

public class PasswordManager
{
    #region Fields

    private const string _chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789@";


    private const string numberPattern = "^\\d+$";

    private const string symbolPattern = "^[^a-zA-Z0-9]+$";

    private const string letterPattern = "^[a-zA-Z]+$";

    #region Fields



    #endregion
    #endregion

    #region Constructors

    public PasswordManager()
    {

    }

    #endregion

    #region Methods


    //generate password letters and numbers
    /// <summary>
    /// Generates a random password of the specified length with a mix of letters, numbers, and symbols.
    /// </summary>
    /// <param name="length">The length of the password to generate.</param>
    /// <returns>A randomly generated password with the specified length.</returns>
    public string GeneratePassword(int length)
    {
        if (length < 6)
            throw new ArgumentException("Password length must be greater than 6");

        const string letterPattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        const string numberPattern = "0123456789";
        const string symbolPattern = "!@#$%&*_+";

        var random = new Random();
        var password = new StringBuilder();


        password.Append(symbolPattern[random.Next(symbolPattern.Length)]);
        password.Append(numberPattern[random.Next(numberPattern.Length)]);
        password.Append(letterPattern[random.Next(letterPattern.Length)]);


        string allChars = letterPattern + numberPattern + symbolPattern;
        for (int i = password.Length; i < length; i++)
        {
            password.Append(allChars[random.Next(allChars.Length)]);
        }


        return new string(password.ToString().ToCharArray().OrderBy(c => random.Next()).ToArray());
    }


    #endregion
}