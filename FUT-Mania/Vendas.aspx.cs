using FUT_Mania.conexao.Cliente;
using FUT_Mania.conexao.Produtos;
using FUT_Mania.conexao.Usuario;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FUT_Mania
{
    public partial class Vendas : System.Web.UI.Page
    {
        public static int EstoqueID;
        public static int ProdutoID;
        public static string nomeProduto;
        public static string ValorProduto;
        public static string ProdutoVendido;
        protected void Page_Load(object sender, EventArgs e)
        {
          
            CarregarGridView();

            ICliente clientes = new Cliente();      
            txtProdutoVendido.Text = SessaoProduto.NomeProduto;
            txtDataVenda.Text = DateTime.Now.Date.ToShortDateString();

            
            DPLClientes.DataSource = clientes.PreencherDropListCliente();
            DPLClientes.DataTextField = "Nome";
            DPLClientes.DataValueField = "ID";
            DPLClientes.DataBind();
            txtProdutoVendido.Text = SessaoProduto.NomeProduto;
            
        }

        void CarregarGridView()
        {
            IProdutos produtos = new Produtos();
            DataTable paganaEstoque = produtos.BuscarProdutos();

            if (paganaEstoque.Rows.Count > 0)
            {
                DgvDisponiveisVenda.DataSource = paganaEstoque;
                DgvDisponiveisVenda.DataBind();
            }
            else
            {
                paganaEstoque.Rows.Add(paganaEstoque.NewRow());
                DgvDisponiveisVenda.DataSource = paganaEstoque;
                DgvDisponiveisVenda.DataBind();
                DgvDisponiveisVenda.Rows[0].Cells.Clear();
                DgvDisponiveisVenda.Rows[0].Cells.Add(new TableCell());
                DgvDisponiveisVenda.Rows[0].Cells[0].ColumnSpan = paganaEstoque.Columns.Count;
                DgvDisponiveisVenda.Rows[0].Cells[0].Text = "Nenhum dado encontrado...!";
                DgvDisponiveisVenda.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }


        protected void btnFinalizarVenda_Click(object sender, EventArgs e)
        {
            int idCliente = Convert.ToInt32(DPLClientes.SelectedValue.ToString());

            int qtdTotal = Convert.ToInt32(txtQtdG.Text + txtQtdM.Text + txtQtdP.Text);

            IProdutos produtos = new Produtos();
            produtos.InserirVenda(txtValorTotal.Text, txtDataVenda.Text, qtdTotal, SessaoProduto.IDproduto, idCliente, SessaoProduto.NomeProduto);

            int quantidadeG = Convert.ToInt32(txtQtdG.Text);
            int quantidadeM = Convert.ToInt32(txtQtdM.Text);
            int quantidadeP = Convert.ToInt32(txtQtdP.Text);
            produtos.EditarEstoque(SessaoProduto.IDestoque, quantidadeG, quantidadeM, quantidadeP);


            txtDataVenda.Text = string.Empty;
            txtProdutoVendido.Text = string.Empty;
            txtQtdG.Text = string.Empty;
            txtQtdM.Text = string.Empty;
            txtQtdP.Text = string.Empty;
            txtValorTotal.Text = string.Empty;

            ClientScript.RegisterStartupScript(this.GetType(), "alert", "AlertSucesso();", true);
        }

        protected void DgvDisponiveisVenda_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = DgvDisponiveisVenda.Rows[index];
                var idGrid = row.Cells[1].Text;
                int id = Convert.ToInt32(idGrid);

                string idEstoque = row.Cells[1].Text;
                string idproduto = row.Cells[2].Text;
                string marcaProduto = row.Cells[3].Text;
                string modeloProduto = row.Cells[4].Text;
                string preco = row.Cells[6].Text;
                string cor = row.Cells[5].Text;

                EstoqueID = Convert.ToInt32(idEstoque);
                ProdutoID = Convert.ToInt32(idproduto);
                ValorProduto = preco;
                ProdutoVendido = modeloProduto;

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "AbrirModalVenda();", true);
            }
        }

        protected void btnSomarTotal_Click(object sender, EventArgs e)
        {

            int qtdG = Convert.ToInt32(txtQtdG.Text);
            int qtdM = Convert.ToInt32(txtQtdM.Text);
            int qtdP = Convert.ToInt32(txtQtdP.Text);
            int qtdTotal = qtdG + qtdM + qtdP;

            if (qtdG < 0 || qtdM < 0 || qtdP < 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "AlertErro();", true);
            }
            else
            {
                ValorProduto =  ValorProduto.Replace("R$", string.Empty);

                double valorProduto = Convert.ToDouble(ValorProduto);

                double totalCompra = qtdTotal * valorProduto;

                txtValorTotal.Text = totalCompra.ToString("C");
                txtProdutoVendido.Text = ProdutoVendido;
                txtDataVenda.Text = DateTime.Now.Date.ToShortDateString();

            }
        }

        
        protected void btnFinalizarVenda_Click1(object sender, EventArgs e)
        {

            int idCliente = Convert.ToInt32(DPLClientes.SelectedValue.ToString());

            int QtdG = Convert.ToInt32(txtQtdG.Text);
            int QtdM = Convert.ToInt32(txtQtdM.Text);
            int QtdP = Convert.ToInt32(txtQtdP.Text);

            int qtdTotal = QtdG + QtdM + QtdP;

            IProdutos produtos = new Produtos();
            produtos.InserirVenda(txtValorTotal.Text, txtDataVenda.Text, qtdTotal, ProdutoID, idCliente, ProdutoVendido);

            int quantidadeG = Convert.ToInt32(txtQtdG.Text);
            int quantidadeM = Convert.ToInt32(txtQtdM.Text);
            int quantidadeP = Convert.ToInt32(txtQtdP.Text);
            produtos.EditarEstoque(EstoqueID, quantidadeG, quantidadeM, quantidadeP);


            txtDataVenda.Text = string.Empty;
            txtProdutoVendido.Text = string.Empty;
            txtQtdG.Text = string.Empty;
            txtQtdM.Text = string.Empty;
            txtQtdP.Text = string.Empty;
            txtValorTotal.Text = string.Empty;

            ClientScript.RegisterStartupScript(this.GetType(), "alert", "AlertSucesso();", true);
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            txtDataVenda.Text = string.Empty;
            txtProdutoVendido.Text = string.Empty;
            txtQtdG.Text = string.Empty;
            txtQtdM.Text = string.Empty;
            txtQtdP.Text = string.Empty;
            txtValorTotal.Text = string.Empty;
        }
    }
}