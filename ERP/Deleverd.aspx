<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Deleverd.aspx.vb" Inherits="AutovynERP.Deleverd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../Style/InsuranceStyle.css" />
    <style>
        ::-webkit-scrollbar{
            display:none;
        }

        .search{
            float:right;
            height: 28px;
            border: none;
            border-radius: 50px 0 0 50px;
            padding-left:10px;
        }

        .Searchbtn{
            float: right;
            height: 28px;
            width: 55px;
            border: none;
            border-radius: 1px 50px 50px 0px;
        }
        
    </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       <div class="backbtn">
            <a href="DashboardModule.aspx">
                <img src="../Images/backbtn.png" width="26" /></a>
            
            <asp:Button ID="ViewFilterData" runat="server" Text="Search" CssClass="Searchbtn" />
            <asp:TextBox ID="Search" runat="server" Placeholder="Search" CssClass="search">
            </asp:TextBox>


        </div>
        <div class="w3-container">
            <div class="w3-bar w3-black tab">
               <a class="w3-bar-item w3-button link" href="SalesModule.aspx" 
                    style="text-decoration: none; color: #fff; font-size: 19px; font-weight: 600; letter-spacing: 1px;">Retail</a>

                <a class="w3-bar-item w3-button link" href="Deleverd.aspx" 
                    style="text-decoration: none; color: #fff; font-size: 19px; font-weight: 600; letter-spacing: 1px;">Deleverd</a>

                <a class="w3-bar-item w3-button link" href="BBND.aspx" 
                    style="text-decoration: none; color: #fff; font-size: 19px; font-weight: 600; letter-spacing: 1px;">BBND</a>
            </div>

        </div>
        <asp:Panel ID="Panel1" runat="server" ScrollBars="Horizontal">
            <asp:GridView ID="DevelerdData" runat="server"
                    CssClass="table table-bordered table-condensed table-responsive table-hover">
                    <AlternatingRowStyle BackColor="White" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="true" Font-Size="Larger" ForeColor="White" />
                    <RowStyle BackColor="#f5f5f5" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="true" ForeColor="White" />
                </asp:GridView>
        </asp:Panel>
    </form>
</body>
</html>

<script type = "text/javascript" >  
    function preventBack() { window.history.forward(); }
    setTimeout("preventBack()", 0);
    window.onunload = function () { null };  
</script>

