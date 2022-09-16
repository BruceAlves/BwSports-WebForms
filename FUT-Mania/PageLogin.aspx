<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PageLogin.aspx.cs" Inherits="FUT_Mania.PageLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="CSS/Login.css" />
</head>
<body>
    


    <img class="img" src="CSS/BwSports_free-file.png"  />
    <form id="formularioLogin" runat="server">

        <header>Login</header>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Email:</label><br />
            <asp:TextBox  runat="server" type="text" class="form-control" id="txtemail" placeholder="Informe seu E-mail"></asp:TextBox><br />

             <label for="exampleFormControlInput1" class="form-label">Senha:</label><br />
            <asp:TextBox  runat="server" type="password" class="form-control" id="txtsenha" placeholder="Informe sua Senha"></asp:TextBox>

            <asp:Button ID="btnLogin" runat="server" required="true" Text="Login" OnClick="btnLogin_Click" />

        </div><br />
    </form>
</body>
</html>
