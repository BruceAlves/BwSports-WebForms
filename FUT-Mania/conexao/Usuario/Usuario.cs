using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FUT_Mania.conexao.Usuario
{
    public class Usuario : IUsuario
    {
        private readonly string conexao = ConfigurationManager.ConnectionStrings["conexaoSQL"].ConnectionString;

        public bool ValidarLogin(string email, string senha)
        {
            bool loginValido = false;

            string selectLogin = $@"select * from usuario
            where email= '{email}' and senha='{senha}';";

            SqlConnection sqlConnection = new SqlConnection(conexao);
            DataTable rowUsuario = new DataTable();
            try
            {
                sqlConnection.Open();
                SqlDataAdapter sqlData = new SqlDataAdapter(selectLogin, sqlConnection);
                sqlData.Fill(rowUsuario);
                if (rowUsuario.Rows.Count > 0)
                {
                    SessaoUsuario.Id = Convert.ToInt32(rowUsuario.Rows[0]["id"]);
                    SessaoUsuario.Email = rowUsuario.Rows[0]["email"].ToString();
                    SessaoUsuario.Nome = rowUsuario.Rows[0]["nome"].ToString();
                   

                    loginValido = true;
                }

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                sqlConnection.Close();
            }
            return loginValido;
        }
    }
}