<%@ Page Title="Realizar uma venda" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Vendas.aspx.cs" Inherits="FUT_Mania.Vendas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Alfa+Slab+One&family=Audiowide&family=Black+Ops+One&family=Fredoka+One&family=Kanit:ital,wght@0,100;0,200;0,300;0,400;1,100;1,200;1,300&family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Permanent+Marker&family=Press+Start+2P&family=Russo+One&family=Silkscreen&display=swap');

        * {
            font-family: Russo One,sans-serif;
        }
    </style>

    <header>Realiza uma venda</header>

    <asp:Label id="lblNomeResponsavel" runat="server" ></asp:Label>

      
        <div class="mb-3">
            <label id="lblNome" class="form-label">Cliente:</label>
            <asp:TextBox ID="txtNome" runat="server" type="text" class="form-control" placeholder="nome do cliente"></asp:TextBox>
        </div>
        <br />
        <div class="mb-3">
            <label id="lblEmail" class="form-label">Produto:</label>
            <asp:TextBox ID="TxtEmail" runat="server" type="email" class="form-control" placeholder="produto"></asp:TextBox>
        </div>
        <br />
        <div class="mb-3">
            <label id="lblCep" class="form-label">Quantidade:</label>
            <asp:TextBox ID="txtCep" runat="server" type="text" class="form-control" placeholder="quantidade de produtos"></asp:TextBox>
            <asp:Button ID="pesquisar" runat="server" required="true" Text="Ok" OnClick="btnPequisar_Onclick" /><br />
        </div>
        <br />
        <div class="mb-3">
            <label id="lblRua" class="form-label">Data:</label>
            <asp:TextBox Enabled="false" ID="txtRua" runat="server" type="text" class="form-control" placeholder="Data que foi realizada a venda"></asp:TextBox>
        </div>
        <br />
       

</asp:Content>
