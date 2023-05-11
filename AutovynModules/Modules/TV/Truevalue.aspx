<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AutovynModules/AUTOVYN.Master" CodeBehind="Truevalue.aspx.vb" Inherits="AutovynERP.Truevalue" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<!-- Virtual Select List Box -->
    <link rel="stylesheet" href="../../JS/ListSelect/virtual-select.min.css" />
    <style>
        * {
            margin: 0;
            padding: 0;
            font-size: 13px;
            font-family: 'Dosis', sans-serif;
        }

        .main-section {
            margin-top: 50px;
            margin-bottom:30px;
        }

        .title {
            text-align: center;
        }

            .title span {
                text-align: center;
                font-weight: 700;
                font-size: 28px;
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
            background: #0568d5;
            border: none;
            border-radius: 5px;
            color: white;
            width: 40%;
            margin: 10px 0px;
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


        @media screen and (max-width:480px) {
            .bottombuttons {
                width: 30%;
            }

            .btn-setting {
                display: flex;
                justify-content: space-between;
            }
        }

        .select2-container--default .select2-selection--single {
            background-image: linear-gradient(to right, #d4d4d4 0%, #878888 100%);
            border: 1px solid #aaa;
            border-radius: 4px;
            height: 32px !important;
        }

            .select2-container--default .select2-selection--single .select2-selection__rendered {
                /*            cursor: not-allowed !important;
*/
            }

        .align-right {
            text-align: right;
        }

        .img-btn {
            width: 34px;
        }

        .disable {
            background-color: #edf4cc;
            cursor: not-allowed;
        }

        .dropify-wrapper {
            height: 100px !important;
        }

        .button-sactions {
            display: flex;
            flex-direction: column;
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
                margin-bottom: 70px;
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
            #Rcpt_Grid {
                margin-left: 0px;
                width: 100%;
            }

            .button-sactions {
                display: flex;
                flex-direction: row;
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
                width: 40%;
                margin-top: 10px;
            }

            .amt-box-total {
                width: 60%;
                margin-top: 10px;
            }

            .alignment {
                text-align: left;
            }

            .inv-box{
                display:flex;
            }

            .inv-field-lbl{
                width:29%;
                padding-left:0px !important;
            }

            .inv-field-total{
                width:46%;
            }

            .inv-field-btn{
                width:0%;
                padding-left:0px;
            }
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid main-section">
        <!--section 1-->
        <div class="title mt-0 mb-0">
            <span>TV Cost-Sheet</span>
        </div>
        <div class="section-first pt-0">
            <!-- row -->
            <div class="row pt-2 amt-box inv-box">
                <asp:Label ID="Label1" CssClass="col-lg-1 col-form-label inv-field-lbl" runat="server" Text="Label">DMS Inv No.</asp:Label>
                <div class="col-lg-2 inv-field-total">
                    <asp:TextBox ID="tvinvoice" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-lg-1 inv-field-btn">
                    <asp:ImageButton ID="DtView" ImageUrl="~/AutovynModules/Media/icons8-search-64.png" runat="server" Width="25" />
                </div>
                <asp:Label ID="Label2" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Label">Cust Id.</asp:Label>
                <div class="col-lg-2 amt-box-total">
                    <asp:TextBox ID="custid" CssClass="form-control disable" Enabled="false" BackColor="#EDF4CC" runat="server"></asp:TextBox>
                </div>

                <asp:Label ID="Label3" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="File No."></asp:Label>
                <div class="col-lg-2 amt-box-total">
                    <asp:TextBox ID="fileno" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                </div>
                <asp:Label ID="Label4" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Date"></asp:Label>
                <div class="col-lg-1 amt-box-total">
                    <asp:TextBox ID="date1" CssClass="form-control" placeholder="MM/DD/YYYY" onblur="(this.type='text')" runat="server" Enabled="False"></asp:TextBox>
                </div>
            </div>
            <!-- row -->

            <!-- row -->
            <div class="row amt-box ">
                <asp:Label ID="Label5" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Cust Name"></asp:Label>
                <div class="col-lg-2 amt-box-total">
                    <asp:TextBox ID="Cust_Name" CssClass="form-control disable" runat="server" BackColor="#EDF4CC" Enabled="False"></asp:TextBox>
                </div>
                <asp:Label ID="Label6" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Address"></asp:Label>
                <div class="col-lg-3 amt-box-total">
                    <asp:TextBox ID="Cust_Add" runat="server" CssClass="form-control" Enabled="false" BackColor="#EDF4CC"></asp:TextBox>
                </div>
                <asp:Label ID="label" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Mobile"></asp:Label>
                <div class="col-lg-2 amt-box-total">
                    <asp:TextBox ID="Mobile" TextMode="Number" MaxLength="10" CssClass="form-control disable" runat="server"></asp:TextBox>
                </div>

            </div>
            <!-- row -->
        </div>



        <!-- Pills navs -->
        <ul class="nav nav-pills nav-fill mb-3" id="ex1" role="tablist">
            <li class="nav-item" role="presentation">
                <a class="nav-link" id="ex2-tab-1" data-mdb-toggle="pill" href="#ex2-pills-1" role="tab" aria-controls="ex2-pills-1" aria-selected="true">Customer & Vehicle Information</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" id="ex2-tab-2" data-mdb-toggle="pill" href="#ex2-pills-2" role="tab" aria-controls="ex2-pills-2" aria-selected="false">Cost & Offers</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" id="ex2-tab-3" data-mdb-toggle="pill" href="#ex2-pills-3" role="tab" aria-controls="ex2-pills-3" aria-selected="false">Other Optional Information</a>
            </li>
        </ul>
        <!-- Pills navs -->

        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-11">
                    <!-- Pills content -->
                    <div class="tab-content" id="ex2-content">
                        <div class="tab-pane fade show" id="ex2-pills-1" role="tabpanel" aria-labelledby="ex2-tab-1">
                            <div class="section-second mt-1">
                                <div class="row g-3">
                                    <div class="col-12">
                                        <!-- row -->
                                        <div class="row amt-box">
                                            <asp:Label ID="Label7" CssClass="col-lg-1 col-form-label amt-box-lbl " runat="server" Text="State"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:DropDownList ID="State_List" runat="server" selectionmode="multiple" data-silent-initial-value-set="true" name="native-select" data-search="true"></asp:DropDownList>
                                            </div>
                                            <asp:Label ID="Label8" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="City"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:DropDownList ID="city_List" selectionmode="multiple" data-silent-initial-value-set="true" name="native-select" data-search="true" runat="server"></asp:DropDownList>
                                            </div>
                                            <asp:Label ID="Label20" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Financier"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:DropDownList ID="Financier_List" selectionmode="multiple" data-silent-initial-value-set="true" name="native-select" data-search="true" runat="server"></asp:DropDownList>
                                            </div>
                                            <asp:Label ID="Label9" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Pin-code"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Pin_Code" CssClass="form-control" runat="server" MaxLength="6"></asp:TextBox>
                                            </div>
                                        </div>
                                        <!-- row -->

                                        <!-- row -->
                                        <div class="row amt-box ">
                                            <asp:Label ID="Label10" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="GST No."></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Gst_No" CssClass="form-control disable" BackColor="#EDF4CC" Enabled="false" runat="server"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label11" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Pan Card"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Pan_No" CssClass="form-control disable" BackColor="#EDF4CC" Enabled="false" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-3 mt-2">
                                                <asp:CheckBox ID="CheckBox1" runat="server" />
                                                <asp:Label ID="Label28" CssClass="col-form-label" runat="server" Text="Form 60(IF Pan NA )"></asp:Label>
                                            </div>
                                            <asp:Label ID="Label31" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="PF Chrgs"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Pf_chrg" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <!-- row -->

                                        <!-- row -->
                                        <div class="row amt-box">
                                            <asp:Label ID="Label21" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Loan Type"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:DropDownList ID="Loan_List" selectionmode="multiple" data-silent-initial-value-set="true" name="native-select" data-search="true" runat="server" ValidateRequestMode="Enabled"></asp:DropDownList>
                                            </div>
                                            <asp:Label ID="Label12" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Fin DO No."></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Do_No" CssClass="form-control disable" Enabled="false" BackColor="#EDF4CC" MaxLength="25" runat="server"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label13" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Fin DO Amt"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Do_Amt" CssClass="form-control disable" BackColor="#EDF4CC" runat="server" Enabled="false" ValidateRequestMode="Enabled"></asp:TextBox>
                                            </div>

                                        </div>
                                        <!-- row -->

                                        <!-- row -->
                                    </div>
                                </div>
                            </div>
                            <%-- section 2 --%>
                            <div class="section-second mt-2">
                                <div class="row g-3 ">
                                    <div class="col-md-12 mb-0">
                                        <label for="inputEmail4" class="form-label fin-team">True Value Vehicle Details (Old Car Details) </label>
                                    </div>
                                    <div class="col-12 mt-0">
                                        <!-- row -->
                                        <div class="row amt-box">
                                            <asp:Label ID="Label14" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Veh. Reg. No."></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Veh_Reg_no" BackColor="#EDF4CC" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>

                                            <asp:Label ID="Label17" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Chassis No."></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Chass_No_List" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label36" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Engine No."></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="OldEng_No" CssClass="form-control disable" Enabled="false" BackColor="#EDF4CC" runat="server"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label18" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Cust Relation"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:DropDownList ID="Rel_Cust" runat="server" CssClass="form-control">
                                                    <asp:ListItem>Self</asp:ListItem>
                                                    <asp:ListItem>Parent</asp:ListItem>
                                                    <asp:ListItem>Spouse</asp:ListItem>
                                                    <asp:ListItem>Siblings</asp:ListItem>
                                                    <asp:ListItem>Son-In-Law</asp:ListItem>
                                                    <asp:ListItem>Daughter-In-Law</asp:ListItem>
                                                    <asp:ListItem>Grand Parents</asp:ListItem>
                                                    <asp:ListItem>Grand Children</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <!-- row -->

                                        <!-- row -->
                                        <div class="row amt-box">
                                            <asp:Label ID="Label16" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Exchange Type"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Exch_Type" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>

                                            <asp:Label ID="Label19" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Model Varient"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Modl_Var" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label15" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Mfg  Year"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="OldMfgYr" CssClass="form-control disable" Enabled="false" BackColor="#EDF4CC" MaxLength="25" runat="server"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label37" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="KM."></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:DropDownList ID="DropDownList7" CssClass="form-control" runat="server"></asp:DropDownList>
                                            </div>
                                        </div>
                                        <!-- row -->


                                        <!-- row -->
                                        <div class="row amt-box">
                                            <asp:Label ID="Label47" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="DSE Name"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:DropDownList ID="DSE_NAME2" selectionmode="multiple" data-silent-initial-value-set="true" name="native-select" data-search="true" runat="server"></asp:DropDownList>
                                            </div>

                                            <asp:Label ID="Label48" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Evalutor Name"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:DropDownList ID="Eval_Name" runat="server" selectionmode="multiple" data-silent-initial-value-set="true" name="native-select" data-search="true"></asp:DropDownList>
                                            </div>
                                        </div>
                                        <!-- row -->
                                    </div>
                                </div>
                            </div>
                            <%-- section 3 --%>
                            <div class="section-second mt-2 mb-3">
                                <div class="row g-3">
                                    <div class="col-md-12">
                                        <label for="inputEmail4" class="form-label fin-team">New Car Sale Details</label>
                                    </div>
                                    <div class="col-12 section-second-half mt-0">
                                        <!-- row -->
                                        <div class="row amt-box">
                                            <asp:Label ID="Label22" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Veh Group"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:DropDownList ID="veh_group_List" selectionmode="multiple" data-silent-initial-value-set="true" name="native-select" data-search="true" runat="server">
                                                    <asp:ListItem>----Select----</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <asp:Label ID="Label23" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Veh Code"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:DropDownList ID="Veh_Code" selectionmode="multiple" data-silent-initial-value-set="true" name="native-select" data-search="true" runat="server"></asp:DropDownList>
                                            </div>
                                            <asp:Label ID="Label27" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Engine No."></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="NewEng_No" CssClass="form-control disable" Enabled="false" BackColor="#EDF4CC" runat="server"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label25" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="DSE Name"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:DropDownList ID="DSE_NAME" selectionmode="multiple" data-silent-initial-value-set="true" name="native-select" data-search="true" runat="server"></asp:DropDownList>
                                            </div>
                                        </div>
                                        <!-- row -->

                                        <!-- row -->
                                        <div class="row amt-box">
                                            <asp:Label ID="Label24" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Color"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:DropDownList ID="Veh_Color_List" selectionmode="multiple" data-silent-initial-value-set="true" name="native-select" data-search="true" runat="server"></asp:DropDownList>
                                            </div>

                                            <asp:Label ID="Label26" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Chassis No."></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:DropDownList ID="Chass_No_List2" runat="server" selectionmode="multiple" data-silent-initial-value-set="true" name="native-select" data-search="true"></asp:DropDownList>
                                            </div>

                                            <asp:Label ID="Label34" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Remark"></asp:Label>
                                            <div class="col-lg-5 amt-box-total">
                                                <asp:TextBox ID="Remark" CssClass="form-control" runat="server" class="singlebox1"></asp:TextBox>
                                            </div>
                                        </div>
                                        <!-- row -->
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane fade show" id="ex2-pills-2" role="tabpanel" aria-labelledby="ex2-tab-2">

                            <!-- Modal -->
                            <div id="signupModal" class="col-md-12 mb-0" style="display: none; z-index: 2; position: absolute; background-color: antiquewhite; border-radius: 12px; opacity: 2; margin-left: 20px; width: 96%; margin-top: 0px;">
                                <asp:Panel ID="pnl" runat="server" ScrollBars="Horizontal">
                                    <asp:GridView ID="Cost_Offer_Grid" runat="server" CssClass="ms-3" Style="border: none; text-align: center; border-radius: 10px; background-color: hsla(40deg, 4%, 36%, 0.25); width: 98%; table-layout: auto;"
                                        ShowHeaderWhenEmpty="True" AutoGenerateSelectButton="false"
                                        CellPadding="3" ForeColor="Black" GridLines="Both" AllowPaging="true" PageSize="16">
                                        <FooterStyle BackColor="#CCCCCC" />
                                        <HeaderStyle Font-Bold="True" ForeColor="RoyalBlue" CssClass="text-center" Width="100%" />
                                        <SelectedRowStyle Font-Bold="True" ForeColor="White" />
                                        <PagerSettings FirstPageText="1" LastPageText="last" NextPageText="next" PreviousPageText="previous" />
                                        <PagerStyle ForeColor="Black" HorizontalAlign="Center" />
                                    </asp:GridView>
                                </asp:Panel>
                                <asp:Button CssClass="btn bottombuttons btn-primary " ID="cancel" runat="server" OnClientClick="hideModal();return false;" Text="cancel" />
                            </div>
                           

                            <%-- section 2 --%>
                            <div class="section-second mt-2">
                                <div class="row g-3">
                                    <div class="col-md-12 mb-0">
                                        <label for="inputEmail4" class="form-label fin-team">Dealer costing</label>
                                    </div>
                                    <div class="col-12 mt-0">
                                        <!-- row -->
                                        <div class="row amt-box">
                                            <asp:Label ID="Label29" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Purchase cost"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Pur_Cost" MaxLength="10" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>

                                            <asp:Label ID="Label30" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Taxable Value"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Tax_Val" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label45" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="GST"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Gst_Rate" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>

                                            <asp:Label ID="Label46" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Purchase Date"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Purc_Date" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <!-- row -->

                                        <!-- row -->
                                        <div class="row amt-box">
                                            <asp:Label ID="Label32" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="MGA Exp."></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Mga_Exp" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>

                                            <asp:Label ID="Label33" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="BodyShop Exp"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Shop_Exp" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label35" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Outside Repair"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="OutSide_Rpr" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>

                                            <asp:Label ID="Label38" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" ToolTip="Certification Exp." Text="Cer Exp."></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Cer_Exp" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <!-- row -->

                                        <!-- row -->
                                        <div class="row amt-box">
                                            <asp:Label ID="Label40" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Refurb Exp."></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Refurb_Exp" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>

                                            <asp:Label ID="Label42" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Exchange Exp."></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Exch_Exp" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label43" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Other Expenses"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Otr_Exp" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>

                                            <asp:Label ID="Label44" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Total Cost"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Total_Cost" Style="cursor: not-allowed;" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <!-- row -->







                                    </div>
                                </div>
                            </div>
                            <%-- section 4 --%>
                            <div class="section-second mt-2">
                                <div class="row g-3">

                                    <div class="col-12 mt-0">
                                        <!-- row -->
                                        <div class="row mt-3  justify-content-lg-start">
                                            <div class="col-md-12 mb-0">
                                                <label for="inputEmail4" class="form-label fin-team">Margin</label>
                                            </div>
                                            <div class="row amt-box">
                                                <asp:Label ID="Label80" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Intrest Rate"></asp:Label>
                                                <div class="col-lg-2 amt-box-total">
                                                    <asp:TextBox ID="Intr_Rate" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>
                                                <asp:Label ID="Label81" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Amount"></asp:Label>
                                                <div class="col-lg-2 amt-box-total">
                                                    <asp:TextBox ID="Amt" CssClass="form-control" Style="cursor: not-allowed;" runat="server"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-2">
                                                    <asp:Button ID="view" CssClass="btn btn-primary" Text="View Data" runat="server" OnClientClick="showModal(); return false;"></asp:Button>
                                                    <%--<asp:ImageButton ID="ImageButton1" ImageUrl="~/class/pictures/additon.png" runat="server" OnClientClick="showModal(); return false;" style="height:10px; width:10px" />--%>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- row -->
                                    </div>
                                </div>
                            </div>


                            <%-- section 3 --%>
                            <div class="section-second mt-2">
                                <div class="row g-3">
                                    <div class="col-md-12 mb-0">
                                        <label for="inputEmail4" class="form-label fin-team">Sale costing</label>
                                    </div>
                                    <div class="col-12 mt-0">
                                        <!-- row -->
                                        <div class="row amt-box">
                                            <asp:Label ID="Label39" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Sale Inv Amt"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Sale_inv" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label41" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Taxable Value"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Taxable_Val" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label49" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="GST"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Gst_Amt" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label50" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Sale Date"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Sale_Date" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <!-- row -->
                                        <!-- row -->
                                        <div class="row amt-box">
                                            <asp:Label ID="Label51" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="RTO Charges"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Rto_Chrg" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>

                                            <asp:Label ID="Label52" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Insurance Amt"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Ins_Amt" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label53" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Extended Amt"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Ext_Amt" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>

                                            <asp:Label ID="Label54" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="MGA Amt"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Mga_Amt" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <!-- row -->
                                        <!-- row -->
                                        <div class="row amt-box">
                                            <asp:Label ID="Label55" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Other Charges"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Oth_Chrg" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>

                                            <asp:Label ID="Label56" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Total Cost Cust."></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Total_Cust_Cost" CssClass="form-control" Style="cursor: not-allowed;" runat="server"></asp:TextBox>
                                            </div>

                                            <asp:Label ID="Label60" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Discount"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Discount" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>

                                            <asp:Label ID="Label65" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Saleing Price"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Sal_price" CssClass="form-control" Style="cursor: not-allowed;" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <!-- row -->
                                    </div>
                                </div>
                            </div>

                            <%-- section 4 --%>
                            <div class="section-second mt-2">
                                <div class="row g-3">
                                    <div class="col-md-12 mb-0">
                                        <asp:Panel ID="Panel1" runat="server" ScrollBars="Horizontal">
                                            <asp:GridView ID="Rcpt_Grid" runat="server" CssClass="" Style="top: 0px; border: 1px solid #6fd472; text-align:center; border-collapse: inherit; background-color: hsla(40deg, 4%, 36%, 0.25); position: relative; width: 100%; table-layout: auto;"
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
                        </div>

                        <div class="tab-pane fade show " id="ex2-pills-3" role="tabpanel" aria-labelledby="ex2-tab-3">

                            <%-- section 2 --%>
                            <div class="section-second mt-1">
                                <div class="row g-3">
                                    <div class="col-12">
                                        <!-- row -->
                                        <div class="row ">
                                            <asp:Label ID="Label57" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Created Date"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:DropDownList ID="DropDownList11" CssClass="form-control" Enabled="false" runat="server"></asp:DropDownList>
                                            </div>
                                            <asp:Label ID="Label58" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="ICM Seq. No."></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="TextBox32" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label59" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="ICM Gtpass No."></asp:Label>
                                            <div class="col-lg-5 amt-box-total">
                                                <asp:TextBox ID="TextBox33" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                                            </div>

                                        </div>
                                        <!-- row -->
                                        <!-- row -->
                                        <div class="row ">
                                            <asp:Label ID="Label61" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Finance Payout"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="TextBox34" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label62" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="DSE Payout"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:DropDownList ID="DropDownList12" CssClass="form-control" Enabled="false" runat="server"></asp:DropDownList>
                                            </div>
                                            <asp:Label ID="Label63" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="EW Policy No."></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:DropDownList ID="DropDownList13" CssClass="form-control" Enabled="false" runat="server"></asp:DropDownList>
                                            </div>
                                            <asp:Label ID="Label64" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="MI Policy No."></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="TextBox47" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <!-- row -->
                                    </div>
                                </div>
                            </div>
                            <%-- section 2 --%>
                            <div class="section-second mt-2">
                                <div class="row g-3 ">
                                    <div class="col-md-12 mb-0">
                                        <label for="inputEmail4" class="form-label fin-team">Change Delivery Branch</label>
                                    </div>
                                    <div class="col-12 mt-0">
                                        <!-- row -->
                                        <div class="row amt-box"> 
                                            <asp:Label ID="Label70" CssClass="col-lg-2 col-form-label amt-box-lbl" runat="server" Text="Delivery Cust. ID"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Delv_CustID" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label71" CssClass="col-lg-2 col-form-label amt-box-lbl" runat="server" Text="Delivery Branch"></asp:Label>
                                            <div class="col-lg-2 amt-box-total">
                                                <asp:TextBox ID="Delv_Branch" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4 justify-content-between">
                                                <button class="col-lg-5 show_bal" id="Ledg_Name" runat="server">Show Ledger Balance</button>
                                                <button class="col-lg-5 show_bal" id="Show_Bal" type="button" runat="server" style="display: none;" text="">
                                                    <asp:Label ID="Balance" runat="server" Text="" Style="font-size: 14px;"></asp:Label>
                                                </button>
                                            </div>
                                        </div>
                                        <!-- row -->

                                    </div>
                                </div>
                            </div>
                            <%-- section 3 --%>
                            <%--                <div class="section-second mt-2">
                    <!-- row -->
                    <div class="row g-3 ">
                        <div class="col-md-12 mb-0">
                            <label for="inputEmail4" class="form-label fin-team">Receipt from other Ledger</label>
                        </div>
                    </div>
                    <!-- row -->
                    <div class="row g-3">
                        <div class="col-12 mb-2">
                            <asp:Panel ID="Panel2" runat="server">
                                <div class="row">
                                    <div class="col-4">
                                        <asp:Label ID="cust_ledger" runat="server" Text="Customer Ledger A/c"></asp:Label>
                                    </div>
                                    <div class="col-2">
                                        <asp:Label ID="Trf_Amt" runat="server" Text="Trf. Amt"></asp:Label>
                                    </div>
                                    <div class="col-5">
                                        <asp:Label ID="lbl" runat="server" Text="Remark (if any)"></asp:Label>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-4">
                                        <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-2">
                                        <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" Style="text-align: right;"></asp:TextBox>
                                    </div>
                                    <div class="col-5">
                                        <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-4">
                                        <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-2">
                                        <asp:TextBox ID="TextBox5" CssClass="form-control" runat="server" Style="text-align: right;"></asp:TextBox>
                                    </div>
                                    <div class="col-5">
                                        <asp:TextBox ID="TextBox6" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>

                        <div class="col-2">
                            <div class="col-1">
                                <asp:Button ID="add" runat="server" Text="Add" CssClass="btn btn-primary" />
                            </div>
                        </div>
                    </div>
                </div>
                <!-- row -->--%>

                            <div class="section-second mt-2">
                                <div class="row g-3">
                                    <div class="col-12 mt-0">
                                        <!-- row -->
                                        <div class="row justify-content-lg-start">
                                            <div class="col-md-12 mb-0 mt-3">
                                                <label for="inputEmail4" class="form-label fin-team">Document Upload</label>
                                            </div>
                                            <div class="row ">
                                                <div class="col-lg-2">
                                                    <asp:Label ID="Label66" CssClass="col-lg-2 amt-box-totalcol-form-label font-control" runat="server" Text="Label">Exchnage Doc 1</asp:Label>
                                                    <asp:FileUpload ID="file_upload" CssClass="dropify" runat="server" accept=".jpg,.png,.pdf,.jpeg" />
                                                </div>
                                                <div class="col-lg-1">
                                                    <asp:Button ID="upload_Doc" Text="Upload" CssClass="btn btn-primary mt-2" runat="server" />
                                                </div>

                                            </div>
                                        </div>
                                        <!-- row -->
                                    </div>
                                </div>
                            </div>

                            <div class="section-grid mt-2">
                                    <div class="row">
                                        <span class="Cust_Det">Document Details</span>
                                    </div>
                                    <div class="row">
                                        <asp:Panel ID="panel" runat="server">
                                            <asp:GridView ID="Doc_Grid" runat="server" CssClass="" Style="top: 0px; border: 1px solid #6fd472; text-align:center; border-collapse: inherit; background-color: hsla(40deg, 4%, 36%, 0.25); position: relative; width: 100%; table-layout: auto;"
                                                ShowHeaderWhenEmpty="True" CellPadding="3" GridLines="both" PageSize="7" AllowPaging="True" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1">
                                                <Columns>
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



                            <%-- section 4 --%>
                            <%--<div class="section-second mt-2">
                        <div class="box2 mt-2">
                            <input type="radio" class="tab-toggles " name="tab-toggles" id="tab12" checked />
                            <input type="radio" class="tab-toggles" name="tab-toggles" id="tab22" />
                            <ul class="tab-lists">
                                <li class="tab-items">
                                    <label class="tab-triggers text-success" for="tab12">Non MGA Item-list</label>
                                </li>
                                <li class="tab-items">
                                    <label class="tab-triggers text-success" for="tab22">Spot Incentive</label>
                                </li>
                            </ul>
                            <div class="tab-containers">
            <div class="tab-contents">
                <div class="section-2 mt-2">
                    <!-- row -->
                    <div class="row g-3 mb-3">
                        <div class="col-md-10 mb-2">
                            <asp:Panel ID="Panel3" ScrollBars="Horizontal" runat="server">
                                <asp:GridView ID="mygrid" runat="server" Style="border: none; left: 10px; top: 0px; position: relative; width: 98%; table-layout: auto;"
                                    ShowHeaderWhenEmpty="True" AutoGenerateSelectButton="false"
                                    CellPadding="3" ForeColor="Black" GridLines="Both" AllowPaging="true" PageSize="16">

                                    <FooterStyle />
                                    <HeaderStyle Font-Bold="True" ForeColor="blue" Width="100%" />
                                    <SelectedRowStyle BackColor="#696969" Font-Bold="True" ForeColor="White" />
                                    <PagerSettings FirstPageText="1" LastPageText="last" NextPageText="next" PreviousPageText="previous" />
                                    <PagerStyle BackColor="#6254e3" ForeColor="White" HorizontalAlign="center" />
                                </asp:GridView>
                            </asp:Panel>
                        </div>
                        <div class="col-lg-2 amt-box-total">
                            <asp:Button class="bottombuttons w-100" ID="Button4" runat="server" Text="Submit" />
                        </div>
                    </div>
                    <!-- row -->
                </div>
            </div>
                <div class="tab-contents">
                    <div class="section-2 mt-2">
                        <!-- row -->
                        <div class="row g-3 mb-3">
                            <div class="col-md-10 mb-2">
                                <asp:Panel ID="Panel4" ScrollBars="Horizontal" runat="server">
                                    <asp:GridView ID="GridView2" runat="server" Style="z-index: 1; left: 10px; top: 0px; position: relative; width: 98%; table-layout: auto;"
                                        ShowHeaderWhenEmpty="True" AutoGenerateSelectButton="false" BackColor="#babec4" BorderColor="#908282"
                                        BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Both" AllowPaging="true" PageSize="16">
                                        <Columns>
                                            <asp:CommandField ShowSelectButton="True" HeaderText="Update" ButtonType="Image" SelectImageUrl="~/Admin/Insurance_SubMenus/Images/pic3.png" SelectText="Edit">
                                                <ControlStyle Width="20px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="30px" />
                                            </asp:CommandField>
                                        </Columns>
                                        <FooterStyle BackColor="#CCCCCC" />
                                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" Width="100%" />
                                        <SelectedRowStyle BackColor="#696969" Font-Bold="True" ForeColor="White" />
                                        <PagerSettings FirstPageText="1" LastPageText="last" NextPageText="next" PreviousPageText="previous" />
                                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                    </asp:GridView>
                                </asp:Panel>
                            </div>
                            <div class="col-lg-2 amt-box-total">
                                <asp:Button class="bottombuttons w-100" ID="Button5" runat="server" Text="Submit" />
                            </div>
                        </div>
                        <!-- row -->
                    </div>
                </div>
        </div>
                        </div>
                    </div>--%>
                        </div>
                    </div>
                    <!-- Pills content -->
                </div>
                <div class="col-lg-1 button-sactions" style="background-color: #a7e2cb;">
                    <div class="img-box">
                        <asp:ImageButton ID="save_data" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Save.png" />
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
    </div>



    <%--<%-- using from search data start  (only) --%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/css/select2.min.css" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.min.js"></script>
    <script type="text/javascript" src="../../JS/ListSelect/virtual-select.min.js"></script>
    <%-- dropify --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://jeremyfagis.github.io/dropify/dist/js/dropify.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://jeremyfagis.github.io/dropify/dist/css/dropify.min.css" />
    <%-- dropify --%>

    <script>
        VirtualSelect.init({
            ele: '#ContentPlaceHolder1_Chass_No_List2',
            showOptionsOnlyOnSearch: true
        });

        VirtualSelect.init({
            ele: '#ContentPlaceHolder1_city_List',
            showOptionsOnlyOnSearch: true
        });
        VirtualSelect.init({
            ele: '#ContentPlaceHolder1_State_List',
            showOptionsOnlyOnSearch: true
        });
        VirtualSelect.init({
            ele: '#ContentPlaceHolder1_Veh_Color_List',
            showOptionsOnlyOnSearch: true
        });
        VirtualSelect.init({
            ele: '#ContentPlaceHolder1_Financier_List',
            showOptionsOnlyOnSearch: true
        });
        VirtualSelect.init({
            ele: '#ContentPlaceHolder1_veh_group_List',
            showOptionsOnlyOnSearch: true
        });
        VirtualSelect.init({
            ele: '#ContentPlaceHolder1_Veh_Code',
            showOptionsOnlyOnSearch: true
        });
        VirtualSelect.init({
            ele: '#ContentPlaceHolder1_Loan_List',
            showOptionsOnlyOnSearch: true

        });
        VirtualSelect.init({
            ele: '#ContentPlaceHolder1_DSE_NAME2',
            showOptionsOnlyOnSearch: true
        });
        VirtualSelect.init({
            ele: '#ContentPlaceHolder1_DSE_NAME',
            showOptionsOnlyOnSearch: true
        });
        VirtualSelect.init({
            ele: '#ContentPlaceHolder1_Eval_Name',
            showOptionsOnlyOnSearch: true
        });

        $(function () {
            //    $("[id*=city]").select2();
            //    $("[id*=State_List]").select2();
            //    $("[id*=Veh_Color_List]").select2();
            //    $("[id*=Financier_List]").select2();
            //    $("[id*=veh_group_List]").select2();
            //    $("[id*=veh_code]").select2();
            //    $("[id*=Loan_List]").select2();
            //    $("[id*=DSE_NAME2]").select2();
            //    $("[id*=DSE_NAME]").select2();
            //    $("[id*=Eval_Name]").select2();
        });
    </script>

    <script>
        $('.dropify').dropify();

        $(document).ready(function () {
            $("#ContentPlaceHolder1_Ledg_Name").click(function (event) {
                event.preventDefault();
                $("#ContentPlaceHolder1_Ledg_Name").toggle();
                $("#ContentPlaceHolder1_Show_Bal").toggle();
            });

            $("#ContentPlaceHolder1_Show_Bal").click(function () {
                $("#ContentPlaceHolder1_Ledg_Name").toggle();
                $("#ContentPlaceHolder1_Show_Bal").toggle();
                return false;
            });
        });

    </script>

    <script>
        // Get references to the input elements
        const number1 = document.getElementById("ContentPlaceHolder1_Pur_Cost");
        const number2 = document.getElementById("ContentPlaceHolder1_Tax_Val");
        const number3 = document.getElementById("ContentPlaceHolder1_Gst_Rate");
        const number4 = document.getElementById("ContentPlaceHolder1_Shop_Exp");
        const number5 = document.getElementById("ContentPlaceHolder1_Mga_Exp");
        const number6 = document.getElementById("ContentPlaceHolder1_OutSide_Rpr");
        const number7 = document.getElementById("ContentPlaceHolder1_Cer_Exp");
        const number8 = document.getElementById("ContentPlaceHolder1_Refurb_Exp");
        const number9 = document.getElementById("ContentPlaceHolder1_Exch_Exp");
        const number10 = document.getElementById("ContentPlaceHolder1_Otr_Exp");
        const number11 = document.getElementById("ContentPlaceHolder1_Intr_Rate");
        const numbersum = document.getElementById("ContentPlaceHolder1_Total_Cost");
        const Total = document.getElementById("ContentPlaceHolder1_Amt");


        // Attach a keyup event listener to both number input fields
        number1.addEventListener("keyup", updateSum);
        number2.addEventListener("keyup", updateSum);
        number3.addEventListener("keyup", updateSum);
        number4.addEventListener("keyup", updateSum);
        number5.addEventListener("keyup", updateSum);
        number6.addEventListener("keyup", updateSum);
        number7.addEventListener("keyup", updateSum);
        number8.addEventListener("keyup", updateSum);
        number9.addEventListener("keyup", updateSum);
        number10.addEventListener("keyup", updateSum);
        number11.addEventListener("keyup", updateSum);


        function updateSum() {
            // Get the values of the number inputs and convert them to numbers
            const value1 = parseFloat(number1.value) || 0;
            const value2 = parseFloat(number2.value) || 0;
            const value3 = parseFloat(number3.value) || 0;
            const value4 = parseFloat(number4.value) || 0;
            const value5 = parseFloat(number5.value) || 0;
            const value6 = parseFloat(number6.value) || 0;
            const value7 = parseFloat(number7.value) || 0;
            const value8 = parseFloat(number8.value) || 0;
            const value9 = parseFloat(number9.value) || 0;
            const value10 = parseFloat(number10.value) || 0;
            const value11 = parseFloat(number11.value) || 0;

            // Calculate the sum
            const sum = value1 + value2 + value3 + value4 + value5 + value6 + value7 + value8 + value9 + value10;

            // Calculate the Total amount after margin
            const marginmoney = ((sum * value11) / 100);
            // Update the sum textbox
            numbersum.value = sum;
            Total.value = marginmoney
        }

        // Get references to the input elements
        const num1 = document.getElementById("ContentPlaceHolder1_Sale_inv");
        const num2 = document.getElementById("ContentPlaceHolder1_Taxable_Val");
        const num3 = document.getElementById("ContentPlaceHolder1_Gst_Amt");
        const num4 = document.getElementById("ContentPlaceHolder1_Rto_Chrg");
        const num5 = document.getElementById("ContentPlaceHolder1_Ins_Amt");
        const num6 = document.getElementById("ContentPlaceHolder1_Ext_Amt");
        const num7 = document.getElementById("ContentPlaceHolder1_Mga_Amt");
        const num8 = document.getElementById("ContentPlaceHolder1_Oth_Chrg");
        const numsum = document.getElementById("ContentPlaceHolder1_Total_Cust_Cost");
        const dis = document.getElementById("ContentPlaceHolder1_Discount");
        const sal_price = document.getElementById("ContentPlaceHolder1_Sal_price");

        // Attach a keyup event listener to both num input fields
        num1.addEventListener("keyup", updateSum1);
        num2.addEventListener("keyup", updateSum1);
        num3.addEventListener("keyup", updateSum1);
        num4.addEventListener("keyup", updateSum1);
        num5.addEventListener("keyup", updateSum1);
        num6.addEventListener("keyup", updateSum1);
        num7.addEventListener("keyup", updateSum1);
        num8.addEventListener("keyup", updateSum1);
        dis.addEventListener("keyup", updateSum1);
        function updateSum1() {
            // Get the vals of the num inputs and convert them to nums
            const val1 = parseFloat(num1.value) || 0;
            const val2 = parseFloat(num2.value) || 0;
            const val3 = parseFloat(num3.value) || 0;
            const val4 = parseFloat(num4.value) || 0;
            const val5 = parseFloat(num5.value) || 0;
            const val6 = parseFloat(num6.value) || 0;
            const val7 = parseFloat(num7.value) || 0;
            const val8 = parseFloat(num8.value) || 0;
            const val_dis = parseFloat(dis.value) || 0;

            // Calculate the sum
            const sum1 = val1 + val2 + val3 + val4 + val5 + val6 + val7 + val8;

            // Update the sum textbox
            numsum.value = sum1;

            const sale = sum1 - val_dis;
            sal_price.value = sale;
        }
    </script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <!-- InputMask -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/inputmask/inputmask.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/inputmask/inputmask.date.extensions.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/inputmask/inputmask.extensions.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/css/inputmask.css" />

    <link rel="stylesheet" type="text/css" href="../../Css/zoom.css" />
    <script type="text/javascript" src="../../Js/zoom.js"></script>

    <script>
        $(function () {
            var inputmask = new Inputmask("99/99/9999", { placeholder: 'dd/mm/yyyy' });
            inputmask.mask($('[id*=ContentPlaceHolder1_Purc_Date]'));
            inputmask.mask($('[id*=ContentPlaceHolder1_Sale_Date]'));
        });
    </script>
    <script type="text/javascript">
        function showModal() {
            var modal = document.getElementById("ContentPlaceHolder1_signupModal");
            modal.style.display = "block";
        }

        function hideModal() {
            var modal = document.getElementById("ContentPlaceHolder1_signupModal");
            modal.style.display = "none";
        }
    </script>
</asp:Content>

