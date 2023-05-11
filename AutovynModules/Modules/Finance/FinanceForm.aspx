<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AutovynModules/AUTOVYN.Master" CodeBehind="FinanceForm.aspx.vb" Inherits="AutovynERP.FinanceForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <!-- Virtual Select -->
 <!-- Virtual Select -->
    <link rel="stylesheet" href="../../JS/ListSelect/virtual-select.min.css" />

    <style>
        * {
            margin: 0;
            padding: 0;
            font-size: 13px;
            font-family: 'Dosis', sans-serif;
        }

        body {
            font-family: sans-serif;
        }


        .main-section {
            margin-top: 50px;
        }

        .title {
            text-align: center;
            height: 50px;
        }

            .title span {
                text-align: center;
                font-weight: 700;
                font-size: 22px;
                text-transform: uppercase;
            }

        .section-first {
            background-image: url("../../Media/icmbg.svg");
            padding: 4px 9px;
            -webkit-box-shadow: -1px -4px 22px -8px rgb(0 0 0 / 75%);
            -moz-box-shadow: -1px -4px 22px -8px rgba(0, 0, 0, 0.75);
            box-shadow: -1px 10px 4px -9px rgb(0 0 0 / 56%);
            border-radius: 10px;
        }

        .section-second {
            display: flex;
            justify-content: space-around;
            flex-direction: column;
            width: 100%;
            background-image: url("../../Media/icmbg.svg");
            padding: 4px 9px;
            -webkit-box-shadow: -1px -4px 22px -8px rgb(0 0 0 / 75%);
            -moz-box-shadow: -1px -4px 22px -8px rgba(0, 0, 0, 0.75);
            box-shadow: -1px 10px 4px -9px rgb(0 0 0 / 56%);
            border-radius: 10px;
        }

        .section-thrid {
            display: flex;
            justify-content: space-around;
            flex-direction: column;
            width: 100%;
            background-image: url("../../Media/icmbg.svg");
            padding: 15px 9px;
            -webkit-box-shadow: -1px -4px 22px -8px rgb(0 0 0 / 75%);
            -moz-box-shadow: -1px -4px 22px -8px rgba(0, 0, 0, 0.75);
            box-shadow: -1px 10px 4px -9px rgb(0 0 0 / 56%);
            border-radius: 10px;
        }

        .fin-team {
            font-size: 18px;
            font-weight: 700;
            color: #0568d5;
        }

        .buttons {
            text-align: center;
        }

        .bottombuttons {
            background: #529352e3;
            border: none;
            border-radius: 5px;
            color: white;
            margin: 10px 0px;
            width: 30%;
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

        .img-box{
            display: flex;
            justify-content: center;
            flex-direction: column;
            text-align: center;
            align-items:center;
            margin:14px 26px;
        }

        .img-btn{
            width:30px;
            height:30px;
        }

        .img-lbl {
            font-size: 11px;
            font-weight: 900;
            margin: 0;
            padding: 0;
        }

      

        .select2-container--default .select2-selection--single {
            background-image: linear-gradient(to right, #d4d4d4 0%, #878888 100%);
            border: 1px solid #aaa;
            border-radius: 4px;
            height: 32px !important;
        }

        .disable {
            background-color: #edf4cc;
            cursor: not-allowed;
        }

        .img-btn {
            width: 30px;
            height: 30px;
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
                margin-bottom:70px;
                margin-top:10px;
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

            .inv-field-lbl{
                width:30%;
            }

            .inv-field-total{
                width:60%;
            }

            .inv-field-btn{
                width: 10%;
                padding-left:17px;
            }
        
        }

         @media screen and (max-width:480px) {

            .bottombuttons {
                width: 30%;
            }

            .button-sactions {
                display: flex;
                margin-bottom:0px;
                margin-top:10px;
                border-radius:10px;
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

            .inv-field-lbl{
                width:26%;
                padding-left:0px !important;
            }

            .inv-field-total{
                width:54.4%;
            }

            .inv-field-btn{
                width: 10%;
                padding-left:0px;
            }

        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid main-section">
        <div class="section-first">
            <div class="title">
                <span>Finance Approval</span>
            </div>
            <!-- row -->
            <div class="row mt-2 amt-box">
                    <asp:Label ID="Label1" CssClass="col-lg-1 col-form-label inv-field-lbl" runat="server" Text="Label">DMS Inv No.</asp:Label>
                    <div class="col-lg-2 inv-field-total">
                        <asp:TextBox ID="dmsinvoice" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-lg-1 inv-field-btn">
                        <asp:ImageButton ID="Dt_View" ImageUrl="~/AutovynModules/Media/icons8-search-64.png" runat="server" Width="25" />
                    </div>
                <asp:Label ID="Label2" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Label">Cust Id.</asp:Label>
                <div class="col-lg-2 amt-box-total">
                    <asp:TextBox ID="custid" CssClass="form-control disable" BackColor="#EDF4CC" Enabled="false" runat="server"></asp:TextBox>
                </div>

                <asp:Label ID="Label3" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="File No."></asp:Label>
                <div class="col-lg-2 amt-box-total">
                    <asp:TextBox ID="fileno" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <asp:Label ID="Label4" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Date"></asp:Label>
                <div class="col-lg-1 amt-box-total">
                    <asp:TextBox ID="date1" CssClass="form-control" BackColor="#EDF4CC" ToolTip="Don't Editable" runat="server" Enabled="False"></asp:TextBox>
                </div>
            </div>
            <!-- row -->

            <!-- row -->
            <div class="row amt-box">
                <asp:Label ID="Label5" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Cust Name"></asp:Label>
                <div class="col-lg-3 amt-box-total">
                    <asp:TextBox ID="name" CssClass="form-control disable" BackColor="#EDF4CC" ToolTip="Don't Editable" runat="server" Enabled="False"></asp:TextBox>
                </div>
                <asp:Label ID="label" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Mobile"></asp:Label>
                <div class="col-lg-2 amt-box-total">
                    <asp:TextBox ID="Mobile" CssClass="form-control disable" BackColor="#EDF4CC" ToolTip="Don't Editable" runat="server" Enabled="False"></asp:TextBox>
                </div>
            </div>
            <!-- row -->
        </div>

        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-11">
                    <%-- section 2 --%>
                    <div class="section-second mt-2">
                        <div class="row amt-box">
                            <div class="col-12">
                                <!-- row -->
                                <div class="row">
                                    <asp:Label ID="Label6" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Chass No."></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="chas_no" Enabled="false" BackColor="#EDF4CC" runat="server" ToolTip="Don't Editable" CssClass="form-control disable"></asp:TextBox>
                                    </div>
                                    <asp:Label ID="Label7" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Engine No."></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="engine" CssClass="form-control disable" runat="server" BackColor="#EDF4CC" ToolTip="Don't Editable" Enabled="False"></asp:TextBox>
                                    </div>
                                    <asp:Label ID="Label8" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="VIN"></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="vin" CssClass="form-control disable" runat="server" BackColor="#EDF4CC" ToolTip="Don't Editable" Enabled="False"></asp:TextBox>
                                    </div>
                                    <asp:Label ID="Label11" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Color"></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                       <asp:TextBox ID="colors" runat="server" BackColor="#EDF4CC" CssClass="form-control disable" ToolTip="Don't Editable" Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                                <!-- row -->

                                <!-- row -->
                                <div class="row">
                                    <asp:Label ID="Label9" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Veh Group"></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="veh_grp" runat="server" BackColor="#EDF4CC" CssClass="form-control disable" ToolTip="Don't Editable" Enabled="false"></asp:TextBox>
                                    </div>
                                    <asp:Label ID="Label10" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Veh Code"></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="veh_Modl" runat="server" BackColor="#EDF4CC" CssClass="form-control disable" ToolTip="Don't Editable" Enabled="false"></asp:TextBox>
                                    </div>
                                    <asp:Label ID="Label12" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="DMS DSE"></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="dmsdse" runat="server" BackColor="#EDF4CC" CssClass="form-control disable" ToolTip="Don't Editable" Enabled="false"></asp:TextBox>
                                    </div>
                                    <asp:Label ID="Label13" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="DMS TL"></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="dsetl" runat="server" BackColor="#EDF4CC" CssClass="form-control disable" ToolTip="Don't Editable" Enabled="false"></asp:TextBox>
                                    </div>

                                </div>
                                <!-- row -->



                                <!-- row -->
                                <div class="row ">
                                    <asp:Label ID="Label20" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="ERP DSE"></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="erp_dse" runat="server" BackColor="#EDF4CC" CssClass="form-control disable" ToolTip="Don't Editable" Enabled="false"></asp:TextBox>
                                    </div>
                                    <asp:Label ID="Label21" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="ERP TL"></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="erp_tl" runat="server" BackColor="#EDF4CC" CssClass="form-control disable" ToolTip="Don't Editable" Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                                <!-- row -->
                            </div>
                        </div>
                    </div>
                    <%-- section 2 --%>
                    <div class="section-second mt-2">
                        <div class="row g-3">
                            <div class="col-12">
                                <!-- row -->
                                <div class="row amt-box ">
                                    <asp:Label ID="Label14" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Financier"></asp:Label>
                                    <div class="col-lg-5 amt-box-total">
                                        <asp:TextBox ID="financie" BackColor="#EDF4CC" runat="server" CssClass="form-control disable" ToolTip="Don't Editable" Enabled="false"></asp:TextBox>
                                    </div>

                                    <asp:Label ID="Label17" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Loan Type"></asp:Label>
                                    <div class="col-lg-5 amt-box-total">
                                        <asp:TextBox ID="Loan_Type" BackColor="#EDF4CC" runat="server" CssClass="form-control disable" ToolTip="Don't Editable" Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                                <!-- row -->

                                <!-- row -->
                                <div class="row amt-box">
                                    <asp:Label ID="Label18" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Fin DO No."></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="findono" CssClass="form-control" MaxLength="25" BackColor="#EDF4CC" Enabled="false" runat="server"></asp:TextBox>
                                    </div>

                                    <asp:Label ID="Label16" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Fin DO Amt"></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="findoamt" CssClass="form-control disable" BackColor="#EDF4CC" ToolTip="Don't Editable" runat="server" Enabled="false" ValidateRequestMode="Enabled"></asp:TextBox>
                                    </div>

                                    <asp:Label ID="Label19" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="PF Chrgs"></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="finchrgs" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>

                                    <asp:Label ID="Label15" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Branch"></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:DropDownList ID="branches" selectionmode="multiple" data-silent-initial-value-set="true" name="native-select" data-search="true" Style="cursor: pointer;" runat="server" ValidateRequestMode="Enabled"></asp:DropDownList>
                                    </div>
                                </div>
                                <!-- row -->
                            </div>
                        </div>
                    </div>

                    <%-- section 3 --%>
                    <div class="section-second mt-2">
                        <div class="row g-3">
                            <div class="col-md-12">
                                <label for="inputEmail4" class="form-label fin-team">Fill by finance team</label>
                            </div>
                            <div class="col-12 section-second-half">
                                <!-- row -->
                                <div class="row amt-box">
                                    <asp:Label ID="Label22" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Payout%age"></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="payoutage" CssClass="form-control" class="doublebox" AutoPostBack="true" runat="server"></asp:TextBox>
                                    </div>
                                    <asp:Label ID="Label23" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Fin Payout"></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="finpayout" CssClass="form-control" class="doublebox" runat="server"></asp:TextBox>
                                    </div>
                                    <asp:Label ID="Label24" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="GST Amt"></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="gst" CssClass="form-control" runat="server" class="doublebox"></asp:TextBox>
                                    </div>
                                    <asp:Label ID="Label25" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Total Payout"></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="totoalfin" CssClass="form-control" runat="server" class="doublebox"></asp:TextBox>
                                    </div>
                                </div>
                                <!-- row -->

                                <!-- row -->
                                <div class="row amt-box ">
                                    <asp:Label ID="Label26" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Interest Rate"></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="interest" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <asp:Label ID="Label27" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Recvd. Amt"></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="received" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>

                                    <asp:Label ID="Label28" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Date"></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="date2" CssClass="form-control" MaxLength="10" placeholder="MM/DD/YYYY" Enabled="false" onblur="(this.type='text')" runat="server" class="doublebox"></asp:TextBox>
                                    </div>

                                    <asp:Label ID="Label29" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="No of EMI"></asp:Label>
                                    <div class="col-lg-2 amt-box-total">
                                        <asp:TextBox ID="emi" CssClass="form-control" runat="server" class="doublebox"></asp:TextBox>
                                    </div>
                                </div>
                                <!-- row -->

                                <!-- row -->
                                <div class="row amt-box ">
                                    <asp:Label ID="Label30" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Bank Name"></asp:Label>
                                    <div class="col-lg-5 amt-box-total">
                                        <asp:TextBox ID="bankname" CssClass="form-control" runat="server" class="singlebox"></asp:TextBox>
                                    </div>

                                    <asp:Label ID="Label35" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Account No."></asp:Label>
                                    <div class="col-lg-5 amt-box-total">
                                        <asp:TextBox ID="accountno" CssClass="form-control" runat="server" class="singlebox"></asp:TextBox>
                                    </div>
                                </div>
                                <!-- row -->

                                <!-- row -->
                                <div class="row amt-box ">
                                    <asp:Label ID="Label32" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Loan Status"></asp:Label>
                                    <div class="col-lg-5 amt-box-total">
                                        <asp:DropDownList ID="loan_status" CssClass="form-control" runat="server" class="singlebox">
                                            <asp:ListItem Value="0">Pending</asp:ListItem>
                                            <asp:ListItem Value="1">Approved</asp:ListItem>
                                            <asp:ListItem Value="2">Rejected</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <asp:Label ID="Label33" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Credit Ref."></asp:Label>
                                    <div class="col-lg-5 amt-box-total">
                                        <asp:TextBox ID="credit" CssClass="form-control" runat="server" class="singlebox"></asp:TextBox>
                                    </div>
                                </div>
                                <!-- row -->

                                <!-- row -->
                                <div class="row amt-box">
                                    <asp:Label ID="Label34" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Remark"></asp:Label>
                                    <div class="col-lg-11 amt-box-total">
                                        <asp:TextBox ID="Remark" CssClass="form-control" runat="server" class="singlebox1"></asp:TextBox>
                                    </div>
                                </div>
                                <!-- row -->


                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-1 button-sactions" style="background-color: #a7e2cb;">
                    <div class="img-box">
                        <asp:ImageButton ID="save_data" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Save.png" />
                        <asp:Label ID="Label124" CssClass="col-form-label img-lbl" runat="server" Text="Save"></asp:Label>
                    </div>

                    <div class="img-box">
                        <asp:ImageButton ID="Data_Update" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Update.png" />
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
                        <asp:ImageButton ID="Print_Data" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Print.png" />
                        <asp:Label ID="Label235" CssClass="col-form-label img-lbl" runat="server" Text="Print"></asp:Label>
                    </div>
                </div>

                <%--                <div class="col-lg-1 section-first mt-2 btn-setting" style="padding:48px 10px 10px 10px;">
                            <div class="img-box text-center">
                                <asp:ImageButton ID="Save_Data" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Save.png"/>
                            </div>
                            <div class="img-box text-center">
                                <asp:Label ID="Label124" CssClass="col-form-label img-lbl" runat="server"  Text="Save"></asp:Label>
                            </div>

                            <div class="img-box text-center">
                                <asp:ImageButton ID="Data_Update" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Update.png" />
                            </div>
                            <div class="img-box text-center">
                                <asp:Label ID="Label231" CssClass="col-form-label img-lbl" runat="server"  Text="Update"></asp:Label>
                            </div>

                            <div class="img-box text-center">
                                <asp:ImageButton ID="Reset_Data" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Reset.png" />
                            </div>
                            <div class="img-box text-center">
                                <asp:Label ID="Label232" CssClass="col-form-label img-lbl" runat="server"  Text="Reset"></asp:Label>
                            </div>

                            <div class="img-box text-center">
                                <asp:ImageButton ID="Delete_Data" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Delete.png" />
                            </div>
                            <div class="img-box text-center">
                                <asp:Label ID="Label233" CssClass="col-form-label img-lbl" runat="server"  Text="Delete"></asp:Label>
                            </div>

                            <div class="img-box text-center">
                                <asp:ImageButton ID="Exit_Form" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Exit.png" />
                            </div>
                            <div class="img-box text-center">
                                <asp:Label ID="Label234" CssClass="col-form-label img-lbl" runat="server"  Text="Exit"></asp:Label>
                            </div>


                            <div class="img-box text-center">
                                <asp:ImageButton ID="Print_Data" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Print.png" />
                            </div>
                            <div class="img-box text-center">
                                <asp:Label ID="Label235" CssClass="col-form-label img-lbl" runat="server"  Text="Print"></asp:Label>
                            </div>
                </div>--%>

            </div>
        </div>

    </div>
    <script src="../../JS/ListSelect/virtual-select.min.js" type="text/javascript"></script>

    <script>
        VirtualSelect.init({
            ele: '#ContentPlaceHolder1_chass_no'
        });
        VirtualSelect.init({
            ele: '#ContentPlaceHolder1_erptll'
        });
        VirtualSelect.init({
            ele: '#ContentPlaceHolder1_financier'
        });
        VirtualSelect.init({
            ele: '#ContentPlaceHolder1_veh_group'
        });

        VirtualSelect.init({
            ele: '#ContentPlaceHolder1_branches',
            showOptionsOnlyOnSearch: true
        });
        VirtualSelect.init({
            ele: '#ContentPlaceHolder1_color'
        });
        VirtualSelect.init({
            ele: '#ContentPlaceHolder1_erpdse'
        });
        VirtualSelect.init({
            ele: '#ContentPlaceHolder1_type_loan'
        });
        VirtualSelect.init({
            ele: '#ContentPlaceHolder1_veh_code'
        });


    //function preventBack() { window.history.forward(); }
    //setTimeout("preventBack()", 0);
    //window.onunload = function () { null };  
    </script>




    <script>
        $(document).ready(function () {
            $("#ContentPlaceHolder1_payoutage").keyup(function (e) {
                if ($(this).val().match(/[^0-9]/g, '')) {
                    $("#error_message").html("Digits Only").show().fadeOut("slow");
                    $(this).val($(this).val().replace(/[^0-9]/g, ''));
                    console.log("=====")
                    errorflag = 1;
                } else {
                    console.log("==tt===")
                }
            });
            $("#ContentPlaceHolder1_payoutage").bind('paste', function (e) {
                setTimeout(function () { $(this).keyup(); }, 30);
            });
        });

    </script>

</asp:Content>
