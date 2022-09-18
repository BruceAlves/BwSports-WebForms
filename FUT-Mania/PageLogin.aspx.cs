using FUT_Mania.conexao.Usuario;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FUT_Mania
{
    public partial class PageLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            IUsuario usuario = new Usuario();
            bool usuarioValido = usuario.ValidarLogin(txtemail.Text, txtsenha.Text);

            if (usuarioValido)
            {
                Response.Redirect("https://localhost:44301/PaginaInicial");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "AlertErro();", true);
                txtsenha.Text = string.Empty;
                txtemail.Text = string.Empty;
            }
        }
    }
}