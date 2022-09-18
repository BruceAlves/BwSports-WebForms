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
            DataTable paganaEstoque = produtos.BuscarProdutos();

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

            int tamanhoG = Convert.ToInt32(txtTMG.Text);
            int tamanhoM = Convert.ToInt32(txtTMM.Text);
            int tamanhoP = Convert.ToInt32(txtTMP.Text);
 
            if (!string.IsNullOrEmpty(txtModelo.Text) && !string.IsNullOrEmpty(txtCor.Text) && !string.IsNullOrEmpty(txtMarca.Text) && !string.IsNullOrEmpty(txtPreco.Text))
            {
                produto.cadastrarProdutos(txtModelo.Text, txtCor.Text, txtMarca.Text, txtPreco.Text);
                produto.inserirEstoque(tamanhoG, tamanhoM, tamanhoP);

                txtIDProduto.Text = string.Empty;
                txtModelo.Text = string.Empty;
                txtCor.Text = string.Empty;
                txtMarca.Text = string.Empty;
                txtPreco.Text = string.Empty;
                txtTMG.Text = string.Empty;
                txtTMM.Text = string.Empty;
                txtTMP.Text = string.Empty;
               

                CarregarGridView();

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "AlertSucesso();", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "AlertErro();", true);
            }
        }

        public static int produtoID, estoqueID = 0;

        protected void DgvEstoque_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = DgvEstoque.Rows[index];
                var idGrid = row.Cells[3].Text;
                int id = Convert.ToInt32(idGrid);

                string idProduto = row.Cells[3].Text;
                string corProduto = row.Cells[6].Text;
                string modeloProduto = row.Cells[5].Text;
                string marca = row.Cells[4].Text;
                string preco = row.Cells[7].Text;

                produtoID = Convert.ToInt32(idProduto);

                txtCorEditar.Text = corProduto;
                txtModeloEditar.Text = modeloProduto;
                txtMarcaEditar.Text = marca;
                txtPrecoEditar.Text = preco;
                
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "AbrirModalEditar();", true);
            }

            if (e.CommandName == "Deletar")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = DgvEstoque.Rows[index];
                var idGrid = row.Cells[2].Text;
                int id = Convert.ToInt32(idGrid);

                string idEstoque = row.Cells[2].Text;
                string idproduto = row.Cells[3].Text;
                string marcaProduto = row.Cells[4].Text;
                string modeloProduto = row.Cells[5].Text;
                string preco = row.Cells[7].Text;
                string cor = row.Cells[6].Text;

                estoqueID = Convert.ToInt32(idEstoque);
                produtoID = Convert.ToInt32(idproduto);

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "ExibirMensagemDeletar();", true);
            }         
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            IProdutos produtos = new Produtos();
            produtos.EditarProduto(produtoID, txtCorEditar.Text, txtModeloEditar.Text, txtMarcaEditar.Text, txtPrecoEditar.Text);    
            CarregarGridView();
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "AlertEditadoSucesso();", true);
        }

        protected void btnDeletar_Click(object sender, EventArgs e)
        {
            IProdutos produtos = new Produtos();
            produtos.DeletarProduto(produtoID, estoqueID);

            CarregarGridView();
        }
    }
}