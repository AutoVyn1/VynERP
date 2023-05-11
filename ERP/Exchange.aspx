<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Exchange.aspx.vb" Inherits="AutovynERP.Exchange1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <title>Exchange Approval</title>
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
    text-align: center;
    height: 100px;
    padding-top: 20px;
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

.tab-toggle:nth-child(1):checked ~ .tab-list .tab-item:nth-child(1),
.tab-toggle:nth-child(2):checked ~ .tab-list .tab-item:nth-child(2),
.tab-toggle:nth-child(3):checked ~ .tab-list .tab-item:nth-child(3) {
    opacity: 1;
}


.tab-toggle:nth-child(2):checked ~ .tab-list::before {
    transform: translateX(100%);
}

.tab-toggle:nth-child(3):checked ~ .tab-list::before {
    transform: translateX(200%);
}

.tab-toggle:nth-child(1):checked ~ .tab-container .tab-content:nth-child(1),
.tab-toggle:nth-child(2):checked ~ .tab-container .tab-content:nth-child(2),
.tab-toggle:nth-child(3):checked ~ .tab-container .tab-content:nth-child(3) {
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
                padding-left:10px;
            }

            .datestyle{
                margin-right:69px;
            }
        }

        @media (max-width: 1281px) {
            body {
                
            }

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
                margin: 17px;
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
            <div class="backbtn sticky-top">
                <a href="DashboardModule.aspx">
                    <img src="../../images/backbtn.png" width="26" /></a>
            </div>
            <%-- --%>
    <div class="Form-container">
        <div class="title">
            <span style="font-size: 27px; font-weight: 700;">Exchange</span>
        </div>

        <div class="container1">
            <div class="data1">
                <div class="half1">
                    <div class="customer">
                        <asp:Label ID="Label34" runat="server"  CssClass="lblw" Text="DMS Invoice No."></asp:Label>
                        <asp:TextBox ID="dmsinvoice" Class="navbox" runat="server"></asp:TextBox>
                        <asp:Label ID="Label1" runat="server"  CssClass="lblw" Text="Cust Id."></asp:Label>
                        <asp:TextBox ID="custid" Class="navbox" runat="server"  ></asp:TextBox>
                        <asp:Button class="bottombuttons1" ID="view" runat="server" Text="view" />
                    </div>
                </div>
                <div class="half2">
                    <div class="customer">
                        <asp:Label ID="Label36" runat="server" CssClass="lblw" Text="File No."></asp:Label>
                        <asp:TextBox ID="fileno" Class="navbox" runat="server" ></asp:TextBox>
                        <asp:Label ID="Label37" runat="server"  CssClass="lblw" Text="Date"></asp:Label>
                        <asp:TextBox ID="date1" Class="navbox datestyle" placeholder="MM/DD/YYYY" onblur="(this.type='text')" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>
        <div class="container2">
            <div class="box">
                <input type="radio" class="tab-toggle" name="tab-toggle" id="tab1" checked />
                <input type="radio" class="tab-toggle" name="tab-toggle" id="tab2" />
                <input type="radio" class="tab-toggle" name="tab-toggle" id="tab3" />

                <ul class="tab-list">
                    <li class="tab-item">
                        <label class="tab-trigger" for="tab1">Exchange1</label>
                    </li>
                    <li class="tab-item">
                        <label class="tab-trigger" for="tab2">Exchange2</label>
                    </li>
                    <li class="tab-item">
                        <label class="tab-trigger" for="tab3">Exchange3</label>
                    </li>
                </ul>

                <div class="tab-container">
                    <div class="tab-content">

                        <div class="customer">
                            <asp:Label ID="Label9" runat="server" Width="" Text="Old/ Exchange Vehicles Detail--01"></asp:Label>
                        </div>
                        <div class="data1">
                            <div class="half">
                                <div class="customer">
                                    <asp:Label ID="Label26" runat="server" Class="labelleft" Text="Veh. Reg. No.(1)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="vehregno" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label29" runat="server" Class="labelleft" Text="Veh. Engine No.(1)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="engineno" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label31" runat="server" Class="labelleft" Text="Exchange Type(1)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="exchtype" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label33" runat="server" Class="labelleft" Text="Customer Name(1)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="custname" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label35" runat="server" Class="labelleft" Text="Customer Id(1)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="custidd" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label40" runat="server" Class="labelleft" Text="Mfg. Year(1)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="mfyear" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label42" runat="server" Class="labelleft" Text="Purchase Amount(1)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="puramount" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label44" runat="server" Class="labelleft" Text="Loan Paid by Dlr(1)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="loanpaid" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label46" Class="labelleft" runat="server" Text="Net Amount(1)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="netamount" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">

                                    <asp:Label ID="Label47" Class="labelleftsp" runat="server" Text="(Net Amount to be Received from True Value(True Value DO))(1)"></asp:Label>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label50" runat="server" Class="labelleft" Text="Amt(1)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="amtt" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label51" runat="server" Class="labelleft" Text="Proposed Cost(Refurbishment Cost)(1)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="refcost" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="half">
                                <div class="customer">
                                    <asp:Label ID="Label28" runat="server" Class="labelleft" Text="Chassis No.(1)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="chassisno" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label30" runat="server" Class="labelleft" Text="Relation With Customer(1)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="relation" runat="server"></asp:TextBox>
                                </div>

                                <div class="customer">
                                    <asp:Label ID="Label32" runat="server" Class="labelleft" Text="Evalutor Name(1)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="evalutor" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label39" runat="server" Class="labelleft" Text="Model variant(1)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="modvariant" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label38" runat="server" Class="labelleft" Text="Customer PAN No.(1)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="pan" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label41" Class="labelleft" runat="server" Text="Km.(1)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="km" runat="server"></asp:TextBox>
                                </div>

                                <div class="customer">
                                    <asp:Label ID="Label43" runat="server" Class="labelleft" Text="Exchange Amount(1)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="exchamount" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label45" runat="server" Class="labelleft" Text="3rd Party Insu. Amt(1)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="thirdpartyin" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label48" runat="server" Class="labelleft" Text="Actual Pymt Recd from TV JV No.(1)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="acttvno" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label49" runat="server" Class="labelleft" Text="TV Pymt Receiving Date(1)"></asp:Label>
                                    <asp:TextBox ID="tvrecdate" Class="doublebox" placeholder="MM/DD/YYYY" onblur="(this.type='text')" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label20" runat="server" Class="labelleftbk" Text="(TV Payment)"></asp:Label>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label52" runat="server" Class="labelleft" Text="Actual Refurbishment Cost(1)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="actrefcosst" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="customer">
                            <asp:Label ID="Label53" runat="server" Class="labelleftbg" Text="Remark(if any)(1)"></asp:Label>
                            <asp:TextBox Class="singlebox1" ID="remark" Height="60px" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="tab-content">

                        <div class="customer">
                            <asp:Label ID="Labe2l9" runat="server" Width="" Text="Old/ Exchange Vehicles Detail--02"></asp:Label>
                        </div>
                        <div class="data1">
                            <div class="half">

                                <div class="customer">
                                    <asp:Label ID="Labe2l28" runat="server" class="labelleft" Text="Veh. Reg. No.(2)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="vehreg2" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Lab3el30" runat="server" class="labelleft" Text="Veh. Engine No.(2)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="veheng2" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Labetl32" runat="server" class="labelleft" Text="Exchange Type(2)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="exchtype2" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label2" runat="server" class="labelleft" Text="Customer Name(2)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="custname2" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label3" runat="server" class="labelleft" Text="Customer Id(2)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="custid12" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label6" runat="server" class="labelleft" Text="Mfg. Year(2)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="mfgyr2" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label8" runat="server" class="labelleft" Text="Purchase Amount(2)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="puramo2" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label11" runat="server" class="labelleft" Text="Loan Paid by Dlr(2)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="loan2" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label13" runat="server" class="labelleft" Text="Net Amount(2)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="netamo2" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label14" Class="labelleftsp" runat="server" Width="" Text="(Net Amount to be Received from True Value(True Value DO))(2)"></asp:Label>

                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label17" runat="server" class="labelleft" Text="Amt(2)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="TextBox21" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label18" runat="server" class="labelleft" Text="Proposed Cost(Refurbishment Cost)(2)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="procost2" runat="server"></asp:TextBox>
                                </div>

                            </div>
                            <div class="half">
                                <div class="customer">
                                    <asp:Label ID="La2bel29" runat="server" class="labelleft" Text="Chassis No.(2)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="vehchassis2" runat="server"></asp:TextBox>
                                </div>

                                <div class="customer">
                                    <asp:Label ID="Labe4l31" runat="server" class="labelleft" Text="Relation With Customer(2)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="relation2" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Labdel33" runat="server" class="labelleft" Text="Evalutor Name(2)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="evalutor2" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label5" runat="server" class="labelleft" Text="Model variant(2)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="varient2" runat="server"></asp:TextBox>
                                </div>

                                <div class="customer">
                                    <asp:Label ID="Label4" runat="server" class="labelleft" Text="Customer PAN No.(2)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="panno2" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label7" runat="server" class="labelleft" Text="Km.(2)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="km2" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label10" runat="server" class="labelleft" Text="Exchange Amount(2)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="exchamo2" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label12" runat="server" class="labelleft" Text="3rd Party Insu. Amt(2)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="tirdparty2" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label15" runat="server" class="labelleft" Text="Actual Pymt Recd from TV JV No.(2)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="actualpay2" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label16" runat="server" class="labelleft" Text="TV Pymt Receiving Date(2)"></asp:Label>
                                    <asp:TextBox ID="recdate2" Class="doublebox" placeholder="MM/DD/YYYY" onblur="(this.type='text')" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label21" Class="labelleftbk" runat="server" Text="(TV Payment)(2)"></asp:Label>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label19" runat="server" class="labelleft" Text="Actual Refurbishment Cost(2)"></asp:Label>
                                    <asp:TextBox class="doublebox" ID="refcost2" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="customer">
                            <asp:Label ID="Label54" runat="server" Class="labelleftbg" Text="Remark(if any)(2)"></asp:Label>
                            <asp:TextBox Class="singlebox1" ID="remark2" Height="60px" runat="server"></asp:TextBox>
                        </div>

                    </div>
                    <div class="tab-content">

                        <div class="customer">
                            <asp:Label ID="Label55" runat="server" Width="" Text="Old/ Exchange Vehicles Detail--03"></asp:Label>
                        </div>
                        <div class="data1">
                            <div class="half">
                                <div class="customer">
                                    <asp:Label ID="Label56" runat="server" class="labelleft" Text="Veh. Reg. No.(3)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="vehreg3" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label58" runat="server" class="labelleft" Text="Veh. Engine No.(3)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="veheng3" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label60" runat="server" class="labelleft" Text="Exchange Type(3)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="exchtype3" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label62" runat="server" class="labelleft" Text="Customer Name(3)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="custname3" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label63" runat="server" class="labelleft" Text="Customer Id(3)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="custid13" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label66" runat="server" class="labelleft" Text="Mfg. Year(3)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="mfgyr3" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label68" runat="server" class="labelleft" Text="Purchase Amount(3)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="puramo3" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label70" runat="server" class="labelleft" Text="Loan Paid by Dlr(3)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="loan3" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label72" runat="server" class="labelleft" Text="Net Amount(3)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="netamo3" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label73" Class="labelleftsp" runat="server" Width="" Text="(Net Amount to be Received from True Value(True Value DO))(3)"></asp:Label>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label76" runat="server" class="labelleft" Text="Amt(3)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="TextBox44" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label77" runat="server" class="labelleft" Text="Proposed Cost(Refurbishment Cost)(3)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="procost3" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="half">
                                <div class="customer">
                                    <asp:Label ID="Label57" runat="server" class="labelleft" Text="Chassis No.(3)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="vehchassis3" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label59" runat="server" class="labelleft" Text="Relation With Customer(3)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="relation3" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label61" runat="server" class="labelleft" Text="Evalutor Name(3)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="evalutor3" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label65" runat="server" class="labelleft" Text="Model variant(3)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="varient3" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label64" runat="server" class="labelleft" Text="Customer PAN No.(3)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="panno3" runat="server"></asp:TextBox>
                                </div>

                                <div class="customer">
                                    <asp:Label ID="Label67" runat="server" class="labelleft" Text="Km.(3)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="km3" runat="server"></asp:TextBox>

                                </div>

                                <div class="customer">
                                    <asp:Label ID="Label69" runat="server" class="labelleft" Text="Exchange Amount(3)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="exchamo3" runat="server"></asp:TextBox>
                                </div>

                                <div class="customer">
                                    <asp:Label ID="Label71" runat="server" class="labelleft" Text="3rd Party Insu. Amt(3)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="tirdparty3" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">

                                    <asp:Label ID="Label74" runat="server" class="labelleft" Text="Actual Pymt Recd from TV JV No.(3)"></asp:Label>
                                    <asp:TextBox Class="doublebox" ID="actualpay3" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">

                                    <asp:Label ID="Label75" runat="server" class="labelleft" Text="TV Pymt Receiving Date(3)"></asp:Label>
                                    <asp:TextBox ID="recdate3" Class="doublebox" placeholder="MM/DD/YYYY" onblur="(this.type='text')" runat="server"></asp:TextBox>
                                </div>
                                <div class="customer">
                                    <asp:Label ID="Label22" runat="server" Class="labelleftbk" Text="(Tv Payment)(3)"></asp:Label>
                                </div>

                                <div class="customer">
                                    <asp:Label ID="Label78" runat="server" class="labelleft" Text="Actual Refurbishment Cost(3)"></asp:Label>
                                    <asp:TextBox class="doublebox" ID="refcost3" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="customer">
                            <asp:Label ID="Label79" runat="server" Class="labelleftbg" Text="Remark(if any)(3)"></asp:Label>
                            <asp:TextBox Class="singlebox1" ID="remark3" Height="60px" runat="server" ></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="center">
            <asp:Button class="bottombuttons" ID="submit" runat="server" Text="Submit" />
            <asp:Button class="bottombuttons" ID="update" runat="server" Text="Update" />
            <asp:Button class="bottombuttons" ID="Clear" runat="server" Text="Clear Fields" />
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
