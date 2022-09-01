using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FUT_Mania.conexao.endereco
{
    public class Endereco : IEndereco
    {
        private readonly string conexao = ConfigurationManager.ConnectionStrings["conexaoSQL"].ConnectionString;

        public int CadastrarEndereco(string cep, string rua, string bairro, string numero, string cidade, string estado)
        {
            int idEndereco = 0;

            SqlConnection sqlConnection = new SqlConnection(conexao);

            try
            {
                string InserirEndereco = $@"insert into tb_endereco (cep, rua, bairro, cidade, estado, numero)
                 values('{cep}', '{rua}', '{bairro}', '{cidade}', '{estado}','{numero}' )
                 SELECT CAST(SCOPE_IDENTITY() as int);";


                SqlCommand sqlCommand = new SqlCommand(InserirEndereco, sqlConnection);
                sqlCommand.Parameters.AddWithValue("@cep", cep);
                sqlCommand.Parameters.AddWithValue("@rua", rua);
                sqlCommand.Parameters.AddWithValue("@bairro", bairro);
                sqlCommand.Parameters.AddWithValue("@cidade", cidade);
                sqlCommand.Parameters.AddWithValue("@estado", estado);
                sqlCommand.Parameters.AddWithValue("@numero", numero);
                sqlConnection.Open();

                idEndereco = Convert.ToInt32(sqlCommand.ExecuteScalar());
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                sqlConnection.Close();
            }

            return idEndereco;
        }
    }
}