<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AutovynModules/AUTOVYN.Master" CodeBehind="WorkshopDiscountApprovalReport.aspx.vb" Inherits="AutovynERP.WorkshopDiscountApprovalReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Virtual Select List Box -->
    <link rel="stylesheet" href="../JS/ListSelect/virtual-select.min.css" />

    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: 'Dosis', sans-serif;
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


        .table {
            font-size: 14px !important;
            margin: 0;
        }

        .btn-sec {
            margin: auto;
        }

        @media screen and (max-width:480px) {
            .spbtn {
                width: 30%;
            }
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid main-section">
            <div class="section-first mt-2">
                <div class="row mb-1">
                    <span class="main-head">Workshop Discount Approval Report</span>
                </div>
            </div>


            <div class="section-first">
                <!-- row -->
                <div class="row mb-1">
                    <asp:Label ID="Label123" CssClass="col-lg-1 col-form-label" runat="server" Text="Date Form"></asp:Label>
                    <div class="col-lg-2">
                        <asp:TextBox ID="date_form" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <asp:Label ID="label1111" CssClass="col-lg-1 col-form-label" runat="server" Text="Date Upto"></asp:Label>
                    <div class="col-lg-2">
                        <asp:TextBox ID="date_upto" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <asp:Label ID="Label20" CssClass="col-lg-1 col-form-label" runat="server" Text="Status"></asp:Label>
                    <div class="col-lg-2">
                        <asp:DropDownList ID="appr_status" CssClass="form-control" runat="server">
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem>Approve</asp:ListItem>
                            <asp:ListItem>Reject</asp:ListItem>
                            <asp:ListItem>Hold</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="col-lg-1"></div>
                    <div class="col-lg-2 btn-sec">
                        <asp:Button ID="workshop" runat="server" Text="Show Data" CssClass="btn spbtn" />
                    </div>
                </div>
                <!-- row -->
            </div>

            <div class="section-first mt-1">
                <!-- row -->
                <div class="row mb-1">
                    <asp:Panel ID="Panel1" CssClass="grid_panel" ScrollBars="Horizontal" runat="server">
                        <asp:GridView ID="worshop_data" runat="server" CssClass="" Style="top: 0px; border: 1px solid #6fd472; text-align: center; border-collapse: inherit; background-color: hsla(40deg, 4%, 36%, 0.25); position: relative; width: 200%; table-layout: auto;"
                            ShowHeaderWhenEmpty="True" CellPadding="3" GridLines="both" PageSize="15" AllowPaging="True" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1">
                            <FooterStyle BackColor="#a7e2cb" ForeColor="Black" />
                            <HeaderStyle Font-Bold="True" ForeColor="#000" CssClass="text-center" BackColor="#e2ed91" Height="31px" Width="120%" />
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
                <!-- row -->
            </div>

        </div>
<!-- InputMask -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/inputmask/inputmask.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/inputmask/inputmask.date.extensions.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/inputmask/inputmask.extensions.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/css/inputmask.css" />

<script>
    $(function () {
        var inputmask = new Inputmask("99/99/9999", { placeholder: 'dd/mm/yyyy' });
        inputmask.mask($('[id*=date_form]'));
        inputmask.mask($('[id*=date_upto]'));
    });
</script>
</asp:Content>
