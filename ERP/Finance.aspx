<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Finance.aspx.vb" Inherits="AutovynERP.Finance1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Autovyn Cloud - Finance Approval</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="Css/finance.css" />
    <style>

        body {
    font-family: sans-serif;
    font-size: 15px;
    background: #FFE4C4;
}

.form {
    background: #FFE4C4;
    line-height: 1.6;
}

.title {
    text-align: center;
    height: 60px;
    padding-top: 15px;
    text-transform: uppercase;
}

.navigation {
    display: flex;
    justify-content: space-between;
}

/*.container {
    overflow: hidden;
}
*/
.data {
    display: flex;
}

.customer {
    display: flex;
    justify-content: space-between;
    margin: 6px;
}

.half {
    width: 50%;
}

.rightalign {
    display: flex;
    justify-content: right;
}

.finance {
    background: #FFE4C4;
}

#Remark {
    height: 40px;
}


.center {
    display: flex;
    justify-content: center;
    margin: 7px;
}

.bottombuttons {
    background: #0568d5;
    border: none;
    border-radius: 5px;
    color: white;
    margin-right: 10px;
    width: 10%;
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

.bottombuttons:hover {
    background-color: #0568d5;
}

.bottombuttons1:hover {
    background-color: #0568d5;
}

#submit {
    margin-right: 10px;
}

#clear {
    margin-left: 10px;
}

.labelleft {
    width: 20%;
}

.labelleftbg {
    width: 10%;
}

.labelleft2 {
    width: 11%;

}

.singlebox {
    width: 78.2%;
    border: 2px solid dimgray;
}

.singlebox1 {
    width: 89.2%;
    border: 2px solid dimgray;
}

.doublebox {
    border: 2px solid dimgray;
    width: 27.3%;
}

.doublebox1 {
    border: 2px solid dimgray;
    width: 48.3%;
}

.doublebox2 {
    border: 2px solid dimgray;
    width: 29%;
}




@media screen and (max-width: 1000px) {
  body {
    
  }
.labelleftbg {
    width: 12%;
}
  .half{
      width:100%;
  }
  .data{
      flex-direction:column;
  }
  .customer{
    margin: 17px;
    line-height: 2.6;
  }
  .singlebox1{
      width:78.2%
  }
}
.backbtn {
                height: 44px;
                background-color: #0476D0;
                padding: 9px;
            }
  </style>
</head>
<body>
    <form class="form" id="form1" runat="server">
         <%-- Using for mobile navigation --%>
            <div class="backbtn">
                <a href="DashboardModule.aspx">
                    <img src="../../images/backbtn.png" width="26" /></a>
            </div>
            <%-- --%>
        <div>
            <h1 class="title">Finance Approval</h1>
        </div>
        <div class="container1">
            <div class="data">
                <div class="half">
                     <div class="customer">
                        <asp:Label ID="Label34" Class="labelleft" runat="server"  Text="DMS Invoice No."></asp:Label>
                        <asp:TextBox ID="dmsinvoice"  runat="server" Class="doublebox"></asp:TextBox>

                        <asp:Label ID="Label1" Class="labelleft2" runat="server"  Text="Cust Id."></asp:Label>
                        <asp:TextBox ID="custid"  runat="server" Class="doublebox2"></asp:TextBox>
                        <asp:Button class="bottombuttons1"  ID="view" runat="server" Width="6.18%" Text="view" />
                     </div>  
                </div>
                <div class="half">
                    <div class="customer">
                        <asp:Label ID="Label36" Class="labelleft" runat="server"  Text="File No."></asp:Label>
                        <asp:TextBox ID="fileno" Class="doublebox" runat="server" ></asp:TextBox>
                        <asp:Label ID="Label37" Class="labelleft" runat="server"  Text="Date"></asp:Label>
                        <asp:TextBox ID="date1" Class="doublebox" placeholder="MM/DD/YYYY" onblur="(this.type='text')" runat="server" ></asp:TextBox>
                        </div>
                    
                </div>
            </div>
        </div>
        <div class="container2">
            <div class="user">
            <div class="customer">
                <asp:Label ID="Label5" Class="labelleftbg" runat="server"  Text="Customer Name"></asp:Label>
                <asp:TextBox ID="name" Class="singlebox1" runat="server" ></asp:TextBox>
            </div>
                </div>
            <div class="data">
                <div class="half">
                    <div class="customer">
                        <asp:Label ID="Label7"  runat="server" Class="labelleft" Text="Financier/HYP/HP"></asp:Label>
                        <asp:TextBox  ID="financierhp" runat="server" Class="singlebox"></asp:TextBox>

                    </div>
                    <div class="customer">

                        <asp:Label ID="Label9"  runat="server" Class="labelleft" Text="Fin DO Amt"></asp:Label>
                        <asp:TextBox ID="findoamt" Class="doublebox" runat="server" ></asp:TextBox>

                        <asp:Label ID="Label10" runat="server" Class="labelleft" Text="Fin Pf Chrgs"></asp:Label>
                        <asp:TextBox ID="finchrgs" Class="doublebox" runat="server" ></asp:TextBox>

                    </div>
                    <div class="customer">

                        <asp:Label ID="Label11" Class="labelleft" runat="server"  Text="Veh. Group/Code"></asp:Label>
                        <asp:TextBox ID="vehgroup"  runat="server" Class="doublebox1"></asp:TextBox>

                        <asp:TextBox ID="vehcode"  runat="server" Class="doublebox"></asp:TextBox>
                    </div>
                    <div class="customer">
                        <asp:Label ID="Label12" Class="labelleft" runat="server"  Text="VIN"></asp:Label>
                        <asp:TextBox ID="vin"  runat="server" Class="singlebox"></asp:TextBox>
                    </div>
                    
                    <div class="customer">
                        <asp:Label ID="Label13" Class="labelleft" runat="server"  Text="DMS DSE"></asp:Label>
                        <asp:TextBox ID="dmsdse"  runat="server" Class="singlebox"></asp:TextBox>
                    </div>
                    <div class="customer">
                        <asp:Label ID="Label14" Class="labelleft" runat="server"  Text="DSE TEL"></asp:Label>
                        <asp:TextBox ID="dsetl"  runat="server" Class="singlebox"></asp:TextBox>
                    </div>
                </div>
                <div class="half">
                    <div class="customer">
                        <asp:Label ID="Label8" runat="server" Class="labelleft" Text="Branch"></asp:Label>
                        <asp:TextBox ID="branch" class="singlebox" runat="server" ></asp:TextBox>
                    </div>
                    <div class="customer">
                            <asp:Label ID="Label15" runat="server" Class="labelleft" Text="Type of Loan"></asp:Label>
                            <asp:TextBox ID="typeloan" class="doublebox" runat="server" ></asp:TextBox>
                            <asp:Label ID="Label16" runat="server" Class="labelleft" Text="Fin DO No."></asp:Label>
                            <asp:TextBox ID="findono" class="doublebox" runat="server" ></asp:TextBox>
                    </div>
                    <div class="customer">
                        <asp:Label ID="Label17" runat="server" Class="labelleft" Text="Color"></asp:Label>
                        <asp:TextBox ID="color" class="singlebox" runat="server" ></asp:TextBox>
                    </div>
                    <div class="customer">
                            <asp:Label ID="Label18" runat="server" Class="labelleft" Text="Chassis No."></asp:Label>
                            <asp:TextBox ID="chassis"  runat="server" class="doublebox"></asp:TextBox>
                            <asp:Label ID="Label19" runat="server" Class="labelleft" Text="Engine No."></asp:Label>
                            <asp:TextBox ID="engine"  runat="server" class="doublebox"></asp:TextBox>
                        </div>
                    <div class="customer">
                        <asp:Label ID="Label20" runat="server" Class="labelleft" Text="ERP DSE"></asp:Label>
                        <asp:TextBox ID="erpdse" class="singlebox" runat="server" ></asp:TextBox>
                    </div>
                    <div class="customer">
                        <asp:Label ID="Label21" runat="server" Class="labelleft" Text="ERP TL"></asp:Label>
                        <asp:TextBox ID="erptl" class="singlebox" runat="server" ></asp:TextBox>
                    </div>
                </div>
            </div>
                <div class="customer">
                    <asp:Label ID="Label22" runat="server"  Text="Fill by finance team"></asp:Label>
                </div>
            <div class="data">
                    <div class="half">
                        <div class="customer">
                                <asp:Label ID="Label23" runat="server" Class="labelleft" Text="Payout %age"></asp:Label>
                                <asp:TextBox ID="payoutage" class="doublebox" runat="server" ></asp:TextBox>
                                <asp:Label ID="Label24" runat="server" Class="labelleft" Text="Fin Payout"></asp:Label>
                                <asp:TextBox ID="finpayout" class="doublebox" runat="server" ></asp:TextBox>
                            </div>
                        <div class="customer">
                                <asp:Label ID="Label32" runat="server" Class="labelleft" Text="Interest Rate"></asp:Label>
                                <asp:TextBox ID="interest" class="doublebox" runat="server" ></asp:TextBox>
                                <asp:Label ID="Label28" runat="server" Class="labelleft" Text="Received Amount"></asp:Label>
                                <asp:TextBox ID="received" class="doublebox" runat="server" ></asp:TextBox>
                            </div>                       
                        <div class="customer">
                            <asp:Label ID="Label6" runat="server" Class="labelleft" Text="Bank Name"></asp:Label>
                            <asp:TextBox ID="bankname"  runat="server" class="singlebox"></asp:TextBox>
                        </div>
                        <div class="customer">
                            <asp:Label ID="Label27" Class="labelleft" runat="server" Text="Loan Disbursement Status"></asp:Label>
                            <asp:TextBox ID="loanstatus"  runat="server" class="singlebox"></asp:TextBox>
                        </div>
                    </div>
                    <div class="half">
                        <div class="customer">
                            
                                <asp:Label ID="Label25" runat="server" Class="labelleft" Text="GST Amt"></asp:Label>
                                <asp:TextBox ID="gst" runat="server" class="doublebox"></asp:TextBox>
                            
                                <asp:Label ID="Label26" runat="server" Class="labelleft" Text="Total Fin. Payout"></asp:Label>
                                <asp:TextBox ID="totoalfin"  runat="server" class="doublebox"></asp:TextBox>
                            
                        </div>
                        <div class="customer">
                            
                                <asp:Label ID="Label29" runat="server" Class="labelleft" Text="Date"></asp:Label>
                                <asp:TextBox ID="date2" MaxLength="10" placeholder="MM/DD/YYYY" onblur="(this.type='text')" runat="server" class="doublebox"></asp:TextBox>
                            
                                <asp:Label ID="Label33" runat="server" Class="labelleft" Text="No. Of Emi"></asp:Label>
                                <asp:TextBox ID="emi" runat="server" class="doublebox"></asp:TextBox>
                           

                        </div>
                        <div class="customer">
                            <asp:Label ID="Label30" runat="server" Class="labelleft" Text="Account No."></asp:Label>
                            <asp:TextBox ID="accountno" runat="server" class="singlebox"></asp:TextBox>
                        </div>
                        <div class="customer">
                            <asp:Label ID="Label31" runat="server" Class="labelleft" Text="Credit Ref."></asp:Label>
                            <asp:TextBox ID="credit" runat="server" class="singlebox"></asp:TextBox>
                        </div>
                    </div>
             </div>     
            <div class="user">
            <div class="customer">
                <asp:Label ID="Label66" runat="server" Class="labelleftbg" Text="Remark"></asp:Label>
                <asp:TextBox  ID="Remark" runat="server" class="singlebox1"></asp:TextBox>
            </div>
                </div>
        </div>
        <div class="center">
            <asp:Button class="bottombuttons" ID="submit" runat="server" Text="Submit" />
            <asp:Button class="bottombuttons" ID="update" runat="server" Text="Update" />
            <asp:Button class="bottombuttons" ID="clear" runat="server" Text="Clear Fields" />
        </div>
    </form>

</body>
</html>

<script type = "text/javascript" >  
    function preventBack() { window.history.forward(); }
    setTimeout("preventBack()", 0);
    window.onunload = function () { null };  
</script>

