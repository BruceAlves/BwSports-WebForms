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
        static int idEstoque = 0;
        public DataTable BuscarProdutos()
        {
            string SelectProdutos = $@"	        
            select estoque.id as 'Código-Estoque', produto.id as 'Código-Produto', produto.marca As 'Marca', produto.modelo As 'Modelo', produto.cor As 'Cor', produto.preco As 'Preço'  from estoque 
             inner join produto
             ON estoque.id_produto = produto.id;";

            SqlConnection sqlConnection = new SqlConnection(conexao);
            DataTable pageProdutos = new DataTable();


            try
            {
                sqlConnection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(SelectProdutos, sqlConnection);
                adapter.Fill(pageProdutos);
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                sqlConnection.Close();
            }

            return pageProdutos;
        }

        public DataTable BuscarEstoque()
        {
            string SelectEstoque = $@"	        
             select estoque.id as 'Código-Estoque', produto.id as 'Código-Produto', produto.marca As 'Marca', produto.modelo As 'Modelo', produto.preco As 'Preço', produto.cor As 'Cor', estoque.quantidade_tamanho_G As 'Qtd TamanhoG' , estoque.quantidade_tamanho_M as 'Qtd TamanhoM', estoque.quantidade_tamanho_P as 'Qtd TamanhoP' from estoque 
             inner join produto
             ON estoque.id_produto = produto.id;";

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



        //DELETE
        public void DeletarProduto(int idProduto, int idEstoque)
        {
            string queryDelete = $@"delete  from estoque
             where id = {idEstoque};
             delete from produto 
             where id = {idProduto};";

            SqlConnection sqlConnection = new SqlConnection(conexao);

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

        //UPDATE PRODUTO
        public void EditarProduto(int id, string cor, string modelo, string marca, string preco)
        {
            string queryUpdate = $@"UPDATE produto SET cor='{cor}', modelo='{modelo}', marca='{marca}', preco='{preco}'
            WHERE id={id};";

            SqlConnection sqlConnection = new SqlConnection(conexao);

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
        //UPADATE ESTOQUE
        public void EditarEstoque(int idEstoque, int tamanhoG, int tamanhoM, int tamanoP)
        {
            string queryUpdate = $@"UPDATE estoque SET quantidade_tamanho_G= {tamanhoG}, quantidade_tamanho_M={tamanhoM}, quantidade_tamanho_P={tamanoP}
            WHERE id={idEstoque};";

            SqlConnection sqlConnection = new SqlConnection(conexao);

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

        public void cadastrarProdutos(string modelo, string cor, string marca, string preco)
        {
            SqlConnection sqlConnection = new SqlConnection(conexao);

            try
            {
                string inserirProduto =
               $@"insert into produto(modelo, marca, cor, preco) values(@modelo, @marca, @cor, @preco)
                SELECT CAST (SCOPE_IDENTITY() as int)";

                sqlConnection.Open();
                SqlCommand cmd = new SqlCommand(inserirProduto, sqlConnection);

                cmd.Parameters.AddWithValue("@modelo", modelo);
                cmd.Parameters.AddWithValue("@cor", cor);
                cmd.Parameters.AddWithValue("@marca", marca);
                cmd.Parameters.AddWithValue("@preco", preco);
                

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

        public void inserirEstoque(int tamanhoG, int tamanhoM, int tamanhoP)
        {
            SqlConnection sqlConnection = new SqlConnection(conexao);

            try
            {
                string inserirCliente =
               $@"
                insert into estoque (quantidade_tamanho_G, quantidade_tamanho_M, quantidade_tamanho_P, id_produto)values(@TMG, @TMM, @TMP, @idProduto)
                SELECT CAST (SCOPE_IDENTITY() as int);";

                sqlConnection.Open();
                SqlCommand cmd = new SqlCommand(inserirCliente, sqlConnection);
            
                cmd.Parameters.AddWithValue("@TMG", tamanhoG);
                cmd.Parameters.AddWithValue("@TMM", tamanhoM);
                cmd.Parameters.AddWithValue("@TMP", tamanhoP);
                cmd.Parameters.AddWithValue("@idProduto", idProduto);

                idEstoque = Convert.ToInt32(cmd.ExecuteScalar());
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

        public void InserirVenda(string valorTotal, string dataVenda, int qtdTotal, int idProduto, int idCliente, string produto)
        {
            SqlConnection sqlConnection = new SqlConnection(conexao);

            try
            {
                string inserirProduto =
               $@"insert into venda (valor_total, data_venda, quantidade_total, id_produto, id_cliente, produto)
               values(@valorTotal, @data_venda, @qtdTotal ,@idProduto, @idCliente, @produto);";

                sqlConnection.Open();
                SqlCommand cmd = new SqlCommand(inserirProduto, sqlConnection);

                cmd.Parameters.AddWithValue("@valorTotal", valorTotal);
                cmd.Parameters.AddWithValue("@data_venda", dataVenda);
                cmd.Parameters.AddWithValue("@qtdTotal", qtdTotal);
                cmd.Parameters.AddWithValue("@idProduto", idProduto);
                cmd.Parameters.AddWithValue("@idCliente", idCliente);
                cmd.Parameters.AddWithValue("@produto", produto);
                cmd.ExecuteNonQuery();

               
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

        public void UpdateQtdEstoque(int id, int QtdTMG, int QtdTMM, int QtdTMP)
        {
            string queryUpdate = $@"UPDATE estoque SET quantidade_tamanho_G = (quantidade_tamanho_G - {QtdTMG}), quantidade_tamanho_M = (quantidade_tamanho_M - {QtdTMM}), quantidade_tamanho_P = (quantidade_tamanho_P - {QtdTMP}) 
             WHERE id = {id};";

            SqlConnection sqlConnection = new SqlConnection(conexao);

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

        public DataTable BuscarExtratoVendas()
        {
            string SelectProdutos = $@"	        
            select venda.id as 'codigo-venda', venda.produto as 'produto', venda.quantidade_total as 'quantidade', venda.valor_total as 'valor-total'
               from venda;";

            SqlConnection sqlConnection = new SqlConnection(conexao);
            DataTable pageExtrato = new DataTable();


            try
            {
                sqlConnection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(SelectProdutos, sqlConnection);
                adapter.Fill(pageExtrato);
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                sqlConnection.Close();
            }

            return pageExtrato;
        }
    }
}