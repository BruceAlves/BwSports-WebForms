using FUT_Mania.conexao.Cliente;
using FUT_Mania.conexao.endereco;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FUT_Mania
{
    public partial class Contact : Page
    {
        public static int clienteid;
        public static int enderecoid;
        protected void Page_Load(object sender, EventArgs e)
        {
            CarregarGridViewClientes();
        }

        void CarregarGridViewClientes()
        {
            ICliente cliente = new Cliente();
            DataTable pageClientes = cliente.BuscarTabelaClientes();

            if (pageClientes.Rows.Count > 0)
            {
                DgvClientes.DataSource = pageClientes;
                DgvClientes.DataBind();
            }
            else
            {
                pageClientes.Rows.Add(pageClientes.NewRow());
                DgvClientes.DataSource = pageClientes;
                DgvClientes.DataBind();
                DgvClientes.Rows[0].Cells.Clear();
                DgvClientes.Rows[0].Cells.Add(new TableCell());
                DgvClientes.Rows[0].Cells[0].ColumnSpan = pageClientes.Columns.Count;
                DgvClientes.Rows[0].Cells[0].Text = "Nenhum dado encontrado...!";
                DgvClientes.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }

        protected void DgvClientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = DgvClientes.Rows[index];

                IEndereco endereco = new Endereco();

                int idCliente = Convert.ToInt32(row.Cells[2].Text);
                var enderecoCliente = endereco.BuscarEnderecoCliente(idCliente);

                clienteid = idCliente;
                enderecoid = Convert.ToInt32(enderecoCliente.Rows[0]["Código-Endereço"]);

                txtEditarNome.Text = enderecoCliente.Rows[0]["Nome"].ToString();
                txtEditarEmail.Text = enderecoCliente.Rows[0]["E-mail"].ToString();
                txtEditarCep.Text = enderecoCliente.Rows[0]["CEP"].ToString();
                txtEditarRua.Text = enderecoCliente.Rows[0]["Rua"].ToString();
                txtEditarNumero.Text = enderecoCliente.Rows[0]["Numero"].ToString();
                txtEditarCidade.Text = enderecoCliente.Rows[0]["Cidade"].ToString();
                txtEditarBairro.Text = enderecoCliente.Rows[0]["Bairro"].ToString();
                txtEditarEstado.Text = enderecoCliente.Rows[0]["Estado"].ToString();

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "AbrirModalEditar();", true);

            }

            if (e.CommandName == "Deletar")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = DgvClientes.Rows[index];
                var idGrid = row.Cells[2].Text;
                int id = Convert.ToInt32(idGrid);

                string idCliente = row.Cells[2].Text;
                string idEndereco = row.Cells[3].Text;
              

                clienteid = Convert.ToInt32(idCliente);
                enderecoid = Convert.ToInt32(idEndereco);
             
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "ExibirMensagemDeletar();", true);
            }
        }
      
       
        protected void btnEditar_Click(object sender, EventArgs e)
        {
            ICliente cliente = new Cliente();
            cliente.EditarCadastroCliente(clienteid, enderecoid, txtEditarNome.Text, txtEditarEmail.Text, txtEditarCep.Text, txtEditarRua.Text, txtEditarBairro.Text, txtEditarNumero.Text, txtEditarCidade.Text, txtEditarEstado.Text);
            CarregarGridViewClientes();
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "AlertEditadoSucesso();", true);
        }

        protected void btnDeletar_Click(object sender, EventArgs e)
        {
            ICliente cliente = new Cliente();
            cliente.DeletarCadastroCliente(enderecoid, clienteid);
            CarregarGridViewClientes();
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "AlertDeletarSucesso();", true);
        }

        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtNome.Text) || string.IsNullOrEmpty(TxtEmail.Text) || string.IsNullOrEmpty(txtRua.Text) || string.IsNullOrEmpty(txtNumero.Text) || txtNumero.Text.Contains('a') || string.IsNullOrEmpty(txtBairro.Text) || string.IsNullOrEmpty(txtCep.Text) || string.IsNullOrEmpty(txtEstado.Text) || string.IsNullOrEmpty(txtCidade.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "AlertErro();", true);
            }
            else
            {
                IEndereco enderecoCadastrado = new Endereco();
                int idEndereco = enderecoCadastrado.CadastrarEndereco(txtCep.Text, txtRua.Text, txtBairro.Text, txtNumero.Text, txtCidade.Text, txtEstado.Text);


                ICliente cliente = new Cliente();
                cliente.CadastrarCliente(idEndereco, txtNome.Text, TxtEmail.Text);

                CarregarGridViewClientes();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "AlertSucesso();", true);
            }
        }
    }
}