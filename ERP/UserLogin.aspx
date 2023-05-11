<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="UserLogin.aspx.vb" Inherits="AutovynERP.UserLogin" %>

<!DOCTYPE html>
 
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../Style/UserLogin.css" />
    <link rel="stylesheet" href="../Style/fin.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <section>
            <div class="login">
                <div class="Loginhead">
                    <h3>AUTO-VYN ERP</h3>
                </div>
                <div class="login-form">
                    <div class="img">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/autovyn.png" CssClass="image" />
                    </div>
                    <div class="logininput">
                        <asp:TextBox ID="Comp_Code" CssClass="linput" placeholder="Comp. code" runat="server"></asp:TextBox><br />
                        <asp:Label ID="MsgComp" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="logininput">
                        <asp:TextBox ID="User_Name" CssClass="linput" placeholder="Username" runat="server"></asp:TextBox><br />
                        <asp:Label ID="MsgUser" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="logininput">
                        <asp:TextBox ID="Password" CssClass="linput" placeholder="Password" TextMode="Password" runat="server"></asp:TextBox><br />
                        <asp:Label ID="MsgPass" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="logininput">
                        <asp:Button ID="loginBtn" CssClass="lbtn" runat="server" Text="Login" Style="cursor: pointer;" />
                    </div>
                </div>
            </div>
        </section>
    </form>
</body>
</html>
<script type = "text/javascript" >  
    function preventBack() { window.history.forward(); }
    setTimeout("preventBack()", 0);
    window.onunload = function () { null };  
</script>

