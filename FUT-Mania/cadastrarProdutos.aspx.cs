using FUT_Mania.conexao.Produtos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FUT_Mania
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            IProdutos produtos = new Produtos();
            DataTable paganiaEstoque = produtos.BuscarProdutosEstoque();

            dgvEstoqueProdutos.DataSource = paganiaEstoque;
            dgvEstoqueProdutos.DataBind();
        }

        protected void btnCadastrarProdutos_Click(object sender, EventArgs e)
        {
            IProdutos produto = new Produtos();
            

            if (!string.IsNullOrEmpty(txtModelo.Text) && !string.IsNullOrEmpty(txtCor.Text) && !string.IsNullOrEmpty(txtTMP.Text) && !string.IsNullOrEmpty(txtTMM.Text) && !string.IsNullOrEmpty(txtTMG.Text))
            {
                produto.cadastrarProdutos(txtModelo.Text, txtCor.Text, txtTMP.Text, txtTMM.Text, txtTMG.Text);

                txtModelo.Text = string.Empty;
                txtCor.Text = string.Empty;
                txtTMP.Text = string.Empty;
                txtTMM.Text = string.Empty;
                txtTMG.Text = string.Empty;

                ScriptManager.RegisterClientScriptBlock(
              this,
              this.GetType(),
              "mensagem",
              "alert('Cadastrado com sucesso')",
               true);

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(
               this,
               this.GetType(),
               "mensagem",
               "alert('Error')",
                true);
            }
        }

    }
}