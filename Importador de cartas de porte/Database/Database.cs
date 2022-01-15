using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace CS_Importador_de_cartas_de_porte.Database
{
    internal class Database
    {
        internal SqlConnection Connection { get; } = new SqlConnection();

        internal bool Connect()
        {
            if (Connection.State == ConnectionState.Open)
            {
                return true;
            }

            try
            {
                Connection.ConnectionString = $"Data Source={Properties.Settings.Default.DatabaseDatasource};Initial Catalog={Properties.Settings.Default.DatabaseCatalog};Persist Security Info=True;User ID={Properties.Settings.Default.DatabaseUserId};Password={Properties.Settings.Default.DatabasePassword}";
                Connection.Open();
            }
            catch (Exception ex)
            {
                Cursor.Current = Cursors.Default;
                MessageBox.Show($"Error al crear la conexión a la base de datos.\n\nError: {ex.Message}", "CS-Importador de cartas de porte", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }

            return true;
        }

        internal bool Close()
        {
            if (Connection.State != ConnectionState.Open)
            {
                return true;
            }

            try
            {
                Connection.Close();
                return true;
            }
            catch (Exception ex)
            {
                Cursor.Current = Cursors.Default;
                MessageBox.Show($"Error al cerrar la conexión a la base de datos.\n\nError: {ex.Message}", "CS-Importador de cartas de porte", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
        }

        internal List<Cosecha> ObtenerCosechas()
        {
            List<Cosecha> cosechas = new List<Cosecha>();

            try
            {
                SqlCommand command = new SqlCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.Connection = Connection;
                command.CommandText = "usp_Cosecha_List";
                command.Parameters.Add("ListaNinguno", SqlDbType.Bit).Value = 0;
                command.Parameters.Add("Activo", SqlDbType.Bit).Value = 1;
                command.Parameters.Add("IDCosecha", SqlDbType.TinyInt).Value = 0;
                SqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        Cosecha cosecha = new Cosecha()
                        { 
                            IDCosecha = reader.GetByte(reader.GetOrdinal("IDCosecha")),
                            Nombre = reader.GetString(reader.GetOrdinal("Nombre")),
                            // FechaInicio = reader.GetDateTime(reader.GetOrdinal("FechaInicio")),
                            // FechaFin = reader.GetDateTime(reader.GetOrdinal("FechaFin")),
                            // ONCCA_Codigo = reader.GetString(reader.GetOrdinal("ONCCA_Codigo")),
                            // Activo = reader.GetBoolean(reader.GetOrdinal("Activo"))
                        };
                        cosechas.Add(cosecha);
                        cosecha = null;
                    }
                }
                reader.Close();
                reader = null;
                command = null;
            }
            catch (Exception ex)
            {
                Cursor.Current = Cursors.Default;
                MessageBox.Show($"Error al obtener la lista de cosechas desde la base de datos.\n\nError: {ex.Message}", "CS-Importador de cartas de porte", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            
            return cosechas;
        }
    }
}
