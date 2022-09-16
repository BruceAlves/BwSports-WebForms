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
    public partial class ExtratoVendas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            IProdutos produtos = new Produtos();
            DataTable paganaExtrato = produtos.BuscarExtratoVendas();

            if (paganaExtrato.Rows.Count > 0)
            {
                DgvExtrato.DataSource = paganaExtrato;
                DgvExtrato.DataBind();
            }
            else
            {
                paganaExtrato.Rows.Add(paganaExtrato.NewRow());
                DgvExtrato.DataSource = paganaExtrato;
                DgvExtrato.DataBind();
                DgvExtrato.Rows[0].Cells.Clear();
                DgvExtrato.Rows[0].Cells.Add(new TableCell());
                DgvExtrato.Rows[0].Cells[0].ColumnSpan = paganaExtrato.Columns.Count;
                DgvExtrato.Rows[0].Cells[0].Text = "Nenhum dado encontrado...!";
                DgvExtrato.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }
    }
}