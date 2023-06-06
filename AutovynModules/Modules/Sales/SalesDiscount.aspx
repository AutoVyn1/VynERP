<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AutovynModules/AUTOVYN.Master" CodeBehind="SalesDiscount.aspx.vb" Inherits="AutovynERP.SalesDiscount1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../../JS/ListSelect/virtual-select.min.css" />
    <%-- swet --%>
    <!-- InputMask -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/inputmask/inputmask.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/inputmask/inputmask.date.extensions.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/inputmask/inputmask.extensions.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/css/inputmask.css" />

    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

    <script type="text/javascript" src="../../JS/ListSelect/virtual-select.min.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: 'Dosis', sans-serif;
        }

        input {
            text-transform: uppercase;
        }

        body {
            background-color: #fffaec;
            font-size: 13px;
        }

        .main-section {
            margin-top: 50px;
        }

        .main-head {
            text-align: center;
            font-size: 24px;
            font-weight: 700;
        }

        .section-first {
            padding: 6px 9px;
            border-radius: 4px;
            background-color: #a7e2cb;
            margin: 1px 0;
            box-shadow: 0px 2px 6px -1px rgba(0,0,0,0.75);
            -webkit-box-shadow: 0px 2px 6px -1px rgba(0,0,0,0.75);
            -moz-box-shadow: 0px 2px 6px -1px rgba(0,0,0,0.75);
        }

        .section-half {
            padding: 0px 9px;
            border-radius: 4px;
            background-color: #a7e2cb;
            margin: 1px 0;
            box-shadow: 0px 2px 6px -1px rgba(0,0,0,0.75);
            -webkit-box-shadow: 0px 2px 0px -1px rgba(0,0,0,0.75);
            -moz-box-shadow: 0px 2px 6px -1px rgba(0,0,0,0.75);
        }

        .sub-head {
            color: royalblue;
            font-size: 14px;
            font-weight: 700;
        }

        .spbtn {
            width: 15%;
            background-color: #65ad65;
            color: #fff;
            font-size: 16px;
            font-weight: 600;
        }

        @media screen and (max-width:480px) {
            .spbtn {
                width: 30%;
            }
        }

        #count {
            display: none;
        }

        .form-control {
            height: 30px;
            font-size: 12px;
        }


        #RequiredFieldValidator1 {
            color: red;
            margin: 0;
            padding: 0;
        }

        .img-box {
            display: flex;
            justify-content: center;
            flex-direction: column;
            text-align: center;
            align-items: center;
            margin: 14px 26px;
        }

        .img-btn {
            width: 30px;
            height: 30px;
        }

        .img-lbl {
            font-size: 11px;
            font-weight: 900;
            margin: 0;
            padding: 0;
        }




        @media screen and (max-width:820px) {
            .section-first {
                width: 80%;
                margin: auto;
            }

            .bottombuttons {
                width: 30%;
            }

            .button-sactions {
                display: flex;
                margin-bottom: 70px;
                margin-top: 10px;
                border-radius: 10px;
            }

            .img-box {
                margin: 14px 40px;
            }

            .section-first {
                width: 98%;
            }

            .amt-box {
                width: 100%;
                display: flex;
                justify-content: space-evenly;
            }

            .amt-box-1 {
                width: 34%;
            }

            .amt-box-11 {
                width: 84%;
            }

            .amt-box-12 {
                width: 14%;
            }


            .amt-box-lbl {
                width: 30%;
                margin-top: 10px;
            }

            .amt-box-total {
                width: 70%;
                margin-top: 10px;
            }
        }

        @media screen and (max-width:480px) {

            .bottombuttons {
                width: 30%;
            }

            .button-sactions {
                display: flex;
                margin-bottom: 0px;
                margin-top: 10px;
                border-radius: 10px;
            }

            .img-box {
                margin: 14px 8px;
            }

            .section-first {
                width: 98%;
            }

            .amt-box {
                width: 100%;
                display: flex;
                justify-content: space-evenly;
            }

            .amt-box-1 {
                width: 34%;
            }

            .amt-box-11 {
                width: 84%;
            }

            .amt-box-12 {
                width: 14%;
            }


            .amt-box-lbl {
                width: 30%;
                margin-top: 10px;
            }

            .amt-box-total {
                width: 70%;
                margin-top: 10px;
            }
        }

        .digitOnly {
            text-align: right;
        }

        #allthethings {
            width: 20%;
            height: 30%;
            left: 45%;
            top: 35%;
            position: fixed;
            -webkit-transform: scale(2);
        }

        #cssload-contain {
            position: fixed;
            margin-left: 25px;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(248, 248, 248, 0.50);
            z-index: 1000;
        }

        .cssload-preloader {
            position: absolute;
            top: 0px;
            left: 0px;
            right: 0px;
            bottom: 0px;
            z-index: 10;
        }

            .cssload-preloader > .cssload-preloader-box {
                position: absolute;
                height: 29px;
                top: 50%;
                width: 500px;
                margin: -15px 0 0 -200px;
                margin-left: 30px;
                perspective: 195px;
                -o-perspective: 195px;
                -ms-perspective: 195px;
                -webkit-perspective: 195px;
                -moz-perspective: 195px;
            }

            .cssload-preloader .cssload-preloader-box > div {
                position: relative;
                opacity: 1;
                width: 29px;
                height: 29px;
                background: rgb(204,204,204);
                float: left;
                text-align: center;
                line-height: 29px;
                font-family: Verdana;
                font-size: 19px;
                color: rgb(255,255,255);
            }

        .dropdown-set {
            width: 100%;
            padding: 5.5px 12px 7.68px;
            border-radius: 3px;
            border: 1px solid silver;
        }

        .checkbox-wrapper-19 {
            box-sizing: border-box;
            --background-color: #fff;
            --checkbox-height: 25px;
        }

        @-moz-keyframes dothabottomcheck-19 {
            0% {
                height: 0;
            }

            100% {
                height: calc(var(--checkbox-height) / 2);
            }
        }

        @-webkit-keyframes dothabottomcheck-19 {
            0% {
                height: 0;
            }

            100% {
                height: calc(var(--checkbox-height) / 2);
            }
        }

        @keyframes dothabottomcheck-19 {
            0% {
                height: 0;
            }

            100% {
                height: calc(var(--checkbox-height) / 2);
            }
        }

        @keyframes dothatopcheck-19 {
            0% {
                height: 0;
            }

            50% {
                height: 0;
            }

            100% {
                height: calc(var(--checkbox-height) * 1.2);
            }
        }

        @-webkit-keyframes dothatopcheck-19 {
            0% {
                height: 0;
            }

            50% {
                height: 0;
            }

            100% {
                height: calc(var(--checkbox-height) * 1.2);
            }
        }

        @-moz-keyframes dothatopcheck-19 {
            0% {
                height: 0;
            }

            50% {
                height: 0;
            }

            100% {
                height: calc(var(--checkbox-height) * 1.2);
            }
        }

        .checkbox-wrapper-19 input[type=checkbox] {
            display: none;
        }

        .checkbox-wrapper-19 .check-box {
            height: var(--checkbox-height);
            width: var(--checkbox-height);
            background-color: transparent;
            border: calc(var(--checkbox-height) * .1) solid #000;
            border-radius: 5px;
            position: relative;
            display: inline-block;
            -moz-box-sizing: border-box;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            -moz-transition: border-color ease 0.2s;
            -o-transition: border-color ease 0.2s;
            -webkit-transition: border-color ease 0.2s;
            transition: border-color ease 0.2s;
            cursor: pointer;
        }

            .checkbox-wrapper-19 .check-box::before,
            .checkbox-wrapper-19 .check-box::after {
                -moz-box-sizing: border-box;
                -webkit-box-sizing: border-box;
                box-sizing: border-box;
                position: absolute;
                height: 0;
                width: calc(var(--checkbox-height) * .2);
                background-color: #34b93d;
                display: inline-block;
                -moz-transform-origin: left top;
                -ms-transform-origin: left top;
                -o-transform-origin: left top;
                -webkit-transform-origin: left top;
                transform-origin: left top;
                border-radius: 5px;
                content: " ";
                -webkit-transition: opacity ease 0.5;
                -moz-transition: opacity ease 0.5;
                transition: opacity ease 0.5;
            }

            .checkbox-wrapper-19 .check-box::before {
                top: calc(var(--checkbox-height) * .72);
                left: calc(var(--checkbox-height) * .41);
                box-shadow: 0 0 0 calc(var(--checkbox-height) * .05) var(--background-color);
                -moz-transform: rotate(-135deg);
                -ms-transform: rotate(-135deg);
                -o-transform: rotate(-135deg);
                -webkit-transform: rotate(-135deg);
                transform: rotate(-135deg);
            }

            .checkbox-wrapper-19 .check-box::after {
                top: calc(var(--checkbox-height) * .37);
                left: calc(var(--checkbox-height) * .05);
                -moz-transform: rotate(-45deg);
                -ms-transform: rotate(-45deg);
                -o-transform: rotate(-45deg);
                -webkit-transform: rotate(-45deg);
                transform: rotate(-45deg);
            }

            .checkbox-wrapper-19 input[type=checkbox]:checked + .check-box,
            .checkbox-wrapper-19 .check-box.checked {
                border-color: #34b93d;
            }

                .checkbox-wrapper-19 input[type=checkbox]:checked + .check-box::after,
                .checkbox-wrapper-19 .check-box.checked::after {
                    height: calc(var(--checkbox-height) / 2);
                    -moz-animation: dothabottomcheck-19 0.2s ease 0s forwards;
                    -o-animation: dothabottomcheck-19 0.2s ease 0s forwards;
                    -webkit-animation: dothabottomcheck-19 0.2s ease 0s forwards;
                    animation: dothabottomcheck-19 0.2s ease 0s forwards;
                }

                .checkbox-wrapper-19 input[type=checkbox]:checked + .check-box::before,
                .checkbox-wrapper-19 .check-box.checked::before {
                    height: calc(var(--checkbox-height) * 1.2);
                    -moz-animation: dothatopcheck-19 0.4s ease 0s forwards;
                    -o-animation: dothatopcheck-19 0.4s ease 0s forwards;
                    -webkit-animation: dothatopcheck-19 0.4s ease 0s forwards;
                    animation: dothatopcheck-19 0.4s ease 0s forwards;
                }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<div id="cssload-contain">
        <div id="allthethings">
            <div class="cssload-preloader">
                <div class="cssload-preloader-box">
                    <div>L</div>
                    <div>O</div>
                    <div>A</div>
                    <div>D</div>
                    <div>I</div>
                    <div>N</div>
                    <div>G</div>
                </div>
            </div>
        </div>
    </div>
    
    <label id="one"></label>--%>

    <div class="container-fluid main-section">
        <asp:Panel ID="MainPanel" runat="server">
            <div class="section-first">
                <!-- row -->
                <div class="row mb-1">
                    <span class="main-head">Sales Discount Approval</span>
                </div>
                <!--new comeents-->
                <!-- row -->
                <!-- row -->
                <div class="row amt-box">
                    <asp:Label ID="mob_lbl" CssClass="col-lg-1 col-form-label amt-box-lbl amt-box-lbl" runat="server" Text="Phone No."></asp:Label>
                    <div class="col-lg-2 amt-box-total amt-box-total">
                        <asp:TextBox ID="Mob_No" MaxLength="10" CssClass="form-control resetting" required   runat="server"></asp:TextBox>
                    </div>

                    <asp:Label ID="label1111" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="PAN No."></asp:Label>
                    <div class="col-lg-2 amt-box-total">
                        <asp:TextBox ID="Pan_No" MaxLength="10" pattern="[a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}" title="Enter Valid Pan Number E.g. AAAAA9999A" required CssClass="form-control resetting Pan_No" runat="server"></asp:TextBox>
                    </div>

                    <asp:Label ID="label" runat="server" CssClass="col-lg-1 col-form-label amt-box-lbl" Text="Branches"></asp:Label>
                    <div class="col-lg-2 amt-box-total">
                        <asp:DropDownList class="resetting" ID="branch" selectionmode="multiple" required data-silent-initial-value-set="true" name="native-select" data-search="true" runat="server"></asp:DropDownList>

                    </div>
                    <asp:Label ID="Label125" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Cust Name"></asp:Label>
                    <div class="col-lg-2 amt-box-total">
                        <asp:TextBox ID="Cust_Name" CssClass="form-control resetting" runat="server"></asp:TextBox>
                    </div>
                </div>
                <!-- row -->
                <!-- row -->
                <div class="row amt-box">

                    <asp:Label ID="Label1" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Model Variant"></asp:Label>
                    <div class="col-lg-2 amt-box-total">
                        <asp:DropDownList class="resetting" ID="modl_var" selectionmode="multiple" data-silent-initial-value-set="true" name="native-select" data-search="true" runat="server"></asp:DropDownList>
                    </div>

                    <asp:Label ID="Label2" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Color"></asp:Label>
                    <div class="col-lg-2 amt-box-total">
                        <asp:DropDownList class="resetting" ID="veh_color" selectionmode="multiple" data-silent-initial-value-set="true" name="native-select" data-search="true" runat="server"></asp:DropDownList>
                    </div>

                    <asp:Label ID="Label24" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Date" ToolTip="Form Fiiling Date"></asp:Label>
                    <div class="col-lg-2 amt-box-total">
                        <asp:TextBox ID="Curr_Date" CssClass="form-control " Enabled="false" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
        </asp:Panel>



        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-11">
                    <%--*****************************************************************--%>
                    <asp:Panel ID="VehDtl_Panel" runat="server">
                        <div class="section-first mt-2">
                            <div class="row">
                                <%--  --%>
                                <div class="col-lg-12">
                                    <div class="row amt-box">
                                        <asp:Label ID="Label4" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Loan Type"></asp:Label>
                                        <div class="col-lg-2 amt-box-total">
                                            <asp:DropDownList class="resetting" ID="Loan_type" selectionmode="multiple" data-silent-initial-value-set="true" name="native-select" data-search="true" runat="server"></asp:DropDownList>
                                        </div>

                                        <asp:Label ID="label6" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="MGA Amt."></asp:Label>
                                        <div class="col-lg-2 amt-box-total">
                                            <asp:TextBox ID="MGA_Amt" CssClass="form-control resetting digitOnly" required  runat="server"></asp:TextBox>
                                        </div>

                                        <asp:Label ID="Label5" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Insurance"></asp:Label>
                                        <div class="col-lg-2 amt-box-total">
                                            <asp:DropDownList class="resetting" ID="Insurance" CssClass="dropdown-set" runat="server">
                                                <asp:ListItem Value="">Select</asp:ListItem>
                                                <asp:ListItem Value="Y">Yes</asp:ListItem>
                                                <asp:ListItem Value="N">No</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                        <asp:Label ID="Label7" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="RTO"></asp:Label>
                                        <div class="col-lg-2 amt-box-total">
                                            <asp:DropDownList class="resetting" ID="RTO_Chrg" CssClass="dropdown-set" runat="server">
                                                <asp:ListItem Value="">Select</asp:ListItem>
                                                <asp:ListItem Value="Y">Yes</asp:ListItem>
                                                <asp:ListItem Value="N">No</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="row amt-box">
                                        <asp:Label ID="Label8" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="EW/CCP"></asp:Label>
                                        <div class="col-lg-2 amt-box-total">
                                            <asp:DropDownList class="resetting" ID="EW_CCP" CssClass="dropdown-set" runat="server">
                                                <asp:ListItem Value="">Select</asp:ListItem>
                                                <asp:ListItem Value="Y">Yes</asp:ListItem>
                                                <asp:ListItem Value="N">No</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                        <asp:Label ID="Label9" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Loyalty Card"></asp:Label>
                                        <div class="col-lg-2 amt-box-total">
                                            <asp:DropDownList class="resetting" ID="Loyalty_Card" required CssClass="dropdown-set" runat="server">
                                                <asp:ListItem Value="">Select</asp:ListItem>
                                                <asp:ListItem Value="Y">Yes</asp:ListItem>
                                                <asp:ListItem Value="N">No</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                        <asp:Label ID="Label10" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Old Car Exch."></asp:Label>
                                        <div class="col-lg-2 amt-box-total">
                                            <asp:DropDownList class="resetting" ID="Car_Exch"  CssClass="dropdown-set"  runat="server">
                                                <asp:ListItem Value="">Select</asp:ListItem>
                                                <asp:ListItem Value="Y">Yes</asp:ListItem>
                                                <asp:ListItem Value="N">No</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                        <asp:Label ID="Label12" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Fastag"></asp:Label>
                                        <div class="col-lg-2 amt-box-total">
                                            <asp:DropDownList class="resetting" ID="FastTeg" CssClass="dropdown-set" runat="server">
                                                <asp:ListItem Value="">Select</asp:ListItem>
                                                <asp:ListItem Value="Y">Yes</asp:ListItem>
                                                <asp:ListItem Value="N">No</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="row amt-box">
                                        <asp:Label ID="Label13" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="SRM/TL"></asp:Label>
                                        <div class="col-lg-2 amt-box-total">
                                            <asp:DropDownList class="resetting" ID="SRM" selectionmode="multiple" data-silent-initial-value-set="true" name="native-select" data-search="true" runat="server"></asp:DropDownList>
                                        </div>

                                        <asp:Label ID="Label22" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="RM/DSE"></asp:Label>
                                        <div class="col-lg-2 amt-box-total">
                                            <asp:DropDownList class="resetting" ID="RM" selectionmode="multiple" data-silent-initial-value-set="true" name="native-select" data-search="true" runat="server"></asp:DropDownList>
                                        </div>

                                        <asp:Label ID="Label11" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Exp. Delv Date" ToolTip="Expect Delevery Date"></asp:Label>
                                        <div class="col-lg-2 amt-box-total">
                                            <asp:TextBox ID="Delv_Date" Enabled="false" CssClass="form-control resetting" runat="server"></asp:TextBox>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                    <%--  --%>
                    <asp:Panel ID="MSIL_Panel" runat="server">
                        <div class="container-fluid mt-2">
                            <div class="row d-flex justify-content-between">
                                <div class="col-lg-12 section-first">
                                    <!-- row -->
                                    <div class="row">
                                        <span class="sub-head">MSIL Offers</span>
                                    </div>
                                    <!-- row -->

                                    <div class="row mb-1 amt-box">
                                        <asp:Label ID="Label14" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Consumer"></asp:Label>
                                        <div class="col-lg-2 amt-box-total">
                                            <asp:TextBox ID="Consumer" CssClass="form-control resetting digitOnly" required  runat="server"></asp:TextBox>
                                        </div>

                                        <asp:Label ID="Label15" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Corporate"></asp:Label>
                                        <div class="col-lg-2 amt-box-total">
                                            <asp:TextBox ID="Corporate" CssClass="form-control resetting digitOnly" required  runat="server"></asp:TextBox>
                                        </div>

                                        <asp:Label ID="Label16" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Exchange"></asp:Label>
                                        <div class="col-lg-2 amt-box-total">
                                            <asp:TextBox ID="Exch" CssClass="form-control resetting digitOnly" required  runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-12 section-first mt-2">
                                    <!-- row -->
                                    <div class="row">
                                        <span class="sub-head">Additional  Offers</span>
                                    </div>
                                    <!-- row -->
                                    <div class="row mb-1 amt-box">
                                        <asp:Label ID="Label17" CssClass="col-lg-1 col-form-label amt-box-lbl" ToolTip="Additional Offer Required" runat="server" Text="Dual Aprvl"></asp:Label>
                                        <div class="col-lg-2 amt-box-total">
                                        <div class="checkbox-wrapper-19">
                                                <asp:CheckBox ID="advance" onclick="handleCheckbox()" runat="server" />
                                                <label for="<%= advance.ClientID %>" class="check-box"></label>
                                            </div>
                                        </div>
                                        <asp:Label ID="Label19" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Approved By"></asp:Label>
                                        <div class="col-lg-2 amt-box-total">
                                            <asp:DropDownList class="resetting" ID="Aprvl_By" selectionmode="multiple" data-silent-initial-value-set="true" name="native-select" data-search="true" runat="server"></asp:DropDownList>
                                        </div>

                                        <asp:Label ID="Label3" CssClass="col-lg-1 col-form-label  amt-box-lbl"  Style="display:none" runat="server" Text="Approver 2"></asp:Label>

                                        <div class="col-lg-2  amt-box-total" id="apr1" style="display:none" >
                                            <asp:DropDownList class="resetting" ID="Aprvl_By2"   selectionmode="multiple" data-silent-initial-value-set="true" name="native-select" data-search="true" runat="server"></asp:DropDownList>
                                        </div>

                                        <asp:Label ID="Label18" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Amount"></asp:Label>
                                        <div class="col-lg-2 amt-box-total">
                                            <asp:TextBox ID="Discount_Amt" CssClass="form-control resetting digitOnly" required  runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="Aprvl_Panel" runat="server">
                        <div class="container-fluid section-first mt-2">
                            <div class="row">
                                <div class="col-12">
                                    <!-- row -->
                                    <div class="row mb-1">
                                        <span class="sub-head">Approvel</span>
                                    </div>
                                    <!-- row -->

                                    <!-- row -->
                                    <div class="row amt-box">

                                        <asp:Label ID="Label20" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Status"></asp:Label>
                                        <div class="col-lg-2 amt-box-total">
                                            <asp:DropDownList class="resetting" ID="Status" CssClass="dropdown-set" runat="server">
                                                <asp:ListItem Value="0">Select</asp:ListItem>
                                                <asp:ListItem Value="Approve">Approve</asp:ListItem>
                                                <asp:ListItem Value="Reject">Reject</asp:ListItem>
                                                <asp:ListItem Value="Pending">Pending</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                        <asp:Label ID="Label23" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Amount"></asp:Label>
                                        <div class="col-lg-2 amt-box-total">
                                            <asp:TextBox ID="Appr_Amt" CssClass="form-control resetting digitOnly"  runat="server"></asp:TextBox>
                                        </div>

                                        



                                        <asp:Label ID="Label21" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Remark"></asp:Label>
                                        <div class="col-lg-5 amt-box-total">
                                            <asp:TextBox ID="Remark" CssClass="form-control resetting" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                    <%--*********************************--%>
                </div>

                <%-- Buttons sections --%>
                <div class="col-lg-1 button-sactions" style="background-color: #cde7cd;">
                    <div class="img-box">
                        <asp:ImageButton ID="Submit_data" runat="server" CssClass="img-btn" OnClientClick="return validateDropDown();" ImageUrl="~/AutovynModules/Media/Save.png" />
                        <asp:Label ID="Label124" CssClass="col-form-label img-lbl" runat="server" Text="Save"></asp:Label>
                    </div>

                    <div class="img-box">
                        <asp:ImageButton ID="Update_Data" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Update.png" />
                        <asp:Label ID="Label231" CssClass="col-form-label img-lbl" runat="server" Text="Update"></asp:Label>
                    </div>

                    <div class="img-box">
                        <asp:ImageButton ID="Reset_Data" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Reset.png" />
                        <asp:Label ID="Label232" CssClass="col-form-label img-lbl" runat="server" Text="Reset"></asp:Label>
                    </div>

                    <div class="img-box">
                        <asp:ImageButton ID="Delete_Data" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Delete.png" />
                        <asp:Label ID="Label233" CssClass="col-form-label img-lbl" runat="server" Text="Delete"></asp:Label>
                    </div>

                    <div class="img-box">
                        <asp:ImageButton ID="Exit_Data" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Exit.png" />
                        <asp:Label ID="Label234" CssClass="col-form-label img-lbl" runat="server" Text="Exit"></asp:Label>
                    </div>


                    <div class="img-box">
                        <asp:ImageButton ID="Print_data" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Print.png" />
                        <asp:Label ID="Label235" CssClass="col-form-label img-lbl" runat="server" Text="Print"></asp:Label>
                    </div>
                </div>
            </div>
        </div>



    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <%-- For limitation to the input  --%>
   <script>
       var inputElement = document.getElementById("ContentPlaceHolder1_Mob_No");
       inputElement.addEventListener("keydown", restrictInput);
       inputElement.addEventListener("input", restrictInput);
       inputElement.addEventListener("touchstart", restrictInput);
       inputElement.addEventListener("touchend", restrictInput);

       var inputElement1 = document.getElementById("ContentPlaceHolder1_Discount_Amt");
       inputElement1.addEventListener("keydown", restrictInput);
       inputElement1.addEventListener("input", restrictInput);
       inputElement1.addEventListener("touchstart", restrictInput);
       inputElement1.addEventListener("touchend", restrictInput);
       inputElement1.addEventListener("blur", addSuffix);

       var inputElement2 = document.getElementById("ContentPlaceHolder1_Appr_Amt");
       inputElement2.addEventListener("keydown", restrictInput);
       inputElement2.addEventListener("input", restrictInput);
       inputElement2.addEventListener("touchstart", restrictInput);
       inputElement2.addEventListener("touchend", restrictInput);
       inputElement2.addEventListener("blur", addSuffix);

       var inputElement2 = document.getElementById("ContentPlaceHolder1_Consumer");
       inputElement2.addEventListener("keydown", restrictInput);
       inputElement2.addEventListener("input", restrictInput);
       inputElement2.addEventListener("touchstart", restrictInput);
       inputElement2.addEventListener("touchend", restrictInput);
       inputElement2.addEventListener("blur", addSuffix);

       var inputElement2 = document.getElementById("ContentPlaceHolder1_Corporate");
       inputElement2.addEventListener("keydown", restrictInput);
       inputElement2.addEventListener("input", restrictInput);
       inputElement2.addEventListener("touchstart", restrictInput);
       inputElement2.addEventListener("touchend", restrictInput);
       inputElement2.addEventListener("blur", addSuffix);

       var inputElement2 = document.getElementById("ContentPlaceHolder1_Exch");
       inputElement2.addEventListener("keydown", restrictInput);
       inputElement2.addEventListener("input", restrictInput);
       inputElement2.addEventListener("touchstart", restrictInput);
       inputElement2.addEventListener("touchend", restrictInput);
       inputElement2.addEventListener("blur", addSuffix);

       var inputElement2 = document.getElementById("ContentPlaceHolder1_MGA_Amt");
       inputElement2.addEventListener("keydown", restrictInput);
       inputElement2.addEventListener("input", restrictInput);
       inputElement2.addEventListener("touchstart", restrictInput);
       inputElement2.addEventListener("touchend", restrictInput);
       inputElement2.addEventListener("blur", addSuffix);

       function restrictInput(event) {

           var inputElement = event.target;
           var inputValue = inputElement.value;

           /*console.log(inputElement)*/

           // Remove non-numeric characters from the input value
           inputValue = inputValue.replace(/\D/g, "");

           // Update the input value with the cleaned numeric value
           inputElement.value = inputValue;


       }

       function addSuffix(event) {

           var inputValue = event.target;
           var value = inputValue.value;

           if (!value.endsWith(".00")) {
               inputValue.value = value + ".00";
           }
       }

   </script>
    <%-- For limitation to the input  --%>


    <%-- For select tool with search  --%>
    <script>
		VirtualSelect.init({
			ele: '#ContentPlaceHolder1_veh_color',
			showOptionsOnlyOnSearch: true
		});

		VirtualSelect.init({
			ele: '#ContentPlaceHolder1_modl_var',
			showOptionsOnlyOnSearch: true
		});

		VirtualSelect.init({
			ele: '#ContentPlaceHolder1_Loan_type',
			showOptionsOnlyOnSearch: true
		});

		VirtualSelect.init({
			ele: '#ContentPlaceHolder1_RM',
			showOptionsOnlyOnSearch: true
		});

		VirtualSelect.init({
			ele: '#ContentPlaceHolder1_SRM',
			showOptionsOnlyOnSearch: true
		});

		VirtualSelect.init({
			ele: '#ContentPlaceHolder1_Aprvl_By',
			showOptionsOnlyOnSearch: true
        });

		VirtualSelect.init({
			ele: '#ContentPlaceHolder1_Aprvl_By2',
			showOptionsOnlyOnSearch: true
		});

		VirtualSelect.init({
			ele: '#ContentPlaceHolder1_branch',
			showOptionsOnlyOnSearch: true
		});

	</script>
    <%-- For select tool with search  --%>

    <script>
		$(function () {
			var inputmask = new Inputmask("99/99/9999", { placeholder: 'dd/mm/yyyy' });
			inputmask.mask($('[id*=Delv_Date]'));
		});

	</script>

    <%-- For removing the url parameters  --%>
    <script>
		var urlWithoutParams = window.location.href.substring(0, window.location.href.indexOf("?"));
		history.replaceState({}, document.title, urlWithoutParams);
	</script>
    <%-- For removing the url parameters  --%>


    <%-- For input Validation  --%>
    <script type="text/javascript">
		function validateDropDown() {
			var branch = document.getElementById('ContentPlaceHolder1_branch');
			var color = document.getElementById('ContentPlaceHolder1_veh_color');
			var modlvar = document.getElementById('ContentPlaceHolder1_modl_var');
			var loantp = document.getElementById('ContentPlaceHolder1_Loan_type');
			var srm = document.getElementById('ContentPlaceHolder1_SRM');
			var rm = document.getElementById('ContentPlaceHolder1_RM');
            var aprvr = document.getElementById('ContentPlaceHolder1_Aprvl_By');
            var mob_no = document.getElementById('ContentPlaceHolder1_Mob_No');

			var disc_amount = document.getElementById('ContentPlaceHolder1_Discount_Amt');
			var apr_amt = document.getElementById('ContentPlaceHolder1_Appr_Amt');

            console.log(apr_amt.value)
			console.log(disc_amount.value)

			if (disc_amount.value<apr_amt.value) {
				Swal.fire({
					icon: 'warning',
					title: 'Please Enter the amount less then the requested amount',
					text: '',
				}).then(function () {
					branch.focus();
				});
				return false;
			}

			if (mob_no.value.length < 10) {
				Swal.fire({
					icon: 'warning',
					title: 'Please Enter 10 digit number',
					text: '',
				}).then(function () {
					branch.focus();
				});
				return false;
			}

			if (branch.value == '0') {
				Swal.fire({
					icon: 'warning',
					title: 'Please select a branch',
					text: '',
				}).then(function () {
					branch.focus();
				});
				return false;
			}
			if (color.value == '0') {
				Swal.fire({
					icon: 'warning',
					title: 'Please select any color',
				});
				return false;
			}

			if (modlvar.value == '0') {
				Swal.fire({
					icon: 'warning',
					title: 'Please select a modal varient',
				});

				return false;
			}

			if (loantp.value == '0') {
				Swal.fire({
					icon: 'warning',
					title: 'Please select loan type',
				});
				return false;
			}

			if (srm.value == '0') {
				Swal.fire({
					icon: 'warning',
					title: 'Please select SRM/TL',
				});
				return false;
			}

			if (rm.value == '0') {
				Swal.fire({
					icon: 'warning',
					title: 'Please select RM/DSE',
				});
				return false;
			}

			if (aprvr.value == '0') {
				Swal.fire({
					icon: 'warning',
					title: 'Please select APPROVER',
				});
				return false;
			}
			return true;
		}
	</script>
    <%-- For input Validation  --%>

    <%-- For reset form data  --%>
    <script>
		$(document).ready(function () {
			// Add event listener to the reset button
			$("#ContentPlaceHolder1_Reset_Data").click(function (event) {
				event.preventDefault(); // Prevent default behavior of the button
				Swal.fire({
					title: "Are you sure you want to reset the form?",
					icon: "warning",
					showCancelButton: true,
					confirmButtonColor: "#3085d6",
					cancelButtonColor: "#d33",
					confirmButtonText: "Yes, reset it!"
				}).then(function (result) {
					if (result.isConfirmed) {
						location.reload();
					}
				});
			});
		});
	</script>
    <%-- For reset form data  --%>

     <%-- for selected index change of the dropdown  --%>
    <script>
		var carExch = document.getElementById("ContentPlaceHolder1_Car_Exch");
		var exch = document.getElementById("ContentPlaceHolder1_Exch");

		carExch.addEventListener("change", function () {
			if (carExch.value === "N") {
				exch.value = "0";
				exch.disabled = true;
			} else {
				exch.value = "0";
				exch.disabled = false;
			}
		});

		var carExch1 = document.getElementById("ContentPlaceHolder1_Status");
		var exch1 = document.getElementById("ContentPlaceHolder1_Appr_Amt");

		carExch1.addEventListener("change", function () {
			if (carExch1.value === "Reject") {
				exch1.value = "0";
				exch1.disabled = true;
			} else {
				exch1.value = "0";
				exch1.disabled = false;
			}
		});
	</script>

     <%-- for selected index change of the dropdown  --%>

    <script>
		document.addEventListener('DOMContentLoaded', function () {
			var checkbox = document.getElementById("ContentPlaceHolder1_advance");
			var dropdown = document.getElementById("apr1");
			var label = document.getElementById("ContentPlaceHolder1_Label3");
			var label1 = document.getElementById("ContentPlaceHolder1_Label19");

			if (checkbox.checked) {
				dropdown.style.display = "block";
				label.style.display = "block";
				label1.textContent = "Approver 1";
			} else {
				dropdown.style.display = "none";
				label.style.display = "none";
				label1.textContent = "Approved By";
			}
        });

		function handleCheckbox() {
			var checkbox = document.getElementById("ContentPlaceHolder1_advance");
			var dropdown = document.getElementById("apr1");
			var label = document.getElementById("ContentPlaceHolder1_Label3");
			var label1 = document.getElementById("ContentPlaceHolder1_Label19");



			if (checkbox.checked) {
				dropdown.style.display = "block";
				label.style.display = "block";
				label1.textContent = "Approver1";

			} else {
				dropdown.style.display = "none";
				label.style.display = "none";
				label1.textContent = "Approved By";

			}
		}
	</script>

    <script>
        function compare_Input() {
            var appr_amt = document.getElementById('ContentPlaceHolder1_Appr_Amt').value;
            var disc_amt = document.getElementById('ContentPlaceHolder1_Discount_Amt').value;

            if (!appr_amt.endsWith(".00") && appr_amt != "") {
                document.getElementById("ContentPlaceHolder1_Appr_Amt").value = appr_amt + ".00";
            }

            var ap_amt = parseInt(document.getElementById('ContentPlaceHolder1_Appr_Amt').value);
            var di_amt = parseInt(document.getElementById('ContentPlaceHolder1_Discount_Amt').value);

            if (ap_amt > di_amt) {
                Swal.fire({
                    icon: 'warning',
                    title: 'Approved Amount Should be Lower Than Requested Amount',
                    text: '',
                }).then(function () {
                    var box = document.getElementById('ContentPlaceHolder1_Appr_Amt')
                    box.value = "";
                    box.style.border = '2px solid red';
                    box.focus();

                });
            }


        }
        document.getElementById('ContentPlaceHolder1_Appr_Amt').addEventListener("blur", compare_Input);
    </script>




</asp:Content>
