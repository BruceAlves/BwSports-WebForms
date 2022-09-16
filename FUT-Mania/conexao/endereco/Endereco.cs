using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FUT_Mania.conexao.endereco
{
    public class Endereco : IEndereco
    {
        private readonly string conexao = ConfigurationManager.ConnectionStrings["conexaoSQL"].ConnectionString;

        public DataTable BuscarEnderecoCliente(int idCliente)
        {
            SqlConnection sqlConnection = new SqlConnection(conexao);

            string query = $@"select cliente.id as 'Código-Cliente', endereco1.id as 'Código-Endereço',cliente.nome as 'Nome', cliente.email as 'E-mail',endereco1.cep as 'CEP', endereco1.rua as 'Rua', endereco1.bairro as 'Bairro', endereco1.cidade as 'Cidade', endereco1.estado as 'Estado', endereco1.numero as 'Numero' 
            from cliente
            inner join endereco1
             ON cliente.id_endereco = endereco1.id
			 where cliente.id = {idCliente};";

            DataTable dtEnderecoCliente = new DataTable();

            try
            {
                sqlConnection.Open();
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(query, sqlConnection);
                sqlDataAdapter.Fill(dtEnderecoCliente);
                
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                sqlConnection.Close();
            }

            return dtEnderecoCliente;
        }

        public int CadastrarEndereco(string cep, string rua, string bairro, string numero, string cidade, string estado)
        {
            int idEndereco = 0;

            SqlConnection sqlConnection = new SqlConnection(conexao);

            try
            {
                string InserirEndereco = $@"insert into endereco1 (cep, rua, bairro, cidade, estado, numero)
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