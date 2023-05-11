<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="MainPage.aspx.vb" Inherits="AutovynERP.MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../Style/MainStyle.css" />
    <title></title>
    <style>
    .dshbtn {
        background: none;
        border: none;
        font-weight: bold;
        padding: 8px 1px 4px 9px;
    }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="Container">
        <div class="profile sticky-top">
            <div class="userinfo">
                <asp:Label ID="comp" runat="server"></asp:Label><br />
                <asp:Label ID="user" runat="server"></asp:Label>
            </div>
        </div>

        <div class="heading" style="margin:40px 10px;">
            <h3>Welcome AUTO-VYN</h3>
        </div>

        <div class="frame">
            
             <div class="section">
                 <div class="tab"><div class="icon-txt"><img src="../images/dashboard.png" /><asp:Button ID="DashboardMod" CssClass="dshbtn" runat="server" Text="Dashboard" /></div></div>
                <div class="tab"><div class="icon-txt"><img src="../images/autovynicon.png" /><asp:Button ID="AutovynModule" CssClass="dshbtn" runat="server" Text="Autovyn" /></div></div>
            </div>
            <div class="section">
                <div class="tab"><div class="icon-txt"><img src="../images/support.png" /><asp:Button ID="SupportModule" CssClass="dshbtn" runat="server" Text="Support" /></div></div>
                <div class="tab"><div class="icon-txt"><img src="../images/logout.png" /><asp:Button ID="LogoutBtn" CssClass="dshbtn" runat="server" Text="Logout" /></div></div>
            </div> 
        </div>

    </div>
    </form>
</body>
</html>
<script type = "text/javascript" >  
    function preventBack() { window.history.forward(); }
    setTimeout("preventBack()", 0);
    window.onunload = function () { null };  
</script>
