<%@ Page Title="Estoque" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Estoque.aspx.cs" Inherits="FUT_Mania.ControleEstoque" %>

<asp:Content ID="Content1" OnLoad="Page_Load" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Alfa+Slab+One&family=Audiowide&family=Black+Ops+One&family=Fredoka+One&family=Kanit:ital,wght@0,100;0,200;0,300;0,400;1,100;1,200;1,300&family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Permanent+Marker&family=Press+Start+2P&family=Russo+One&family=Silkscreen&display=swap');

        * {
            font-family: Russo One,sans-serif;
        }

        h1 {
            color: darkgreen;
            text-align: center;
        }
    </style>

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
                            <label id="lblEditarTMG" class="form-label">Qtd Tamanho G:</label>
                            <asp:TextBox ID="txtEditarTMG" runat="server" type="text" class="form-control" placeholder="Modelo do produto"></asp:TextBox>
                        </div>
                        <br />
                        <div class="mb-3">
                            <label id="lblEditarTMM" class="form-label">Qtd Tamanho M:</label>
                            <asp:TextBox ID="txtEditarTMM" runat="server" type="text" class="form-control" placeholder="Modelo do produto"></asp:TextBox>
                        </div>
                        <br />

                        <div class="mb-3">
                            <label id="lblEditarTMP" class="form-label">Qtd Tamanho P:</label>
                            <asp:TextBox ID="txtEditarTMP" runat="server" type="text" class="form-control" placeholder="Modelo do produto"></asp:TextBox>
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


    <!-- Button trigger modal Editar-->
    <button type="button" id="btnModalEditar" style="display: none;" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModalEditar">
        Editar produto</button>
    <!-- Button trigger modal mensagem sucesso-->
    <button type="button" id="btnModalMessageSucesso" style="display: none;" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#AbrirMensageSucess">
        mensagemSucesso</button>

    <h1>CONTROLE DE ESTOQUE</h1>


    <asp:GridView ID="dgvEstoqueProdutos" runat="server" CellPadding="4" Style="text-align: center; margin-left: -6%; margin-top: 4%; padding: 20px;" ForeColor="Black" Width="113%" Height="50px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2" OnRowCommand="dgvEstoqueProdutos_RowCommand">
        <Columns>
            <asp:ButtonField ButtonType="Button" CommandName="Editar" ShowHeader="True" Text="Editar" />
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

    <script type="text/javascript">
        function AbrirModalEditar() {
            var btnAbrirModal = document.getElementById('btnModalEditar');
            btnAbrirModal.click();

        }

        function EditadoComSucesso() {
            var AbrirMensageSucess = document.getElementById('btnModalMessageSucesso');
            btnModalMessageSucesso.click();
        }


        function AlertSucesso() {
            Swal.fire(
                'Alerta de sucesso!',
                'Atualizado com sucesso!',
                'success'
            )
        }

        function AlertAviso() {
            Swal.fire(
                'Alerta de aviso!',
                'Teste sweet alert!',
                'warning'
            )
        }

        function AlertErro() {
            Swal.fire(
                'Alerta de erro!',
                'Preencha todos os campos!',
                'error'
            )
        }

    </script>

    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</asp:Content>
