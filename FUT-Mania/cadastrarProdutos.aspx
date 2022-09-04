<%@ Page Title="Cadastrar Produtos" Language="C#"   MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="cadastrarProdutos.aspx.cs" Inherits="FUT_Mania.About"  %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <style>
        @import url('https://fonts.googleapis.com/css2?family=Alfa+Slab+One&family=Audiowide&family=Black+Ops+One&family=Fredoka+One&family=Kanit:ital,wght@0,100;0,200;0,300;0,400;1,100;1,200;1,300&family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Permanent+Marker&family=Press+Start+2P&family=Russo+One&family=Silkscreen&display=swap');

        * {
            font-family: Russo One,sans-serif;
        }


        #cadastrobtn {
            margin-top: -55%;
            margin-left: -5%;
        }

        header {
            margin-left: 40%;
            color: darkgreen;
            font-size:40px;
        }
    </style>



    
    <!--CARREGAMENTO ESTOQUE-->

    <header>PRODUTOS</header>


     <asp:GridView ID="DgvEstoque" runat="server" CellPadding="4" style="text-align:center; margin-left:-50px; font-size: 20px; margin-top:8%; padding:20px;" ForeColor="Black" Width="110%" Height="249px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2">
         <Columns>
             <asp:ButtonField ButtonType="Button" CommandName="Edit" HeaderText="" ShowHeader="True" Text="Editar" />
             <asp:ButtonField ButtonType="Button" CommandName="Delete" HeaderText="" ShowHeader="True" Text="Deletar" />
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
      <br />

    <!--CADASTRAR PRODUTOS-->

    <!-- Button trigger modal -->
    <button type="button" id="cadastrobtn" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
        Cadastrar novo produto</button>
    

    <asp:Label  ID="lblErroeMessage" runat="server"  ForeColor="Red" ></asp:Label> 
    <asp:Label  ID="lblSuccessMessage" runat="server"  ForeColor="Green" ></asp:Label>

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h3 class="modal-title" id="myModalLabel">Cadastrar Produto</h3>
                </div>
                <div class="modal-body">
                    <div class="cadastroProduto">
                        <div class="mb-3">
                            <label id="lbModelo" class="form-label">Modelo:</label>
                            <asp:TextBox ID="txtModelo" runat="server" type="text" class="form-control" placeholder="Modelo do produto"></asp:TextBox>
                        </div>
                        <br />
                        <div class="mb-3">
                            <label id="lbCor" class="form-label">Cor:</label>
                            <asp:TextBox ID="txtCor" runat="server" type="text" class="form-control" placeholder="Cor do produto"></asp:TextBox>
                        </div>
                        <br />
                        <div class="mb-3">
                            <label id="lbTamanhoP" class="form-label">Tamanho P:</label>
                            <asp:TextBox ID="txtTMP" runat="server" type="text" class="form-control" placeholder="Quantidade tamanho P"></asp:TextBox>
                        </div>
                        <br />
                        <div class="mb-3">
                            <label id="lbTamanhoM" class="form-label">Tamanho M:</label>
                            <asp:TextBox ID="txtTMM" runat="server" type="text" class="form-control" placeholder="Quantidade tamanho M"></asp:TextBox>
                        </div>
                        <br />
                        <div class="mb-3">
                            <label id="lbTamanhoG" class="form-label">Tamanho G:</label>
                            <asp:TextBox ID="txtTMG" runat="server" type="text" class="form-control" placeholder="Quantidade tamanho G"></asp:TextBox>
                        </div>
                        <br />

                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnLogin" class="btn btn-primary" runat="server" required="true" Text="Cadastrar" OnClick="btnCadastrarProdutos_Click" />
                </div>
            </div>
        </div>
    </div>



    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script>
        document.getElementById('validarCadastro').onclick = teste;
        function validarCadastro() {

            swal("Erro!", "Inserido com sucesso!", "sucess");
        }

    </script>

   

</asp:Content>
