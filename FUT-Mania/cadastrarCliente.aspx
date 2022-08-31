<%@ Page Title="Cadastrar Cliente" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="cadastrarCliente.aspx.cs" Inherits="FUT_Mania.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link rel="stylesheet" href="CSS/Cliente.css" />

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
    


    

    <asp:Label ID="lblCep" runat="server">Cep:</asp:Label>
    <asp:TextBox ID="txtCep" runat="server"></asp:TextBox>
    <asp:Button ID="pesquisar" runat="server" required="true" Text="Ok" OnClick="btnPequisar_Onclick" /><br />
    <br />
    <asp:Label ID="lblRua" runat="server">Rua:</asp:Label>
    <asp:TextBox Enabled="false" ID="txtRua" runat="server"></asp:TextBox><br />
    <br />

    <asp:Label ID="lblNumero" runat="server">Numero:</asp:Label>
    <asp:TextBox ID="txtNumero" runat="server"></asp:TextBox><br />
    <br />

    <asp:Label ID="lblBairro" runat="server">Bairro:</asp:Label>
    <asp:TextBox Enabled="false" ID="txtbairro" runat="server"></asp:TextBox><br />
    <br />

    <asp:Label ID="lblEstado" runat="server">Estado:</asp:Label>
    <asp:TextBox Enabled="false" ID="txtEstado" runat="server"></asp:TextBox><br />
    <br />

    <asp:Label ID="lblCidade" runat="server">Cidade:</asp:Label>
    <asp:TextBox Enabled="false" ID="txtCidade" runat="server"></asp:TextBox><br />
    <br />

    <asp:Button ID="btnLogin" runat="server" required="true" Text="Cadastrar" OnClick="btnCadastrar_Onclick" />

    <asp:Button ID="btnLimpar" runat="server" required="true" Text="Limpar" OnClick="btnLimpar_Onclick" />




    <%--<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script>
        document.getelementbyid('teste1').onclick = teste;
        function teste() {

            swal("erro!", "credenciais inválidas!", "error");
        }

    </script>--%>
</asp:Content>
