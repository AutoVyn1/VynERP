<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AutovynModules/AUTOVYN.Master" CodeBehind="Print_Slip.aspx.vb" Inherits="AutovynERP.Print_Slip" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <style>

      *{
        font-size: 15px;
      }
      .disable{
          border:none;
          background-color:antiquewhite;
      }
      .fixed-top{
          display:none;
      }
      .fixed-bottom{
          display:none;
      }
      .col-md-2{
          background-color:#e9ebea;
      }
page {
  background: white;
  display: block;
  margin: 0 auto;
  margin-bottom: 0.5cm;
  border:0.6px solid silver;
}
page[size="A4"] {  
  width: 21cm;
  height: 26.7cm; 
}
page[size="A4"][layout="landscape"] {
  width: 29.7cm;
  height: 21cm;  
}
page[size="A3"] {
  width: 29.7cm;
  height: 42cm;
}
page[size="A3"][layout="landscape"] {
  width: 42cm;
  height: 29.7cm;  
}
page[size="A5"] {
  width: 14.8cm;
  height: 21cm;
}
page[size="A5"][layout="landscape"] {
  width: 21cm;
  height: 14.8cm;  
}
@media print {
  body, page {
    margin: 0;
    box-shadow: 0;
  }
}
      
  
.invoice {
    background: #fff;
   
}

.invoice-company {
    font-size: 12px;
}

.invoice-header {
   
    background: #f0f3f4;
    padding: 2px
}

.invoice-date,
.invoice-from,
.invoice-to {
    display: table-cell;
    width: 1%
}

.invoice-from,
.invoice-to {
    padding-right: 20px
}

.invoice-date .date,
.invoice-from strong,
.invoice-to strong {
    font-size: 16px;
    font-weight: 600
}

.invoice-date {
    text-align: right;
    padding-left: 20px
}

.invoice-price {
    background: #f0f3f4;
    display: table;
    width: 100%
}

.invoice-price .invoice-price-left,
.invoice-price .invoice-price-right {
    display: table-cell;
    padding: 20px;
    font-size: 20px;
    font-weight: 600;
    width: 75%;
    position: relative;
    vertical-align: middle
}

.invoice-price .invoice-price-left .sub-price {
    display: table-cell;
    vertical-align: middle;
    padding: 0 20px
}

.invoice-price small {
    font-size: 12px;
    font-weight: 400;
    display: block
}

.invoice-price .invoice-price-row {
    display: table;
    float: left
}

.invoice-price .invoice-price-right {
    width: 25%;
    background: #2d353c;
    color: #fff;
    font-size: 28px;
    text-align: right;
    vertical-align: bottom;
    font-weight: 300
}

.invoice-price .invoice-price-right small {
    display: block;
    opacity: .6;
    position: absolute;
    top: 10px;
    left: 10px;
    font-size: 12px
}

.invoice-footer {
    border-top: 1px solid #ddd;
    padding-top: 10px;
    font-size: 10px
}

.invoice-note {
    color: #999;
    margin-top: 80px;
    font-size: 85%
}

.invoice>div:not(.invoice-footer) {
    margin-bottom: 6px
}

.btn.btn-white, .btn.btn-white.disabled, .btn.btn-white.disabled:focus, .btn.btn-white.disabled:hover, .btn.btn-white[disabled], .btn.btn-white[disabled]:focus, .btn.btn-white[disabled]:hover {
    color: #2d353c;
    background: #fff;
    border-color: #d9dfe3;
}
.line{
  margin: 1rem 0;
    color: inherit;
    color: black;
    border: 0;
    border-top: 1px solid;
    opacity: 1.25;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <page size="A4">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet"/>
    <div class="container">
       <div class="section-first pt-0 ">
                <div class="raw text-center">
                    <h3>Fuel Voucher</h3>
                </div>

            </div>
        <div class="container-fluid ms-3">

        <div class="row" >
            <asp:Label ID="Label12" CssClass="col-md-2  " runat="server" Text="Label">Slip No.</asp:Label>
                                <div class="col-md-8 disable">
                                    <asp:TextBox ID="slipno" CssClass="disable " ReadOnly="true" runat="server"></asp:TextBox>
                                </div>
</div>
        <div class="row mt-3">
             <asp:Label ID="Label1" CssClass="col-md-2" runat="server" Text="Label">Slip Date</asp:Label>
                                <div class="col-md-8 disable">
                                    <asp:TextBox ID="slipdate" CssClass="disable " ReadOnly="true" runat="server"></asp:TextBox>
                                </div>
        </div>
           
        

        <div class="row mt-3" >
            <asp:Label ID="dms_inv" CssClass="col-md-2  " runat="server" Text="Label">DMS Inv No.</asp:Label>
                                <div class="col-md-8 disable">
                                    <asp:TextBox ID="dmsno" CssClass="disable " ReadOnly="true" runat="server"></asp:TextBox>
                                </div>
                                </div>

        

        <div class="row mt-3" >
            <asp:Label ID="deldate1" CssClass="col-md-2  " runat="server" Text="Label">Del. Date</asp:Label>
                                <div class="col-md-8 disable">
                                    <asp:TextBox ID="deldate" CssClass="disable " ReadOnly="true" runat="server"></asp:TextBox>
                                </div>

            
        </div>

        <div class="row mt-3" >
            <asp:Label ID="gpno1" CssClass="col-md-2  " runat="server" Text="Label">Gate Pass  No.</asp:Label>
                                <div class="col-md-8 disable">
                                    <asp:TextBox ID="gpno" CssClass="disable " ReadOnly="true" runat="server"></asp:TextBox>
                                </div>
                                </div>

        <div class="row mt-3" >

            <asp:Label ID="gpdate1" CssClass="col-md-2" runat="server" Text="Label">Gate Pass Date</asp:Label>
                                <div class="col-md-8 disable">
                                    <asp:TextBox ID="gpdate" CssClass="disable " ReadOnly="true" runat="server"></asp:TextBox>
                                </div>
        </div>

        <div class="row mt-3" >

            <asp:Label ID="Label7" CssClass="col-md-2" runat="server" Text="Label">Fuel Type</asp:Label>
                                <div class="col-md-8 disable">
                                    <asp:TextBox ID="ftype" CssClass="disable " ReadOnly="true" runat="server"></asp:TextBox>
                                </div>
        </div>

        
        <div class="row mt-3" >

            <asp:Label ID="Label8" CssClass="col-md-2" runat="server" Text="Label">Fuel Qty(LTR)</asp:Label>
                                <div class="col-md-8 disable">
                                    <asp:TextBox ID="fqty" CssClass="disable " ReadOnly="true" runat="server"></asp:TextBox>
                                </div>
        </div>

            <div class="row " style="margin-top:407px" >
                <div class="col-6">
                    <asp:Label ID="AUTHORITY" CssClass="col-md-4 disable" runat="server" Text="Authority sign ">Authority sign</asp:Label>
                </div>
            <div class="col-6">
                <asp:Label ID="Label3" CssClass="col-md-4" runat="server" Text="Authority sign ">print date</asp:Label>

              <asp:TextBox ID="print_date"  CssClass="disable " ReadOnly="true" runat="server"></asp:TextBox>  
            </div>
              
        </div>
        </div>

    </div>
</page>

</asp:Content>
