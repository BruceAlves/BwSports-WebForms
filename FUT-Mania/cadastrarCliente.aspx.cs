using FUT_Mania.conexao.Cliente;
using FUT_Mania.conexao.endereco;
using FUT_Mania.ViaCEP;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FUT_Mania
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        void LimparCampos()
        {
            txtCep.Text = string.Empty;
            txtNome.Text = string.Empty;
            TxtEmail.Text = string.Empty;
            txtbairro.Text = string.Empty;
            txtCidade.Text = string.Empty;
            txtEstado.Text = string.Empty;
            txtRua.Text = string.Empty;
            txtNumero.Text = string.Empty;
        }
    

        protected void btnCadastrar_Onclick(object sender, EventArgs e)
        {
            IviaCep numeroValido = new ViaCep();
            var respostaValidacao = numeroValido.validarNumero(txtNumero.Text);


            if (string.IsNullOrEmpty(txtNome.Text) || string.IsNullOrEmpty(TxtEmail.Text) || string.IsNullOrEmpty(txtRua.Text) || string.IsNullOrEmpty(txtNumero.Text) || txtNumero.Text.Contains('a') || string.IsNullOrEmpty(txtbairro.Text) || string.IsNullOrEmpty(txtCep.Text) || string.IsNullOrEmpty(txtEstado.Text) || string.IsNullOrEmpty(txtCidade.Text))
            {
                ScriptManager.RegisterClientScriptBlock(
               this,
               this.GetType(),
               "mensagem",
               "alert('Erro: Preencha todos os campos!')",
                true);
            }
            else
            {
                ICliente cliente = new Cliente();
                int idCliente = cliente.CadastrarCliente(txtNome.Text, TxtEmail.Text);

                IEndereco enderecoCadastrado = new Endereco();
                int idEndereco = enderecoCadastrado.CadastrarEndereco(txtCep.Text, txtRua.Text, txtbairro.Text, txtNumero.Text, txtCidade.Text, txtEstado.Text);

                ICliente_Endereco id_cliente_Endereco = new Cliente_Endereco();
                id_cliente_Endereco.InserirId(idCliente, idEndereco);

                LimparCampos();
            }
        }

        protected void btnLimpar_Onclick(object sender, EventArgs e)
        {
            LimparCampos();
        }

        protected void btnPequisar_Onclick(object sender, EventArgs e)
        {
            int cepLength = txtCep.Text.Length;

            IviaCep validacaoCep = new ViaCep();
            var respostaCEP = validacaoCep.validarCEP(txtCep.Text);

            if (cepLength != 8)
            {
                ScriptManager.RegisterClientScriptBlock(
               this,
               this.GetType(),
               "mensagem",
               "alert('Erro: CEP Inválido!')",
                true);

                LimparCampos();
                txtbairro.Enabled = false;
                txtCidade.Enabled = false;
                txtEstado.Enabled = false;
                txtRua.Enabled = false;
            }
            else if (respostaCEP == false)
            {
                ScriptManager.RegisterClientScriptBlock(
               this,
               this.GetType(),
               "mensagem",
               "alert('Erro: CEP Inválido!')",
                true);

                LimparCampos();
                txtbairro.Enabled = false;
                txtCidade.Enabled = false;
                txtEstado.Enabled = false;
                txtRua.Enabled = false;
            }
            else
            {
                IviaCep endereco = new ViaCep();
                EnderecoCEP respostaCep = endereco.EnderecoCep(txtCep.Text);



                if (!string.IsNullOrEmpty(respostaCep.Rua))
                {
                    txtRua.Text = respostaCep.Rua;
                    txtRua.Enabled = false;
                }
                else
                {
                    txtRua.Enabled = true;
                    txtRua.Text = string.Empty;
                }


                if (!string.IsNullOrEmpty(respostaCep.Bairro))
                {
                    txtbairro.Text = respostaCep.Bairro;
                    txtbairro.Enabled = false;
                }
                else
                {
                    txtbairro.Enabled = true;
                    txtbairro.Text = string.Empty;
                }


                if (!string.IsNullOrEmpty(respostaCep.Cidade))
                {
                    txtCidade.Text = respostaCep?.Cidade;
                    txtCidade.Enabled = false;
                }
                else
                {
                    txtCidade.Enabled = true;
                    txtCidade.Text = string.Empty;
                }


                if (!string.IsNullOrEmpty(respostaCep.Estado))
                {
                    txtEstado.Text = respostaCep.Estado;
                    txtEstado.Enabled = false;
                }
                else
                {
                    txtEstado.Enabled = true;
                    txtEstado.Text = string.Empty;
                }
            }
        }


    }
}