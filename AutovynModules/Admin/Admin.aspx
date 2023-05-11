<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Admin.aspx.vb" Inherits="AutovynERP.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<!-- Font Awesome -->
<link  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"  rel="stylesheet"/>
<!-- Google Fonts -->
<link  href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"  rel="stylesheet"/>
<!-- MDB -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.css"  rel="stylesheet"/>

    <link rel="stylesheet" href="../JS/ListSelect/virtual-select.min.css"/>
    <title></title>
    <style>
        /* Firefox */
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
                background-color: #DFE9EB;
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

        .title {
            text-align: center;
            height: 50px;
        }

            .title span {
                text-align: center;
                font-weight: 700;
                font-size: 26px;
                text-transform: uppercase;
            }


            .sub-title span {
                font-weight: 700;
                font-size: 16px;
                text-transform: uppercase;
                background: #e9e9e9;
            background: -webkit-linear-gradient(0deg, #e9e9e9 0%, #d0ffd3 50%, #ffffff 100%);
            background: linear-gradient(0deg, #e9e9e9 0%, #d0ffd3 50%, #ffffff 100%);
            -webkit-box-shadow: 1px 1px 10px -1px rgba(142,242,177,1);
            -moz-box-shadow: 1px 1px 10px -1px rgba(142,242,177,1);
            box-shadow: 1px 1px 10px -1px rgba(142,242,177,1);
            }


        .section-first {
            padding: 4px 9px;
            -webkit-box-shadow: -1px -4px 22px -8px rgb(0 0 0 / 75%);
            -moz-box-shadow: -1px -4px 22px -8px rgba(0, 0, 0, 0.75);
            box-shadow: -1px 10px 4px -9px rgb(0 0 0 / 56%);
            border-radius: 4px;
            background: #e9e9e9;
            background: -webkit-linear-gradient(0deg, #e9e9e9 0%, #d0ffd3 50%, #ffffff 100%);
            background: linear-gradient(0deg, #e9e9e9 0%, #d0ffd3 50%, #ffffff 100%);
        }

        .section-branch {
            padding: 4px 9px;
            
            border-radius: 4px;
        }

        .form-label {
            font-size: 13px;
        }

        .form-control {
            height: 29px;
            font-size: 12px;
        }






        .nav-section {
            width: 24rem;
            height: 60vh;
            background-color: rgb(71 184 90 / 26%);
        }


        .nav-item-box {
            height: 60vh;
            border-radius: 4px;
        }

        .navitempanel {
            height: 57vh;
            padding: 10px;
            background: #e9e9e9;
            background: -webkit-linear-gradient(0deg, #e9e9e9 0%, #d0ffd3 50%, #ffffff 100%);
            background: linear-gradient(0deg, #e9e9e9 0%, #d0ffd3 50%, #ffffff 100%);
            -webkit-box-shadow: 1px 1px 10px -1px rgba(142,242,177,1);
            -moz-box-shadow: 1px 1px 10px -1px rgba(142,242,177,1);
            box-shadow: 1px 1px 10px -1px rgba(142,242,177,1);
        }

        .branch-card {
            width: 24rem;
            height: 50vh;
            background-color: rgb(71 184 90 / 26%);
        }
    </style>


</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="headerPanel" runat="server">
            <div class="container-fluid">
                <div class="section-first p-3">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="title">
                                <span>Admin Dashboard</span>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <asp:Label ID="Label1" runat="server" CssClass="col-lg-1 form-label" Text="Username"></asp:Label>
                        <div class="col-lg-3">
                            <asp:TextBox ID="Usr_name" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                        </div>

                        <asp:Label ID="Label3" runat="server" CssClass="col-lg-1 form-label" Text="User Mobile"></asp:Label>
                        <div class="col-lg-2">
                            <asp:TextBox ID="Usr_mob" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                        </div>

                        <asp:Label ID="Label2" runat="server" CssClass="col-lg-1 form-label" Text="Existing user"></asp:Label>
                        <div class="col-lg-3">
                           <asp:DropDownList ID="Exits_Users" runat="server" selectionmode="multiple" data-silent-initial-value-set="true" name="native-select" data-search="true" ValidateRequestMode="Enabled"></asp:DropDownList>
                        </div>

                        <div class="col-lg-1">
                            <asp:button ID="View_Usr" CssClass="btn btn-success" Text="View" runat="server"></asp:button>
                        </div>

                    </div>
                </div>

                <div class="section-branch p-3 mt-2">
                    <div class="row">
                        <div class="col-lg-3 nav-item-box">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="sub-title">
                                        <span>Select Modules</span>
                                    </div>
                                </div>
                            </div>
                            <asp:Panel ID="Panel3" runat="server" ScrollBars="Vertical" CssClass="navitempanel">
                                <asp:TreeView ID="TreeView1" runat="server" Font-Bold="True">
                                    <%-- 0 --%>
                                    <DataBindings>
                                        <asp:TreeNodeBinding Text="Accounts" TextField="Accounts_0" PopulateOnDemand="true" SelectAction="SelectExpand" Value="Accounts_0" /><asp:TreeNodeBinding />
                                    </DataBindings>
                                    <Nodes>
                                        <asp:TreeNode ShowCheckBox="True" Text="Accounts" Value="Accounts_0">
                                            <asp:TreeNode ShowCheckBox="True" Text="Receipt" Value="Accounts_0_1"></asp:TreeNode>
                                        </asp:TreeNode>
                                    </Nodes>
                                    <%-- 1 --%>
                                    <DataBindings>
                                        <asp:TreeNodeBinding Text="Finance" TextField="Finance_1" Value="Finance_1" Target="_blank" /><asp:TreeNodeBinding />
                                    </DataBindings>
                                    <Nodes>
                                        <asp:TreeNode ShowCheckBox="True" Text="Finance" Value="Finance_1">
                                            <asp:TreeNode ShowCheckBox="True" Text="Finance Form" Value="Finance_1_1"></asp:TreeNode>
                                            <asp:TreeNode ShowCheckBox="True" Text="Finance Data" Value="Finance_1_2"></asp:TreeNode>
                                        </asp:TreeNode>
                                    </Nodes>
                                    <%-- 2 --%>
                                    <DataBindings>
                                        <asp:TreeNodeBinding Text="Insurance" TextField="Insurance_2" Value="Insurance_2" Target="_blank" /> <asp:TreeNodeBinding />
                                    </DataBindings>
                                    <Nodes>
                                        <asp:TreeNode ShowCheckBox="True" Text="Insurance" Value="Insurance_2">
                                            <asp:TreeNode ShowCheckBox="True" Text="Insurance Form" Value="Insurance_2_1"></asp:TreeNode>
                                            <asp:TreeNode ShowCheckBox="True" Text="Insurance Data" Value="Insurance_2_2"></asp:TreeNode>
                                        </asp:TreeNode>

                                    </Nodes>
                                    <%-- 3 --%>
                                    <DataBindings>
                                        <asp:TreeNodeBinding Text="Sales" TextField="Sales_3" Value="Sales_3"  Target="_blank" /><asp:TreeNodeBinding />
                                    </DataBindings>
                                    <Nodes>
                                        <asp:TreeNode ShowCheckBox="True" Text="Sales" Value="Sales_3">
                                            <asp:TreeNode ShowCheckBox="True" Text="Sales Discount" Value="Sales_3_1"></asp:TreeNode>
                                            <asp:TreeNode ShowCheckBox="True" Text="Sales Discount Approval Report" Value="Sales_3_2"></asp:TreeNode>
                                            <asp:TreeNode ShowCheckBox="True" Text="Workshop Discount" Value="Sales_3_3"></asp:TreeNode>
                                            <asp:TreeNode ShowCheckBox="True" Text="Workshop Discount Approval Report" Value="Sales_3_4"></asp:TreeNode>
                                        </asp:TreeNode>

                                    </Nodes>
                                    <%-- 4 --%>
                                    <DataBindings>
                                        <asp:TreeNodeBinding Text="TrueValue" TextField="TrueValue_4" Value="TrueValue_4"  Target="_blank" /> <asp:TreeNodeBinding />
                                    </DataBindings>
                                    <Nodes>
                                        <asp:TreeNode ShowCheckBox="True" Text="TrueValue" Value="TrueValue_4">
                                            <asp:TreeNode ShowCheckBox="True" Text="TrueValue" Value="TrueValue_4_1"></asp:TreeNode>

                                        </asp:TreeNode>

                                    </Nodes>
                                    <%-- 5 --%>
                                    <DataBindings>
                                        <asp:TreeNodeBinding Text="HRMS" TextField="HRMS_5" Value="Payroll_5" Target="_blank" /> <asp:TreeNodeBinding />
                                    </DataBindings>
                                    <Nodes>
                                        <asp:TreeNode ShowCheckBox="True" Text="HRMS" Value="HRMS_5">
                                            <asp:TreeNode ShowCheckBox="True" Text="Payroll" Value="HRMS_5_1"></asp:TreeNode>
                                            <asp:TreeNode ShowCheckBox="True" Text="Home" Value="Home_5_2"></asp:TreeNode>
                                            <asp:TreeNode ShowCheckBox="True" Text="Devices" Value="Devices_5_3"></asp:TreeNode>
                                            <asp:TreeNode ShowCheckBox="True" Text="Location" Value="Location_5_4"></asp:TreeNode>
                                            <asp:TreeNode ShowCheckBox="True" Text="Candidate_Home" Value="Candidate_Home_5_5"></asp:TreeNode>
                                            <asp:TreeNode ShowCheckBox="True" Text="Candidate_Info" Value="Candidate_Info_5_6"></asp:TreeNode>
                                            <asp:TreeNode ShowCheckBox="True" Text="Candidate_List" Value="Candidate_List_5_7"></asp:TreeNode>
                                        </asp:TreeNode>

                                    </Nodes>
                                    <%-- 6 --%>
                                    <DataBindings>
                                        <asp:TreeNodeBinding Text="Retail" TextField="Retail_6" Value="Retail_6" Target="_blank" /><asp:TreeNodeBinding />
                                    </DataBindings>
                                    <Nodes>
                                        <asp:TreeNode ShowCheckBox="True" Text="Retail" Value="Retail_6">
                                            <asp:TreeNode ShowCheckBox="True" Text="Retail Data" Value="salesPage_6_1"></asp:TreeNode>
                                        </asp:TreeNode>
                                    </Nodes>

                                    <%-- 7 --%>
                                    <DataBindings>
                                        <asp:TreeNodeBinding Text="DSE" TextField="DSE_7" Value="DSE_7" />
                                        <asp:TreeNodeBinding />
                                    </DataBindings>
                                    <Nodes>
                                        <asp:TreeNode ShowCheckBox="True" Text="DSE" Value="DSE_7">
                                            <asp:TreeNode ShowCheckBox="True" Text="BankAPI" Value="BankAPI_7_1"></asp:TreeNode>
                                        </asp:TreeNode>
                                    </Nodes>

                                    <%-- 8 --%>
                                    <DataBindings>
                                        <asp:TreeNodeBinding Text="Cashier" TextField="Cashier_8" Value="Cashier_8" />
                                        <asp:TreeNodeBinding />
                                    </DataBindings>
                                    <Nodes>
                                        <asp:TreeNode ShowCheckBox="True" Text="Cashier" Value="Cashier_8">
                                            <asp:TreeNode ShowCheckBox="True" Text="Cashier" Value="Cashier_8_1"></asp:TreeNode>
                                        </asp:TreeNode>
                                    </Nodes>

                                    <%-- 9 --%>
                                    <DataBindings>
                                        <asp:TreeNodeBinding Text="MIS" TextField="MIS_9" Value="MIS_9" />
                                        <asp:TreeNodeBinding />
                                    </DataBindings>
                                    <Nodes>
                                        <asp:TreeNode ShowCheckBox="True" Text="MIS" Value="MIS_9">
                                            <asp:TreeNode ShowCheckBox="True" Text="MIS" Value="MIS_9_1"></asp:TreeNode>
                                        </asp:TreeNode>
                                    </Nodes>

                                    <%-- 10 --%>
                                    <DataBindings>
                                        <asp:TreeNodeBinding Text="ICM" TextField="ICM_10" Value="ICM_10" /><asp:TreeNodeBinding />
                                    </DataBindings>
                                    <Nodes>
                                        <asp:TreeNode ShowCheckBox="True" Text="ICM" Value="ICM_10">
                                            <asp:TreeNode ShowCheckBox="True" Text="DSE_Checklist" Value="DSE_Checklist_10_1"></asp:TreeNode>
                                        </asp:TreeNode>
                                    </Nodes>

                                    <%-- 11 --%>
                                    <DataBindings>
                                        <asp:TreeNodeBinding Text="Auditor" TextField="Auditor_11" Value="Auditor_11" />
                                        <asp:TreeNodeBinding />
                                    </DataBindings>
                                    <Nodes>
                                        <asp:TreeNode ShowCheckBox="True" Text="Auditor" Value="Auditor_11">
                                            <asp:TreeNode ShowCheckBox="True" Text="Auditor" Value="Auditor_11_1"></asp:TreeNode>
                                        </asp:TreeNode>
                                    </Nodes>

                                    <%-- 12 --%>
                                    <DataBindings>
                                        <asp:TreeNodeBinding Text="Reminder" TextField="Reminder_12" Value="Reminder_12" />
                                        <asp:TreeNodeBinding />
                                    </DataBindings>
                                    <Nodes>
                                        <asp:TreeNode ShowCheckBox="True" Text="Reminder" Value="Reminder_12">
                                            <asp:TreeNode ShowCheckBox="True" Text="Reminder" Value="Reminder_12_1"></asp:TreeNode>
                                        </asp:TreeNode>
                                    </Nodes>
                                </asp:TreeView>
                            </asp:Panel>
                        </div>


                        <div class="col-lg-3 nav-item-box">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="sub-title">
                                        <span>Select Branch</span>
                                    </div>
                                </div>
                            </div>
                            <asp:Panel ID="Panel1" runat="server" ScrollBars="Vertical" CssClass="navitempanel">
                                <div id="sample-select">
                                    <asp:DropDownList ID="Select_Branch" runat="server"></asp:DropDownList>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                </div>            
            </div>
        </asp:Panel>
    </form>



<!-- MDB -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"></script>
   
    <script src="../JS/ListSelect/virtual-select.min.js"></script>
    <script>

        VirtualSelect.init({
            ele: '#Select_Branch',
            multiple: true,
            search: false,
            keepAlwaysOpen: true,
        });

        VirtualSelect.init({
            ele: '#Exits_Users'
        });
    </script>
</body>
</html>
