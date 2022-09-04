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

        static int idProduto = 0;
        public DataTable BuscarProdutosEstoque()
        {
            string SelectEstoque = $@"
	       SELECT produtos.id AS Código, produtos.cor As Cor_Produto ,produtos.modelo As Modelo,produtos.tamanhoG As Tamanho_G,produtos.tamanhoM As Tamanho_M,produtos.tamanhoP As Tamanho_P
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
        //INSERT


        public void cadastrarProdutos(string modelo, string cor, string tamanhoP, string tamanhoM, string tamanhoG)
        {
            SqlConnection sqlConnection = new SqlConnection(conexao);

            try
            {
                string inserirCliente =
               $@"insert into produtos (modelo, cor, tamanhoP, tamanhoM, tamanhoG)
                                 values  (@modelo, @cor, @tamanhoP, @tamanhoM, @tamanhoG)
                             SELECT CAST (SCOPE_IDENTITY() as int);";

                sqlConnection.Open();
                SqlCommand cmd = new SqlCommand(inserirCliente, sqlConnection);

                cmd.Parameters.AddWithValue("@modelo", modelo);
                cmd.Parameters.AddWithValue("@cor", cor);
                cmd.Parameters.AddWithValue("@tamanhoP", tamanhoP);
                cmd.Parameters.AddWithValue("@tamanhoM", tamanhoM);
                cmd.Parameters.AddWithValue("@tamanhoG", tamanhoG);

                idProduto = Convert.ToInt32(cmd.ExecuteScalar());
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

        //DELETE
        public void DeletarProduto(int id)
        {
            string queryDelete = $@"delete from produtos
            where id = {id};";

            SqlConnection sqlConnection = new SqlConnection();

            try
            {
                sqlConnection.Open();
                SqlCommand sqlCommand = new SqlCommand(queryDelete, sqlConnection);
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

        //UPDATE
        public void EditarProduto(int id, string cor, string modelo, string tmanhoG, string tamanhoM, string tamanhoP)
        {
            string queryUpdate = $@"UPDATE produtos SET cor='{cor}', modelo='{modelo}', tamanhoG={tmanhoG}, tamanhoM={tamanhoM},tamanhoP={tamanhoP}
            WHERE id={id};";

            SqlConnection sqlConnection = new SqlConnection();

            try
            {
                sqlConnection.Open();
                SqlCommand sqlCommand = new SqlCommand(queryUpdate, sqlConnection);
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