using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FUT_Mania.conexao.Cliente
{
    public class Cliente_Endereco : ICliente_Endereco
    {
        private readonly string conexao = ConfigurationManager.ConnectionStrings["conexaoSQL"].ConnectionString;
        public void InserirId(int idCliente, int idEndereco)
        {
            string inserirID = $@"insert into tb_endereco_cliente (id_cliente, id_endereco )
             values( '{idCliente}', '{idEndereco}' );";

            SqlConnection connection = new SqlConnection(conexao);

            try
            {
                connection.Open();
                SqlCommand command = new SqlCommand(inserirID, connection);
                command.ExecuteNonQuery();

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                connection.Close();
            }
        }
    }
}