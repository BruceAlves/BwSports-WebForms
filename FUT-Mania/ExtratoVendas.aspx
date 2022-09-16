<%@ Page Title="Extrato" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ExtratoVendas.aspx.cs" Inherits="FUT_Mania.ExtratoVendas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Alfa+Slab+One&family=Audiowide&family=Black+Ops+One&family=Fredoka+One&family=Kanit:ital,wght@0,100;0,200;0,300;0,400;1,100;1,200;1,300&family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Permanent+Marker&family=Press+Start+2P&family=Russo+One&family=Silkscreen&display=swap');

        * {
            font-family: Russo One,sans-serif;
        }

          header{
             text-align:center;
             color:darkgreen;
             font-size:40px; 
            margin-top:40px;
         }

    </style>

    <header>Extrato de vendas</header>

     <asp:GridView ID="DgvExtrato" runat="server" Style="margin-left: 8%; text-align: center; margin-top: 4%"
        
        BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Width="86%" >
        <Columns>
            
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
     <img style="margin-left: 45%; width:10%; height:10%; margin-top: 5%;" src="CSS/BwSports_free-file.png" alt="Bw">
</asp:Content>
