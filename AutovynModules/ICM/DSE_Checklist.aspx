<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DSE_Checklist.aspx.vb" Inherits="AutovynERP.DSE_Checklist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.css" rel="stylesheet" />

    <style>
        body{
            font-size:13px;
        }

        @media screen and (max_width:480px){
            nutton_sections{
                display:flex;
            }

            .image-box{
                margin:10px 8px;
            }
        }

    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row text-center">
                <span class="heading">BILLING DSE - CHECKLIST</span>
            </div>
        <div class="section-first">
            <div class="title">
            </div>
            <!-- row -->
            <div class="row mb-1 pt-2">
                <asp:Label ID="Label1" CssClass="col-lg-1 col-form-label" runat="server" Text="Label">DMS Inv. No.</asp:Label>
                <div class="col-lg-2">
                    <asp:TextBox ID="dmsinvoice" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-lg-1">
                    <asp:Button ID="DtView" runat="server" CssClass="viewDt btn btn-primary" Text="View" />

                </div>
                <asp:Label ID="Label2" CssClass="col-lg-1 col-form-label" runat="server" Text="Label">DMS Cust Id.</asp:Label>
                <div class="col-lg-2">
                    <asp:TextBox ID="custid" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                <asp:Label ID="Label3" CssClass="col-lg-1 col-form-label" runat="server" Text="File No."></asp:Label>
                <div class="col-lg-2">
                    <asp:TextBox ID="fileno" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <asp:Label ID="Label4" CssClass="col-lg-1 col-form-label" runat="server" Text="Date"></asp:Label>
                <div class="col-lg-1">
                    <asp:TextBox ID="Inv_date" CssClass="form-control" onblur="(this.type='text')" runat="server"></asp:TextBox>   
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
                          aria-selected="true"
                          >Link</a
                        >
                      </li>
                      <li class="nav-item" role="presentation">
                        <a
                          class="nav-link"
                          id="ex2-tab-2"
                          data-mdb-toggle="pill"
                          href="#ex2-pills-2"
                          role="tab"
                          aria-controls="ex2-pills-2"
                          aria-selected="false"
                          >Very very very very long link</a
                        >
                      </li>
                      <li class="nav-item" role="presentation">
                        <a
                          class="nav-link"
                          id="ex2-tab-3"
                          data-mdb-toggle="pill"
                          href="#ex2-pills-3"
                          role="tab"
                          aria-controls="ex2-pills-3"
                          aria-selected="false"
                          >Another link</a
                        >
                      </li>
                    </ul>
                    <!-- Pills navs -->

                    <!-- Pills content -->
                    <div class="tab-content" id="ex2-content">
                      <div
                        class="tab-pane fade show active"
                        id="ex2-pills-1"
                        role="tabpanel"
                        aria-labelledby="ex2-tab-1"
                      >
                        Tab 1 content
                      </div>
                      <div
                        class="tab-pane fade"
                        id="ex2-pills-2"
                        role="tabpanel"
                        aria-labelledby="ex2-tab-2"
                      >
                        Tab 2 content
                      </div>
                      <div
                        class="tab-pane fade"
                        id="ex2-pills-3"
                        role="tabpanel"
                        aria-labelledby="ex2-tab-3"
                      >
                        Tab 3 content
                      </div>
                    </div>
                    <!-- Pills content -->
                </div>
                <div class="col-lg-1">

                </div>
            </div>
        </div>

        <!-- Section-Second -->
            <div class="section-first mt-2">
                <div class="row">
                    <span class="Cust_Det">Customer Details</span>
                </div>
                <div class="row">
                    <asp:Label ID="Label5" CssClass="col-lg-1 col-form-label" runat="server" Text="Label">Customer Name</asp:Label>
                    <div class="col-lg-5">
                        <asp:TextBox ID="Cust_name" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <asp:Label ID="Label6" CssClass="col-lg-1 col-form-label" runat="server" Text="Address"></asp:Label>
                    <div class="col-lg-5">
                        <asp:TextBox ID="Add" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                </div>

                <div class="row">
                    <asp:Label ID="Label7" CssClass="col-lg-1 col-form-label" runat="server" Text="Label">City</asp:Label>
                    <div class="col-lg-2">
                        <asp:TextBox ID="City" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <asp:Label ID="Label8" CssClass="col-lg-1 col-form-label" runat="server" Text="State"></asp:Label>
                    <div class="col-lg-2">
                        <asp:TextBox ID="State" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <asp:Label ID="Label9" CssClass="col-lg-1 col-form-label" runat="server" Text="Mobile"></asp:Label>
                    <div class="col-lg-2">
                        <asp:TextBox ID="Mob_no" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <asp:Label ID="Label10" CssClass="col-lg-1 col-form-label" runat="server" Text="Email"></asp:Label>
                    <div class="col-lg-2">
                        <asp:TextBox ID="Email" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                </div>

                <div class="row">
                    <asp:Label ID="Label11" CssClass="col-lg-1 col-form-label" runat="server" Text="Label">Customer Type</asp:Label>
                    <div class="col-lg-2">
                        <asp:dropdownlist ID="Cust_type" CssClass="Drop_down" runat="server">
                            <asp:ListItem>Individual Customer</asp:ListItem>
                            <asp:ListItem>CSD Customer</asp:ListItem>
                            <asp:ListItem>BSF Customer</asp:ListItem>
                            <asp:ListItem>CPC Customer</asp:ListItem>
                        </asp:dropdownlist>
                    </div>

                    <asp:Label ID="Label12" CssClass="col-lg-1 col-form-label" runat="server" Text="Pin Code"></asp:Label>
                    <div class="col-lg-2">
                        <asp:TextBox ID="Pin_Code" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <asp:Label ID="Label13" CssClass="col-lg-1 col-form-label" runat="server" Text="Pan Card"></asp:Label>
                    <div class="col-lg-2">
                        <asp:TextBox ID="Pan_No" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <asp:Label ID="Label14" CssClass="col-lg-1 col-form-label" runat="server" Text="GST No."></asp:Label>
                    <div class="col-lg-2">
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
                <div class="row">
                    <asp:Label ID="Label15" CssClass="col-lg-1 col-form-label" runat="server" Text="Label">Veh. Group</asp:Label>
                    <div class="col-lg-2">
                        <asp:TextBox ID="Veh_Grp" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <asp:Label ID="Label24" CssClass="col-lg-1 col-form-label" runat="server" Text="Label">Veh. Code</asp:Label>
                    <div class="col-lg-2">
                        <asp:TextBox ID="Veh_Code" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>


                    <asp:Label ID="Label16" CssClass="col-lg-1 col-form-label" runat="server" Text="Color"></asp:Label>
                    <div class="col-lg-2">
                        <asp:TextBox ID="Color" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <asp:Label ID="Label17" CssClass="col-lg-1 col-form-label" runat="server" Text="Label">VIN</asp:Label>
                    <div class="col-lg-2">
                        <asp:TextBox ID="Vin" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                </div>

                <div class="row">
                    <asp:Label ID="Label20" CssClass="col-lg-1 col-form-label" runat="server" Text="DMS - DSE"></asp:Label>
                    <div class="col-lg-2">
                        <asp:TextBox ID="Dms_Dse" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <asp:Label ID="Label21" CssClass="col-lg-1 col-form-label" runat="server" Text="Label">ERP DSE</asp:Label>
                    <div class="col-lg-2">
                        <asp:TextBox ID="Erp_Dse" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <asp:Label ID="Label18" CssClass="col-lg-1 col-form-label" runat="server" Text="Chassis No."></asp:Label>
                    <div class="col-lg-2">
                        <asp:TextBox ID="Chas_no" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <asp:Label ID="Label19" CssClass="col-lg-1 col-form-label" runat="server" Text="Engine No."></asp:Label>
                    <div class="col-lg-2">
                        <asp:TextBox ID="Engn_no" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                </div>

                <div class="row">
                    <asp:Label ID="Label22" CssClass="col-lg-1 col-form-label" runat="server" Text="DSE TL"></asp:Label>
                    <div class="col-lg-2">
                        <asp:TextBox ID="Dse_TL" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>


                    <asp:Label ID="Label23" CssClass="col-lg-1 col-form-label" runat="server" Text="ERP TL"></asp:Label>
                    <div class="col-lg-2">
                        <asp:TextBox ID="Erp_TL" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                </div>


            </div>
            <!-- Section-Third -->


        </div>
    </form>
</body>
</html>
