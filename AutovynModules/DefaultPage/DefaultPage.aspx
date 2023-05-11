<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AutovynModules/AUTOVYN.Master" CodeBehind="DefaultPage.aspx.vb" Inherits="AutovynERP.DefaultPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

    <style>
        * {
            margin:0;
            padding:0;
            font-family: 'Dosis', sans-serif;
            scrollbar-width: thin;
            scrollbar-color: #397524 #DFE9EB;
        }

        .home-screen {
            height: 100vh;
            display: flex;
            justify-content: center;
            flex-direction: column;
            align-items: center;
        }

        .main-content {
            margin-top: 50px;
        }

        .img {
            display: flex;
            justify-content: center;
            flex-direction: column;
            align-items: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="home-screen">
        <div class="headingsContainer">
            <img src="../Media/autovyn.png" alt="" width="240" />
        </div>
    </div>







    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>

</asp:Content>
