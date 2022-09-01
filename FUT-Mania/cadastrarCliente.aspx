<%@ Page Title="Cadastrar Cliente" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="cadastrarCliente.aspx.cs" Inherits="FUT_Mania.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link rel="stylesheet" href="CSS/Cliente.css" />

    <div class="formulario">
        <h3>Cadastrar Cliente</h3>

        <div class="mb-3">
            <label id="lblNome" class="form-label">Nome completo:</label>
            <asp:TextBox ID="txtNome" runat="server" type="text" class="form-control" placeholder="Nome completo"></asp:TextBox>
        </div>
        <br />
        <div class="mb-3">
            <label id="lblEmail" class="form-label">E-mail:</label>
            <asp:TextBox ID="TxtEmail" runat="server" type="email" class="form-control" placeholder="Informe seu E-mail"></asp:TextBox>
        </div>
        <br />
        <div class="mb-3">
            <label id="lblCep" class="form-label">Cep:</label>
            <asp:TextBox ID="txtCep" runat="server" type="text" class="form-control" placeholder="Informe seu CEP"></asp:TextBox>
            <asp:Button ID="pesquisar" runat="server" required="true" Text="Ok" OnClick="btnPequisar_Onclick" /><br />
        </div>
        <br />
        <div class="mb-3">
            <label id="lblRua" class="form-label">Rua:</label>
            <asp:TextBox Enabled="false" ID="txtRua" runat="server" type="text" class="form-control" placeholder="rua"></asp:TextBox>
        </div>
        <br />
        <div class="mb-3">
            <label id="lblNumero" class="form-label">Numero:</label>
            <asp:TextBox  ID="txtNumero" runat="server" type="text" class="form-control" placeholder="numero"></asp:TextBox>
        </div>
        <br />
        <div class="mb-3">
            <label id="lblBairro" class="form-label">Bairro:</label>
            <asp:TextBox Enabled="false" ID="txtbairro" runat="server" type="text" class="form-control" placeholder="Bairro"></asp:TextBox>
        </div>
        <br />
        <div class="mb-3">
            <label id="lblEstado" class="form-label">Estado:</label>
            <asp:TextBox Enabled="false" ID="txtEstado" runat="server" type="text" class="form-control" placeholder="Estado"></asp:TextBox>
        </div>
        <br />
        <div class="mb-3">
            <label id="lblCidade" class="form-label">Cidade:</label>
            <asp:TextBox Enabled="false" ID="txtCidade" runat="server" type="text" class="form-control" placeholder="Cidade"></asp:TextBox>
        </div>
        <asp:Button ID="btnCadastrar" runat="server" required="true" Text="Cadastrar" OnClick="btnCadastrar_Onclick" />

        <asp:Button ID="btnLimpar" runat="server" required="true" Text="Limpar" OnClick="btnLimpar_Onclick" />

        <br />

    </div>



    <%--<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script>
        document.getelementbyid('teste1').onclick = teste;
        function teste() {

            swal("erro!", "credenciais inválidas!", "error");
        }

    </script>--%>
</asp:Content>
