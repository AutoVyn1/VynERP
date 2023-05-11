<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="InsurancePage.aspx.vb" Inherits="AutovynERP.InsurancePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="../Style/InsuranceStyle.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="backbtn sticky-top">
            <a href="DashboardModule.aspx">
                <img src="../Images/backbtn.png" width="26" /></a>
        </div>

        <div class="w3-container sticky-top">
            <div class="w3-bar w3-black tab">
                <a class="w3-bar-item w3-button" onclick="openCity('form')" style="text-decoration: none; color: #fff; font-size: 19px; font-weight: 600; letter-spacing: 1px;">Form</a>
                <a class="w3-bar-item w3-button" href="InsuDataView.aspx" onclick="openCity('DataView')"
                    style="text-decoration: none; color: #fff; font-size: 19px; font-weight: 600; letter-spacing: 1px;">Data</a>
            </div>

            <div id="form" class="w3-container city">
                <div class="form-heading">
                    <h3>Customer Insurance Form</h3>
                </div>
                <div class="main-form">
                    <div class="ibl-input">
                        <div class="lbl">
                            <asp:Label ID="Label1" runat="server" Text="Label">Cust_Name</asp:Label>
                        </div>
                        <div class="input">
                            <asp:TextBox ID="CustName" runat="server" CssClass="inputt" Placeholder="Cust_Name"></asp:TextBox>
                        </div>
                    </div>
                    <div class="ibl-input">
                        <div class="lbl">
                            <asp:Label ID="Label2" runat="server" Text="Label">Cust_Address</asp:Label>
                        </div>
                        <div class="input">
                            <asp:TextBox ID="CustAddress" runat="server" CssClass="inputt" Placeholder="Enter customer address"></asp:TextBox>
                        </div>

                    </div>
                    <div class="ibl-input">
                        <div class="lbl">
                            <asp:Label ID="Label3" runat="server" Text="Label">Mobile Number</asp:Label>
                        </div>
                        <div class="input">
                            <asp:TextBox ID="CustMobile" runat="server" CssClass="inputt" Placeholder="Enter mobile number"></asp:TextBox>
                        </div>

                    </div>
                    <div class="ibl-input">
                        <div class="lbl">
                            <asp:Label ID="Label4" runat="server" Text="Label">Email</asp:Label>
                        </div>
                        <div class="input">
                            <asp:TextBox ID="CustEmail" runat="server" CssClass="inputt" Placeholder="Enter customer email"></asp:TextBox>
                        </div>

                    </div>
                    <div class="ibl-input">
                        <div class="lbl">
                            <asp:Label ID="Label5" runat="server" Text="Label">Vechile No.</asp:Label>
                        </div>
                        <div class="input">
                            <asp:TextBox ID="VehicleNo" runat="server" CssClass="inputt" Placeholder="Enter Vechile no."></asp:TextBox>
                        </div>

                    </div>
                    <div class="ibl-input">
                        <div class="lbl">
                            <asp:Label ID="Label6" runat="server" Text="Label">Payment Mode</asp:Label>
                        </div>
                        <div class="input">
                            <asp:DropDownList ID="PaymentMode" runat="server" CssClass="inputt" Style="width: 186px;">
                                <asp:ListItem>Cash</asp:ListItem>
                                <asp:ListItem>Cheque</asp:ListItem>
                                <asp:ListItem>NEFT</asp:ListItem>
                                <asp:ListItem>Wallet</asp:ListItem>
                                <asp:ListItem>Other</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="ibl-input">
                        <div class="lbl">
                            <asp:Label ID="Label7" runat="server" Text="Label">Insurance Amt.</asp:Label>
                        </div>
                        <div class="input">
                            <asp:TextBox ID="InsuranceAmt" runat="server" CssClass="inputt" Placeholder="Enter insurance amount"></asp:TextBox>
                        </div>
                    </div>
                    <div class="ibl-input">
                        <div class="lbl">
                            <asp:Label ID="Label8" runat="server" Text="Label">Select Date</asp:Label>
                        </div>
                        <div class="input">
                            <asp:TextBox ID="datePicker" runat="server" TextMode="Date" CssClass="inputt" Style="width: 186px;"></asp:TextBox>
                        </div>
                    </div>
                    <div class="ibl-input">
                        <div class="lbl">
                            <asp:Label ID="Label9" runat="server" Text="Label">Remark</asp:Label>
                        </div>
                        <div class="input">
                            <asp:TextBox ID="Remark" runat="server" CssClass="inputt" Placeholder="Enter remark"></asp:TextBox>
                        </div>
                    </div>
                    <div class="ibl-input">
                        <asp:Button ID="Submit" runat="server" Text="Submit" CssClass="submit-btn" />
                    </div>
                </div>
            </div>
        </div>


        <script>
            function openCity(cityName) {
                var i;
                var x = document.getElementsByClassName("city");
                for (i = 0; i < x.length; i++) {
                    x[i].style.display = "none";
                }
                document.getElementById(cityName).style.display = "block";
            }
        </script>
    </form>
</body>
</html>

<script type = "text/javascript" >  
    function preventBack() { window.history.forward(); }
    setTimeout("preventBack()", 0);
    window.onunload = function () { null };  
</script>
