<%@ Page Title="Produtos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Produtos.aspx.cs" Inherits="FUT_Mania.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <style>
        @import url('https://fonts.googleapis.com/css2?family=Alfa+Slab+One&family=Audiowide&family=Black+Ops+One&family=Fredoka+One&family=Kanit:ital,wght@0,100;0,200;0,300;0,400;1,100;1,200;1,300&family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Permanent+Marker&family=Press+Start+2P&family=Russo+One&family=Silkscreen&display=swap');

        * {
            font-family: Russo One,sans-serif;
        }


        #cadastrobtn {
            margin-top: -1%;
            margin-left: -6%;
        }

        header {
            margin-left: 20%;
            color: darkgreen;
            font-size: 40px;
        }
    </style>

    <!-- Modal Cadastrar -->
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
                            <asp:TextBox ID="txtIDProduto" Visible="false" Enabled="false" runat="server" type="text" class="form-control"></asp:TextBox>
                        </div>
                        <br />
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
                            <label id="lblMarca" class="form-label">Marca:</label>
                            <asp:TextBox ID="txtMarca" runat="server" type="text" class="form-control" placeholder="Marca do produto"></asp:TextBox>
                        </div>
                        <br />
                        <div class="mb-3">
                            <label id="lblPreco" class="form-label">Preço:</label>
                            <asp:TextBox ID="txtPreco" runat="server" type="text" class="form-control" placeholder="Preço do produto"></asp:TextBox>
                        </div>
                        <br />
                         <div class="mb-3">
                            <label id="lblTMG" class="form-label"> Qtd Tamanho G:</label>
                            <asp:TextBox ID="txtTMG" runat="server" type="number" class="form-control" placeholder="quantidade no tamanho G"></asp:TextBox>
                        </div>
                        <br />
                         <div class="mb-3">
                            <label id="lblTMM" class="form-label"> Qtd Tamanho M:</label>
                            <asp:TextBox ID="txtTMM" runat="server" type="number" class="form-control" placeholder="quantidade no tamanho M"></asp:TextBox>
                        </div>
                        <br />
                          <div class="mb-3">
                            <label id="lblTMP" class="form-label"> Qtd Tamanho P:</label>
                            <asp:TextBox ID="txtTMP" runat="server" type="number" class="form-control" placeholder="quantidade no tamanho P"></asp:TextBox>
                        </div>
                        <br />
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnCadastrar" class="btn btn-primary" runat="server" required="true" Text="Cadastrar" OnClick="btnCadastrarProdutos_Click" />
                </div>
            </div>
        </div>
    </div>

    <!-- Fim Modal cadastrar -->

    <!-- Modal Editar -->
    <div class="modal fade" id="myModalEditar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h3 class="modal-title" id="myModalLabelEditar">Editar Produto</h3>
                </div>
                <div class="modal-body">
                    <div class="cadastroProduto">
                        <div class="mb-3">
                            <label id="lbModeloEditar" class="form-label">Modelo:</label>
                            <asp:TextBox ID="txtModeloEditar" runat="server" type="text" class="form-control" placeholder="Modelo do produto"></asp:TextBox>
                        </div>
                        <br />
                        <div class="mb-3">
                            <label id="lbCorEditar" class="form-label">Cor:</label>
                            <asp:TextBox ID="txtCorEditar" runat="server" type="text" class="form-control" placeholder="Cor do produto"></asp:TextBox>
                        </div>
                        <br />
                        <div class="mb-3">
                            <label id="lbMarcaEditar" class="form-label">Marca:</label>
                            <asp:TextBox ID="txtMarcaEditar" runat="server" type="text" class="form-control" placeholder="Marca do produto"></asp:TextBox>
                        </div>
                        <br />
                        <div class="mb-3">
                            <label id="lbTamanhoMEditar" class="form-label">Preço:</label>
                            <asp:TextBox ID="txtPrecoEditar" runat="server" type="text" class="form-control" placeholder="valor do produto"></asp:TextBox>
                        </div>
                        <br />

                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnEditar" class="btn btn-primary" runat="server" required="true" Text="Editar" OnClick="btnEditar_Click" />
                </div>
            </div>
        </div>
    </div>

    <!-- Fim Modal Editar -->

    <!---Modal Editado com sucesso--->
    <div class="modal fade" id="AbrirMensageSucess" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 style="font-size: 30px; color: forestgreen" class="modal-title">Sucesso!!</h4>
                </div>
                <div class="modal-body">
                    <p>Alterado com sucesso&hellip;</p>

                    <script src="https://cdn.lordicon.com/xdjxvujz.js"></script>
                    <lord-icon
                        src="https://cdn.lordicon.com/hrqqslfe.json"
                        trigger="hover"
                        colors="primary:#ffffff,secondary:#30e849"
                        style="width: 150px; margin-left: 35%; height: 150px">
                    </lord-icon>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
    <!--Fim Modal Editado com sucesso-->

    <!---Modal deletando com sucesso--->
    <div class="modal fade" id="AbrirMensageDelete" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 style="font-size: 40px; color: red" class="modal-title">Ops!</h4>
                </div>
                <div class="modal-body">
                    <script src="https://cdn.lordicon.com/xdjxvujz.js"></script>
                    <lord-icon
                        src="https://cdn.lordicon.com/inrunzby.json"
                        trigger="hover"
                        style="width: 150px; text-align: center; margin-left: 35%; height: 150px">
                    </lord-icon>

                    <p style="font-size: 25px; color: red;">Realmente deseja deletar este item ?&hellip;</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Não</button>
                    <asp:Button ID="btnDeletar" class="btn btn-primary" runat="server" required="true" Text="Sim" OnClick="btnDeletar_Click" />
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
    <!--Fim Modal Deletando com sucesso-->

    <!---Modal Cadastrado com sucesso--->
    <div class="modal fade" id="AbrirMensageCadastrado" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 style="font-size: 40px; color: darkgreen;" class="modal-title">Sucesso!</h4>
                </div>
                <div class="modal-body">
                    <p style="font-size: 30px">O item foi cadastrado com sucesso!&hellip;</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Ok</button>
                   

                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
    <!--Fim Modal Cadastrado com sucesso-->

    <!--CARREGAMENTO ESTOQUE-->
    <br />
    <br />
    <header>Gerenciamento de Produtos</header>


    <asp:GridView ID="DgvEstoque" runat="server" CellPadding="4" Style=" text-align:center; margin-left: -6%; margin-top: 4%; padding: 20px;" ForeColor="Black" Width="113%" Height="50px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2" OnRowCommand="DgvEstoque_RowCommand">
        <Columns>
            <asp:ButtonField ButtonType="Button" CommandName="Editar" HeaderText="" ShowHeader="True" Text="Editar" />
            <asp:ButtonField ButtonType="Button" CommandName="Deletar" HeaderText="" ShowHeader="True" Text="Deletar" />
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



    <!-- Button trigger modal Editar-->
    <button type="button" id="btnModalEditar" style="display: none;" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModalEditar">
        Editar produto</button>
    <!-- Button trigger modal mensagem sucesso-->
    <button type="button" id="btnModalMessageSucesso" style="display: none;" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#AbrirMensageSucess">
        mensagemSucesso</button>

     <!-- Button trigger modal venda-->
    <button type="button" id="btnModalVenda" style="display: none;" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#AbrirRealisarVenda">
        mensagemSucesso</button>

    <!-- Button trigger modal mensagem Deletar-->
    <button type="button" id="btnModalMessageDeletar" style="display: none;" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#AbrirMensageDelete">
        mensagemDeletar</button>

    <!-- Button trigger modal mensagem Cadastro-->
    <button type="button" id="btnModalMessageCadastro" style="display: none;" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#AbrirMensageCadastrado">
        mensagemCadastro</button>

    <!-- Button trigger modal Cadastrar-->
    <button type="button" id="cadastrobtn" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
        Novo produto</button>




    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    

    <script type="text/javascript">
        document.getElementById('validarCadastro').onclick = teste;
        function validarCadastro() {

            swal("Erro!", "Inserido com sucesso!", "sucess");
        }


        function AbrirModalEditar() {
            var btnAbrirModal = document.getElementById('btnModalEditar');
            btnAbrirModal.click();

        }

        function EditadoComSucesso() {
            var AbrirMensageSucess = document.getElementById('btnModalMessageSucesso');
            btnModalMessageSucesso.click();
        }

        function btnRealizarVenda() {
            var AbrirMensageSucess = document.getElementById('btnModalVenda');
            btnModalVenda.click();
        }


        function ExibirMensagemDeletar() {
            var btnModalMessageDeletar = document.getElementById('btnModalMessageDeletar');
            btnModalMessageDeletar.click();
        }

        function ExibirCadastroSucess() {
            var btnCadastrar = document.getElementById('btnModalMessageCadastro');
            btnModalMessageCadastro.click();
        }

        function AlertSucesso() {
            Swal.fire(
                'Sucesso',
                'Cadastrado com sucesso!',
                'success'
            )
        }


        function AlertEditadoSucesso() {
            Swal.fire(
                'Sucesso',
                'Editado com sucesso!',
                'success'
            )
        }

        function AbrirModalVenda() {
            var AbrirModalvenda = document.getElementById('btnModalVenda');
            btnModalVenda.click();
        }

        function AlertErro() {
            Swal.fire(
                'Erro!',
                'Não possivel realizar o cadastro',
                'error'
            )
        }
    </script>





</asp:Content>
