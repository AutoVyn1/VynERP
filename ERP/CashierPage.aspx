<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CashierPage.aspx.vb" Inherits="AutovynERP.CashierPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../Style/CashierStyle.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="backbtn">
            <a href="DashboardModule.aspx">
                <img src="../Images/backbtn.png" width="26" /></a>
        </div>
        <div class="cashier">
            <div class="cashier-head">
                <h3>Cashier</h3>
            </div>
            <div class="cashier-form">
                <div class="ibl-input">
                    <div class="lbl">
                        <asp:Label ID="Label1" runat="server" Text="Label">Cash Ledger</asp:Label>
                    </div>
                    <div class="input">
                        <asp:Label ID="cashLedg" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="ibl-input">
                    <div class="lbl">
                        <asp:Label ID="Label2" runat="server" Text="Label">Cashier Id</asp:Label>
                    </div>
                    <div class="input">
                        <asp:TextBox ID="cashier_id" runat="server" Placeholder="Enter cashier Id" Height="30px"></asp:TextBox>
                    </div>
                </div>
                <div class="ibl-input">
                    <div class="lbl">
                        <asp:Label ID="Label3" runat="server" Text="Label">Ledger Code</asp:Label>
                    </div>
                    <div class="input">
                        <asp:TextBox ID="ledg_code" runat="server" Placeholder="Enter ledger code" Height="30px"></asp:TextBox>
                    </div>
                </div>
                <div class="ibl-input">
                    <div class="lbl">
                        <asp:Label ID="Label4" runat="server" Text="Label">Enter Date</asp:Label>
                    </div>
                    <div class="input">
                        <asp:TextBox ID="enterdate" TextMode="Date" runat="server" Style="width: 166px; height: 30px;"></asp:TextBox>
                    </div>
                </div>
                <div class="ibl-input">
                    <div class="lbl">
                        <asp:Label ID="Label5" runat="server" Text="Label">Amount</asp:Label>
                    </div>
                    <div class="input">
                        <asp:TextBox ID="amount" runat="server" Height="30px"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="cash-count">
                <div class="cbl-input">
                    <div class="clbl">
                        <asp:Label ID="cnt_2000" runat="server" Text="Label">2000</asp:Label>
                    </div>
                    <div class="inputcash">
                        <asp:TextBox ID="amt_2000" runat="server" Height="26px"></asp:TextBox>
                    </div>
                    <div class="cinput">
                        <asp:TextBox ID="total_2000" runat="server" Height="26px"></asp:TextBox>
                    </div>
                </div>
                <div class="cbl-input">
                    <div class="clbl">
                        <asp:Label ID="cnt_500" runat="server" Text="Label">500</asp:Label>
                    </div>
                    <div class="inputcash">
                        <asp:TextBox ID="amt_500" runat="server" Height="26px"></asp:TextBox>
                    </div>
                    <div class="cinput">
                        <asp:TextBox ID="total_500" runat="server" Height="26px"></asp:TextBox>
                    </div>

                </div>
                <div class="cbl-input">
                    <div class="clbl">
                        <asp:Label ID="cnt_200" runat="server" Text="Label">200</asp:Label>
                    </div>
                    <div class="inputcash">
                        <asp:TextBox ID="amt_200" runat="server" Height="26px"></asp:TextBox>
                    </div>
                    <div class="cinput">
                        <asp:TextBox ID="total_200" runat="server" Height="26px"></asp:TextBox>
                    </div>
                </div>
                <div class="cbl-input">
                    <div class="clbl">
                        <asp:Label ID="cnt_100" runat="server" Text="Label">100</asp:Label>
                    </div>
                    <div class="inputcash">
                        <asp:TextBox ID="amt_100" runat="server" Height="26px"></asp:TextBox>
                    </div>
                    <div class="cinput">
                        <asp:TextBox ID="total_100" runat="server" Height="26px"></asp:TextBox>
                    </div>
                </div>
                <div class="cbl-input">
                    <div class="clbl">
                        <asp:Label ID="cnt_50" runat="server" Text="Label">50</asp:Label>
                    </div>
                    <div class="inputcash">
                        <asp:TextBox ID="amt_50" runat="server" Height="26px"></asp:TextBox>
                    </div>
                    <div class="cinput">
                        <asp:TextBox ID="total_50" runat="server" Height="26px"></asp:TextBox>
                    </div>
                </div>
                <div class="cbl-input">
                    <div class="clbl">
                        <asp:Label ID="cnt_20" runat="server" Text="Label">20</asp:Label>
                    </div>
                    <div class="inputcash">
                        <asp:TextBox ID="amt_20" runat="server" Height="26px"></asp:TextBox>
                    </div>
                    <div class="cinput">
                        <asp:TextBox ID="total_20" runat="server" Height="26px"></asp:TextBox>
                    </div>
                </div>
                <div class="cbl-input">
                    <div class="clbl">
                        <asp:Label ID="cnt_10" runat="server" Text="Label">10</asp:Label>
                    </div>
                    <div class="inputcash">
                        <asp:TextBox ID="amt_10" runat="server" Height="26px"></asp:TextBox>
                    </div>
                    <div class="cinput">
                        <asp:TextBox ID="total_10" runat="server" Height="26px"></asp:TextBox>
                    </div>
                </div>
                <div class="ibl-input">
                    <div class="lbl">
                        <asp:Button ID="Total" runat="server" CssClass="total-bal" Text="Total Balance = " />
                    </div>
                    <div class="totalinput">
                        <asp:TextBox ID="total_bal" runat="server" Style="height: 32px;"></asp:TextBox>
                    </div>
                </div>

                <div class="ibl-btn">
                    <asp:Button ID="Submitcash" runat="server" Text="Submit Cash" CssClass="submit-btn" />
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
