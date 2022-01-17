using CardonerSistemas;
using CardonerSistemas.Database.Ado;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace CS_Importador_de_cartas_de_porte.Database
{
    class Entidad
    {

        #region Properties

        public int IDEntidad { get; set; }
        public string Nombre { get; set; }
        public long? Cuit { get; set; }
        public bool EsTitular { get; set; }
        public bool EsIntermediario { get; set; }
        public bool EsRemitenteComercial { get; set; }
        public bool EsCorredor { get; set; }
        public bool EsEntregador { get; set; }
        public bool EsDestinatario { get; set; }
        public bool EsDestino { get; set; }
        public bool EsTransportista { get; set; }
        public bool EsChofer { get; set; }
        public bool EsClienteSubProducto { get; set; }
        public string Notas { get; set; }
        public bool Activo { get; set; }
        public byte IDUsuarioCreacion { get; set; }
        public DateTime FechaHoraCreacion { get; set; }
        public byte IDUsuarioModificacion { get; set; }
        public DateTime FechaHoraModificacion { get; set; }

        internal bool IsNew { get; set; } = true;
        internal bool IsFound { get; set; } = false;

        #endregion

        #region Methods

        internal bool ObtenerPorCuit(Database database, long cuit)
        {
            SqlDataReader reader = null;
            try
            {
                SqlCommand command = new SqlCommand
                {
                    CommandType = CommandType.StoredProcedure,
                    Connection = database.Connection,
                    CommandText = "usp_Entidad_GetPorCuit"
                };
                command.Parameters.Add("Cuit", SqlDbType.BigInt).Value = cuit;
                reader = command.ExecuteReader();

                IsFound = false;
                if (reader.HasRows)
                {
                    reader.Read();
                    IDEntidad = SqlServerValues.GetInteger(reader, "IDEntidad");
                    Nombre = SqlServerValues.GetString(reader, "Nombre");
                    Cuit = SqlServerValues.GetLongSafeAsNull(reader, "CUIT");
                    EsTitular = SqlServerValues.GetBoolean(reader, "EsTitular");
                    EsIntermediario = SqlServerValues.GetBoolean(reader, "EsIntermediario");
                    EsRemitenteComercial = SqlServerValues.GetBoolean(reader, "EsRemitenteComercial");
                    EsCorredor = SqlServerValues.GetBoolean(reader, "EsCorredor");
                    EsEntregador = SqlServerValues.GetBoolean(reader, "EsEntregador");
                    EsDestinatario = SqlServerValues.GetBoolean(reader, "EsDestinatario");
                    EsDestino = SqlServerValues.GetBoolean(reader, "EsDestino");
                    EsTransportista = SqlServerValues.GetBoolean(reader, "EsTransportista");
                    EsChofer = SqlServerValues.GetBoolean(reader, "EsChofer");
                    EsClienteSubProducto = SqlServerValues.GetBoolean(reader, "EsClienteSubProducto");
                    Notas = SqlServerValues.GetStringSafeAsNull(reader, "Notas");
                    Activo = SqlServerValues.GetBoolean(reader, "Activo");
                    IDUsuarioCreacion = reader.GetByte(reader.GetOrdinal("IDUsuarioCreacion"));
                    FechaHoraCreacion = reader.GetDateTime(reader.GetOrdinal("FechaHoraCreacion"));
                    IDUsuarioModificacion = reader.GetByte(reader.GetOrdinal("IDUsuarioModificacion"));
                    FechaHoraModificacion = reader.GetDateTime(reader.GetOrdinal("FechaHoraModificacion"));
                    IsFound = true;
                }
                reader.Close();
                reader = null;
                command = null;
                return true;
            }
            catch (Exception ex)
            {
                if (reader != null)
                {
                    reader.Close();
                }
                Cursor.Current = Cursors.Default;
                MessageBox.Show($"Error al obtener la entidad desde la base de datos.\n\nError: {ex.Message}", "CS-Importador de cartas de porte", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
        }

        internal bool Actualizar(Database database)
        {
            try
            {
                SqlCommand command = new SqlCommand
                {
                    Connection = database.Connection,
                    CommandType = CommandType.StoredProcedure
                };

                SqlParameter parameterIDEntidad = new SqlParameter("IDEntidad", SqlDbType.Int);
                if (IDEntidad == 0)
                {
                    command.CommandText = "usp_Entidad_Add";
                    parameterIDEntidad.Direction = ParameterDirection.Output;
                }
                else
                {
                    command.CommandText = "usp_Entidad_Update";
                    parameterIDEntidad.Value = IDEntidad;
                }
                command.Parameters.Add(parameterIDEntidad);
                command.Parameters.Add("Nombre", SqlDbType.VarChar).Value = Nombre.ToTitleCaseAll();
                command.Parameters.Add("CUIT", SqlDbType.BigInt).Value = Cuit;
                command.Parameters.Add("EsTitular", SqlDbType.Bit).Value = EsTitular;
                command.Parameters.Add("EsIntermediario", SqlDbType.Bit).Value = EsIntermediario;
                command.Parameters.Add("EsRemitenteComercial", SqlDbType.Bit).Value = EsRemitenteComercial;
                command.Parameters.Add("EsCorredor", SqlDbType.Bit).Value = EsCorredor;
                command.Parameters.Add("EsEntregador", SqlDbType.Bit).Value = EsEntregador;
                command.Parameters.Add("EsDestinatario", SqlDbType.Bit).Value = EsDestinatario;
                command.Parameters.Add("EsDestino", SqlDbType.Bit).Value = EsDestino;
                command.Parameters.Add("EsTransportista", SqlDbType.Bit).Value = EsTransportista;
                command.Parameters.Add("EsChofer", SqlDbType.Bit).Value = EsChofer;
                command.Parameters.Add("EsClienteSubProducto", SqlDbType.Bit).Value = EsClienteSubProducto;
                if (string.IsNullOrWhiteSpace(Notas))
                {
                    command.Parameters.Add("Notas", SqlDbType.VarChar).Value = DBNull.Value;
                }
                else
                {
                    command.Parameters.Add("Notas", SqlDbType.VarChar).Value = Notas;
                }
                command.Parameters.Add("Activo", SqlDbType.Bit).Value = Activo;
                command.Parameters.Add("IDUsuario", SqlDbType.TinyInt).Value = Properties.Settings.Default.IdUsuarioImportador;

                command.ExecuteNonQuery();
                if (IDEntidad == 0)
                {
                    IDEntidad = (int)parameterIDEntidad.Value;
                }
                parameterIDEntidad = null;
                command = null;
                return true;
            }
            catch (Exception ex)
            {
                Cursor.Current = Cursors.Default;
                MessageBox.Show($"Error al actualizar los datos de la entidad '{Nombre}' en la base de datos.\n\nError: {ex.Message}", "CS-Importador de cartas de porte", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
        }

        #endregion

    }
}