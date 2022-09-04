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
    public partial class ControleEstoque : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            IProdutos produtos = new Produtos();
            DataTable paganiaEstoque = produtos.BuscarProdutosEstoque();

            dgvEstoqueProdutos.DataSource = paganiaEstoque;
            dgvEstoqueProdutos.DataBind();
        }

      
    }
}