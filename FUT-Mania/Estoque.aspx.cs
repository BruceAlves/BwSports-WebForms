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
            CarregarGridView();
        }

        void CarregarGridView()
        {
            IProdutos produtos = new Produtos();
            DataTable paganaEstoque = produtos.BuscarEstoque();

            if (paganaEstoque.Rows.Count > 0)
            {
                dgvEstoqueProdutos.DataSource = paganaEstoque;
                dgvEstoqueProdutos.DataBind();
            }
            else
            {
                paganaEstoque.Rows.Add(paganaEstoque.NewRow());
                dgvEstoqueProdutos.DataSource = paganaEstoque;
                dgvEstoqueProdutos.DataBind();
                dgvEstoqueProdutos.Rows[0].Cells.Clear();
                dgvEstoqueProdutos.Rows[0].Cells.Add(new TableCell());
                dgvEstoqueProdutos.Rows[0].Cells[0].ColumnSpan = paganaEstoque.Columns.Count;
                dgvEstoqueProdutos.Rows[0].Cells[0].Text = "Nenhum dado encontrado...!";
                dgvEstoqueProdutos.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }

        public static int estoqueID = 0;
        protected void dgvEstoqueProdutos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = dgvEstoqueProdutos.Rows[index];
                var idGrid = row.Cells[2].Text;
                int id = Convert.ToInt32(idGrid);

                string IdEstoque = row.Cells[1].Text;
                string tamanho_G = row.Cells[7].Text;
                string tamanho_M = row.Cells[8].Text;
                string tamanho_P = row.Cells[9].Text;

                estoqueID = Convert.ToInt32(IdEstoque);

                txtEditarTMG.Text = tamanho_G;
                txtEditarTMM.Text = tamanho_M;
                txtEditarTMP.Text = tamanho_P;

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "AbrirModalEditar();", true);

            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            int TMG = Convert.ToInt32(txtEditarTMG.Text);
            int TMM = Convert.ToInt32(txtEditarTMM.Text);
            int TMP = Convert.ToInt32(txtEditarTMP.Text);

            IProdutos produtos = new Produtos();
            produtos.EditarEstoque (estoqueID, TMG, TMM, TMP);
            CarregarGridView();
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "AlertSucesso();", true);
        }
    }
}