<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="BranchSelect.aspx.vb" Inherits="AutovynERP.BranchPage1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../Css/InsuranceStyle.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <section>
            <div class="Mainhead">
                <h2>AUTO-VYN CLOUD</h2>
            </div>

            <div class="login">
                <div class="Loginhead" style="background-color:#0476D0; color:#fff;">
                    <h3>SELECT YOUR BRANCH</h3>
                </div>

                <div class="login-form">
                    <asp:DropDownList ID="DropDownList1" runat="server" style="width: 260px;"></asp:DropDownList>
                    <div class="logininput">
                        <asp:Button ID="ShowProfile" CssClass="lbtn" runat="server" Text="Enter Branch" />
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
