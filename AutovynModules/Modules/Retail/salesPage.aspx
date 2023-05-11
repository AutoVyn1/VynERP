<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="salesPage.aspx.vb" Inherits="AutovynERP.salesPage" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Autovvyn Cloud - Sales Page</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="~/Css/Sales.css" />

     <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.css" rel="stylesheet" />

    <%-- animation --%>
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-size:14px;
            font-family: 'Dosis', sans-serif;
        }


        .main-section{
            margin-top:50px;
        }

        .tab {
            overflow: hidden;
            background-color: #C3CEDA;
        }

            /* Style the buttons inside the tab */
            .tab button {
                background-color: #C3CEDA;
                float: left;
                border: none;
                outline: none;
                cursor: pointer;
                padding: 14px 16px;
                transition: 0.3s;
                font-size: 17px;
            }

                /* Change background color of buttons on hover */
                .tab button:hover {
                    background-color: #C3CEDA;
                }

                /* Create an active/current tablink class */
                .tab button.active {
                    background-color: #C3CEDA;
                }

        .tabcontent {
            display: none;
            padding: 6px 12px;
        }


        .pull-right {
            float: right !important;
        }

        .tabs {
            position: relative;
            height: 11.50rem;
            width: 100%;
        }

            .tabs::before,
            .tabs::after {
                content: "";
            }

            .tabs::after {
                clear: both;
            }

        .tab {
            float: left;
        }

        .tab-switch {
            display: none;
        }

        .tab-label {
            position: relative;
            display: block;
            background-image: linear-gradient(to top, #cfd9df 0%, #e2ebf0 100%);
            line-height: 2.75em;
            padding: 0 1.618em;
            cursor: pointer;
            top: 0;
            transition: all 0.25s;
            font-size: 14px;
        }

            .tab-label:hover {
                top: -0.25rem;
                transition: top 0.25s;
                border-bottom: 2px solid #152175;
            }

        .tab-content {
            width: 100%;
            position: absolute;
            z-index: 1;
            left: 0;
            color: #2c3e50;
            opacity: 0;
            transition: all 0.35s;
        }

        .tab-switch:checked + .tab-label {
            color: #2c3e50;
            transition: all 0.35s;
            z-index: 1;
            font-size: 14px;
        }

        .tab-switch:checked + label + .tab-content {
            z-index: 2;
            opacity: 1;
            transition: all 0.35s;
        }

        .retail {
            height: 100px;
            display: flex;
            flex-direction: row;
            justify-content: space-evenly;
            align-items: center;
            flex-flow: wrap;
            overflow: auto;
        }

        .box1 {
            width: 10%;
            height: 50px;
            margin: 2px;
            display: flex;
            flex-direction: row;
            cursor: pointer;
            box-shadow: 0px -1px 9px -3px rgba(0,0,0,0.75);
            -webkit-box-shadow: 0px -1px 9px -3px rgba(0,0,0,0.75);
            -moz-box-shadow: 0px -1px 9px -3px rgba(0,0,0,0.75);
        }

        .icon {
            width: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #0C4160;
            border-radius: 5px 1px 1px 5px;
        }

        .title {
            width: 100px;
            display: flex;
            justify-content: start;
            color: #FFFFFF;
            padding-left:10px;
            background-color: #738FA7;
            font-size: 12px;
            font-weight: 500;
            border: none;
            border-radius: 0px 4px 12px 0;
        }

        .navbar-expand-lg .navbar-nav .dropdown-menu {
            position: absolute;
            width: 190px;
        }

        @media only screen and (max-width: 448px) {
            .navbar {
                width: 100%;
            }

            .chart-box {
                margin-top: 80px;
                width: 100%;
            }

            header {
                width: 100vw;
                height: 1vh;
                background-size: cover;
                position: relative;
                background-attachment: fixed;
            }

            nav ul {
                width: 100px;
            }

            span {
                font-size: 1rem;
            }

            .retail {
                width: 100%;
                display: flex;
                flex-direction: row;
                justify-content: space-evenly;
                align-items: center;
                flex-wrap: wrap;
            }

            .box1 {
                width: 150px;
                height: 43px;
                margin: 2px;
                display: flex;
                flex-direction: row;
                cursor: pointer;
                border-radius: 50%;
            }

            .icon {
                width: 50px;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .tabs {
                position: relative;
                height: 8.5rem;
                width: max-content;
                margin: 12px;
                float: left;
            }

            .footer {
                width: 100%;
            }

            .date-box {
                width:30%;
            }
        }

        @media only screen and (max-width: 768px) {
            header {
                width: 100vw;
                height: 1vh;
                background-size: cover;
                position: relative;
                background-attachment: fixed;
            }

            .chart-box {
                margin-top: 80px;
                width: 100%;
            }

            nav ul {
                width: 100px;
            }

            span {
                font-size: 1rem;
            }

            .retail {
                width: 100%;
                display: flex;
                flex-direction: row;
                justify-content: space-evenly;
                align-items: center;
                flex-wrap: wrap;
            }

            .box1 {
               width: 25%;
                height: 43px;
                margin: 2px;
                display: flex;
                flex-direction: row;
                cursor: pointer;
                border-radius: 50%;
            }

            .icon {
                width: 50px;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .tabs {
                position: relative;
                height: 8.5rem;
                width: 98%;
                margin: 12px;
                float: left;
            }

            .tab {
                float: left;
                width: 25%;
            }
        }

        @media only screen and (max-width: 828px) {
            .box1 {
               width: 25%;
                height: 43px;
                margin: 2px;
                display: flex;
                flex-direction: row;
                cursor: pointer;
                border-radius:4%;
            }

            .tab {
                float: left;
                width: 25%;
            }

        }


        #retail_data_view {
            padding: 10px;
        }


       /*footer*/

       .section-footer {
            background: rgb(230, 191, 153);
            background: linear-gradient(90deg, rgba(230, 191, 153, 0.6935106806394433) 4%, rgba(167, 192, 255, 0.5954714649531687) 81%);
            padding-top:8px;
        }

        .f-setion {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap:wrap;
        }

        .date-f{
             width: 15%;
            border: none;
            border-radius: 4px;
            height: 33px;
            background-color: cornflowerblue;
            color:#fff;
        }

        .date-box{
            border: none;
            border-radius: 4px;
            height: 33px;
        }

        #GrdView {
            font-size:12px;
            font-family: 'Ubuntu', sans-serif;
        }
.myPagerStyle a {
        color: #3366FF;
        text-decoration: none;
        padding: 10px;
    }
       .myPagerStyle span {
        
        text-decoration: none;
        padding: 10px;
        border: none;
    }
     
    .myPagerStyle a:hover {
        background-color: #3366FF;
        color: #FFFFFF;
    }

    .myPagerStyle .selected {
        background-color: #3366FF;
        color: #FFFFFF;
        font-weight: bold;
    }

    .myPagerStyle .first a {
        font-weight: bold;
        color: #3366FF;
        border: none;
        padding: 5px;
    }

    .myPagerStyle .first a:hover {
        background-color: transparent;
        color: #3366FF;
        text-decoration: none;
    }
    </style>
</head>
<body>

    <form id="form1" runat="server" style=" border:none;">
         <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
          <!-- Container wrapper -->
          <div class="container">
            <!-- Toggle button -->

            <button
              class="navbar-toggler" type="button" data-mdb-toggle="collapse" data-mdb-target="#navbarSupportedContent"
              aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <i class="fas fa-bars"></i>
            </button>

            <!-- Collapsible wrapper -->
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <!-- Navbar brand -->

              <a class="navbar-brand mt-2 mt-lg-0" href="../DefaultPage/DefaultHome.aspx">
                  <asp:Image ID="Image1" runat="server" ImageUrl="~/AutovynModules/Media/autovynicon.png" alt="autovyn logo" loading="lazy" height="25"/>
                <a class="navbar-brand" href="#"> <span style="color:#e5322d; font-weight: 700;">A</span><span style="color:#f4992e; font-weight: 700;">U</span><span style="color:#039bd3; font-weight: 700;">T</span><span style="color:#e5322d; font-weight: 700;">O</span><span font-weight: 700;>-</span><span style="color:#f4992e; font-weight: 700;">V</span><span style="color:#f4992e; font-weight: 700;">Y</span><span style="color:#039bd3; font-weight: 700;">N</span></a> 
              </a>
              <!-- Left links -->
              <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                  <li class="nav-item">
                      <asp:HyperLink ID="HyperLink19" runat="server" Text="Home" NavigateUrl="~/AutovynModules/DefaultPage/DefaultPage.aspx" CssClass="w3-bar-item w3-button nav-link active" ></asp:HyperLink>
                      
                  </li>
                  <%-- 0 --%>
                   <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink1" role="button" data-mdb-toggle="dropdown" aria-expanded="false">Accounts</a>
                      <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink1">
                          <li>
                              <asp:HyperLink ID="HyperLink18" runat="server" Text="Vouchers" NavigateUrl="~/AutovynModules/Modules/Accounts/Acc_Voucher.aspx" CssClass="w3-bar-item w3-button dropdown-item" ></asp:HyperLink>
                          </li>
                      </ul>
                  </li>

                  <%-- 1 --%>
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink5" role="button" data-mdb-toggle="dropdown" aria-expanded="false">Finance </a>
                      <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink5">
                          <li>
                              <asp:HyperLink ID="HyperLink17" runat="server" Text="Finance Form" NavigateUrl="~/AutovynModules/Modules/Finance/Finance.aspx" CssClass="w3-bar-item w3-button dropdown-item" ></asp:HyperLink>
                          </li>

                          <li>
                              <asp:HyperLink ID="HyperLink16" runat="server" Text="View Summary" NavigateUrl="~/AutovynModules/Modules/Finance/FinanceSummary.aspx" CssClass="w3-bar-item w3-button dropdown-item" ></asp:HyperLink>
                          </li>
                      </ul>
                  </li>
                  <%-- 2 --%>
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink9" role="button" data-mdb-toggle="dropdown" aria-expanded="false">Insurance</a>
                      <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink9">
                          <li>
                              <asp:HyperLink ID="HyperLink15" runat="server" Text="Insurance" NavigateUrl="~/AutovynModules/Modules/Insurance/Insurance.aspx" CssClass="w3-bar-item w3-button dropdown-item" ></asp:HyperLink>
                          </li>

                          <li>
                              <asp:HyperLink ID="HyperLink14" runat="server" Text="Insurance Data View" NavigateUrl="~/AutovynModules/Modules/Insurance/InsuranceData.aspx" CssClass="w3-bar-item w3-button dropdown-item" ></asp:HyperLink>
                          </li>
                      </ul>
                  </li>
                  <%-- 3 --%>
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink2" role="button" data-mdb-toggle="dropdown" aria-expanded="false">Sales</a>
                      <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink2">
                          <li>
                              <asp:HyperLink ID="HyperLink13" runat="server" Text="Sales Discount Approval" NavigateUrl="~/AutovynModules/Modules/Sales/SalesDiscount.aspx" CssClass="w3-bar-item w3-button dropdown-item" ></asp:HyperLink>
                          </li>
                          <li>
                              <asp:HyperLink ID="HyperLink12" runat="server" Text="Sales Discount Approval Report" NavigateUrl="~/AutovynModules/Modules/Sales/SalesDiscountApprovalReport.aspx" CssClass="w3-bar-item w3-button dropdown-item" ></asp:HyperLink>
                          </li>
                          <li>
                              <asp:HyperLink ID="HyperLink11" runat="server" Text="Workshop Discount" NavigateUrl="~/AutovynModules/Modules/Sales/WorkshopDiscount.aspx" CssClass="w3-bar-item w3-button dropdown-item" ></asp:HyperLink>
                          </li>

                          <li>
                              <asp:HyperLink ID="HyperLink10" runat="server" Text="Workshop Discount Approval Report" NavigateUrl="~/AutovynModules/Modules/Sales/WorkshopDiscountApprovalReport.aspx" CssClass="w3-bar-item w3-button dropdown-item" ></asp:HyperLink>
                          </li>
                      </ul>
                  </li>
                  <%-- 4 --%>
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink3" role="button" data-mdb-toggle="dropdown" aria-expanded="false">TrueValue </a>
                      <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink3">
                          <li>
                              <asp:HyperLink ID="HyperLink9" runat="server" Text="TrueValue" NavigateUrl="~/AutovynModules/Modules/TV/Truevalue.aspx" CssClass="w3-bar-item w3-button dropdown-item" ></asp:HyperLink>
                          </li>
                      </ul>
                  </li>
                  <%-- 5 --%>
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink10" role="button" data-mdb-toggle="dropdown" aria-expanded="false">Retail</a>
                      <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink10">
                          <li>
                              <asp:HyperLink ID="HyperLink8" runat="server" Text="Retail Data" NavigateUrl="~/AutovynModules/Modules/Retail/salesPage.aspx" CssClass="w3-bar-item w3-button dropdown-item" ></asp:HyperLink>
                          </li>
                      </ul>
                  </li>



                  <%-- 6 --%>
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink8" role="button" data-mdb-toggle="dropdown" aria-expanded="false">DSE </a>
                      <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink8">
                          <li>
                              <asp:HyperLink ID="HyperLink7" runat="server" Text="Bank API" NavigateUrl="~/AutovynModules/Modules/DSE/BankAPI.aspx" CssClass="w3-bar-item w3-button dropdown-item" ></asp:HyperLink>
                          </li>

                      </ul>
                  </li>

                  <%-- 7 --%>
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" data-mdb-toggle="dropdown"
                          data-mdb-auto-close="outside">Payroll</a>
                      <ul class="dropdown-menu shadow">
                          <asp:HyperLink ID="HyperLink6" runat="server" Text="HRMS" NavigateUrl="~/AutovynModules/Modules/Payroll/HRMS.aspx" CssClass="w3-bar-item w3-button dropdown-item" ></asp:HyperLink>
                          <li class="dropend">
                              <a href="#" class="dropdown-item dropdown-toggle" data-mdb-toggle="dropdown">Attendance</a>
                              <ul class="dropdown-menu shadow">
                                  <li>
                                      <asp:HyperLink ID="HyperLink5" runat="server" Text="Home" NavigateUrl="~/AutovynModules/Modules/Payroll/Home.aspx" CssClass="w3-bar-item w3-button dropdown-item" ></asp:HyperLink>
                                  </li>
                                  <li>
                                      <asp:HyperLink ID="HyperLink4" runat="server" Text="Devices" NavigateUrl="~/AutovynModules/Modules/Payroll/Devices.aspx" CssClass="w3-bar-item w3-button dropdown-item" ></asp:HyperLink>
                                  </li>
                                  <li>
                                      <asp:HyperLink ID="HyperLink3" runat="server" Text="Location" NavigateUrl="~/AutovynModules/Modules/Payroll/Location.aspx" CssClass="w3-bar-item w3-button dropdown-item" ></asp:HyperLink>
                                  </li>
                              </ul>
                          </li>

                          <li class="dropend">
                              <a href="#" class="dropdown-item dropdown-toggle" data-mdb-toggle="dropdown">Interview</a>
                              <ul class="dropdown-menu shadow">
                                  <li>
                                      <asp:HyperLink ID="HyperLink2" runat="server" Text="Candidate Home" NavigateUrl="~/AutovynModules/Modules/Payroll/Candidate_Home.aspx" CssClass="w3-bar-item w3-button dropdown-item" ></asp:HyperLink>
                                  </li>
                                  <li>
                                      <asp:HyperLink ID="HyperLink1" runat="server" Text="Candidate Info" NavigateUrl="~/AutovynModules/Modules/Payroll/Candidate_Info.aspx" CssClass="w3-bar-item w3-button dropdown-item" ></asp:HyperLink>
                                  </li>
                                  <li>
                                      <asp:HyperLink ID="linkCreateUser" runat="server" Text="Candidate List" NavigateUrl="~/AutovynModules/Modules/Payroll/Candidate_List.aspx" CssClass="w3-bar-item w3-button dropdown-item" ></asp:HyperLink>
                                  </li>
                              </ul>
                          </li>
                      </ul>
                  </li>



                  <%-- 8 --%>
                  <li class="nav-item">
                      <asp:HyperLink ID="linkCreateUserr" runat="server" Text="Reminder" NavigateUrl="~/AutovynModules/Modules/Reminder/Reminder_Set.aspx" CssClass="w3-bar-item w3-button nav-link" ></asp:HyperLink>
                  </li>
                   
                  <%-- 9 --%>
                  <li class="nav-item">
                      <a class="nav-link" href="#">Cashier</a>
                  </li>
                  <%-- 10 --%>
                  <li class="nav-item">
                      <a class="nav-link" href="#">Auditer</a>
                  </li>

                  <%-- 11 --%>
                  <li class="nav-item">
                      <a class="nav-link" href="#">MIS</a>
                  </li>
                  
                  
              </ul>
              <!-- Left links -->
            </div>
            <!-- Collapsible wrapper -->

            <!-- Right elements -->
            <div class="d-flex align-items-center">
              <!-- Icon -->
             <%-- <a class="text-reset me-3" href="#">
                <i class="fas fa-shopping-cart"></i>
              </a>--%>

              <!-- Notifications -->
              <%--<div class="dropdown">
                <a
                  class="text-reset me-3 dropdown-toggle hidden-arrow"
                  href="#"
                  id="navbarDropdownMenuLink"
                  role="button"
                  data-mdb-toggle="dropdown"
                  aria-expanded="false"
                >
                  <i class="fas fa-bell"></i>
                  <span class="badge rounded-pill badge-notification bg-danger">1</span>
                </a>
                <ul
                  class="dropdown-menu dropdown-menu-end"
                  aria-labelledby="navbarDropdownMenuLink"
                >
                  <li>
                    <a class="dropdown-item" href="#">Some news</a>
                  </li>
                  <li>
                    <a class="dropdown-item" href="#">Another news</a>
                  </li>
                  <li>
                    <a class="dropdown-item" href="#">Something else here</a>
                  </li>
                </ul>
              </div>--%>
              <!-- Avatar -->
              <%--<div class="dropdown">
                <a
                  class="dropdown-toggle d-flex align-items-center hidden-arrow"
                  href="../../Credintial/LoginPage.aspx" id="navbarDropdownMenuAvatar" role="button" data-mdb-toggle="dropdown" aria-expanded="false">
                  <img src="../../Media/Nav-back.png" class="rounded-circle" height="25" alt="Black and White Portrait of a Man" loading="lazy"/>
                </a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMenuAvatar">
                  <li>
                    <a class="dropdown-item" href="#">My profile</a>
                  </li>
                  <li>
                    <a class="dropdown-item" href="#">Settings</a>
                  </li>
                  <li>
                    <a class="dropdown-item" href="#">Logout</a>
                  </li>
                </ul>
              </div>--%>
            </div>
            <!-- Right elements -->

          </div>
          <!-- Container wrapper -->
        </nav>

        
        <div class="container-fluid main-section">
            <div class="wrapper d-flex justify-content-center flex-column">
            <div class="tabs" data-aos="zoom-out" data-aos-duration="1000" >

                 <div class="tab" >
                    <input type="radio" name="css-tabs" id="tab" checked class="tab-switch" />
                    <label for="tab" class="tab-label"><a href="SalesChart.aspx" style="color:#000; text-decoration:none;">Dashboard</a></label>
                    <div class="tab-content" >
                        <div class="retail" >
                            <div class="box1">
                                <div class="icon">
                                    <img src="../../Media/shop.png" width="20" /></div>
                                    <asp:Button ID="dshrtl"  runat="server" Text="RETAIL" class="title" />
                            </div>

                            <div class="box1">
                                <div class="icon">
                                    <img src="../../Media/bookmark.png" width="20" /></div>
                                <asp:Button ID="Button2"  runat="server" Text="DELIVERED" class="title" />

                            </div>

                            <div class="box1">
                                <div class="icon">
                                    <img src="../../Media/bookmark.png" width="20" /></div>
                                <asp:Button ID="Button3"  runat="server" Text="BBND" class="title" />

                            </div>
                            <div class="box1">
                                <div class="icon">
                                    <img src="../../Media/star.png" width="20" /></div>
                                <asp:Button ID="Button4"  runat="server" Text="RIPS" class="title" />

                            </div>
                            <div class="box1">
                                <div class="icon">
                                    <img src="../../Media/star.png" width="20" /></div>
                                <asp:Button ID="Button5"  runat="server" Text="CORPORATE" class="title" />

                            </div>
                            <div class="box1">
                                <div class="icon">
                                    <img src="../../Media/star.png" width="20" /></div>
                                <asp:Button ID="Button6"  runat="server" Text="EXCHANGE" class="title" />

                            </div>
                        </div>


                    </div>
                </div>


                <div class="tab" >
                    <input type="radio" name="css-tabs" id="tab-1" checked class="tab-switch" />
                    <label for="tab-1" class="tab-label">Retailer</label>
                    <div class="tab-content">
                        <div class="retail">
                            <div class="box1">
                                <div class="icon">
                                    <img src="../../Media/shop.png" width="20" /></div>
                                <asp:Button ID="retail" runat="server" Text="RETAIL" class="title" />

                            </div>

                            <div class="box1">
                                <div class="icon">
                                    <img src="../../Media/bookmark.png" width="20" /></div>
                                <asp:Button ID="deliveryBtn" runat="server" Text="DELIVERED" class="title" />

                            </div>

                            <div class="box1">
                                <div class="icon">
                                    <img src="../../Media/bookmark.png" width="20" /></div>
                                <asp:Button ID="vb_nd" runat="server" Text="BBND" class="title" />

                            </div>
                            <div class="box1">
                                <div class="icon">
                                    <img src="../../Media/star.png" width="20" /></div>
                                <asp:Button ID="rips_support" runat="server" Text="RIPS" class="title" />

                            </div>
                            <div class="box1">
                                <div class="icon">
                                    <img src="../../Media/star.png" width="20" /></div>
                                <asp:Button ID="corporate_1" runat="server" Text="CORPORATE" class="title" />

                            </div>
                            <div class="box1">
                                <div class="icon">
                                    <img src="../../Media/star.png" width="20" /></div>
                                <asp:Button ID="exchange_offer"  runat="server" Text="EXCHANGE" class="title" />

                            </div>

                        </div>

                    </div>
                </div>

                <div class="tab">
                    <input type="radio" name="css-tabs" id="tab-2" class="tab-switch" />
                    <label for="tab-2" class="tab-label">Enabler</label>
                    <div class="tab-content">
                            <div class="retail">
                            <div class="box1">
                                <div class="icon">
                                    <img src="../../Media/shop.png" width="20" /></div>
                                    <asp:Button ID="Button1"  runat="server" Text="RETAIL" class="title" />
                            </div>

                            <div class="box1">
                                <div class="icon">
                                    <img src="../../Media/bookmark.png" width="20" /></div>
                                <asp:Button ID="Button7"  runat="server" Text="DELIVERED" class="title" />

                            </div>

                            <div class="box1">
                                <div class="icon">
                                    <img src="../../Media/bookmark.png" width="20" /></div>
                                <asp:Button ID="Button8"  runat="server" Text="BBND" class="title" />

                            </div>
                            <div class="box1">
                                <div class="icon">
                                    <img src="../../Media/star.png" width="20" /></div>
                                <asp:Button ID="Button9"  runat="server" Text="RIPS" class="title" />

                            </div>
                            <div class="box1">
                                <div class="icon">
                                    <img src="../../Media/star.png" width="20" /></div>
                                <asp:Button ID="Button10"  runat="server" Text="CORPORATE" class="title" />

                            </div>
                            <div class="box1">
                                <div class="icon">
                                    <img src="../../Media/star.png" width="20" /></div>
                                <asp:Button ID="Button11"  runat="server" Text="EXCHANGE" class="title" />

                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab">
                    <input type="radio" name="css-tabs" id="tab-3" class="tab-switch" />
                    <label for="tab-3" class="tab-label">Finance</label>
                    <div class="tab-content">

                        <div class="retail">
                            <div class="box1">
                                <div class="icon">
                                    <img src="../../Media/shop.png" width="20" /></div>
                                    <asp:Button ID="Button12"  runat="server" Text="RETAIL" class="title" />
                            </div>

                            <div class="box1">
                                <div class="icon">
                                    <img src="../../Media/bookmark.png" width="20" /></div>
                                <asp:Button ID="Button13"  runat="server" Text="DELIVERED" class="title" />

                            </div>

                            <div class="box1">
                                <div class="icon">
                                    <img src="../../Media/bookmark.png" width="20" /></div>
                                <asp:Button ID="Button14"  runat="server" Text="BBND" class="title" />

                            </div>
                            <div class="box1">
                                <div class="icon">
                                    <img src="../../Media/star.png" width="20" /></div>
                                <asp:Button ID="Button15"  runat="server" Text="RIPS" class="title" />

                            </div>
                            <div class="box1">
                                <div class="icon">
                                    <img src="../../Media/star.png" width="20" /></div>
                                <asp:Button ID="Button16"  runat="server" Text="CORPORATE" class="title" />

                            </div>
                            <div class="box1">
                                     <div class="icon">
                                    <img src="../../Media/star.png" width="20" /></div>
                                <asp:Button ID="Button17"  runat="server" Text="EXCHANGE" class="title" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                <asp:Panel ID="GetData" runat="server" ScrollBars="Horizontal">
                    <asp:GridView ID="GrdView" runat="server" EmptyDataText="No Data Available"
                        CssClass="table table-bordered table-condensed table-responsive table-hover" AutoGenerateSelectButton="false" BackColor="#336699" BorderColor="#908282" Style="width: 98%;"
                        BorderStyle="Solid" BorderWidth="1px" AllowPaging="true" PagerStyle-CssClass="myPagerStyle" OnPageIndexChanging="GrdView_PageIndexChanging" PageSize="8">
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
        </div>
      

        <div class="container-fluid section-footer fixed-bottom">
            <div class="row mb-1 d-flex justify-content-between text-center">
                <div class="col-lg-8">
                    <p>Copyright © 2022-2023<a href="https://www.autovyn.com/index.aspx"> AUTO-VYN </a>All rights reserved.</p>
                </div>
                <div class="col-lg-4 mt-1 mb-1">
                    <span class="pe-2">Form</span><asp:TextBox ID="DateFrom" MaxLength="10" CssClass="col-lg-3 col-form-label date-box p-1" runat="server"></asp:TextBox>
                    <span class="pe-2">To</span><asp:TextBox ID="DateUpto" MaxLength="10" CssClass="col-lg-3 col-form-label date-box p-1" runat="server"></asp:TextBox>
                    <asp:Button ID="Date_Refresh" CssClass="date-f" runat="server" Text="View" />
                </div>
            </div>
        </div>


    </form>
    <script>
        AOS.init();
    </script>
</body>
</html>
 <!-- MDB -->
     <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"></script>

<!-- InputMask -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/inputmask/inputmask.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/inputmask/inputmask.date.extensions.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/inputmask/inputmask.extensions.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/css/inputmask.css" />

<script>
    $(function () {
        var inputmask = new Inputmask("99/99/9999", { placeholder: 'dd/mm/yyyy' });
        inputmask.mask($('[id*=DateFrom]'));
        inputmask.mask($('[id*=DateUpto]'));
    });
</script>