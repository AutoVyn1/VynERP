<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AutovynModules/AUTOVYN.Master" CodeBehind="Cashier.aspx.vb" Inherits="AutovynERP.Cashier" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: 'Ubuntu', sans-serif;
        }

        body {
            background-image: url("../../Media/loginbg.svg");
        }

        .main-section{
            margin-top:36px;
        }

        .sub-head{
            text-align: center;
                font-weight: 700;
                font-size: 24px;
                text-transform: uppercase;
        }

        .section-first {
            display: flex;
            justify-content: space-around;
            flex-direction: column;
            width: 70%;
            margin:auto;
            background:#ffffff50;
            padding: 18px 9px;
            -webkit-box-shadow: -1px -4px 22px -8px rgb(0 0 0 / 75%);
            -moz-box-shadow: -1px -4px 22px -8px rgba(0, 0, 0, 0.75);
            box-shadow: -1px 10px 4px -9px rgb(0 0 0 / 56%);
            border-radius: 10px;
        }

        .total-bal{
            border: none;
            background-color: #7fb46c;
            padding: 5px 10px;
            border-radius: 3px;
            color: #fff;
            font-weight: 600;
            font-size: 12px;
        }

        .submit-btn{
            border: none;
            background-color: #7fb46c;
            padding: 6px 54px;
            border-radius: 3px;
            color: #fff;
            font-weight: 600;
            font-size: 14px;
        }

        .form-control{
            height:30px;
        }


    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid main-section">
        <div class="section-first">
            <div class="row">
                <div class="col-lg-9 m-auto">
                    <div class="row mb-2">
                        <asp:Label ID="Label5" CssClass="col-form-label sub-head" runat="server" Text="Cashier Data"></asp:Label>
                    </div>
                    <div class="row">
                        <!-- row -->
                        <div class="row mt-1">
                            <asp:Label ID="Label19" CssClass="col-lg-3 col-form-label" runat="server" Text="Cash Ledg"></asp:Label>
                            <div class="col-lg-6">
                                <asp:TextBox ID="Cash_Ledg" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row mt-1">
                            <asp:Label ID="Label1" CssClass="col-lg-3 col-form-label" runat="server" Text="Cashier Id"></asp:Label>
                            <div class="col-lg-6">
                                <asp:TextBox ID="cashier_id" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                            </div>

                        </div>
                        <!-- row -->


                        <!-- row -->
                        <div class="row mt-1">
                            <asp:Label ID="Label2" CssClass="col-lg-3 col-form-label" runat="server" Text="Ledger Code"></asp:Label>
                            <div class="col-lg-6">
                                <asp:TextBox ID="ledg_code" runat="server" Enabled="false" CssClass="form-control" ></asp:TextBox>
                            </div>
                        </div>

                        <!-- row -->
                        <div class="row mt-1">
                            <asp:Label ID="Label3" CssClass="col-lg-3 col-form-label" runat="server" Text="Enter Date"></asp:Label>
                            <div class="col-lg-6">
                                <asp:TextBox ID="enterdate"  runat="server" TextMode="Date" CssClass="form-control" ></asp:TextBox>
                            </div>
                        </div>
                        <!-- row -->


                        <!-- row -->
                        <div class="row mt-1">
                            <asp:Label ID="Label4" CssClass="col-lg-3 col-form-label" runat="server" Text="Amount"></asp:Label>
                            <div class="col-lg-6">
                                <asp:TextBox ID="amount" runat="server" CssClass="form-control" ></asp:TextBox>
                            </div>
                        </div>

        <!-- row -->
                        <div class="row mt-1">
                            <div class="col-lg-3">
                                <asp:Label ID="cnt_2000" runat="server" CssClass="" Text="2000"></asp:Label>
                            </div>
                            <div class="col-lg-3">
                                <asp:TextBox ID="amt_2000" runat="server" CssClass="form-control" ></asp:TextBox>
                            </div>
                            <div class="col-lg-3">
                                <asp:TextBox ID="total_2000" runat="server" CssClass="form-control" Enabled="false" ></asp:TextBox>
                            </div>
                        </div>
                        <!-- row -->

                        <!-- row -->
                        <div class="row mt-1">
                            <div class="col-lg-3">
                                <asp:Label ID="cnt_500" runat="server" Text="500"></asp:Label>
                            </div>
                            <div class="col-lg-3">
                                <asp:TextBox ID="amt_500" runat="server" CssClass="form-control" ></asp:TextBox>
                            </div>
                            <div class="col-lg-3">
                                <asp:TextBox ID="total_500" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                            </div>
                        </div>
                        <!-- row -->

                        <!-- row -->
                        <div class="row mt-1">
                            <div class="col-lg-3">
                                <asp:Label ID="cnt_200" runat="server" Text="200"></asp:Label>
                            </div>
                            <div class="col-lg-3">
                                <asp:TextBox ID="amt_200" runat="server" CssClass="form-control" ></asp:TextBox>
                            </div>
                            <div class="col-lg-3">
                                <asp:TextBox ID="total_200" runat="server" CssClass="form-control" Enabled="false" ></asp:TextBox>
                            </div>
                        </div>
                        <!-- row -->

                        <!-- row -->
                        <div class="row mt-1">
                            <div class="col-lg-3">
                                <asp:Label ID="cnt_100" runat="server" Text="100"></asp:Label>
                            </div>
                            <div class="col-lg-3">
                                <asp:TextBox ID="amt_100" runat="server" CssClass="form-control" ></asp:TextBox>
                            </div>
                            <div class="col-lg-3">
                                <asp:TextBox ID="total_100" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                            </div>
                        </div>
                        <!-- row -->

                        <!-- row -->
                        <div class="row mt-1">
                            <div class="col-lg-3">
                                <asp:Label ID="cnt_50" runat="server" Text="50"></asp:Label>
                            </div>
                            <div class="col-lg-3">
                                <asp:TextBox ID="amt_50" runat="server" CssClass="form-control" ></asp:TextBox>
                            </div>
                            <div class="col-lg-3">
                                <asp:TextBox ID="total_50" runat="server" CssClass="form-control" Enabled="false" ></asp:TextBox>
                            </div>
                        </div>
                        <!-- row -->

                        <!-- row -->
                        <div class="row mt-1">
                            <div class="col-lg-3">
                                <asp:Label ID="cnt_20" runat="server" Text="20"></asp:Label>
                            </div>
                            <div class="col-lg-3">
                                <asp:TextBox ID="amt_20" runat="server" CssClass="form-control" ></asp:TextBox>
                            </div>
                            <div class="col-lg-3">
                                <asp:TextBox ID="total_20" runat="server" CssClass="form-control" Enabled="false" ></asp:TextBox>
                            </div>
                        </div>
                        <!-- row -->

                        <!-- row -->
                        <div class="row mt-1">
                            <div class="col-lg-3">
                                <asp:Label ID="cnt_10" runat="server" Text="10"></asp:Label>
                            </div>
                            <div class="col-lg-3">
                                <asp:TextBox ID="amt_10" runat="server" CssClass="form-control" ></asp:TextBox>
                            </div>
                            <div class="col-lg-3">
                                <asp:TextBox ID="total_10" runat="server" CssClass="form-control" Enabled="false" ></asp:TextBox>
                            </div>
                        </div>
                        <!-- row -->

                        <!-- row -->
                        <div class="row mt-1">
                            <div class="col-lg-3">
                                <asp:Label ID="Label6" runat="server" Text="Total Balance "></asp:Label>
                            </div>
                            <div class="col-lg-6">
                                <asp:TextBox ID="total_bal" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                            </div>
                        </div>
                        <!-- row -->

                        <!-- row -->
                        <div class="row mt-2">
                            <div class="col-lg-12 mt-3" style="text-align:center;">
                                <asp:Button ID="Submitcash" runat="server" Text="Submit Cash" CssClass="submit-btn" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script>
    function updateTotal(id) {
        var qtyInput = document.getElementById('ContentPlaceHolder1_amt_' + id);
        var labelValue = parseFloat(document.getElementById('ContentPlaceHolder1_cnt_' + id).innerText);
        var totalInput = document.getElementById('ContentPlaceHolder1_total_' + id);
        qtyInput.oninput = function () {
            var qty = parseFloat(qtyInput.value) || 0; // Treat empty value as 0
            var total = qty * labelValue;
            totalInput.value = total.toFixed(2);
            updateMainTotal();
        };
    }
    function updateMainTotal() {
        var mainTotalInput = document.getElementById('ContentPlaceHolder1_total_bal');
        var total = 0;

        [2000, 500, 200, 100, 50, 20, 10].forEach(function (id) {
            var totalInput = document.getElementById('ContentPlaceHolder1_total_' + id);
            if (totalInput.value) {
                total += parseFloat(totalInput.value);
            }
        });
        mainTotalInput.value = total.toFixed(2);
    }

    [2000, 500, 200, 100, 50, 20, 10].forEach(function (id) {
        updateTotal(id);
    });
</script>
</asp:Content>
