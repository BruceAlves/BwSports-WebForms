<%@ Page Title="Realizar uma venda" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Vendas.aspx.cs" Inherits="FUT_Mania.Vendas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Alfa+Slab+One&family=Audiowide&family=Black+Ops+One&family=Fredoka+One&family=Kanit:ital,wght@0,100;0,200;0,300;0,400;1,100;1,200;1,300&family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Permanent+Marker&family=Press+Start+2P&family=Russo+One&family=Silkscreen&display=swap');

        * {
            font-family: Russo One,sans-serif;
        }

        .meuFormulario {
            margin-top:-1%;
            margin-left: 75%;
            position: relative;
        }

        header {
              margin-top:-28%;
             margin-left: 70%;
            text-align: center;
            font-size: 30px;
        }



        .meuFormulario2{
             margin-top:5%;
            margin-left: 30%;
            position: relative;
        }


        h2 {
            margin-left: -7%;
            margin-top: 50px;
        }

        h1{
            margin-left: -5%;
            
        }
    </style>

    <h2>Produtos disponíveis:</h2>

    <asp:GridView ID="DgvDisponiveisVenda" runat="server" CellPadding="4" Style="text-align: center; margin-left: -8%; margin-top: 2%; padding: 20px;" ForeColor="Black" Width="78%" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2" OnRowCommand="DgvDisponiveisVenda_RowCommand">
        <Columns>
            <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="" ShowHeader="True" Text="Vender" />
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

    <header>Realiza uma venda</header><br />
                <div class="meuFormulario">

                    <div>
                        <label>Vender para cliente</label><br />
                        <asp:DropDownList ID="DPLClientes" runat="server" Height="35px" Width="300px">
                            <asp:ListItem Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <br />

                    <div class="mb-3">
                        <label id="lblProduto" class="form-label">Produto vendido:</label>
                        <asp:TextBox ID="txtProdutoVendido" Enabled="false" runat="server" type="text" class="form-control" placeholder="Produto"></asp:TextBox>
                    </div>
                    <br />
                 
                    <div class="mb-3">
                        <label id="lblNome" class="form-label">Valor total:</label>
                        <asp:TextBox ID="txtValorTotal" runat="server" Enabled="false" type="text" class="form-control" placeholder="Valor total da compra"></asp:TextBox>
                    </div>
                    <br />

                    <div class="mb-3">
                        <label id="lblCep" class="form-label">Data:</label>
                        <asp:TextBox ID="txtDataVenda" Enabled="false" runat="server" type="text" class="form-control" placeholder="Data da venda"></asp:TextBox>
                    </div>
                    <br />
                   
                    <asp:Button ID="btnFinalizarVenda" class="btn btn-primary" runat="server" required="true" Text="Finalizar venda" OnClick="btnFinalizarVenda_Click1" />

                </div>



    <!--Fim Modal venda-->
    <div class="modal fade" id="AbrirModalVenda" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content"><br /><br />
                <div class="meuFormulario2" >

                    <h1>Calcular valor</h1><br />
                    <div class="mb-3">
                        <label id="lblQtdG" class="form-label">G:</label>
                        <asp:TextBox ID="txtQtdG" runat="server" type="number" class="form-control" placeholder="Quantidade total de itens"></asp:TextBox><br />

                    </div>


                    <div class="mb-3">
                        <label id="lblQtdM" class="form-label">M:</label>
                        <asp:TextBox ID="txtQtdM" runat="server" type="number" class="form-control" placeholder="Quantidade total de itens"></asp:TextBox><br />

                    </div>

                    <div class="mb-3">
                        <label id="lblQtdP" class="form-label">P:</label>
                        <asp:TextBox ID="txtQtdP" runat="server" type="number" class="form-control" placeholder="Quantidade total de itens"></asp:TextBox><br />
                        <asp:Button ID="btnSomarTotal" class="btn btn-primary" runat="server" required="true" Text="Calcular valor" OnClick="btnSomarTotal_Click" />
                         <asp:Button ID="btnCancelar" class="btn btn-default" runat="server" required="true" Text="Cancelar" OnClick="btnCancelar_Click" />
                    </div>
                    <br />
                </div>     
                <br />
                <br />

            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
    <!--Fim Modal Cadastrado com sucesso-->

    <!-- Button trigger modal venda-->
    <button type="button" id="btnModalVenda" style="display: none;" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#AbrirModalVenda">
        mensagemSucesso</button>


    <script>
        function AlertSucesso() {
            Swal.fire(
                'Sucesso',
                'Venda realizada com sucesso!',
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
                'a quantidade não pode ser negativa',
                'error'
            )
        }
    </script>
</asp:Content>
