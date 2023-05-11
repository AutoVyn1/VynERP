<%@ Page Title="Billing - DSE Checklist" Language="vb" AutoEventWireup="false" MasterPageFile="~/AutovynModules/AUTOVYN.Master" CodeBehind="Pending_List.aspx.vb" Inherits="AutovynERP.Pending_List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <link rel="stylesheet" href="../JS/ListSelect/virtual-select.min.css" />
    <style>
        * {
            scrollbar-width: thin;
            scrollbar-color: #397524 #DFE9EB;
        }

            /* Chrome, Edge and Safari */
            *::-webkit-scrollbar {
                width: 7px;
                width: 7px;
            }

            *::-webkit-scrollbar-track {
                border-radius: 5px;
                background-color: #DFE9EB;
            }

                *::-webkit-scrollbar-track:hover {
                    background-color: #B8C0C2;
                }

                *::-webkit-scrollbar-track:active {
                    background-color: #B8C0C2;
                }

            *::-webkit-scrollbar-thumb {
                border-radius: 5px;
                background-color: #397524;
            }

                *::-webkit-scrollbar-thumb:hover {
                    background-color: #62A34B;
                }

                *::-webkit-scrollbar-thumb:active {
                    background-color: #62A34B;
                }

        * {
            margin: 0px;
            padding: 0;
        }


        body {
            font-size: 13px;
        }

        .main-section {
            margin-top: 60px;
            margin-bottom:40px;

        }

        .section-first {
            background-image: url("../Media/icmbg.svg");
            padding: 4px 9px;
            -webkit-box-shadow: -1px -4px 22px -8px rgb(0 0 0 / 75%);
            -moz-box-shadow: -1px -4px 22px -8px rgba(0, 0, 0, 0.75);
            box-shadow: -1px 10px 4px -9px rgb(0 0 0 / 56%);
            border-radius: 10px;
        }

        .section-grid {
            background-image: url("../Media/icmbg.svg");
            padding: 4px 9px;
            -webkit-box-shadow: -1px -4px 22px -8px rgb(0 0 0 / 75%);
            -moz-box-shadow: -1px -4px 22px -8px rgba(0, 0, 0, 0.75);
            box-shadow: -1px 10px 4px -9px rgb(0 0 0 / 56%);
            border-radius: 10px;
        }

        .heading {
            font-weight: 700;
            font-size: 25px;
        }


        #DtView {
            padding: 7px 21px !important;
            margin-top: 2px !important;
            background-color: #a7e2cb !important;
        }

        .Cust_Det {
            font-weight: 700;
            font-size: 18px;
            color: royalblue;
        }

        .Drop_down {
            width: 100%;
            padding: 5.5px 12px 7.68px;
            border-radius: 3px;
            border: 1px solid silver;
        }

        .disable {
            background-color: #edf4cc;
            cursor: not-allowed;
        }

        .alignment {
            text-align: right;
        }

        .dropify-wrapper {
            height: 80px !important;
        }

        .prevent-select {
            -webkit-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        .font-control {
            font-weight: 700;
            color: royalblue;
            height:32px;
            
        }
        * {
            font-size:13px;
        }
        .img-btn {
            width: 34px;
        }

        #myImg {
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
            display: block;
            margin-left: auto;
            margin-right: auto
        }

            #myImg:hover {
                opacity: 0.7;
            }

        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding-top: 100px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
        }

        /* Modal Content (image) */
        .modal-content {
            margin: auto;
            display: block;
            width: 75%;
            //max-width: 75%;
        }

        /* Caption of Modal Image */
        #caption {
            margin: auto;
            display: block;
            width: 80%;
            max-width: 700px;
            text-align: center;
            color: #ccc;
            padding: 10px 0;
            height: 150px;
        }

        /* Add Animation */
        .modal-content, #caption {
            -webkit-animation-name: zoom;
            -webkit-animation-duration: 0.6s;
            animation-name: zoom;
            animation-duration: 0.6s;
        }

        .out {
            animation-name: zoom-out;
            animation-duration: 0.6s;
        }

        @-webkit-keyframes zoom {
            from {
                -webkit-transform: scale(1)
            }

            to {
                -webkit-transform: scale(2)
            }
        }

        @keyframes zoom {
            from {
                transform: scale(0.4)
            }

            to {
                transform: scale(1)
            }
        }

        @keyframes zoom-out {
            from {
                transform: scale(1)
            }

            to {
                transform: scale(0)
            }
        }

        /* The Close Button */
        .close {
            position: absolute;
            top: 15px;
            right: 35px;
            color: #f1f1f1;
            font-size: 40px;
            font-weight: bold;
            transition: 0.3s;
        }

            .close:hover,
            .close:focus {
                color: #bbb;
                text-decoration: none;
                cursor: pointer;
            }


/*        .data-panel {
            height: 20vh;
        }
*/
        .button-sactions {
            display: flex;
            flex-direction: column;
            border-radius:10px;
        }

        .img-box {
            display: flex;
            justify-content: center;
            flex-direction: column;
            text-align: center;
            align-items: center;
            margin: 14px 5px;
        }

        .img-box {
            margin: 0;
        }

        .img-btn{
            width:30px;
        }


        .status-sec {
            display: flex;
            flex-direction: row;
        }

        .amt-box-sts{
            width:40%;
        }

        .bottom-sec{
            margin-bottom: 70px;
        }


        .sts_txt{
            width: 20%;
            font-weight:700;
            color:red;
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
                flex-direction: row;
                margin:10px 0;
                 border-radius:10px;
            }

            .img-box {
                margin: 14px 47px;
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

            .alignment {
                text-align: left;
            }
        }


        @media screen and (max-width:480px) {

            .button-sactions {
                display: flex;
                border-radius: 10px;
            }

            .img-box {
                margin: 14px 8px;
            }

            .section-first {
                width: 100%;
                margin: auto;
            }

            .bottombuttons {
                width: 30%;
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

            .alignment {
                text-align: left;
            }
        }

        .inv {
            border: none;
            width: 49px;
            background-color: #fff;
            height: 28px;
            border-radius: 4px 0px 0px 4px;
            padding-left: 5px;
        }

        .inv_no {
            margin-left: -5px;
            border: none;
            height: 28px;
            border-radius: 0px 4px 4px 0px;
        }


            .inv_no:focus {
                outline-width: 0;
            }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid main-section" style="-webkit-user-select: none; -ms-user-select: none; user-select: none;">
        <div class="row text-center">
            <span class="heading">DSE - BILLING CHECKLIST</span>
        </div>
        <div class="section-first">
            <div class="title">
            </div>
            <!-- row -->
            <div class="row mb-1 pt-2 amt-box">
                <asp:Label ID="Label1" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Label">DMS Inv. No.</asp:Label>
                <div class="col-lg-2 amt-box-total">
                    <asp:TextBox ID="inv" Enabled="false" CssClass="inv" runat="server"></asp:TextBox>
                    <asp:TextBox ID="dmsinvoice" CssClass="inv_no" runat="server"></asp:TextBox>
                </div>
                <div class="col-lg-1">
                    <asp:Button ID="DtView" runat="server" CssClass="viewDt btn btn-light" Style="background-color: #84c397; font-weight: 700; color: #fff;" Text="View" />
                </div>
                <asp:Label ID="Label2" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Label">DMS Cust Id.</asp:Label>
                <div class="col-lg-2 amt-box-total">
                    <asp:TextBox ID="custid" CssClass="form-control disable prevent-select" BackColor="#EDF4CC" runat="server" Enabled="false"></asp:TextBox>
                </div>

                <asp:Label ID="Label3" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="File No."></asp:Label>
                <div class="col-lg-2 amt-box-total">
                    <asp:TextBox ID="fileno" CssClass="form-control" Style="text-align: center;" runat="server"></asp:TextBox>
                </div>
                <asp:Label ID="Label4" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Date"></asp:Label>
                <div class="col-lg-1 amt-box-total">
                    <asp:TextBox ID="Inv_date" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox>
                </div>
            </div>
            <!-- row -->
        </div>


        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-11">
                    <!-- Pills navs -->
                    <ul class="nav nav-pills nav-fill mb-3" id="ex1" role="tablist">
                        <li class="nav-item" role="presentation">
                            <a
                                class="nav-link active"
                                id="ex2-tab-1"
                                data-mdb-toggle="pill"
                                href="#ex2-pills-1"
                                role="tab"
                                aria-controls="ex2-pills-1"
                                aria-selected="true">Customer & Vehicle Information</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a
                                class="nav-link"
                                id="ex2-tab-2"
                                data-mdb-toggle="pill"
                                href="#ex2-pills-2"
                                role="tab"
                                aria-controls="ex2-pills-2"
                                aria-selected="false">Cost & Offers</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a
                                class="nav-link"
                                id="ex2-tab-3"
                                data-mdb-toggle="pill"
                                href="#ex2-pills-3"
                                role="tab"
                                aria-controls="ex2-pills-3"
                                aria-selected="false">Document Upload</a>
                        </li>
                    </ul>
                    <!-- Pills navs -->

                    <!-- Pills content -->
                    <div class="tab-content" id="ex2-content">
                        <div
                            class="tab-pane fade show active"
                            id="ex2-pills-1"
                            role="tabpanel"
                            aria-labelledby="ex2-tab-1">
                            <!-- Section-Second -->
                            <div class="section-first mt-2">
                                <div class="row">
                                    <span class="Cust_Det">Customer Details</span>
                                </div>
                                <div class="row amt-box">
                                    <asp:Label ID="Label5" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Label">Cust Name</asp:Label>
                                    <div class="col-lg-5 amt-box-total">
                                        <asp:TextBox ID="Cust_name" CssClass="form-control disable prevent-select" Enabled="false" runat="server" BackColor="#EDF4CC"></asp:TextBox>
                                    </div>

                                    <asp:Label ID="Label6" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Address"></asp:Label>
                                    <div class="col-lg-5 amt-box-total">
                                        <asp:TextBox ID="Add" CssClass="form-control disable prevent-select" Enabled="false" BackColor="#EDF4CC" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row amt-box">
                                    <asp:Label ID="Label7" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Label">City</asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="City" CssClass="form-control disable prevent-select" Enabled="false" BackColor="#EDF4CC" runat="server"></asp:TextBox>
                                    </div>

                                    <asp:Label ID="Label8" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="State"></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="State" CssClass="form-control disable prevent-select" Enabled="false" BackColor="#EDF4CC" runat="server"></asp:TextBox>
                                    </div>

                                    <asp:Label ID="Label9" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Mobile"></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="Mob_no" CssClass="form-control disable prevent-select" Enabled="false" BackColor="#EDF4CC" runat="server"></asp:TextBox>
                                    </div>

                                    <asp:Label ID="Label10" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Email"></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="Email" CssClass="form-control" Style="text-align: center;" runat="server"></asp:TextBox>
                                    </div>

                                </div>

                                <div class="row amt-box">
                                    <asp:Label ID="Label11" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Label">Customer Type</asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:DropDownList ID="Cust_type" CssClass="Drop_down" runat="server">
                                            <asp:ListItem>Individual Customer</asp:ListItem>
                                            <asp:ListItem>CSD Customer</asp:ListItem>
                                            <asp:ListItem>BSF Customer</asp:ListItem>
                                            <asp:ListItem>CPC Customer</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                    <asp:Label ID="Label12" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Pin Code"></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="Pin_Code" CssClass="form-control disable prevent-select" Enabled="false" BackColor="#EDF4CC" runat="server"></asp:TextBox>
                                    </div>

                                    <asp:Label ID="Label13" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Pan Card"></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="Pan_No" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>

                                    <asp:Label ID="Label14" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="GST No."></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="Gst_no" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>

                                </div>


                            </div>
                            <!-- Section-Second -->


                            <!-- Section-Third -->
                            <div class="section-first mt-2">
                                <div class="row">
                                    <span class="Cust_Det">Chassis Details</span>
                                </div>
                                <div class="row amt-box-">
                                    <asp:Label ID="Label15" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Label">Veh. Group</asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="Veh_Grp" CssClass="form-control disable prevent-select" Enabled="false" BackColor="#EDF4CC" runat="server"></asp:TextBox>
                                    </div>

                                    <asp:Label ID="Label24" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Label">Veh. Code</asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="Veh_Code" CssClass="form-control disable prevent-select" Enabled="false" BackColor="#EDF4CC" runat="server"></asp:TextBox>
                                    </div>


                                    <asp:Label ID="Label16" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Color"></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="Color" CssClass="form-control disable prevent-select" Enabled="false" BackColor="#EDF4CC" runat="server"></asp:TextBox>
                                    </div>
                                    <asp:Label ID="Label17" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Label">VIN</asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="Vin" CssClass="form-control disable prevent-select" Enabled="false" BackColor="#EDF4CC" runat="server"></asp:TextBox>
                                    </div>

                                </div>

                                <div class="row">
                                    <asp:Label ID="Label20" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="DMS - DSE"></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="Dms_Dse" CssClass="form-control disable prevent-select" Enabled="false" BackColor="#EDF4CC" runat="server"></asp:TextBox>
                                    </div>

                                    <asp:Label ID="Label21" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Label">ERP DSE</asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:DropDownList ID="Erp_Dse" runat="server" data-silent-initial-value-set="true" name="native-select" data-search="true"></asp:DropDownList>
                                    </div>

                                    <asp:Label ID="Label18" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Chassis No."></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="Chas_no" CssClass="form-control disable prevent-select" Enabled="false" BackColor="#EDF4CC" runat="server"></asp:TextBox>
                                    </div>
                                    <asp:Label ID="Label19" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Engine No."></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="Engn_no" CssClass="form-control disable prevent-select" Enabled="false" BackColor="#EDF4CC" runat="server"></asp:TextBox>
                                    </div>

                                </div>

                                <div class="row">
                                    <asp:Label ID="Label22" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="DSE TL"></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="Dse_TL" CssClass="form-control disable prevent-select" Enabled="false" BackColor="#EDF4CC" runat="server"></asp:TextBox>
                                    </div>


                                    <asp:Label ID="Label23" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="ERP TL"></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:DropDownList ID="Erp_TL" runat="server" data-silent-initial-value-set="true" name="native-select" data-search="true"></asp:DropDownList>
                                    </div>

                                    <asp:Label ID="Label34" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Loan Type"></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:DropDownList ID="Loan_type" runat="server" data-silent-initial-value-set="true" name="native-select" data-search="true"></asp:DropDownList>
                                    </div>

                                </div>


                            </div>
                            <!-- Section-Third -->

                        </div>
                        <div
                            class="tab-pane fade"
                            id="ex2-pills-2"
                            role="tabpanel"
                            aria-labelledby="ex2-tab-2">
                            <div class="section-first mt-2">
                                <div class="row">
                                    <span class="Cust_Det">Chassis Details</span>
                                </div>
                                <div class="row amt-box">
                                    <asp:Label ID="Label25" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Label">Ex - Showroom</asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="Ex_Pric" CssClass="form-control alignment" BackColor="#EDF4CC" Enabled="false" runat="server"></asp:TextBox>
                                    </div>

                                    <asp:Label ID="Label26" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Label">MI. Policy Date</asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="Mi_Date" CssClass="form-control" BackColor="#EDF4CC" runat="server"></asp:TextBox>
                                    </div>
                                    <asp:Label ID="Label33" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Label">CCP Charges</asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="CCp_Chrg" CssClass="form-control alignment" runat="server"></asp:TextBox>
                                    </div>

                                    <asp:Label ID="Label39" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Label">FastTag Chrg</asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="FastTag_Chrg" CssClass="form-control alignment" BackColor="#EDF4CC" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row amt-box">
                                    <asp:Label ID="Label27" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Label">Insu. Type</asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:DropDownList ID="Insu_type" CssClass="Drop_down" runat="server">
                                            <asp:ListItem>Zero Dep.</asp:ListItem>
                                            <asp:ListItem>Normal</asp:ListItem>
                                            <asp:ListItem>Commercial</asp:ListItem>
                                            <asp:ListItem>Zero Dep. NCB</asp:ListItem>
                                            <asp:ListItem>Normal NCB</asp:ListItem>
                                            <asp:ListItem>None</asp:ListItem>
                                            <asp:ListItem>LTCP</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                    <asp:Label ID="Label28" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Label">Insu. Amount</asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="Insu_amt" CssClass="form-control alignment" BackColor="#EDF4CC" runat="server"></asp:TextBox>
                                    </div>
                                    <asp:Label ID="Label35" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Label">MGA</asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:DropDownList ID="Mga" CssClass="Drop_down" runat="server">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem>No</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                    <asp:Label ID="Label36" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Label">MGA Amount</asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="Mga_Amt" CssClass="form-control alignment" runat="server"></asp:TextBox>
                                    </div>


                                </div>

                                <div class="row amt-box">
                                    <asp:Label ID="Label29" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Label">EW Type</asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:DropDownList ID="EW_type" CssClass="Drop_down" runat="server">
                                            <asp:ListItem>Platinum (4th) Yr</asp:ListItem>
                                            <asp:ListItem>Gold (3rd) Yr</asp:ListItem>
                                            <asp:ListItem>Royal Platinum (5th) Yr</asp:ListItem>
                                            <asp:ListItem>RANA EW Royal Platinum</asp:ListItem>
                                            <asp:ListItem>None</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                    <asp:Label ID="Label30" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Label">EW Amount</asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="Ew_Amt" CssClass="form-control alignment" BackColor="#EDF4CC" runat="server"></asp:TextBox>
                                    </div>
                                    <asp:Label ID="Label37" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Label">NEXA(Card)</asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:DropDownList ID="Nexa_Card" CssClass="Drop_down" runat="server">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem>No</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                    <asp:Label ID="Label38" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Label">RC Card Chrg</asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="Rc_Card_Chrg" CssClass="form-control alignment" BackColor="#EDF4CC" runat="server"></asp:TextBox>
                                    </div>

                                </div>
                                <div class="row amt-box">
                                    <asp:Label ID="Label31" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Label">RTO Type</asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:DropDownList ID="Rto_Type" CssClass="Drop_down" runat="server">
                                            <asp:ListItem>Permanent</asp:ListItem>
                                            <asp:ListItem>Temporary</asp:ListItem>
                                            <asp:ListItem>Commercial</asp:ListItem>
                                            <asp:ListItem>RTO + TRC (Both)</asp:ListItem>
                                            <asp:ListItem>None</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                    <asp:Label ID="Label32" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Label">RTO (Perma.)</asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="Rto_Chrg" CssClass="form-control alignment" BackColor="#EDF4CC" runat="server"></asp:TextBox>
                                    </div>

                                    <asp:Label ID="Label40" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Label">Other Chrg</asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="Oth_Chrg" CssClass="form-control alignment" BackColor="#EDF4CC" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="section-first mt-2">
                                <div class="row">
                                    <span class="Cust_Det">Discount</span>
                                </div>
                                <div class="row amt-box">
                                    <asp:Label ID="Label41" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Label">Consumer Offer</asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="Cons_Disc" CssClass="form-control alignment" BackColor="#EDF4CC" Enabled="false" runat="server"></asp:TextBox>
                                    </div>

                                    <asp:Label ID="Label42" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Label">Exchnage Offer</asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="Exch_Disc" CssClass="form-control alignment" BackColor="#EDF4CC" Enabled="false" runat="server"></asp:TextBox>
                                    </div>

                                    <asp:Label ID="Label43" CssClass="col-lg-1 col-form-label alignment amt-box-lbl" runat="server" Text="Label">Corporate</asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="Corp_Disc" CssClass="form-control alignment " BackColor="#EDF4CC" Enabled="false" runat="server"></asp:TextBox>
                                    </div>

                                    <asp:Label ID="Label44" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Label">Post Sale Disc.</asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="Post_Disc" CssClass="form-control alignment" BackColor="#00ff99" ForeColor="White" runat="server" Text="0.00"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="section-first mt-2">
                                <div class="row amt-box">
                                    <div class="col-lg-8">
                                        <span class="Cust_Det">Receipt Details</span>
                                    </div>
                                    <div class="col-lg-4 text-center">
                                        <button class="col-lg-5 show_bal" id="Ledg_Name" runat="server">Show Ledger Balance</button>
                                        <button class="col-lg-5 show_bal" id="Show_Bal" type="button" runat="server" style="display: none;" text="">
                                            <asp:Label ID="Balance" runat="server" Text="" Style="font-size: 14px;"></asp:Label>
                                        </button>
                                    </div>
                                </div>
                                <div class="row">
                                    <asp:Panel ID="panel2" runat="server"  ScrollBars="Vertical" CssClass="data-panel">
                                        <asp:GridView ID="Rect_Grid" runat="server" CssClass="" Style="top: 0px; border: 1px solid #6fd472; text-align: center; border-collapse: inherit; background-color: hsla(40deg, 4%, 36%, 0.25); position: relative; width: 100%; table-layout: auto;"
                                            ShowHeaderWhenEmpty="True" CellPadding="3" GridLines="both" PageSize="7" AllowPaging="True" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1">
                                            <FooterStyle BackColor="#a7e2cb" ForeColor="Black" />
                                            <HeaderStyle Font-Bold="True" ForeColor="#000" CssClass="text-center" BackColor="#e2ed91" Height="31px" Width="100%" />
                                            <RowStyle BackColor="#ecf6ff" ForeColor="Black" />
                                            <AlternatingRowStyle BackColor="#ceff99" />
                                            <SelectedRowStyle Font-Bold="True" ForeColor="White" BackColor="#9471DE" />
                                            <PagerSettings FirstPageText="1" LastPageText="last" NextPageText="next" PreviousPageText="previous" />
                                            <PagerStyle ForeColor="Black" HorizontalAlign="center" BackColor="#e2ed91" />
                                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                            <SortedAscendingHeaderStyle BackColor="#594B9C" />
                                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                            <SortedDescendingHeaderStyle BackColor="#33276A" />
                                        </asp:GridView>
                                    </asp:Panel>
                                </div>
                            </div>

                        </div>
                        <div class="tab-pane fade" id="ex2-pills-3" role="tabpanel" aria-labelledby="ex2-tab-3">
                            <div class="section-first mt-2">
                                <div class="row">
                                    <div class="col-lg-2">
                                        <asp:Label ID="Label45" CssClass="col-lg-2 col-form-label font-control" runat="server" Text="Label">Pan Card</asp:Label>
                                        <asp:FileUpload ID="Pan_upload" CssClass="dropify" runat="server" accept=".jpg,.png,.pdf,.jpeg" />
                                    </div>
                                    <div class="col-lg-2">
                                        <asp:Label ID="Label46" CssClass="col-lg-2 col-form-label font-control" runat="server" Text="Label">Aadhar Card</asp:Label>
                                        <asp:FileUpload ID="Aadh_upload" CssClass="dropify" runat="server" accept=".jpg,.png,.pdf,.jpeg" />
                                    </div>
                                    <div class="col-lg-2">
                                        <asp:Label ID="Label47" CssClass="col-lg-2 col-form-label font-control" runat="server" Text="Label">Corporate Doc 1</asp:Label>
                                        <asp:FileUpload ID="Corp_1" CssClass="dropify" runat="server" accept=".jpg,.png,.pdf,.jpeg" />
                                    </div>
                                    <div class="col-lg-2">
                                        <asp:Label ID="Label48" CssClass="col-lg-2 col-form-label font-control" runat="server" Text="Label">Corporate Doc 2</asp:Label>
                                        <asp:FileUpload ID="Corp_2" CssClass="dropify" runat="server" accept=".jpg,.png,.pdf,.jpeg" />
                                    </div>
                                    <div class="col-lg-1">
                                        &nbsp;
                                    </div>
                                    <div class="img-box text-center col-lg-1">
                                        <asp:ImageButton ID="save_Doc" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/cloud-computing.png" Width="40" /><br />
                                        <asp:Label ID="Label124" CssClass="col-form-label img-lbl" runat="server" Text="Upload"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-2">
                                        <asp:Label ID="Label49" CssClass="col-lg-2 col-form-label font-control" runat="server" Text="Label">Finance Delv Order</asp:Label>
                                        <asp:FileUpload ID="Fin_upload" CssClass="dropify" runat="server" accept=".jpg,.png,.pdf,.jpeg" />
                                    </div>
                                    <div class="col-lg-2">
                                        <asp:Label ID="Label50" CssClass="col-lg-2 col-form-label font-control" runat="server" Text="Label">Sale Covering Later</asp:Label>
                                        <asp:FileUpload ID="Sal_upload" CssClass="dropify" runat="server" accept=".jpg,.png,.pdf,.jpeg" />
                                    </div>
                                    <div class="col-lg-2">
                                        <asp:Label ID="Label51" CssClass="col-lg-2 col-form-label font-control" runat="server" Text="Label">Exchnage Doc 1</asp:Label>
                                        <asp:FileUpload ID="Exch_1" CssClass="dropify" runat="server" accept=".jpg,.png,.pdf,.jpeg" />
                                    </div>
                                    <div class="col-lg-2">
                                        <asp:Label ID="Label52" CssClass="col-lg-2 col-form-label font-control" runat="server" Text="Label">Exchnage Doc 2</asp:Label>
                                        <asp:FileUpload ID="Exch_2" CssClass="dropify" runat="server" accept=".jpg,.png,.pdf,.jpeg" />
                                    </div>
                                    <div class="col-lg-1">
                                        &nbsp;
                                    </div>
                                    <div class="col-lg-3">
                                        <asp:Label ID="label" runat="server" ForeColor="Red" Text="Note : Drag & Drop Document, Then Click Upload Icon"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="section-grid mt-2">
                                <div class="row">
                                    <span class="Cust_Det">Document Details</span>
                                </div>
                                <div class="row">
                                    <asp:Panel ID="panel" runat="server" ScrollBars="Vertical" CssClass="data-panel">
                                        <asp:GridView ID="Doc_Grid" runat="server" CssClass="" Style="top: 0px; border: 1px solid #6fd472; text-align: center; border-collapse: inherit; background-color: hsla(40deg, 4%, 36%, 0.25); position: relative; width: 100%; table-layout: auto;"
                                            ShowHeaderWhenEmpty="True" CellPadding="3" GridLines="both" PageSize="7" AllowPaging="True" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1">
                                            <Columns>
                                                <asp:BoundField HeaderText="Remove" DataField="Remove" Visible="false" />
                                                 <asp:CommandField ShowSelectButton="True" HeaderText="Remove" ButtonType="Image" SelectImageUrl="~/AutovynModules/Media/Delete.png" SelectText="Remove">
                                                        <ControlStyle Width="20px" />
                                                        <ItemStyle HorizontalAlign="center" CssClass="ms-3" VerticalAlign="Middle" Width="80px" />
                                                    </asp:CommandField>
                                            </Columns>
                                            <FooterStyle BackColor="#a7e2cb" ForeColor="Black" />
                                            <HeaderStyle Font-Bold="True" ForeColor="#000" CssClass="text-center" BackColor="#e2ed91" Height="31px" Width="100%" />
                                            <RowStyle BackColor="#ecf6ff" ForeColor="Black" />
                                            <AlternatingRowStyle BackColor="#ceff99" />
                                            <SelectedRowStyle Font-Bold="True" ForeColor="White" BackColor="#9471DE" />
                                            <PagerSettings FirstPageText="1" LastPageText="last" NextPageText="next" PreviousPageText="previous" />
                                            <PagerStyle ForeColor="Black" HorizontalAlign="center" BackColor="#e2ed91" />
                                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                            <SortedAscendingHeaderStyle BackColor="#594B9C" />
                                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                            <SortedDescendingHeaderStyle BackColor="#33276A" />
                                        </asp:GridView>
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Pills content -->
                <div class="col-lg-1 button-sactions mt-2" style="background-color: #a7e2cb;">
                    <div class="img-box">
                        <asp:ImageButton ID="Save_data" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Save.png" />
                        <asp:Label ID="Label53" CssClass="col-form-label img-lbl" runat="server" Text="Save"></asp:Label>
                    </div>
                    <div class="img-box">
                        <asp:ImageButton ID="Update_data" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Update.png" />
                        <asp:Label ID="Label231" CssClass="col-form-label img-lbl" runat="server" Text="Update"></asp:Label>
                    </div>

                    <div class="img-box">
                        <asp:ImageButton ID="Reset_Data" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Reset.png" />
                        <asp:Label ID="Label232" CssClass="col-form-label img-lbl" runat="server" Text="Reset"></asp:Label>
                    </div>

                    <div class="img-box">
                        <asp:ImageButton ID="Go_Branch" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Branch_icon.png" />
                        <asp:Label ID="Label233" CssClass="col-form-label img-lbl" runat="server" Text="Branch"></asp:Label>
                    </div>

                    <div class="img-box">
                        <asp:ImageButton ID="Exit_Form" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Exit.png" />
                        <asp:Label ID="Label234" CssClass="col-form-label img-lbl" runat="server" Text="Exit"></asp:Label>
                    </div>

                    <div class="img-box">
                        <asp:ImageButton ID="Print_data" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Print.png" />
                        <asp:Label ID="Label235" CssClass="col-form-label img-lbl" runat="server" Text="Print"></asp:Label>
                    </div>
                </div>
            </div>
        </div>

        <div class="section-first mt-1 bottom-sec">
            <div class="row">
                <div class="col-lg-12">

                    <div class="row">
                        <div class="col-lg-12">
                            <asp:Label ID="Label54" CssClass="Cust_Det col-lg-1 col-form-label" runat="server" Text="Vehicle Status"></asp:Label>
                        </div>
                    </div>

                    <div class="row sts-box">
                        <div class="col-lg-4 d-flex">
                            <asp:Label ID="Label58" CssClass="sts_txt col-lg-3 col-form-label" runat="server" Text="Invoice No. : "></asp:Label>
                            <div class=" amt-box-sts mt-2">
                                <asp:Label ID="Inv_no" CssClass="sts_txt col-lg-1 col-form-label" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="col-lg-3 d-flex">
                            <asp:Label ID="Label57" CssClass="sts_txt col-lg-1 col-form-label" runat="server" Text="Status : "></asp:Label>

                            <div class="amt-box-sts mt-2">
                                <asp:Label ID="veh_sts" CssClass="sts_txt col-lg-1 col-form-label" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="col-lg-5 d-flex">
                            <div class="amt-box-sts mt-2">
                                <asp:Label ID="Open_only" CssClass="sts_txt col-lg-1 col-form-label" runat="server" Text=""></asp:Label>
                            </div>
                        </div>

                        <div class="col-lg-5 d-flex">
                            <div class="amt-box-sts mt-2">
                                <asp:Label ID="Label55" CssClass="sts_txt col-lg-1 col-form-label" runat="server" Text=""></asp:Label>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>



    </div>
    <!-- InputMask -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/inputmask/inputmask.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/inputmask/inputmask.date.extensions.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/inputmask/inputmask.extensions.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/css/inputmask.css" />
    <%-- dropify --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://jeremyfagis.github.io/dropify/dist/js/dropify.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://jeremyfagis.github.io/dropify/dist/css/dropify.min.css" />
    <%-- dropify --%>
    <script src="../JS/ListSelect/virtual-select.min.js" type="text/javascript"></script>

    <%--    <script>
        const number1 = document.getElementById("dmsinvoice");
        const btn = document.getElementById("DtView");
        number1.addEventListener("keyup", updateSum);
        btn.style.display = "None"
        function updateSum() {
            if (number1 = "") {
                btn.style.display = "Block"
            }
            else {
                btn.style.display = "None"
            }
        }
    </script>--%>
<%--    <script>
        $(function () {
            var inputmask = new Inputmask("99/99/99", { placeholder: 'dd/MM/yy' });
            inputmask.mask($('[id*=Inv_date]'));
        });
    </script>--%>

    <script>
        $(document).ready(function () {
            $("#ContentPlaceHolder1_Ledg_Name").click(function (event) {
                event.preventDefault();
                $("#ContentPlaceHolder1_Ledg_Name").toggle();
                $("#ContentPlaceHolder1_Show_Bal").toggle();
            });

            $("#ContentPlaceHolder1_Show_Bal").keyup(function () {
                $("#ContentPlaceHolder1_Ledg_Name").toggle();
                $("#ContentPlaceHolder1_Show_Bal").toggle();
                return false;
            });
        });

    </script>

    <script>
        $('.dropify').dropify();
        VirtualSelect.init({
            ele: '#ContentPlaceHolder1_Erp_TL'
        });
        VirtualSelect.init({
            ele: '#ContentPlaceHolder1_Loan_type'
        });
        VirtualSelect.init({
            ele: '#ContentPlaceHolder1_Erp_Dse'
        });
    </script>

<%--    <script>
        // Get the modal
        var modal = document.getElementById('myModal');

        // Get the image and insert it inside the modal - use its "alt" text as a caption
        var img = '<%=Session("image")%>';
        var modalImg = document.getElementById("img01");
        var captionText = document.getElementById("caption");
        img.onclick = function () {
            modal.style.display = "block";
            modalImg.src = this.src;
            modalImg.alt = this.alt;
            captionText.innerHTML = this.alt;
        }


        // When the user clicks on <span> (x), close the modal
        modal.onclick = function () {
            img01.className += " out";
            setTimeout(function () {
                modal.style.display = "none";
                img01.className = "modal-content";
            }, 400);

        }
    </script>--%>
</asp:Content>