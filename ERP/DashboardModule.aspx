<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DashboardModule.aspx.vb" Inherits="AutovynERP.DashboardModule" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../Style/DashboardModuleStyle.css" />

    
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
        <div class="backbtn sticky-top"><a href="MainPage.aspx" ><img src="../Images/backbtn.png" width="26" /></a></div>
        <div class="profile sticky-top">
            <asp:Image ID="Image1" ImageUrl="~/Images/autovyn.png" Width="150" runat="server" />
        </div>

        <div class="heading">
            <h3>ERP Module</h3>
            <asp:Label ID="user" runat="server" style="font-size: 18px;"></asp:Label>
        </div>

        <div class="frame">
            <div class="section">
                <div class="tab"><div class="icon-txt"><img src="../images/insurance.png" /><asp:Button ID="Insuranced" CssClass="dshbtn" Text="Insurance" runat="server" /></div></div>
                <div class="tab"><div class="icon-txt"><img src="../images/cashier.png" /><asp:Button ID="CashierLogind" CssClass="dshbtn" runat="server" Text="Cashier" /></div></div>
            </div>
            <div class="section">
                <div class="tab"><div class="icon-txt"><img src="../Images/sales.png" /><asp:Button ID="SalesModuled" CssClass="dshbtn" Text="Sales" runat="server" /></div></div>
                <div class="tab"><div class="icon-txt"><img src="../Images/payroll.png" /><asp:Button ID="Payroll" CssClass="dshbtn" Text="Payroll" runat="server" /></div></div>
            </div> 
            <div class="section">
                <div class="tab"><div class="icon-txt"><img src="../images/service.png" /><asp:Button ID="Service" CssClass="dshbtn" Text="Service" runat="server" /></div></div>
                <div class="tab"><div class="icon-txt"><img src="../images/truevalue.png" /><asp:Button ID="TrueValue" CssClass="dshbtn" Text="True Value" runat="server" /></div></div>
            </div>
            <div class="section">
                <div class="tab"><div class="icon-txt"><img src="../images/service.png" /><asp:Button ID="Accounts" CssClass="dshbtn" Text="Accounts" runat="server" /></div></div>
                <div class="tab"><div class="icon-txt"><img src="../images/auditor.png" /><asp:Button ID="Exchange" CssClass="dshbtn" Text="Exchange" runat="server" /></div></div>
            </div>
            <div class="section">
                <div class="tab"><div class="icon-txt"><img src="../images/accounts.png" /><asp:Button ID="MIS" CssClass="dshbtn" Text="MIS" runat="server" /></div></div>
                <div class="tab"><div class="icon-txt"><img src="../images/admin.png" /><asp:Button ID="Finance" CssClass="dshbtn" Text="Finance" runat="server" /></div></div>
            </div>
            <div class="section">
                <div class="tab"><div class="icon-txt"><img src="../images/alerts.png" /><asp:Button ID="Alerts" CssClass="dshbtn" Text="Alerts" runat="server" /></div></div>
                <div class="tab"><div class="icon-txt"><img src="../images/support.png" /><asp:Button ID="Support" CssClass="dshbtn" Text="Support" runat="server" /></div></div>
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

