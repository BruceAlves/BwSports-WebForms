<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FUT_Mania.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="CSS/Login.css" />
    <title></title>
</head>
<body>
    <img class="img" src="https://images.squarespace-cdn.com/content/v1/52136d0fe4b01103f36987fe/1544190245655-K0BZKFG6WRHT6HY4TK3G/uefa-champions-league-rebranding-2018-2021-7.jpg?format=2500w" />

    <form id="form1" runat="server">
        <div id="container">
            <header>LOGIN</header>

            <div class="DivEmail">
                <asp:Label ID="lblEmail" runat="server" required="true">Email:</asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" required="true"></asp:TextBox>
            </div>

            <div class="DivSenha">
                <asp:Label ID="lblSenha" runat="server" required="true">Senha:</asp:Label>
                <asp:TextBox Type="password" ID="txtsenha" runat="server" required="true"></asp:TextBox>
            </div>

            <asp:Button ID="btnLogin" runat="server" required="true" Text="Login" OnClick="btnLogin_Click" />

        </div>

    </form>


    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script>
        document.getElementById('teste').onclick = teste;
        function teste() {

            swal("Erro!", "Credenciais inválidas!", "error");
        }



    </script>
</body>
</html>
