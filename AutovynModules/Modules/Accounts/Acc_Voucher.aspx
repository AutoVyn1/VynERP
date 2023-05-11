<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AutovynModules/AUTOVYN.Master" CodeBehind="Acc_Voucher.aspx.vb" Inherits="AutovynERP.Acc_Voucher1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../../JS/ListSelect/virtual-select.min.css" />
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: 'Dosis', sans-serif;
        }

        .form-control{
            height:30px;
            font-size:13px;
        }

        body {
            font-family: sans-serif;
            background-image: url("../../Media/loginbg.svg");

        }


        .section-first{
            padding:0px 9px;
            border-radius: 4px;
            background-color:ivory;
            
        }

        .Vouchertype{
            background-color: #3b71ca;
            color: #ffffff;
            font-weight: 600;
            text-align: center;
        }

        .narration{
            height:70px;
        }

        .panel-section{
            width:100%;
            
        }

        ::-webkit-scrollbar{
            display:none;
        }

        .Acc-header {
            background-color: #addaad;
            color: #ffffff;
        }

        .voucher-img{
            width:60%;
            border-radius:0px !important;
            border:.1px solid #fff;
            height:33px;
        }
        .bank-dtl{
            width:60%;
            height:33px;
            border-radius:0px !important;
            border:.1px solid #fff;
        }

        .narr{
            width:100%;
            border-radius:0 !important;
            margin-left:5px;
        }


        .grid-panel{
            height:180px;
            border:1px solid;
            margin:4px 0;
            border-radius:4px;
        }

        .bottom-panel {
            height: 110px;
            padding: 10px 2px;
            margin: 4px 0;
            border-radius: 4px;
            background-color: ivory;
            -webkit-box-shadow: -1px -4px 22px -8px rgb(0 0 0 / 75%);
            -moz-box-shadow: -1px -4px 22px -8px rgba(0, 0, 0, 0.75);
            box-shadow: -1px 10px 4px -9px rgb(0 0 0 / 56%);
            border-radius: 4px;
            background-color:ivory;
            margin:2px 0;
        }

        .input-grid{
            display:flex;
        }

        .input1{
            width:9%;
            border-radius:0px !important;
        }

        .input2{
            width:16.8%;
            border-radius:0px !important;
        }

        .input3{
            width:16.8%;
            border-radius:0px !important;
        }

        .input4{
            width:8%;
            border-radius:0px !important;
        }

        .input5{
            width:9%;
            border-radius:0px !important;
        }

        .input6{
            width:16%;
            border-radius:0px !important;
        }

        .input7{
            width:17%;
            border-radius:0px !important;
        }

        .input8{
            width:8%;
            border-radius:0px !important;
        }

        .btn-section{
            width: 40.9%;
            height: 44px;
            display: flex;
            background-color: #cde7cd;
            border-radius: 100px;
            margin-left: 10px;
        }

        .img-box{
            display: flex;
            justify-content: center;
            flex-direction: column;
            text-align: center;
            align-items:center;
            margin:4px 16px;
        }

        .img-btn{
            width:21px;
            height:21px;
        }

        .img-lbl {
            font-size: 11px;
            font-weight: 900;
            margin: 0;
            padding: 0;
        }

        .vscomp-toggle-button{
            background-color:#fff !important;

        }

        .main-section{
            margin-top:50px;
        }

        .small-font{
            font-size:11px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid main-section">
            <div class="row section-first p-3" style="background-color: #cde7cd;">
                <div class="col-lg-6">
                    <%-- row --%>
                    <div class="row">
                        <asp:Label ID="Label123" CssClass="col-lg-2 col-form-label" runat="server" Text="Voucher Type"></asp:Label>
                        <div class="col-lg-4">
                            <asp:Label ID="Voucher_type" CssClass="form-control Vouchertype" runat="server" Text="Voucher"></asp:Label>
                        </div>

                        <asp:Label ID="Label1" CssClass="col-lg-2 col-form-label" runat="server" Text="Voucher No"></asp:Label>
                        <div class="col-lg-4">
                            <asp:TextBox ID="Voucher_no" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        </div>
                    <%-- row --%>
                    <div class="row">
                        <asp:Label ID="Label2" CssClass="col-lg-2 col-form-label" runat="server" Text="Book Name"></asp:Label>
                        <div class="col-lg-4">
                            <asp:dropdownlist ID="Book_name" runat="server" selectionmode="multiple" data-silent-initial-value-set="true" name="native-select" data-search="true"></asp:dropdownlist>
                        </div>

                        <asp:Label ID="Label3" CssClass="col-lg-2 col-form-label" runat="server" Text="Voucher Date"></asp:Label>
                        <div class="col-lg-4">
                            <asp:TextBox ID="Voucher_date" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <%-- row --%>
                    <div class="row">
                        <asp:Label ID="Label5" CssClass="col-lg-2 col-form-label" runat="server" Text="Cash/Bank"></asp:Label>
                        <div class="col-lg-10">
                            <asp:DropDownList ID="CashbankAcc" runat="server" selectionmode="multiple" data-silent-initial-value-set="true" name="native-select" data-search="true"></asp:DropDownList>
                        </div>
                    </div>
                    <%-- row --%>
                    <div class="row">
                        <asp:Label ID="Label7" CssClass="col-lg-2 col-form-label" runat="server" Text="Ref. No."></asp:Label>
                        <div class="col-lg-2 d-flex">
                            <asp:DropDownList ID="DropDownList4" CssClass="form-control" runat="server">
                                <asp:ListItem CssClass="form-control">New Ref.</asp:ListItem>
                                <asp:ListItem CssClass="form-control">Bill Ref.</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-lg-3">
                            <asp:TextBox ID="Ref_no" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>

                        <asp:Label ID="Label8" CssClass="col-lg-2 col-form-label" runat="server" Text="Reco. Date"></asp:Label>
                        <div class="col-lg-3">
                            <asp:TextBox ID="reco_date" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <%-- row --%>
                </div>

                <div class="col-lg-6">
                    <%-- row --%>
                    <div class="row">
                        <asp:Label ID="Label4" CssClass="col-lg-3 col-form-label" runat="server" Text="Voucher Nature Type"></asp:Label>
                        <div class="col-lg-4">
                            <asp:DropDownList ID="nature_type" runat="server" selectionmode="multiple" data-silent-initial-value-set="true" name="native-select" data-search="true">
                            <asp:ListItem CssClass="form-control">General Receipt</asp:ListItem>
                            <asp:ListItem CssClass="form-control">True Value Receipt</asp:ListItem>
                            <asp:ListItem CssClass="form-control">Insurance Receipt</asp:ListItem>
                            <asp:ListItem CssClass="form-control">New Vehicle Receipt</asp:ListItem>
                            <asp:ListItem CssClass="form-control">WorkShop/BodyShop Receipt</asp:ListItem>
                        </asp:DropDownList>
                        </div>
                     </div>
                    <%-- row --%>
                    <div class="row">
                        <asp:Label ID="Label9" CssClass="col-lg-3 col-form-label" runat="server" Text="DMS Receipt No."></asp:Label>
                        <div class="col-lg-4">
                            <asp:TextBox ID="DMS_recpt" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <%-- row --%>
                    <%-- row --%>
                    <div class="row">
                        <asp:Label ID="Label6" CssClass="col-lg-3 col-form-label" runat="server" Text="Ledg Closing Balance"></asp:Label>
                        <div class="col-lg-9">
                        
                            <textarea id="Ledg_closing_bal" cols="70" rows="3" class="form-control"></textarea>
                        </div>
                    </div>
                    <%-- row --%>

                </div>
            </div>


            <asp:Panel ID="Panel1" runat="server" CssClass="panel-section">
                <div class="section-first p-3 Acc-header">
                    <%-- row --%>

                    <div class="row">
                        <div class="col-1">
                            <asp:Label ID="Label10" CssClass="col-form-label" runat="server" Text="To/By"></asp:Label>
                        </div>

                        <div class="col-2">
                            <asp:Label ID="Label11" CssClass="col-form-label" runat="server" Text="Ledger Account"></asp:Label>
                        </div>

                        <div class="col-2">
                            <asp:Label ID="Label12" CssClass="col-form-label" runat="server" Text="Posting Branch"></asp:Label>
                        </div>

                        <div class="col-1">
                            <asp:Label ID="Label13" CssClass="col-form-label" runat="server" Text="Cr Amount"></asp:Label>
                        </div>

                        <div class="col-1">
                            <asp:Label ID="Label14" CssClass="col-form-label" runat="server" Text="Method of Adj."></asp:Label>
                        </div>

                        <div class="col-2">
                            <asp:Label ID="Label15" CssClass="col-form-label" runat="server" Text="Instrument Type"></asp:Label>
                        </div>

                        <div class="col-2">
                            <asp:Label ID="Label16" CssClass="col-form-label" runat="server" Text="Instrument No"></asp:Label>
                        </div>

                        <div class="col-1">
                            <asp:Label ID="Label17" CssClass="col-form-label" runat="server" Text="Date"></asp:Label>
                        </div>
                    </div>

                    <%-- row --%>
                </div>
                <div class="row">
                    <div class="col-12 input-grid">
                        <asp:DropDownList ID="DropDownList1" CssClass="form-control input1" runat="server">
                            <asp:ListItem>To</asp:ListItem>
                            <asp:ListItem>BY</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="Ledg_acc" CssClass="input2" runat="server" selectionmode="multiple" data-silent-initial-value-set="true" name="native-select" data-search="true"></asp:DropDownList>
                        <asp:DropDownList ID="Post_branch" CssClass="input3" runat="server" selectionmode="multiple" data-silent-initial-value-set="true" name="native-select" data-search="true"></asp:DropDownList>
                        <asp:TextBox ID="TextBox14" CssClass="form-control input4" runat="server"></asp:TextBox>
                        <asp:DropDownList ID="DropDownList2" CssClass="form-control input5" runat="server">
                            <asp:ListItem CssClass="form-control">On Account</asp:ListItem>
                            <asp:ListItem CssClass="form-control">Advanced</asp:ListItem>
                            <asp:ListItem CssClass="form-control">Bill Ref.</asp:ListItem>
                            <asp:ListItem CssClass="form-control">New Ref.</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="Inst_type" CssClass="input6" runat="server" selectionmode="multiple" data-silent-initial-value-set="true" name="native-select" data-search="true"></asp:DropDownList>
                        <asp:TextBox ID="Inst_no" CssClass="form-control input7" runat="server"></asp:TextBox>
                        <asp:TextBox ID="date" CssClass="form-control input8" runat="server"></asp:TextBox>
                    </div>
                </div>

                <%-- row --%>

                <div class="row">
                    <div class="col-4 d-flex">
                        <asp:Button ID="voucher_img" runat="server" CssClass="btn btn-primary voucher-img" Text="Voucher Image" />
                        <asp:Button ID="bank_dtl" runat="server" CssClass="btn btn-primary bank-dtl" Text="Bank Details" />
                    </div>

                    <div class="col-7 d-flex">
                        <asp:Label ID="Label18" CssClass="col-form-label" style="width:126px; text-align:end; padding-right:6px; height:33px;" runat="server" Text="Narration"></asp:Label>
                        <asp:TextBox ID="narr" CssClass="form-control narr" runat="server"></asp:TextBox>
                    </div>

                    <div class="col-1">
                        <asp:Label ID="Label19" CssClass="col-form-label" runat="server" Text="(Shift+Ctrl+N)"></asp:Label>
                    </div>
                </div>

            </asp:Panel>

            <asp:Panel ID="Panel2" runat="server" CssClass="grid-panel">
                <asp:GridView ID="GridView1" runat="server"></asp:GridView>
            </asp:Panel>

            <asp:Panel ID="Panel3" runat="server" CssClass="bottom-panel section-first">

                <div class="row">
                    <div class="col-1 mt-2">
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                        <asp:Label ID="Label28" CssClass="col-form-labe mt-2 small-font" runat="server" Text="Hypothecation"></asp:Label>
                    </div>

                    <div class="col-2 d-flex">
                        <asp:Label ID="Label20" CssClass="col-form-label" runat="server" Text="Bank"></asp:Label>
                        <asp:TextBox ID="TextBox19" CssClass="form-control bfield" runat="server"></asp:TextBox>
                    </div>

                    <div class="col-2 d-flex">
                        <asp:Label ID="Label21" CssClass="col-form-label" runat="server" Text="Branch"></asp:Label>
                        <asp:TextBox ID="TextBox20" CssClass="form-control bfield" runat="server"></asp:TextBox>
                    </div>

                    <div class="col-3 mt-2">
                        <asp:CheckBox ID="CheckBox2" runat="server" />
                        <asp:Label ID="Label22" CssClass="col-form-labe mt-2 pe-1 small-font" runat="server" Text="Print Bill Details"></asp:Label>

                        <asp:CheckBox ID="CheckBox3" runat="server" />
                        <asp:Label ID="Label23" CssClass="col-form-labe mt-2 small-font" runat="server" Text="Print Ledg Narration"></asp:Label>
                    </div>

                    <div class="col-2 d-flex">
                        <asp:Label ID="Label26" CssClass="col-form-label" runat="server" Text="Dr."></asp:Label>
                        <asp:TextBox ID="TextBox24" CssClass="form-control bfield" runat="server"></asp:TextBox>
                    </div>

                    <div class="col-2 d-flex">
                        <asp:Label ID="Label27" CssClass="col-form-label" runat="server" Text="Cr."></asp:Label>
                        <asp:TextBox ID="TextBox25" CssClass="form-control bfield" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="row mt-2">
                    <div class="col-5 btn-section">
                        <div class="img-box">
                            <asp:ImageButton ID="ImageButton1" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Save.png"  />
                            <asp:Label ID="Label24" CssClass="col-form-label img-lbl" runat="server" Text="Save"></asp:Label>
                        </div>
                        <div class="img-box">
                            <asp:ImageButton ID="ImageButton2" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Update.png" />
                            <asp:Label ID="Label25" CssClass="col-form-label img-lbl" runat="server" Text="Update"></asp:Label>
                        </div>
                        
                        <div class="img-box">
                            <asp:ImageButton ID="ImageButton5" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Cancel.png" />
                            <asp:Label ID="Label216" CssClass="col-form-label img-lbl" runat="server" Text="Cancel"></asp:Label>
                        </div>
                        <div class="img-box">
                            <asp:ImageButton ID="ImageButton3" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Reset.png" />
                            <asp:Label ID="Label271" CssClass="col-form-label img-lbl" runat="server" Text="Reset"></asp:Label>
                        </div>
                        
                        <div class="img-box">
                            <asp:ImageButton ID="ImageButton4" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Delete.png" />
                            <asp:Label ID="Label2731" CssClass="col-form-label img-lbl" runat="server" Text="Delete"></asp:Label>
                        </div>
                        
                        <div class="img-box">
                            <asp:ImageButton ID="ImageButton6" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Exit.png" />
                            <asp:Label ID="Label2741" CssClass="col-form-label img-lbl" runat="server" Text="Exit"></asp:Label>
                        </div>
                        
                        <div class="img-box">
                            <asp:ImageButton ID="ImageButton7" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Print.png" />
                            <asp:Label ID="Label27451" CssClass="col-form-label img-lbl" runat="server" Text="Print"></asp:Label>
                        </div>
                    </div>

                    <div class="col-7">
                        <textarea id="TextArea1" cols="83" rows="2" class="form-control"></textarea>
                    </div>
                </div>
            </asp:Panel>
        </div>

    <%--<%-- using from search data start  (only) --%>
<script type="text/javascript" src="../../JS/ListSelect/virtual-select.min.js"></script>
<script>
    VirtualSelect.init({
        ele: '#ContentPlaceHolder1_nature_type'
    });

    VirtualSelect.init({
        ele: '#ContentPlaceHolder1_Book_name'
    });

    VirtualSelect.init({
        ele: '#ContentPlaceHolder1_CashbankAcc'
    });

    VirtualSelect.init({
        ele: '#ContentPlaceHolder1_Ledg_acc'
    });

    VirtualSelect.init({
        ele: '#ContentPlaceHolder1_Post_branch'
    });

    VirtualSelect.init({
        ele: '#ContentPlaceHolder1_Inst_type'
    });
</script>
</asp:Content>
