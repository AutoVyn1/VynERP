<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="InsuDataView.aspx.vb" Inherits="AutovynERP.InsuDataView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../Style/InsuranceStyle.css" />
    <title></title>
    <style>
        @media screen and (max-width:480px) {

            .gridView {
                width: max-content;
                margin: 2px;
            }

            .name {
                background-color: antiquewhite;
                width: 20%;
                height: 50px;
                border: 1px solid;
            }

            .backbtn {
                width: 459%;
                height: 44px;
                background-color: #0476D0;
                padding: 9px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="backbtn">
            <a href="InsurancePage.aspx">
                <img src="../Images/backbtn.png" width="26" /></a>
        </div>


        <div class="gridView">
            <asp:Panel ID="Panel1" runat="server" ScrollBars="Horizontal">
                <asp:GridView ID="dataGrid" runat="server"
                    CssClass="table table-bordered table-condensed table-responsive table-hover">
                    <AlternatingRowStyle BackColor="White" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="true" Font-Size="Larger" ForeColor="White" />
                    <RowStyle BackColor="#f5f5f5" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="true" ForeColor="White" />
                </asp:GridView>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
<script type = "text/javascript" >  
    function preventBack() { window.history.forward(); }
    setTimeout("preventBack()", 0);
    window.onunload = function () { null };  
</script>
