<%@ Page Title="Cadastrar Produtos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="cadastrarProdutos.aspx.cs" Inherits="FUT_Mania.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <style>
        @import url('https://fonts.googleapis.com/css2?family=Alfa+Slab+One&family=Audiowide&family=Black+Ops+One&family=Fredoka+One&family=Kanit:ital,wght@0,100;0,200;0,300;0,400;1,100;1,200;1,300&family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Permanent+Marker&family=Press+Start+2P&family=Russo+One&family=Silkscreen&display=swap');

        * {
            font-family: Russo One,sans-serif;
        }


        #cadastrobtn {
            margin-top: -50%;
            margin-left: 5px;
        }

        h1 {
            margin-left: 40%;
            color: darkgreen
        }
    </style>


    <!--CARREGAMENTO ESTOQUE-->
    <h1>PRODUTOS</h1>

    <asp:GridView ID="dgvEstoqueProdutos" runat="server" Style="margin-top: 5%; font-size: 20px; padding-left: 10px; text-align: center; margin-left: 1px;" CellPadding="4" ForeColor="#333333" GridLines="None" Height="250px" Width="100%">
        <AlternatingRowStyle BackColor="White" />

        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />

    </asp:GridView>

    <!--CADASTRAR PRODUTOS-->

    <!-- Button trigger modal -->
    <button type="button" id="cadastrobtn" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
        Cadastrar novo produto</button>

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
                            <label id="lblModelo" class="form-label">Modelo:</label>
                            <asp:TextBox ID="txtModelo" runat="server" type="text" class="form-control" placeholder="Modelo do produto"></asp:TextBox>
                        </div>
                        <br />
                        <div class="mb-3">
                            <label id="lblCor" class="form-label">Cor:</label>
                            <asp:TextBox ID="txtCor" runat="server" type="text" class="form-control" placeholder="Cor do produto"></asp:TextBox>
                        </div>
                        <br />
                        <div class="mb-3">
                            <label id="lblTamanhoP" class="form-label">Tamanho P:</label>
                            <asp:TextBox ID="txtTMP" runat="server" type="text" class="form-control" placeholder="Quantidade tamanho P"></asp:TextBox>
                        </div>
                        <br />
                        <div class="mb-3">
                            <label id="lblTamanhoM" class="form-label">Tamanho M:</label>
                            <asp:TextBox ID="txtTMM" runat="server" type="text" class="form-control" placeholder="Quantidade tamanho M"></asp:TextBox>
                        </div>
                        <br />
                        <div class="mb-3">
                            <label id="lblTamanhoG" class="form-label">Tamanho G:</label>
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

    <!---Editar Produtos-->


    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script>
        document.getElementById('validarCadastro').onclick = teste;
        function validarCadastro() {

            swal("Erro!", "Inserido com sucesso!", "sucess");
        }

    </script>
</asp:Content>
