using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FUT_Mania.conexao.Produtos
{
    public class Produtos : IProdutos
    {
        private readonly string conexao = ConfigurationManager.ConnectionStrings["conexaoSQL"].ConnectionString;

        public DataTable BuscarProdutosEstoque()
        {
            string SelectEstoque = $@"
	       SELECT produtos.id AS Código, produtos.cor As Cor ,produtos.modelo As Modelo,produtos.tamanhoG As Tamanho_G,produtos.tamanhoM As Tamanho_M,produtos.tamanhoP As Tamanho_P
           FROM  produtos;";

            SqlConnection sqlConnection = new SqlConnection(conexao);
            DataTable pageEstoque = new DataTable();
            

            try
            {
                sqlConnection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(SelectEstoque, sqlConnection);
                adapter.Fill(pageEstoque);
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                sqlConnection.Close();
            }

            return pageEstoque;
        }

        public void cadastrarProdutos(string modelo, string cor, string tamanhoP, string tamanhoM, string tamanhoG)
        {
            string insertProdutos = $@"insert into produtos(modelo, cor, tamanhoP, tamanhoM, tamanhoG)
            values('{modelo}', '{cor}','{tamanhoP}', '{tamanhoM}', '{tamanhoG}' );";

            SqlConnection sqlConnection = new SqlConnection(conexao);

            try
            {
                sqlConnection.Open();
                SqlCommand sqlCommand = new SqlCommand(insertProdutos, sqlConnection);
                sqlCommand.ExecuteNonQuery();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                sqlConnection.Close();
            }

        }
    }
}