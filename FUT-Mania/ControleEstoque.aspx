<%@ Page Title="Controle de estoque" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ControleEstoque.aspx.cs" Inherits="FUT_Mania.ControleEstoque" %>

<asp:Content ID="Content1" OnLoad="Page_Load" ContentPlaceHolderID="MainContent" runat="server">

    <style>
    @import url('https://fonts.googleapis.com/css2?family=Alfa+Slab+One&family=Audiowide&family=Black+Ops+One&family=Fredoka+One&family=Kanit:ital,wght@0,100;0,200;0,300;0,400;1,100;1,200;1,300&family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Permanent+Marker&family=Press+Start+2P&family=Russo+One&family=Silkscreen&display=swap');

        * {
            font-family: Russo One,sans-serif;
        }
        h1{
            color:darkgreen
        }

    </style>

   <h1>CONTROLE DE ESTOQUE</h1>

    <asp:GridView ID="dgvEstoque" runat="server" style="margin-top:5%; text-align:center; font-size:20px; font-family:Arial; "  CellPadding="4"  ForeColor="#333333" GridLines="None" Height="250px" Width="100%">
        <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Right" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>

    


</asp:Content>
