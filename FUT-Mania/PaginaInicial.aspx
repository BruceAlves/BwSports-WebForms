<%@ Page Title="Página inicial" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PaginaInicial.aspx.cs" Inherits="FUT_Mania._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="CSS/InicialPage.css" />


    <style>
        .right carousel-control{
            background-color:white;
        }
    </style>

    <br />
    <br />

    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div style="margin-top: 1%; height: 600px; background-color: white; border-radius: 15px;" class="carousel-inner" role="listbox">
            <div class="item active">
                <img style="margin-left: 40%; margin-top: 10%;" src="CSS/BwSports_free-file.png" alt="Bw">
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item">
                <img style="margin-left: 35%; width:350px; height:350px; margin-top: 8%" src="CSS/logo-uefa-champions-league-4096.png" alt="Bw">

                <div class="carousel-caption">
                </div>
            </div>

            <div class="item">
                <img style="margin-left: 33%;  width:400px; height:350px; margin-top: 10%;" src="CSS/pngwing.com (1).png" alt="Bw">

                <div class="carousel-caption">
                </div>
            </div>

             <div class="item">
                <img style="margin-left: 35%; width:350px; height:350px; margin-top: 10%;" src="CSS/kisspng-201617-premier-league-201516-premier-league-5b32564f3ea479.4756515515300255512566.png" alt="Bw">

                <div class="carousel-caption">
                </div>
            </div>

            
             <div class="item">
                <img style="margin-left: 40%; margin-top: 10%;" src="CSS/campeonato-brasileiro-serie-a-logo-F86C405B11-seeklogo.com.png" alt="Bw">

                <div class="carousel-caption">
                </div>
            </div>
            <br />
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

</asp:Content>
