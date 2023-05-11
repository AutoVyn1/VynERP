<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AutovynModules/AUTOVYN.Master" CodeBehind="SalesDiscountApprovalReport.aspx.vb" Inherits="AutovynERP.SalesDiscountApprovalReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Virtual Select List Box -->
    <link rel="stylesheet" href="../JS/ListSelect/virtual-select.min.css" />
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: 'Dosis', sans-serif;
        }

        body{
            background-color:#fffaec;
            font-size:13px;
        }

        
        .main-section {
            margin-top: 50px;
        }

        .main-head{
            text-align:center;
            font-size:24px;
            font-weight:700;

        }
        .section-first{
            padding:10px 9px;
            border-radius: 4px;
            background-color: #cde7cd;
            margin:1px 0;
            box-shadow: 0px 2px 6px -1px rgba(0,0,0,0.75);
            -webkit-box-shadow: 0px 2px 6px -1px rgba(0,0,0,0.75);
            -moz-box-shadow: 0px 2px 6px -1px rgba(0,0,0,0.75);
        }

         .section-half{
            padding:5px 9px;
            border-radius: 4px;
            background-color: #cde7cd;
            margin:1px 0;
            box-shadow: 0px 2px 6px -1px rgba(0,0,0,0.75);
            -webkit-box-shadow: 0px 2px 0px -1px rgba(0,0,0,0.75);
            -moz-box-shadow: 0px 2px 6px -1px rgba(0,0,0,0.75);

        }

        .sub-head{
            color:royalblue;
            font-size:16px;
            font-weight:700;
        }

        .spbtn{
            width: 80%;
            background-color: #65ad65;
            color: #fff;
            font-size: 12px;
            font-weight: 600;
        }


    .salesData{
            height:400px;
            padding:0;
        }

    .table{
        font-size:14px !important;
        margin:0;
    }

    .btn-sec{
        margin:auto;

    }

    .sales-grid{
            height:60vh;
        }

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
        background-color: #a7e2cb;
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


          @media screen and (max-width:820px) {

             .amt-box {
                 width: 100%;
                 display: flex;
             }

             .amt-box-lbl {
                 width: 18%;
                 margin-top: 10px;
             }

             .amt-box-total {
                 width: 40%;
                 margin-top: 10px;
             }

         }

               @media screen and (max-width:480px) {
                   .spbtn {
                width: 100%;
                height: 29px;
                margin: 0px;
                font-size: 10px;
                padding: 0px;
            }

            ::-webkit-scrollbar {
                display: none;
            }
            
                   .form-control{
                       height:29px;
                       font-size:12px;
                   }
            .amt-box {
                width: 100%;
                display: flex;
            }

            .amt-box-lbl {
                width: 24%;
                margin-top: 10px;
                font-size:10px;
            }

            .amt-box-total {
                width: 38%;
                margin-top: 10px;
            }
        }

        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid main-section">
            <div class="section-first mt-2">
                <div class="row mb-1">
                    <span class="main-head">Sales Approval Report</span>
                </div>
            </div>

            <div class="row">

                <%-- Form sections --%>
                <div class="col-lg-12">
                    <%-- Tabs --%>
                    <div class="section-first">
                        <!-- row -->
                        <div class="row mb-1 amt-box">
                            <asp:Label ID="Label123" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Date Range"></asp:Label>
                            <div class="col-lg-2 amt-box-total">
                                <asp:TextBox ID="date_form" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>

                            <div class="col-lg-2 amt-box-total">
                                <asp:TextBox ID="date_upto" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>

                            <asp:Label ID="Label20" CssClass="col-lg-1 col-form-label amt-box-lbl" runat="server" Text="Status"></asp:Label>
                            <div class="col-lg-2 amt-box-total">
                                <asp:DropDownList ID="appr_status" CssClass="form-control" runat="server">
                                    <asp:ListItem>Status</asp:ListItem>
                                    <asp:ListItem>Approve</asp:ListItem>
                                    <asp:ListItem>Reject</asp:ListItem>
                                    <asp:ListItem>Pending</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="col-lg-2 btn-sec amt-box-total">
                                <asp:Button ID="Saleshow" runat="server" Text="Show Data" CssClass="btn spbtn" />
                            </div>
                        </div>
                        <!-- row -->
                    </div>

                    <div class="section-first mt-1">
                        <!-- row -->
                        <div class="row mb-1">
                       <asp:Panel ID="GetData" runat="server" ScrollBars="Horizontal" CssClass="sales-grid">
                                       
                           <asp:GridView ID="sales_Data" runat="server" CssClass="" Style="top: 0px; border: 1px solid #6fd472; text-align: center; border-collapse: inherit; background-color: hsla(40deg, 4%, 36%, 0.25); position: relative; width: 100%; table-layout: auto;"
                            ShowHeaderWhenEmpty="True" CellPadding="3" GridLines="both" BackColor="White" PagerStyle-CssClass="myPagerStyle" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1">
                          
                            <AlternatingRowStyle BackColor="White" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="true" Font-Size="Larger" ForeColor="White" />
                            <RowStyle BackColor="#f5f5f5" />
                            <HeaderStyle BackColor="#0C4160" ForeColor="WhiteSmoke" Width="100%" />
                            <FooterStyle BackColor="#CCCCCC" />
                            <SelectedRowStyle Font-Size="Large" />
                            <HeaderStyle Font-Bold="True" ForeColor="White" Width="100%" />
                            <SelectedRowStyle BackColor="#336699" Font-Bold="True" ForeColor="White" />
                            <PagerSettings FirstPageText="1" LastPageText="last" NextPageText="next" PreviousPageText="previous" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        </asp:GridView>
                </asp:Panel>
                          
                        </div>
                        <!-- row -->
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

<script>
    $(function () {
        var inputmask = new Inputmask("99/99/9999", { placeholder: 'dd/MM/yyyy' });
        inputmask.mask($('[id*=date_form]'));
        inputmask.mask($('[id*=date_upto]'));
    });
</script>


</asp:Content>
