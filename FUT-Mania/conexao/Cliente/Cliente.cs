using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;

using System.Linq;
using System.Web;

namespace FUT_Mania.conexao.Cliente
{
    public class Cliente : ICliente
    {
        private readonly string conexao = ConfigurationManager.ConnectionStrings["conexaoSQL"].ConnectionString;

        public int CadastrarCliente(string nome, string email)
        {
            SqlConnection sqlConnection = new SqlConnection(conexao);
            int idClienteInserido = 0;
            try
            {

                string inserirCliente =
               $@"insert into tb_cliente (nome, email)
                       values (@nome, @email)
                       SELECT CAST(SCOPE_IDENTITY() as int);";

                sqlConnection.Open();
                SqlCommand cmd = new SqlCommand(inserirCliente, sqlConnection);

                cmd.Parameters.AddWithValue("@nome", nome);
                cmd.Parameters.AddWithValue("@email", email);

                idClienteInserido = Convert.ToInt32(cmd.ExecuteScalar());

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                sqlConnection.Close();
                
            }
            return idClienteInserido;
        }
    }
}