<%@ Page Title="Cadastrar Produtos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="cadastrarProdutos.aspx.cs" Inherits="FUT_Mania.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Alfa+Slab+One&family=Audiowide&family=Black+Ops+One&family=Fredoka+One&family=Kanit:ital,wght@0,100;0,200;0,300;0,400;1,100;1,200;1,300&family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Permanent+Marker&family=Press+Start+2P&family=Russo+One&family=Silkscreen&display=swap');
      *{
          font-family:Russo One,sans-serif;
          
      }

    </style>

    <h3>Cadastrar Produtos</h3>
    <asp:Label ID="lblModelo" runat="server" >Modelo:</asp:Label>
    <asp:TextBox ID="txtModelo" runat="server" ></asp:TextBox><br /><br />

     <asp:Label ID="lblCor" runat="server" >Cor:</asp:Label>
     <asp:TextBox ID="txtCor" runat="server" ></asp:TextBox><br /><br />

     <asp:Label ID="lblTamanhoP" runat="server" >Tamanho P:</asp:Label>
     <asp:TextBox ID="txtTMP" runat="server" ></asp:TextBox><br /><br />

      <asp:Label ID="lblTamanhoM" runat="server" >Tamanho M:</asp:Label>
     <asp:TextBox ID="txtTMM" runat="server" ></asp:TextBox><br /><br />

      <asp:Label ID="lblTamanhoG" runat="server" >Tamanho G:</asp:Label>
     <asp:TextBox ID="txtTMG" runat="server" ></asp:TextBox><br /><br />

    <asp:Button ID="btnLogin" runat="server" required="true" text="Cadastrar"  onclick="btnCadastrarProdutos_Click"  />


      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
    document.getElementById('validarCadastro').onclick = teste;
    function validarCadastro() {

        swal("Erro!", "Inserido com sucesso!", "sucess");
    }

</script>
</asp:Content>
