<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AutovynModules/AUTOVYN.Master" CodeBehind="WorkshopDiscount.aspx.vb" Inherits="AutovynERP.WorkshopDiscount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Virtual Select List Box -->
    <link rel="stylesheet" href="../../JS/ListSelect/virtual-select.min.css" />
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: 'Dosis', sans-serif;
        }


        .main-section {
            margin-top: 50px;
        }

        #error_message {
            background-color: red;
            color: #fff;
            font-size: 13px;
            text-align:center;
        }
        #ContentPlaceHolder1_disc_amt,#ContentPlaceHolder1_appr_amt {
            text-align:right;
        }


        body{
            background-color:#fffaec;
            font-size:13px;
        }

       

        .main-head{
            text-align:center;
            font-size:24px;
            font-weight:700;

        }

        .section-first{
            padding:10px 9px;
            border-radius: 4px;
            background-color: #a7e2cb;
            margin:1px 0;
            box-shadow: 0px 2px 6px -1px rgba(0,0,0,0.75);
            -webkit-box-shadow: 0px 2px 6px -1px rgba(0,0,0,0.75);
            -moz-box-shadow: 0px 2px 6px -1px rgba(0,0,0,0.75);
        }

         .section-half{
            padding:5px 9px;
            border-radius: 4px;
            background-color: #a7e2cb;
            margin:1px 0;
            box-shadow: 0px 2px 6px -1px rgba(0,0,0,0.75);
            -webkit-box-shadow: 0px 2px 0px -1px rgba(0,0,0,0.75);
            -moz-box-shadow: 0px 2px 6px -1px rgba(0,0,0,0.75);

        }

         .form-control{
             height:30px;
         }

        .sub-head{
            color:royalblue;
            font-size:16px;
            font-weight:700;
        }

        .spbtn{
            width: 15%;
            background-color: #65ad65;
            color: #fff;
            font-size: 12px;
            font-weight: 600;
        }

        @media screen and (max-width:480px) {
            .button-sactions {
                display: flex;
            }

            .img-box {
                margin: 14px 8px;
            }

            .spbtn {
                width: 30%;
            }
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
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid main-section">

            <div class="section-first">
                <!-- row -->
                <div class="row mb-1">
                    <span class="main-head">Workshop Discount Approval</span>
                </div>
                <!-- row -->
                <!-- row -->
                <div class="row mb-1">
                    <asp:Label ID="Label123" CssClass="col-lg-1 col-form-label" runat="server" Text="Cust Name"></asp:Label>
                    <div class="col-lg-2">
                        <asp:TextBox ID="cust_name" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <asp:Label ID="label1111" CssClass="col-lg-1 col-form-label" runat="server" Text="Mobile No."></asp:Label>
                    <div class="col-lg-2">
                        <asp:TextBox ID="Mobile_no" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="col-lg-3">
                        <div id="error_message"></div>
                    </div>

                    <asp:Label ID="Label14" CssClass="col-lg-1 col-form-label" runat="server" Text="Date"></asp:Label>
                    <div class="col-lg-2">
                        <asp:TextBox ID="curr_date" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox>
                    </div>
                </div>
                <!-- row -->

                <!-- row -->
                <div class="row mb-1">
                    <asp:Label ID="Label125" CssClass="col-lg-1 col-form-label" runat="server" Text="Email"></asp:Label>
                    <div class="col-lg-2">
                        <asp:TextBox ID="email" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <asp:Label ID="Label1" CssClass="col-lg-1 col-form-label" runat="server" Text="Job Card No"></asp:Label>
                    <div class="col-lg-2">
                        <asp:TextBox ID="job_card" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <asp:Label ID="Label2" CssClass="col-lg-1 col-form-label" runat="server" Text="Bill No"></asp:Label>
                    <div class="col-lg-2">
                        <asp:TextBox ID="bill_no" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <asp:Label ID="Label4" CssClass="col-lg-1 col-form-label" runat="server" Text="Invoice Type"></asp:Label>
                            <div class="col-lg-2">
                                <asp:DropDownList ID="inv_type" CssClass="form-control" runat="server">
                                    <asp:ListItem>Workshop</asp:ListItem>
                                    <asp:ListItem>Bodyshop</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                </div>
            </div>



        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-11">

            <div class="section-first mt-2">
                <div class="row">
                    <%--  --%>
                    <div class="col-lg-12">
                        <div class="row">

                            <asp:Label ID="label15" CssClass="col-lg-1 col-form-label" runat="server" Text="Branch"></asp:Label>
                            <div class="col-lg-2">
                                <asp:DropDownList ID="branch" runat="server" selectionmode="multiple" data-silent-initial-value-set="true" name="native-select" data-search="true"></asp:DropDownList>
                            </div>

                            <asp:Label ID="Label10" CssClass="col-lg-1 col-form-label" runat="server" Text="Service Advisor"></asp:Label>
                            <div class="col-lg-2">
                                <asp:TextBox ID="service_ad" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>

                            <asp:Label ID="label6" CssClass="col-lg-1 col-form-label" runat="server" Text="Model variant"></asp:Label>
                            <div class="col-lg-2">
                                <asp:DropDownList ID="modl_varient" runat="server"  selectionmode="multiple" data-silent-initial-value-set="true" name="native-select" data-search="true"></asp:DropDownList>
                            </div>

                        </div>


                        <div class="row mt-1">
                            <asp:Label ID="Label7" CssClass="col-lg-1 col-form-label" runat="server" Text="Discount Type"></asp:Label>
                            <div class="col-lg-2">
                                <asp:DropDownList ID="disc_type" CssClass="form-control" runat="server">
                                    <asp:ListItem>Additional Discount</asp:ListItem>
                                    <asp:ListItem></asp:ListItem>
                                    <asp:ListItem></asp:ListItem>
                                    <asp:ListItem></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <asp:Label ID="Label8" CssClass="col-lg-1 col-form-label" runat="server" Text="Invoice Vlaue"></asp:Label>
                            <div class="col-lg-2">
                                <asp:TextBox ID="inv_val" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>

                            
                        </div>
                     </div>
                 </div>
            </div>

            <%--  --%>

            <div class="container-fluid mt-2">
                <div class="row d-flex justify-content-between">
                    <div class="col-lg-12 section-first">
                        <!-- row -->
                        <div class="row mb-1">
                            <span class="sub-head">Discount  Offers</span>
                        </div>
                        <!-- row -->

                        <div class="row mb-1">
                            <asp:Label ID="Label113" CssClass="col-lg-1 col-form-label" runat="server" Text="Disc. Amount"></asp:Label>
                            <div class="col-lg-2">
                                <asp:TextBox ID="disc_amt" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>

                            <asp:Label ID="Label1566" CssClass="col-lg-1 col-form-label" runat="server" Text="Disc. Reason"></asp:Label>
                            <div class="col-lg-5">
                                <asp:TextBox ID="disc_reason" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>

                            <asp:Label ID="Label9" CssClass="col-lg-1 col-form-label" runat="server" Text="Approval Name"></asp:Label>
                            <div class="col-lg-2">
                                <asp:TextBox ID="appr_name" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="container-fluid section-first mt-2">
                <div class="row">
                    <div class="col-12">
                         <!-- row -->
                        <div class="row mb-1">
                            <span class="sub-head">Approval</span>
                        </div>
                        <!-- row -->

                        <!-- row -->
                        <div class="row mb-1">
                            <asp:Label ID="Label19" CssClass="col-lg-1 col-form-label" runat="server" Text="Amount"></asp:Label>
                            <div class="col-lg-2">
                                <asp:TextBox ID="appr_amt" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>

                            <asp:Label ID="Label20" CssClass="col-lg-1 col-form-label" runat="server" Text="Status"></asp:Label>
                            <div class="col-lg-2">
                                <asp:DropDownList ID="appr_status" CssClass="form-control" runat="server">
                                    <asp:ListItem>Approve</asp:ListItem>
                                    <asp:ListItem>Reject</asp:ListItem>
                                    <asp:ListItem>Hold</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <asp:Label ID="Label21" CssClass="col-lg-1 col-form-label" runat="server" Text="Remark"></asp:Label>
                            <div class="col-lg-5">
                                <asp:TextBox ID="remark" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

                </div>
                    <%-- Buttons sections --%>
                   <div class="col-lg-1 button-sactions" style="background-color: #a7e2cb;">
                            <div class="img-box">
                                <asp:ImageButton ID="Save_Data" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Save.png"/>
                                <asp:Label ID="Label124" CssClass="col-form-label img-lbl" runat="server"  Text="Save"></asp:Label>
                            </div>

                            <div class="img-box">
                                <asp:ImageButton ID="ImageButton2" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Update.png" />
                                <asp:Label ID="Label231" CssClass="col-form-label img-lbl" runat="server"  Text="Update"></asp:Label>
                            </div>

                            <div class="img-box">
                                <asp:ImageButton ID="ImageButton3" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Reset.png" />
                                <asp:Label ID="Label232" CssClass="col-form-label img-lbl" runat="server"  Text="Reset"></asp:Label>
                            </div>

                            <div class="img-box">
                                <asp:ImageButton ID="ImageButton4" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Delete.png" />
                                <asp:Label ID="Label233" CssClass="col-form-label img-lbl" runat="server"  Text="Delete"></asp:Label>
                            </div>

                            <div class="img-box">
                                <asp:ImageButton ID="ImageButton6" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Exit.png" />
                                <asp:Label ID="Label234" CssClass="col-form-label img-lbl" runat="server"  Text="Exit"></asp:Label>
                            </div>


                            <div class="img-box">
                                <asp:ImageButton ID="Print_data" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Print.png" />
                                <asp:Label ID="Label235" CssClass="col-form-label img-lbl" runat="server"  Text="Print"></asp:Label>
                            </div>
                </div>
            </div>
        </div>

        <%--*******************************--%>
 </div>

<script type="text/javascript" src="../../JS/ListSelect/virtual-select.min.js"></script>

<script>
    VirtualSelect.init({
        ele: '#ContentPlaceHolder1_branch',
        showOptionsOnlyOnSearch: true
    });

    VirtualSelect.init({
        ele: '#ContentPlaceHolder1_modl_varient',
        showOptionsOnlyOnSearch: true
    });

</script>
<!-- InputMask -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/inputmask/inputmask.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/inputmask/inputmask.date.extensions.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/inputmask/inputmask.extensions.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/css/inputmask.css" />

<script>
    $(function () {
        var inputmask = new Inputmask("99/99/9999", { placeholder: 'dd/mm/yyyy' });
        inputmask.mask($('[id*=curr_date]'));
    });
</script>

<script>
    $(document).ready(function () {
        $("#ContentPlaceHolder1_Mobile_no").keyup(function (e) {
            if ($(this).val().match(/[^0-9]/g, '')) {
                $("#error_message").html("Digits Only").show().fadeOut("slow");
                $(this).val($(this).val().replace(/[^0-9]/g, ''));
                console.log("=====")
                errorflag = 1;
            } else {
                console.log("==tt===")
            }
        });
        $("#ContentPlaceHolder1_Mobile_no").bind('paste', function (e) {
            setTimeout(function () { $(this).keyup(); }, 30);
        });

        $("#ContentPlaceHolder1_disc_amt").keyup(function (e) {
            if ($(this).val().match(/[^0-9]/g, '')) {
                $("#error_message").html("Digits Only").show().fadeOut("slow");
                $(this).val($(this).val().replace(/[^0-9]/g, ''));
                console.log("=====")
                errorflag = 1;
            } else {
                console.log("==tt===")
            }
        });
        $("#ContentPlaceHolder1_disc_amt").bind('paste', function (e) {
            setTimeout(function () { $(this).keyup(); }, 30);
        });

        $("#ContentPlaceHolder1_appr_amt").keyup(function (e) {
            if ($(this).val().match(/[^0-9]/g, '')) {
                $("#error_message").html("Digits Only").show().fadeOut("slow");
                $(this).val($(this).val().replace(/[^0-9]/g, ''));
                console.log("=====")
                errorflag = 1;
            } else {
                console.log("==tt===")
            }
        });
        $("#ContentPlaceHolder1_appr_amt").bind('paste', function (e) {
            setTimeout(function () { $(this).keyup(); }, 30);
        });
    });
</script>


</asp:Content>
