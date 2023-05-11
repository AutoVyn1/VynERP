<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TrueValue.aspx.vb" Inherits="AutovynERP.TrueValue1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: sans-serif;
            font-size: 15px;
            background: #FFE4C4;
        }

        .Form-container {
            margin: 4px;
        }

        .form {
            background: #FFE4C4;
            line-height: 1.6;
        }

        .title {
            text-align: center;
            height: 60px;
            padding-top: 15px;
            text-transform: uppercase;
        }

        .navigation {
            display: flex;
            justify-content: space-between;
        }

        .container {
            border: 2px solid silver;
            overflow: hidden;
        }

        .data {
            display: flex;
        }

        .data1 {
            display: flex;
            justify-content: space-between;
        }

        .customer {
            display: flex;
            justify-content: space-between;
            margin: 6px;
            line-height: 1.7;
        }

        .half {
            width: 50%;
        }


        .half1 {
            width: 64%;
        }

        .half2 {
            width: 35%;
        }


        .rightalign {
            display: flex;
            justify-content: right;
        }

        .finance {
            background: #FFE4C4;
        }

        #Remark {
            height: 40px;
        }


        .center {
            display: flex;
            justify-content: center;
            margin: 7px;
        }

        .bottombuttons {
            background: #0568d5;
            border: none;
            border-radius: 5px;
            color: white;
            margin-right: 10px;
            width: 10%;
            height: 37px;
        }

        .bottombuttons1 {
            background: #0568d5;
            border: none;
            border-radius: 4px;
            color: white;
            min-height: 23px;
            min-width: 60px;
        }

        .bottombuttons:hover {
            background-color: #0568d5;
        }

        .bottombuttons1:hover {
            background-color: #0568d5;
        }

        #submit {
            margin-right: 10px;
        }

        #clear {
            margin-left: 10px;
        }

        .labelleft {
            width: 40%;
        }

        .labelleftbg {
            width: 20%;
        }

        .labelleft2 {
            width: 11%;
        }

        .labelleftsp {
            width: 70%;
        }

        .labelleftbk {
            width: 49.4%;
        }

        .singlebox {
            width: 78.2%;
            border: 2px solid dimgray;
        }

        .singlebox1 {
            width: 78.76%;
            border: 2px solid dimgray;
        }

        .doublebox {
            border: 2px solid dimgray;
            width: 57%;
        }

        .doublebox1 {
            border: 2px solid dimgray;
            width: 48.3%;
        }

        .doublebox2 {
            border: 2px solid dimgray;
            width: 29%;
        }

        .navbox {
            border: 2px solid dimgray;
        }


        .box {
            background-color: #fff;
            background: #FFE4C4;
            border-radius: 3px;
            overflow: hidden;
        }

        .tab-list {
            margin: 0;
            padding: 0;
            list-style: none;
            display: flex;
            position: relative;
        }


        .tab-list::before {
            content: '';
            display: block;
            height: 2px;
            width: 33.333%;
            position: absolute;
            bottom: 0;
            background-image: linear-gradient(to right, #434343 0%, black 100%);
            transition: .3s;
        }

        .tab-item {
            flex: 1;
            text-align: center;
            transition: .3s;
            opacity: 0.5;
        }

        .tab-toggle {
            display: none;
        }

        .tab-content {
            display: none;
        }

        .tab-toggle:nth-child(1):checked~.tab-list .tab-item:nth-child(1),
        .tab-toggle:nth-child(2):checked~.tab-list .tab-item:nth-child(2),
        .tab-toggle:nth-child(3):checked~.tab-list .tab-item:nth-child(3) {
            opacity: 1;
        }


        .tab-toggle:nth-child(2):checked~.tab-list::before {
            transform: translateX(100%);
        }

        .tab-toggle:nth-child(3):checked~.tab-list::before {
            transform: translateX(200%);
        }

        .tab-toggle:nth-child(1):checked~.tab-container .tab-content:nth-child(1),
        .tab-toggle:nth-child(2):checked~.tab-container .tab-content:nth-child(2),
        .tab-toggle:nth-child(3):checked~.tab-container .tab-content:nth-child(3) {
            display: block;
        }

        .tab-trigger {
            display: block;
            padding: 10px 0;
        }

        .tab-container {
            background: #FFE4C4;
        }


        @media (min-width: 600px) {
            .navbox {
                border: 2px solid dimgray;
                width: 30%;
            }

            .lblw {
                width: 15%;
                padding-left: 10px;
            }

            .datestyle {
                margin-right: 69px;
            }

        }

        @media screen and (max-width: 1000px) {

            .labelleftbg {
                width: 30%;
            }

            .half {
                width: 100%;
            }

            .half1 {
                width: 100%;
            }

            .half2 {
                width: 100%;
            }

            .data1 {
                flex-direction: column;
            }

            .customer {
                margin: 15px;
                line-height: 2.6;
            }

            .singlebox1 {
                width: 57%;
                line-height: 2.6;
            }

        }

            .backbtn {
                height: 44px;
                background-color: #0476D0;
                padding: 9px;
            }


    </style>
</head>

<body>
    <form id="form1" runat="server">

        <%-- Using for mobile navigation --%>
            <div class="backbtn">
                <a href="DashboardModule.aspx">
                    <img src="../../images/backbtn.png" width="26" /></a>
            </div>
            <%-- --%>
                <div class="title">
                    <h1>TV COST SHEET</h1>
                </div>
                <div class="container1">
                    <div class="data1">
                        <div class="half1">
                            <div class="customer">
                                <asp:Label ID="Label34" runat="server" CssClass="lblw" Text="TV Invoice No.">
                                </asp:Label>
                                <asp:TextBox ID="tvinvoice" Class="navbox" runat="server"></asp:TextBox>
                                <asp:Label ID="Label1" runat="server" CssClass="lblw" Text="Cust Id."></asp:Label>
                                <asp:TextBox ID="custid" Class="navbox" runat="server"></asp:TextBox>
                                <asp:Button class="bottombuttons1" ID="view" runat="server" Text="view" />
                            </div>
                        </div>
                        <div class="half2">
                            <div class="customer">
                                <asp:Label ID="Label36" runat="server" CssClass="lblw" Text="File No."></asp:Label>
                                <asp:TextBox ID="fileno" Class="navbox" runat="server"></asp:TextBox>
                                <asp:Label ID="Label37" runat="server" CssClass="lblw" Text="Date"></asp:Label>
                                <asp:TextBox ID="date1" Class="navbox datestyle" placeholder="MM/DD/YYYY"
                                    onblur="(this.type='text')" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container2">
                    <div class="customer">
                        <asp:Label ID="Label3" Class="labelleftbg" runat="server" Text="Customer Name"></asp:Label>
                        <asp:TextBox Class="singlebox1" ID="custname" runat="server"></asp:TextBox>
                    </div>
                    <div class="customer">
                        <asp:Label ID="Label2" runat="server" Class="labelleftbg" Text="Address"></asp:Label>
                        <asp:TextBox Class="singlebox1" ID="address" runat="server"></asp:TextBox>
                    </div>
                    <div class="data1">
                        <div class="half">
                            <div class="customer">
                                <asp:Label ID="Label29" runat="server" class="labelleft" Text="City"></asp:Label>
                                <asp:TextBox Class="doublebox" ID="city" runat="server"></asp:TextBox>
                            </div>
                            <div class="customer">
                                <asp:Label ID="Label31" runat="server" class="labelleft" Text="Mobile No."></asp:Label>
                                <asp:TextBox Class="doublebox" ID="mobile" runat="server"></asp:TextBox>
                            </div>
                            <div class="customer">
                                <asp:Label ID="Label13" runat="server" class="labelleft" Text="PAN Card"></asp:Label>
                                <asp:TextBox Class="doublebox" ID="pan" runat="server" Width="30.5%"></asp:TextBox>
                                <asp:CheckBox ID="form60" runat="server" />
                                <asp:Label ID="Label18" runat="server" Width="20%" Text="Form 60(PAN N/A)"></asp:Label>
                            </div>
                            <div class="customer">
                                <asp:Label ID="Label5" runat="server" class="labelleft" Text="Financier/HYP/HP">
                                </asp:Label>
                                <asp:TextBox Class="doublebox" ID="financier" runat="server"></asp:TextBox>
                            </div>
                            <div class="customer">
                                <asp:Label ID="Label7" runat="server" class="labelleft" Text="Fin. DO Amt"></asp:Label>
                                <asp:TextBox Class="doublebox" ID="findoamt" runat="server" Width="23%"></asp:TextBox>
                                <asp:Label ID="Label8" runat="server" Width="16%" Text="Fin. PF Chrgs"></asp:Label>
                                <asp:TextBox Class="doublebox" ID="finpf" runat="server" Width="13.4%"></asp:TextBox>
                            </div>
                        </div>
                        <div class="half">
                            <div class="customer">
                                <asp:Label ID="Label30" runat="server" class="labelleft" Text="State"></asp:Label>
                                <asp:TextBox Class="doublebox" ID="State" runat="server"></asp:TextBox>
                            </div>
                            <div class="customer">
                                <asp:Label ID="Label32" runat="server" class="labelleft" Text="PIN Code"></asp:Label>
                                <asp:TextBox Class="doublebox" ID="pincode" runat="server"></asp:TextBox>
                            </div>
                            <div class="customer">
                                <asp:Label ID="Label4" runat="server" class="labelleft" Text="GST No."></asp:Label>
                                <asp:TextBox Class="doublebox" ID="gst" runat="server"></asp:TextBox>
                            </div>

                            <div class="customer">
                                <asp:Label ID="Label6" runat="server" class="labelleft" Text="Type of Loan"></asp:Label>
                                <asp:TextBox Class="doublebox" ID="typeloan" runat="server"></asp:TextBox>
                            </div>

                            <div class="customer">
                                <asp:Label ID="Label11" runat="server" class="labelleft" Text="Fin Do No."></asp:Label>
                                <asp:TextBox Class="doublebox" ID="findono" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="customer">
                        <asp:Label ID="Label9" class="boldlabel" runat="server" Text="True Value Vehicle Details">
                        </asp:Label>
                    </div>
                    <div class="data1">
                        <div class="half">
                            <div class="customer">
                                <asp:Label ID="Label42" runat="server" class="labelleft" Text="Veh. Reg. No.">
                                </asp:Label>
                                <asp:TextBox Class="doublebox" ID="vehreg" runat="server"></asp:TextBox>
                            </div>
                            <div class="customer">
                                <asp:Label ID="Label44" runat="server" class="labelleft" Text="Veh. Engine No.">
                                </asp:Label>
                                <asp:TextBox Class="doublebox" ID="vehengine" runat="server"></asp:TextBox>
                            </div>
                            <div class="customer">
                                <asp:Label ID="Label46" runat="server" class="labelleft" Text="Exchange Type">
                                </asp:Label>
                                <asp:TextBox Class="doublebox" ID="exchangetp" runat="server"></asp:TextBox>
                            </div>
                            <div class="customer">
                                <asp:Label ID="Label48" runat="server" class="labelleft" Text="Model variant">
                                </asp:Label>
                                <asp:TextBox Class="doublebox" ID="modelvt" runat="server"></asp:TextBox>
                            </div>
                            <div class="customer">
                                <asp:Label ID="Label51" runat="server" class="labelleft" Text="DSE Name"></asp:Label>
                                <asp:TextBox Class="doublebox" ID="dsename" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="half">
                            <div class="customer">
                                <asp:Label ID="Label43" runat="server" Width="30%" Text="Chassis No."></asp:Label>
                                <asp:TextBox Class="doublebox" ID="chassis" runat="server"></asp:TextBox>
                            </div>

                            <div class="customer">
                                <asp:Label ID="Label45" runat="server" class="labelleft" Text="Relation With Customer">
                                </asp:Label>
                                <asp:TextBox Class="doublebox" ID="relation" runat="server"></asp:TextBox>
                            </div>
                            <div class="customer">
                                <asp:Label ID="Label40" runat="server" class="labelleft" Text="Mfg. Year"></asp:Label>
                                <asp:TextBox Class="doublebox" ID="mfg" runat="server"></asp:TextBox>

                            </div>
                            <div class="customer">
                                <asp:Label ID="Label41" runat="server" class="labelleft" Text="Km."></asp:Label>
                                <asp:TextBox Class="doublebox" ID="km" runat="server"></asp:TextBox>
                            </div>
                            <div class="customer">
                                <asp:Label ID="Label52" runat="server" class="labelleft" Text="Evalutor Name">
                                </asp:Label>
                                <asp:TextBox Class="doublebox" ID="evalutor" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="customer">
                        <asp:Label ID="Label53" Class="labelleftbg" runat="server" Text="Remark"></asp:Label>
                        <asp:TextBox Class="singlebox1" ID="remark" Height="40px" runat="server"></asp:TextBox>
                    </div>
                    <div class="customer">
                        <asp:Label ID="Label10" Class="labelleftbg" runat="server" Text="New Car Sale Details">
                        </asp:Label>
                    </div>
                    <div class="data1">
                        <div class="half">
                            <div class="customer">
                                <asp:Label ID="Label12" runat="server" class="labelleft" Text="Veh. Group/Code">
                                </asp:Label>
                                <asp:TextBox Class="doublebox" ID="vehgroup" runat="server" Width="20%"></asp:TextBox>
                                <asp:TextBox Class="doublebox" ID="vehcode" runat="server" Width="33.5%"></asp:TextBox>
                            </div>
                            <div class="customer">
                                <asp:Label ID="Label15" runat="server" class="labelleft" Text="DSE Name"></asp:Label>
                                <asp:TextBox Class="doublebox" ID="dsename1" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="half">
                            <div class="customer">
                                <asp:Label ID="Label14" runat="server" class="labelleft" Text="Color"></asp:Label>
                                <asp:TextBox Class="doublebox" ID="color" runat="server"></asp:TextBox>
                            </div>
                            <div class="customer">

                                <asp:Label ID="Label16" runat="server" class="labelleft" Text="Chassis No."></asp:Label>
                                <asp:TextBox Class="doublebox" ID="chassis1" runat="server" Width="23%"></asp:TextBox>
                                <asp:Label ID="Label17" runat="server" Width="16%" Text="Engine No."></asp:Label>
                                <asp:TextBox Class="doublebox" ID="engine1" runat="server" Width="13.4%"></asp:TextBox>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="center">
                    <asp:Button class="bottombuttons" ID="submit" runat="server" Text="Submit" />
                    <asp:Button class="bottombuttons" ID="update" runat="server" Text="Update" />
                    <asp:Button class="bottombuttons" ID="clear" runat="server" Text="Clear Fields" />
                </div>
    </form>
</body>

</html>
<script type = "text/javascript" >  
    function preventBack() { window.history.forward(); }
    setTimeout("preventBack()", 0);
    window.onunload = function () { null };  
</script>
