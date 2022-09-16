using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;

namespace FUT_Mania.conexao.Cliente
{
    public class Cliente : ICliente
    {
        private readonly string conexao = ConfigurationManager.ConnectionStrings["conexaoSQL"].ConnectionString;

        public DataTable BuscarTabelaClientes()
        {
            string SelectClientes = $@"	        
            select cliente.id as 'Código-Cliente', endereco1.id as 'Código-Endereço',cliente.nome as 'Nome', cliente.email as 'E-mail',endereco1.cep as 'CEP', endereco1.rua as 'Rua', endereco1.bairro as 'Bairro', endereco1.cidade as 'Cidade', endereco1.estado as 'Estado', endereco1.numero as 'Numero' 
            from cliente
            inner join endereco1
             ON cliente.id_endereco = endereco1.id;";

            SqlConnection sqlConnection = new SqlConnection(conexao);
            DataTable pageClientes = new DataTable();


            try
            {
                sqlConnection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(SelectClientes, sqlConnection);
                adapter.Fill(pageClientes);
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                sqlConnection.Close();
            }

            return pageClientes;
        }

        public DataTable PreencherDropListCliente()
        {
            string selectClientes = $@" select cliente.id, cliente.nome from cliente
            ORDER BY id;";

            SqlConnection sqlConnection = new SqlConnection(conexao);
            DataTable dropClientes = new DataTable();


            try
            {
                sqlConnection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(selectClientes, sqlConnection);
                adapter.Fill(dropClientes);

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                sqlConnection.Close();
            }

            return dropClientes;
        }

        public void CadastrarCliente(int idEndereco, string nome, string email)
        {
            SqlConnection sqlConnection = new SqlConnection(conexao);
            try
            {
                string inserirCliente =
               $@"insert into cliente (nome, email, id_endereco)
                       values (@nome, @email, @id_endereco)";

                sqlConnection.Open();
                SqlCommand cmd = new SqlCommand(inserirCliente, sqlConnection);

                cmd.Parameters.AddWithValue("@nome", nome);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@id_endereco", idEndereco);
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

        public void DeletarCadastroCliente(int idEndereco, int idCliente)
        {

            string deleteCadastroCliente = $@"
            Delete  from cliente
			where id={idCliente};
			Delete from endereco1
			where id = {idEndereco};";

            SqlConnection sqlConnection = new SqlConnection(conexao);

            try
            {
                sqlConnection.Open();
                SqlCommand command = new SqlCommand(deleteCadastroCliente, sqlConnection);
                command.ExecuteNonQuery();
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

        public void EditarCadastroCliente(int idCliente, int idEndereco, string nome, string email, string cep, string rua, string bairro, string numero, string cidade, string estado)
        {
            string updateCadastroCliente = $@"UPDATE cliente SET nome='{nome}', email='{email}'
            WHERE id={idCliente};

			UPDATE endereco1 set cep='{cep}', rua='{rua}',bairro='{bairro}', cidade='{cidade}' , estado='{estado}', numero='{numero}'
			where id ={idEndereco};";

            SqlConnection sqlConnection = new SqlConnection(conexao);

            try
            {
                sqlConnection.Open();
                SqlCommand command = new SqlCommand(updateCadastroCliente, sqlConnection);
                command.ExecuteNonQuery();
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