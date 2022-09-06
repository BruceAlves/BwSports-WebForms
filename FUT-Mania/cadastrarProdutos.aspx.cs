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
        public static int idCodigo = 0;

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

              //  ScriptManager.RegisterClientScriptBlock(
              //this,
              //this.GetType(),
              //"mensagem",
              //"alert('Cadastrado com sucesso')",
              // true);
              //  CarregarGridView();

                

                txtModelo.Text = string.Empty;
                txtCor.Text = string.Empty;
                txtTMP.Text = string.Empty;
                txtTMM.Text = string.Empty;
                txtTMP.Text = string.Empty;

                CarregarGridView();

                ClientScript.RegisterStartupScript(this.GetType(), "alert", " ExibirCadastroSucess();", true);
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

        protected void DgvEstoque_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = DgvEstoque.Rows[index];
                var idGrid = row.Cells[2].Text;
                int id = Convert.ToInt32(idGrid);

                string idProduto = row.Cells[2].Text;
                string corProduto = row.Cells[3].Text;
                string modeloProduto = row.Cells[4].Text;
                string tamanhoG = row.Cells[5].Text;
                string tamanhoM = row.Cells[6].Text;
                string tamanhoP = row.Cells[7].Text;


                idCodigo = Convert.ToInt32(idProduto);

                txtCorEditar.Text = corProduto;
                txtModeloEditar.Text = modeloProduto;
                txtTMGEditar.Text = tamanhoG;
                txtTMMEditar.Text = tamanhoM;
                txtTMPEditar.Text = tamanhoP;

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "AbrirModalEditar();", true);

            }

            if (e.CommandName == "Deletar")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = DgvEstoque.Rows[index];
                var idGrid = row.Cells[2].Text;
                int id = Convert.ToInt32(idGrid);

                string idProduto = row.Cells[2].Text;
                string corProduto = row.Cells[3].Text;
                string modeloProduto = row.Cells[4].Text;
                string tamanhoG = row.Cells[5].Text;
                string tamanhoM = row.Cells[6].Text;
                string tamanhoP = row.Cells[7].Text;

                idCodigo = Convert.ToInt32(idProduto);

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "ExibirMensagemDeletar();", true);
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            IProdutos produtos = new Produtos();
            produtos.EditarProduto(idCodigo, txtCorEditar.Text, txtModeloEditar.Text, txtTMGEditar.Text, txtTMMEditar.Text, txtTMPEditar.Text);    
            CarregarGridView();
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "EditadoComSucesso();", true);
        }


        protected void btnDeletar_Click(object sender, EventArgs e)
        {
            IProdutos produtos = new Produtos();
            produtos.DeletarProduto(idCodigo);

            CarregarGridView();
        }
    }
}