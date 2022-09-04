using FUT_Mania.conexao.Produtos;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace FUT_Mania
{
    public partial class About : Page
    {
        private readonly string conexao = ConfigurationManager.ConnectionStrings["conexaoSQL"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            CarregarGridView();
        }

        void CarregarGridView()
        {
            IProdutos produtos = new Produtos();
            DataTable paganaEstoque = produtos.BuscarProdutosEstoque();

            if (paganaEstoque.Rows.Count > 0)
            {
                DgvEstoque.DataSource = paganaEstoque;
                DgvEstoque.DataBind();
            }
            else
            {
                paganaEstoque.Rows.Add(paganaEstoque.NewRow());
                DgvEstoque.DataSource = paganaEstoque;
                DgvEstoque.DataBind();
                DgvEstoque.Rows[0].Cells.Clear();
                DgvEstoque.Rows[0].Cells.Add(new TableCell());
                DgvEstoque.Rows[0].Cells[0].ColumnSpan = paganaEstoque.Columns.Count;
                DgvEstoque.Rows[0].Cells[0].Text = "Nenhum dado encontrado...!";
                DgvEstoque.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }


        protected void btnCadastrarProdutos_Click(object sender, EventArgs e)
        {
            IProdutos produto = new Produtos();


            if (!string.IsNullOrEmpty(txtModelo.Text) && !string.IsNullOrEmpty(txtCor.Text) && !string.IsNullOrEmpty(txtTMP.Text) && !string.IsNullOrEmpty(txtTMM.Text) && !string.IsNullOrEmpty(txtTMG.Text))
            {
                produto.cadastrarProdutos(txtModelo.Text, txtCor.Text, txtTMP.Text, txtTMM.Text, txtTMG.Text);

                ScriptManager.RegisterClientScriptBlock(
              this,
              this.GetType(),
              "mensagem",
              "alert('Cadastrado com sucesso')",
               true);
                CarregarGridView();

                txtModelo.Text = string.Empty;
                txtCor.Text = string.Empty;
                txtTMP.Text = string.Empty;
                txtTMM.Text = string.Empty;
                txtTMP.Text = string.Empty;
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