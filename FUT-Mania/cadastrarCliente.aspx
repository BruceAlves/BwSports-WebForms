<%@ Page Title="Clientes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="cadastrarCliente.aspx.cs" Inherits="FUT_Mania.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="CSS/Cliente.css" />

    <style>
        #cadastrobtn {
            margin-top: 1%;
            margin-left: -6%;
            position: relative;
        }

        header {
            text-align: center;
            color: darkgreen;
            font-size: 40px;
        }
    </style>

    <header>Clientes cadastrados</header>

    <asp:GridView ID="DgvClientes" runat="server" Style="margin-left: -10%; text-align: center; margin-top: 4%"
        BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Width="120%" OnRowCommand="DgvClientes_RowCommand">
        <Columns>
            <asp:ButtonField ButtonType="Button" CommandName="Editar" Text="Editar" />
            <asp:ButtonField ButtonType="Button" CommandName="Deletar" Text="Deletar" />
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


    <!-- Modal Cadastrar -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" onload="Load_InformeCEP" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h3 class="modal-title" id="myModalLabel">Cadastrar Cliente</h3>
                </div>
                <div class="modal-body">

                    <div class="formulario">
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
                        <div class="mb-3">
                            <label id="lblCep" class="form-label">Cep:</label>
                            <asp:TextBox ID="txtCep" runat="server" type="text" class="cep" placeholder="Informe seu CEP"></asp:TextBox>

                        </div>
                        <br />
                        <div class="mb-3">
                            <label id="lblRua" class="form-label">Rua:</label>
                            <asp:TextBox ID="txtRua" runat="server" type="text" class="rua" placeholder="rua"></asp:TextBox>
                        </div>
                        <br />
                        <div class="mb-3">
                            <label id="lblNumero" class="form-label">Numero:</label>
                            <asp:TextBox ID="txtNumero" runat="server" type="text" class="form-control" placeholder="numero"></asp:TextBox>
                        </div>
                        <br />
                        <div class="mb-3">
                            <label id="lblBairro" class="form-label">Bairro:</label>
                            <asp:TextBox ID="txtBairro" runat="server" type="text" class="bairro" placeholder="Bairro"></asp:TextBox>
                        </div>
                        <br />
                        <div class="mb-3">
                            <label id="lblEstado" class="form-label">Estado:</label>
                            <asp:TextBox ID="txtEstado" runat="server" type="text" class="estado" placeholder="Estado"></asp:TextBox>
                        </div>
                        <br />
                        <div class="mb-3">
                            <label id="lblCidade" class="form-label">Cidade:</label>
                            <asp:TextBox ID="txtCidade" runat="server" type="text" class="cidade" placeholder="Cidade"></asp:TextBox>
                        </div>
                        <%--<asp:Button ID="btnCadastrar" runat="server" required="true" Text="Cadastrar" OnClick="btnCadastrar_Onclick" />--%>

                        <%-- <asp:Button ID="btnLimpar" runat="server" required="true" Text="Limpar" OnClick="btnLimpar_Onclick" />--%>

                        <br />

                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnCadastrar" class="btn btn-primary" runat="server" required="true" Text="Cadastrar" OnClick="btnCadastrar_Click" />
                </div>
            </div>
        </div>
    </div>

    <!-- Fim Modal cadastrar -->

    <!-- Modal Editar -->
    <div class="modal fade" id="myModalEditar" tabindex="-1" role="dialog" onload="Load_InformeCEP" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h3 class="modal-title" id="myModalLabelEditar">Editar cadastro</h3>
                </div>
                <div class="modal-body">

                    <div class="formulario">
                        <div class="mb-3">
                            <label id="lblNomeEditar" class="form-label">Nome completo:</label>
                            <asp:TextBox ID="txtEditarNome" runat="server" type="text" class="form-control" placeholder="Nome completo" required="true"></asp:TextBox>
                        </div>
                        <br />
                        <div class="mb-3">
                            <label id="lblEmailEditar" class="form-label">E-mail:</label>
                            <asp:TextBox ID="txtEditarEmail" runat="server" type="email" class="form-control" placeholder="Informe seu E-mail" required="true"></asp:TextBox>
                        </div>
                        <br />
                        <div class="mb-3">
                            <label id="lblCepEditar" class="form-label">Cep:</label>
                            <asp:TextBox ID="txtEditarCep" runat="server" type="text" class="cep" placeholder="Informe seu CEP" required="true"></asp:TextBox>

                        </div>
                        <br />
                        <div class="mb-3">
                            <label id="lblRuaEditar" class="form-label">Rua:</label>
                            <asp:TextBox ID="txtEditarRua" runat="server" type="text" class="rua" placeholder="rua" required="true"></asp:TextBox>
                        </div>
                        <br />
                        <div class="mb-3">
                            <label id="lblNumeroEditar" class="form-label">Numero:</label>
                            <asp:TextBox ID="txtEditarNumero" runat="server" type="text" class="form-control" placeholder="numero" required="true"></asp:TextBox>
                        </div>
                        <br />
                        <div class="mb-3">
                            <label id="lblBairroEditar" class="form-label">Bairro:</label>
                            <asp:TextBox ID="txtEditarBairro" runat="server" type="text" class="bairro" placeholder="Bairro" required="true"></asp:TextBox>
                        </div>
                        <br />
                        <div class="mb-3">
                            <label id="lblEstadoEditar" class="form-label">Estado:</label>
                            <asp:TextBox ID="txtEditarEstado" runat="server" type="text" class="estado" placeholder="Estado" required="true"></asp:TextBox>
                        </div>
                        <br />
                        <div class="mb-3">
                            <label id="lblCidadeEditar" class="form-label">Cidade:</label>
                            <asp:TextBox ID="txtEditarCidade" runat="server" type="text" class="cidade" placeholder="Cidade" required="true"></asp:TextBox>
                        </div>

                        <asp:Button ID="btnlimpar" runat="server" required="true" Text="limpar" />

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

                    <p style="font-size: 25px; color: red;">Realmente deseja deletar este cadastro ?&hellip;</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Não</button>
                    <asp:Button ID="btnDeletar" class="btn btn-primary" runat="server" Text="Deletar" OnClick="btnDeletar_Click" />
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
    <!--Fim Modal Deletando com sucesso->



    <!-- Button trigger modal Cadastrar-->
    <button type="button" id="cadastrobtn" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
        Novo cliente</button>

    <!-- Button trigger modal Editar-->
    <button type="button" id="btnModalEditar" style="display: none;" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModalEditar">
        Editar produto</button>
    <!-- Button trigger modal mensagem Deletar-->
    <button type="button" id="btnModalMessageDeletar" style="display: none;" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#AbrirMensageDelete">
        mensagemDeletar</button>



    <script type="text/javascript">

        function AbrirModalEditar() {
            var btnAbrirModal = document.getElementById('btnModalEditar');
            btnAbrirModal.click();

        }

        function EditadoComSucesso() {
            var AbrirMensageSucess = document.getElementById('btnModalMessageSucesso');
            btnModalMessageSucesso.click();
        }

        function ExibirMensagemDeletar() {
            var btnModalMessageDeletar = document.getElementById('btnModalMessageDeletar');
            btnModalMessageDeletar.click();
        }

        function ExibirCadastroSucess() {
            var btnCadastrar = document.getElementById('btnModalMessageCadastro');
            btnModalMessageCadastro.click();
        }


    </script>

    <script>

        const limparFormulario = () => {
            document.getElementById('MainContent_txtRua').value = '';
            document.getElementById('MainContent_txtBairro').value = '';
            document.getElementById('MainContent_txtCidade').value = '';
            document.getElementById('MainContent_txtEstado').value = '';
        }


        const preencherFormulario = (enderecoViaCep) => {
            document.getElementById('MainContent_txtRua').value = enderecoViaCep.logradouro;
            document.getElementById('MainContent_txtBairro').value = enderecoViaCep.bairro;
            document.getElementById('MainContent_txtCidade').value = enderecoViaCep.localidade;
            document.getElementById('MainContent_txtEstado').value = enderecoViaCep.uf;
        }


        const eNumero = (txtNumero) => /^[0-9]+$/.test(txtNumero);

        const cepValido = (txtCep) => txtCep.length == 8 && eNumero(txtCep);

        const pesquisarCep = async () => {
            limparFormulario();

            const cep = document.getElementById('MainContent_txtCep').value.replace("-", "");
            console.log(`Peguei o cep ${cep}`)
            const url = `https://viacep.com.br/ws/${cep}/json/`;
            console.log(`Peguei o url ${url}`)
            if (cepValido(cep)) {
                console.log(`Peguei o cep ${cep}`)
                const dados = await fetch(url);
                const endereco = await dados.json();
                if (endereco.hasOwnProperty('erro')) {
                    alert('CEP incorreto!');
                } else {
                    preencherFormulario(endereco);
                }
            } else {
                alert('CEP incorreto!')
            }

        }

        document.getElementById('MainContent_txtCep')
            .addEventListener('focusout', pesquisarCep);

        const limparFormularioEditar = () => {
            document.getElementById('MainContent_txtEditarRua').value = '';
            document.getElementById('MainContent_txtEditarBairro').value = '';
            document.getElementById('MainContent_txtEditarCidade').value = '';
            document.getElementById('MainContent_txtEditarEstado').value = '';
        }


        const preencherFormularioEditar = (endereco) => {
            document.getElementById('MainContent_txtEditarRua').value = endereco.logradouro;
            document.getElementById('MainContent_txtEditarBairro').value = endereco.bairro;
            document.getElementById('MainContent_txtEditarCidade').value = endereco.localidade;
            document.getElementById('MainContent_txtEditarEstado').value = endereco.uf;
        }


        const eNumero1 = (txtNumero) => /^[0-9]+$/.test(txtNumero);

        const cepValido1 = (txtCep) => txtCep.length == 8 && eNumero(txtCep);

        const pesquisarCepEditar = async () => {
            limparFormularioEditar();

            const cep = document.getElementById('MainContent_txtEditarCep').value.replace("-", "");
            console.log(`Peguei o cep ${cep}`)
            const url = `https://viacep.com.br/ws/${cep}/json/`;
            console.log(`Peguei o url ${url}`)
            if (cepValido1(cep)) {
                console.log(`Peguei o cep ${cep}`)
                const dados = await fetch(url);
                const enderecoViaCep = await dados.json();
                if (enderecoViaCep.hasOwnProperty('erro')) {
                    alert('CEP incorreto!');
                } else {
                    preencherFormularioEditar(enderecoViaCep);
                }
            } else {
                alert('CEP incorreto!')
            }

        }

        document.getElementById('MainContent_txtEditarCep')
            .addEventListener('focusout', pesquisarCepEditar);

        function AlertSucesso() {
            Swal.fire(
                'Alerta de sucesso!',
                'Cadastro realizado com sucesso!',
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

        function AlertDeletarSucesso() {
            Swal.fire(
                'Sucesso',
                'Deletado com sucesso!',
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
