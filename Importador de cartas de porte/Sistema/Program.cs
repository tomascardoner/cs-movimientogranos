using System;
using System.Windows.Forms;

namespace CS_Importador_de_cartas_de_porte
{
    static class Program
    {
#pragma warning disable S2223 // Non-constant static fields should not be visible
        internal static string DatabaseConnectionString;
#pragma warning restore S2223 // Non-constant static fields should not be visible

        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            const string PasswordEncryptor = "Va8d6cZBEwi+bkg*Nt:mCMs=lrFQuIno";
            string decryptedText = string.Empty;
            if (CardonerSistemas.Encrypt.StringCipher.Decrypt(Properties.Settings.Default.DatabasePassword, PasswordEncryptor, ref decryptedText))
            {
                DatabaseConnectionString = $"Data Source={Properties.Settings.Default.DatabaseDatasource};Initial Catalog={Properties.Settings.Default.DatabaseDatabase};Persist Security Info=True;User ID={Properties.Settings.Default.DatabaseUserId};Password={decryptedText}";
            }

            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new FormMainMenu());
        }
    }
}
