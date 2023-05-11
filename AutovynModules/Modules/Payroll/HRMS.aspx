<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AutovynModules/AUTOVYN.Master" CodeBehind="HRMS.aspx.vb" Inherits="AutovynERP.HRMS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: 'Dosis', sans-serif;
        }

        
        body{
            font-size: 13px;
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


                .tabstyle{
            padding:10px !important;
        }



        .main-section {
            margin-top: 50px;
        }

        .profile {
            width: 90%;
            border: 1px solid green;
            border-radius: 15px;
            background-color: white;
            margin: auto;
            height: 136px;
            text-align: center;
        }

        .title span {
            font-size: 14px;
        }

        .sub-head {
            color: royalblue;
            font-size: 14px;
            font-weight: 700;
        }

        .sub-head1 {
            color: black;
            font-size: 14px;
            font-weight: 700;
        }



        .section-first {
            /*background: rgb(230, 191, 153);*/
            /*background: linear-gradient(90deg, rgba(230, 191, 153, 0.6935106806394433) 4%, rgba(167, 192, 255, 0.5954714649531687) 81%);*/
            padding: 4px 9px;
            -webkit-box-shadow: -1px -4px 22px -8px rgb(0 0 0 / 75%);
            -moz-box-shadow: -1px -4px 22px -8px rgba(0, 0, 0, 0.75);
            box-shadow: -1px 10px 4px -9px rgb(0 0 0 / 56%);
            border-radius: 4px;
            background-color: #a7e2cb;
        }

        .SalaryDetails {
            background-color: #efffdf;
            border-radius: 5px;
            padding: 4px 9px;
        }

        .fin-team {
            font-size: 18px;
            font-weight: 700;
            color: #0568d5;
        }

        .buttons {
            text-align: center;
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
            font-size:13px;
            color: white;
            min-height: 23px;
            min-width: 60px;
        }


        /*buttons*/

        .grnnewcode{
            font-size:12px;
             color: #fff;
             font-weight: 600;
            background-color: #529352e3;
        }

    .USLB {
        font-size: 10px;
        color: #fff;
        font-weight: 600;
        background-color: #529352e3;
    }

    .lwf{
         font-size: 10px;
        background-color: #529352e3;
        color: #fff;
        font-weight: 600;

    }

    .BDupdate{
        background-color: #529352e3;
        color: #fff;
        font-weight: 600;
        width:15%;
    }

    .OTPV{
        font-size: 10px;
        background-color: #529352e3;
        color: #fff;
        font-weight: 600;
        width:70%;
    }

    .Salary_update{
        background-color: #529352e3;
        color: #fff;
        font-weight: 600;
        width:30%;
        margin-top:10px;
        font-size: 12px;
    }

    .salarysummry{
         background-color: #529352e3;
        color: #fff;
        font-weight: 600;
        margin-top:10px;
        font-size: 12px;
    }

    .profilebtn {
        background-color: #529352e3;
        color: #fff;
        font-weight: 600;
        width:91px;
        margin-top:10px;
        font-size:12px;
    }

    .ELWD{
         background-color: #529352e3;
        color: #fff;
        font-weight: 600;
        width:30%;
        margin-top:10px;
        font-size: 12px;

    }

    
    .edit{
         background-color: #529352e3;
        color: #fff;
        font-weight: 600;
        width:10%;
        margin-top:10px;
        font-size: 12px;
    }

    .insert{
         background-color: #529352e3;
        color: #fff;
        width:100%;
        margin-top:10px;
    }

    .insert2{
         background-color: #529352e3;
        color: #fff;
        width:10%;
        margin-top:10px;
    }

    .insert3{
        background-color: #529352e3;
        color: #fff;
        width: 7.6%;
        margin-top:10px;
    }

    .insert4{
        background-color: #529352e3;
        color: #fff;
        width:24%;
        margin-top:10px;
    }

    .insert5{
        background-color: #529352e3;
        color: #fff;
        margin-top:10px;
    }

    .showimg{
        background-color: #529352e3;
        color: #fff;
        width:70%;
        margin-top:10px;
        font-size: 14px;
    }

    .uploadimg{
         background-color: #529352e3;
        color: #fff;
        width:70%;
        margin-top:10px;
        font-size: 14px;
    }

    .bankdtl {
        font-size:12px;
        background-color: #529352e3;
        color: #fff;
        font-weight: 600;
        width: 18%;
        margin-top: 10px;
    }

    .apv{
         background-color: #529352e3;
        color: #fff;
        font-weight: 600;
        width: 18%;
        margin-top: 10px;
        font-size: 12px;
    }


    @media screen and (max-width:768px) {
        .button-sactions {
            display: flex;
            justify-content: space-between;
        }

        .profile {
            width: 41%;
            border: 1px solid green;
            border-radius: 15px;
            background-color: white;
            margin: 10px auto;
            height: 270px;
            text-align: center;
            font-size:12px;
        }

        .apv {
            width: 30%;
        }

        .ELWD {
            width: 40%;
        }
    }

    @media screen and (max-width:828px) {
        .button-sactions {
            display: flex;
            justify-content: space-between;
        }

        .profile {
            width: 41%;
            border: 1px solid green;
            border-radius: 15px;
            background-color: white;
            margin: 10px auto;
            height: 270px;
            text-align: center;
        }

        .apv{
            width:30%;
        }

        .ELWD {
            width: 40%;
        }
    }


    @media screen and (max-width:480px) {


        .profile{
            height: 140px;
        }

        .Salary_update,.BDupdate {
            width: 50%;
        }

        .OTPV {
            width: 100%;
        }

        .grnnewcode {
            margin-top: 6px;
        }

        .profile{
            margin-top:15px;
            width:50%;
        }

        .ELWD {
            width: 94%;
        }

       .uplodbtn{
            width:28%;
        }

       .edit{
           width:30%;
       }


       .button-sactions {
            display: flex;
        }

        .img-box {
            display: flex;
            justify-content: center;
            flex-direction: column;
            text-align: center;
            align-items: center;
            margin: 14px 5px;
        }

        .img-box{
            background-color:red;
            margin:0;
        }


       }
    
    .form-control{
        height:30px;
        font-size:13px;
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


        .SalaryDetails .col-form-label{
            font-size:12px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid main-section">
        <!-- Main section-->
        <div class="section-first p-3">
            <div class="container-fluid">
                <div class="row">
                    <!--Main section-1 half-1-->
                    <div class="col-lg-9">
                        <!-- row -->
                        <div class="row mb-1">
                            <span class="sub-head">Employee Key Datails</span>
                        </div>
                        <!-- row -->

                        <!-- row -->
                        <div class="row mb-1">
                            <asp:Label ID="Label123" CssClass="col-lg-1 col-form-label" runat="server" Text="Label">Emp Code</asp:Label>
                            <div class="col-lg-3">
                                <asp:TextBox ID="Emp_code" CssClass="form-control" runat="server"  ></asp:TextBox>
                            
                            </div>
                            <div class="col-lg-2">
                                <asp:Button ID="gen_code" runat="server" CssClass="btn grnnewcode" Text="Generate new code" />
                            </div>
                            <asp:Label ID="label1111" CssClass="col-lg-1 col-form-label" runat="server" Text="Label">First Name</asp:Label>
                            <div class="col-lg-2">
                                <asp:TextBox ID="F_Name" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>

                            <asp:Label ID="Label125" CssClass="col-lg-1 col-form-label" runat="server" Text="Last Name"></asp:Label>
                            <div class="col-lg-2">
                                <asp:TextBox ID="L_Name" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <!-- row -->

                        <!-- row -->
                        <div class="row mb-1">
                            <asp:Label ID="Label126" CssClass="col-lg-1 col-form-label" runat="server" Text="Emp Type"></asp:Label>
                            <div class="col-lg-3">
                                <asp:DropDownList ID="DropDownList22" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="1">Regular</asp:ListItem>
                                    <asp:ListItem Value="2">Casual</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-lg-2"></div>
                            <asp:Label ID="Label127" CssClass="col-lg-1 col-form-label" runat="server" Text="Gender"></asp:Label>
                            <div class="col-lg-2">
                                <asp:DropDownList ID="DropDownList23" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="1">Male</asp:ListItem>
                                    <asp:ListItem Value="2">Female</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <asp:Label ID="label128" CssClass="col-lg-1 col-form-label" runat="server" Text="Region"></asp:Label>
                            <div class="col-lg-2">
                                <asp:DropDownList ID="DropDownList24" CssClass="form-control" runat="server"></asp:DropDownList>
                            </div>

                        </div>
                        <!-- row -->

                        <!-- row -->
                        <div class="row mb-1">
                            <asp:Label ID="label129" CssClass="col-lg-1 col-form-label" runat="server" Text="Location"></asp:Label>
                            <div class="col-lg-3">
                                <asp:DropDownList ID="Location" CssClass="form-control" runat="server"></asp:DropDownList>
                            </div>
                            <asp:Label ID="label130" CssClass="col-lg-3 col-form-label" runat="server" Text="Employee Machine Punching Code"></asp:Label>
                            <div class="col-lg-2">
                                <asp:DropDownList ID="DropDownList26" CssClass="form-control" runat="server"></asp:DropDownList>
                            </div>

                            <asp:Label ID="label131" CssClass="col-lg-1 col-form-label" runat="server" Text="EIN No." ToolTip="Employee Identification No"></asp:Label>
                            <div class="col-lg-2">
                                <asp:DropDownList ID="DropDownList27" CssClass="form-control" runat="server"></asp:DropDownList>
                            </div>
                        </div>
                        <!-- row -->

                        <!-- row -->
                        <div class="row mb-1">
                            <asp:Label ID="label228" CssClass="col-lg-1 col-form-label" runat="server" Text="Section"></asp:Label>
                            <div class="col-lg-3">
                                <asp:DropDownList ID="section" CssClass="form-control" runat="server"></asp:DropDownList>
                            </div>
                            <div class="col-lg-2"></div>
                            <asp:Label ID="label229" CssClass="col-lg-1 col-form-label" runat="server" Text="Designation"></asp:Label>
                            <div class="col-lg-2">
                                <asp:DropDownList ID="DropDownList37" CssClass="form-control" runat="server"></asp:DropDownList>
                            </div>
                            <asp:Label ID="label230" CssClass="col-lg-1 col-form-label" runat="server" Text="Departement"></asp:Label>
                            <div class="col-lg-2">
                                <asp:DropDownList ID="dept" CssClass="form-control" runat="server"></asp:DropDownList>
                            </div>
                        </div>
                        <!-- row -->

                    </div>

                    <!--Main section-1 half-2-->

                    <div class="col-lg-3">
                        <div class="row">
                            <div class="col-lg-7">
                                <div class="profile">
                                    <asp:Image ID="User_profile" runat="server" ImageUrl="~/AutovynModules/Media/profile.jpg" Style="border-radius: 15px; width: 100%; height: 100%;" />
                                </div>
                            </div>
                            <div class="col-lg-4" style="text-align: center;">
                                <asp:FileUpload ID="profile_Upload" runat="server" CssClass="uplodbtn" Style="width: 90%; margin-top: 4px; border-radius: 3px;" />
                                <br>
                                <br>
                                <asp:Button ID="btnUpload" Text="Upload" CssClass="btn profilebtn" runat="server" OnClick="UploadFile"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

            <div class="row">
                <%-- Form sections --%>
                <div class="col-lg-11">
                    <div class="section-first p-3" >
                        <!-- Pills navs -->
                        <ul class="nav nav-pills nav-fill mb-3" id="ex1" role="tablist">

                            <li class="nav-item" role="presentation">
                                <a class="nav-link active  tabstyle" id="ex2-tab-1" data-mdb-toggle="pill" href="#ex2-pills-1" role="tab" aria-controls="ex2-pills-1" aria-selected="true">Basic Info</a>
                            </li>

                            <li class="nav-item" role="presentation">
                                <a class="nav-link tabstyle" id="ex2-tab-2" data-mdb-toggle="pill" href="#ex2-pills-2" role="tab" aria-controls="ex2-pills-2" aria-selected="false">Employee Details</a>
                            </li>

                            <li class="nav-item" role="presentation">
                                <a class="nav-link tabstyle" id="ex2-tab-3" data-mdb-toggle="pill" href="#ex2-pills-3" role="tab" aria-controls="ex2-pills-3" aria-selected="false">Salary Details</a>
                            </li>


                            <li class="nav-item" role="presentation">
                                <a class="nav-link tabstyle" id="ex2-tab-4" data-mdb-toggle="pill" href="#ex2-pills-4" role="tab" aria-controls="ex2-pills-4" aria-selected="false">Education Details</a>
                            </li>

                            <li class="nav-item" role="presentation">
                                <a class="nav-link tabstyle" id="ex2-tab-5" data-mdb-toggle="pill" href="#ex2-pills-5" role="tab" aria-controls="ex2-pills-5" aria-selected="false">Full & Final</a>
                            </li>

                            <li class="nav-item" role="presentation">
                                <a class="nav-link tabstyle" id="ex2-tab-6" data-mdb-toggle="pill" href="#ex2-pills-6" role="tab" aria-controls="ex2-pills-6" aria-selected="false">Asset Issu</a>
                            </li>

                            <li class="nav-item" role="presentation">
                                <a class="nav-link tabstyle" id="ex2-tab-7" data-mdb-toggle="pill" href="#ex2-pills-7" role="tab" aria-controls="ex2-pills-7" aria-selected="false">Documents</a>
                            </li>

                            <li class="nav-item" role="presentation">
                                <a class="nav-link tabstyle" id="ex2-tab-8" data-mdb-toggle="pill" href="#ex2-pills-8" role="tab" aria-controls="ex2-pills-8" aria-selected="false">Verification</a>
                            </li>

                            <li class="nav-item" role="presentation">
                                <a class="nav-link tabstyle" id="ex2-tab-9" data-mdb-toggle="pill" href="#ex2-pills-9" role="tab" aria-controls="ex2-pills-9" aria-selected="false">Mobile App</a>
                            </li>

                            <li class="nav-item" role="presentation">
                                <a class="nav-link tabstyle" id="ex2-tab-10" data-mdb-toggle="pill" href="#ex2-pills-10" role="tab" aria-controls="ex2-pills-10" aria-selected="false">Others</a>
                            </li>
                        </ul>
                        <!-- Pills navs -->

                        <!-- Pills content -->
                        <div class="tab-content" id="ex2-content">
                            <%-- Basic info --%>
                            <div class="tab-pane fade show active" id="ex2-pills-1" role="tabpanel" aria-labelledby="ex2-tab-1">
                                <!--Tab1 section 1-->
                                <div class="section-first p-3 ">
                                    <div class="title mt-0 mb-1">
                                        <span class="sub-head">Employee Joining Details</span>
                                    </div>
                                    <!-- row -->
                                    <div class="row mb-1">
                                        <asp:Label ID="Label8" CssClass="col-lg-1 col-form-label" runat="server" Text="Label">Interview Date</asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>

                                        <asp:Label ID="Label9" CssClass="col-lg-2 col-form-label" runat="server" Text="Label">Employee Status</asp:Label>
                                        <div class="col-lg-2">
                                            <asp:DropDownList ID="DropDownList4" CssClass="form-control" runat="server">
                                                <asp:ListItem>Yes</asp:ListItem>
                                                <asp:ListItem>No</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>


                                        <asp:Label ID="Label18" CssClass="col-lg-2 col-form-label" runat="server" Text="Joining Date"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox8" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <!-- row -->

                                    <!-- row -->
                                    <div class="row mb-1">
                                        <asp:Label ID="Label20" CssClass="col-lg-1 col-form-label" runat="server" Text="Induc. Status" ToolTip="Induction Status"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:DropDownList ID="DropDownList5" CssClass="form-control" runat="server">
                                                <asp:ListItem>Yes</asp:ListItem>
                                                <asp:ListItem>No</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                        <asp:Label ID="Label22" CssClass="col-lg-2 col-form-label" runat="server" Text="Probation Period"></asp:Label>
                                        <div class="col-lg-2">

                                            <asp:TextBox ID="TextBox9" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>


                                        <asp:Label ID="Label19" CssClass="col-lg-2 col-form-label" runat="server" Text="Probation Period Date"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox13" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>


                                    </div>
                                    <!-- row -->

                                    <!-- row -->
                                    <div class="row mb-1">
                                        <asp:Label ID="Label23" CssClass="col-lg-1 col-form-label" runat="server" Text="Label">Notice Period</asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox11" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <asp:Label ID="Label25" CssClass="col-lg-2 col-form-label" runat="server" Text="Skill"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox12" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <!-- row -->
                                </div>



                                <!--Tab1 section 2-->
                                <div class="section-first p-3 mt-2">
                                    <div class="title mt-0 mb-1">
                                        <span class="sub-head">Employee Identity</span>
                                    </div>
                                    <!-- row -->
                                    <div class="row mb-1">
                                        <asp:Label ID="Label7" CssClass="col-lg-1 col-form-label" runat="server" Text="Label">PAN Card No</asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="Pan_No" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>

                                        <div class="col-lg-1 mt-2">
                                            <asp:CheckBox ID="CheckBox1" runat="server" />
                                            <asp:Label ID="Label28" CssClass="col-lg-2 col-form-labe mt-2" runat="server" Text="Verified"></asp:Label>
                                        </div>

                                        <asp:Label ID="Label10" CssClass="col-lg-1 col-form-label" runat="server" Text="Label">Passport No</asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-1 mt-2">
                                            <asp:CheckBox ID="CheckBox4" runat="server" CssClass="col-lg-1 col-form-labe mt-2" />
                                            <asp:Label ID="Label13" CssClass="col-lg-12 col-form-labe" runat="server" Text="Verified"></asp:Label>
                                        </div>

                                        <asp:Label ID="Label12" CssClass="col-lg-1 col-form-label" runat="server" Text="Pass Exp" ToolTip="Passport Exprie Date"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>


                                    </div>
                                    <!-- row -->

                                    <!-- row -->
                                    <div class="row mb-1">
                                        <asp:Label ID="Label16" CssClass="col-lg-1 col-form-label" runat="server" Text="Aadhar No"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox7" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>

                                        <div class="col-lg-1 mt-2">
                                            <asp:CheckBox ID="CheckBox5" runat="server" CssClass="col-lg-1 col-form-labe mt-2" />
                                            <asp:Label ID="Label17" CssClass="col-lg-12 col-form-labe" runat="server" Text="Verified"></asp:Label>
                                        </div>

                                        <asp:Label ID="Label11" CssClass="col-lg-1 col-form-label" runat="server" Text="Label">Licence No</asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox5" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-1 mt-2">
                                            <asp:CheckBox ID="CheckBox3" runat="server" CssClass="col-lg-1 col-form-labe mt-2" />
                                            <asp:Label ID="Label15" CssClass="col-lg-12 col-form-labe" runat="server" Text="Verified"></asp:Label>
                                        </div>

                                        <asp:Label ID="Label14" CssClass="col-lg-1 col-form-label" runat="server" Text="Licen. Issu " ToolTip="Licence Issu Date"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox6" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>

                                    </div>
                                    <!-- row -->
                                </div>



                                <!--Tab1 section 3-->
                                <div class="section-first p-3 mt-2">
                                    <div class="title mt-0 mb-1">
                                        <span class="sub-head">Reporting Manager</span>
                                    </div>
                                    <!-- row -->
                                    <div class="row mb-1">
                                        <asp:Label ID="Label4" CssClass="col-lg-1 col-form-label" runat="server" Text="Label">Reporting -1</asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox10" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-1"></div>

                                        <asp:Label ID="Label24" CssClass="col-lg-1 col-form-label" runat="server" Text="Reporting -2"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox14" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-1"></div>

                                        <asp:Label ID="Label21" CssClass="col-lg-1 col-form-label" runat="server" Text="HR Team"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox15" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>

                                    </div>
                                    <!-- row -->
                                </div>
                            </div>

                            <%-- Employee Details --%>
                            <div class="tab-pane fade" id="ex2-pills-2" role="tabpanel" aria-labelledby="ex2-tab-2">
                                <!--Tab-2 section 1-->
                                <div class="section-first ps-3 pe-3 ">

                                    <!-- row -->
                                    <div class="row mb-1">
                                        <span class="sub-head">Permanent Address</span>
                                    </div>
                                    <!-- row -->

                                    <!-- row -->
                                    <div class="row mb-1">
                                        <asp:Label ID="Label30" CssClass="col-lg-1 col-form-label" runat="server" Text="Label">Address</asp:Label>
                                        <div class="col-lg-5">
                                            <asp:TextBox ID="address" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>

                                        <asp:Label ID="Label31" CssClass="col-lg-1 col-form-label" runat="server" Text="Label">City</asp:Label>
                                        <div class="col-lg-5">
                                            <asp:TextBox ID="city" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <!-- row -->

                                    <!-- row -->
                                    <div class="row mb-1">
                                        <asp:Label ID="Label32" CssClass="col-lg-1 col-form-label" runat="server" Text="Pin code"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="pin_no" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>

                                        <asp:Label ID="Label38" CssClass="col-lg-1 col-form-label" runat="server" Text="State"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="state" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>

                                        <asp:Label ID="Label39" CssClass="col-lg-1 col-form-label" runat="server" Text="Landline No"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="land_line" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <asp:Label ID="Label40" CssClass="col-lg-1 col-form-label" runat="server" Text="Mobile No"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="mob_no" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>

                                    </div>
                                    <!-- row -->

                                    <!-- row -->
                                    <div class="row mb-1">
                                        <asp:Label ID="Label41" CssClass="col-lg-1 col-form-label" runat="server" Text="Email Id"></asp:Label>
                                        <div class="col-lg-5">
                                            <asp:TextBox ID="TextBox24" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <!-- row -->
                                </div>


                                <!--Tab-2 section 2-->
                                <div class="section-first" style="background-color: #cde7cd;">
                                    <!-- row -->
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <input type="checkbox" id="same" onchange="addressFunction()" />
                                            <asp:Label ID="Label33" CssClass="col-lg-2 col-form-labe mt-2" runat="server" Text="Click If Both Address Same"></asp:Label>
                                        </div>
                                    </div>
                                    <!-- row -->
                                </div>

                                <script>
                                    function addressFunction() {
                                        if (document.getElementById("same").checked) {
                                            document.getElementById("address2").value = document.getElementById("address").value;
                                            document.getElementById("city2").value = document.getElementById("city").value;
                                            document.getElementById("pin_no2").value = document.getElementById("pin_no").value;
                                            document.getElementById("state2").value = document.getElementById("state").value;
                                            document.getElementById("land_line2").value = document.getElementById("land_line").value;
                                            document.getElementById("mob_no2").value = document.getElementById("mob_no").value;
                                        }
                                    }
                                </script>

                                <!--Tab-2 section 3-->
                                <div class="section-first ps-3 pe-3">
                                    <!-- row -->
                                    <div class="row mb-1">
                                        <span class="sub-head">Current Address</span>
                                    </div>
                                    <!-- row -->
                                    <!-- row -->
                                    <div class="row ">
                                        <asp:Label ID="Label34" CssClass="col-lg-1 col-form-label" runat="server" Text="Label">Address</asp:Label>
                                        <div class="col-lg-5">
                                            <asp:TextBox ID="address2" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>

                                        <asp:Label ID="Label35" CssClass="col-lg-1 col-form-label" runat="server" Text="Label">City</asp:Label>
                                        <div class="col-lg-5">
                                            <asp:TextBox ID="city2" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <!-- row -->

                                    <!-- row -->
                                    <div class="row mb-1 mt-1">

                                        <asp:Label ID="Label36" CssClass="col-lg-1 col-form-label" runat="server" Text="Curr. Pin code"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="pin_no2" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>

                                        <asp:Label ID="Label37" CssClass="col-lg-1 col-form-label" runat="server" Text="Current State"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="state2" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <asp:Label ID="Label44" CssClass="col-lg-1 col-form-label" runat="server" Text="UID No"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="uid_no" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>

                                        <asp:Label ID="Label42" CssClass="col-lg-1 col-form-label" runat="server" Text="Label">Landline No</asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="land_line2" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>


                                    <!-- row -->
                                    <div class="row mb-1 mt-1">
                                        <asp:Label ID="Label43" CssClass="col-lg-1 col-form-label" runat="server" Text="Label">Mobile No</asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="mob_no2" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <asp:Label ID="Label434" CssClass="col-lg-1 col-form-label" runat="server" Text="Label">Grade</asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="DropDownList11" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>

                                        <asp:Label ID="Label46" CssClass="col-lg-1 col-form-label" runat="server" Text="Label">Nationality</asp:Label>
                                        <div class="col-lg-2">
                                            <asp:DropDownList ID="DropDownList12" CssClass="form-control" runat="server">
                                                <asp:ListItem>Indian</asp:ListItem>
                                                <asp:ListItem></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                    </div>
                                    <!-- row -->
                                </div>


                                <!--Tab-2 section 4-->
                                <div class="section-first ps-3 pe-3 mt-1 ">
                                    <!-- row -->
                                    <div class="row mb-1">
                                        <div class="col-lg-4 mt-2">
                                            <asp:Label ID="Label144" CssClass="col-form-labe sub-head" runat="server" Text="Employee Personal Information"></asp:Label>
                                        </div>
                                        <div class="col-lg-8" style="text-align: right;">
                                            <button class=" btn edit" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample10" aria-expanded="false" aria-controls="collapseExample">
                                                Edit
                                            </button>
                                        </div>
                                    </div>
                                    <!-- row -->
                                    <div class="collapse" id="collapseExample10">
                                        <div class="card card-body">
                                            <!-- row -->
                                            <div class="row mb-1 mt-1">
                                                <asp:Label ID="Label45" CssClass="col-lg-2 col-form-label" runat="server" Text="Label">Father's Name</asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="father_name" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Label47" CssClass="col-lg-2 col-form-label" runat="server" Text="Mother's Name"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="mother_name" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Label48" CssClass="col-lg-1 col-form-label" runat="server" Text="Label">Aniv. Date</asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox28" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-1 mt-2">
                                                    <asp:CheckBox ID="CheckBox6" runat="server" />
                                                    <asp:Label ID="Label49" CssClass="col-lg-2 col-form-labe mt-2" runat="server" Text="Married"></asp:Label>
                                                </div>
                                            </div>
                                            <!-- row -->

                                            <!-- row -->
                                            <div class="row mb-1 mt-1">
                                                <asp:Label ID="Label50" CssClass="col-lg-2 col-form-label" runat="server" Text="Label">Spouse Name</asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox29" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Label55" CssClass="col-lg-2 col-form-label" runat="server" Text="Label">Personal Email</asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox33" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Label51" CssClass="col-lg-1 col-form-label" runat="server" Text="Height(Ft)"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="emp_height" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <!-- row -->

                                            <!-- row -->
                                            <div class="row mb-1 mt-1">
                                                <asp:Label ID="Label52" CssClass="col-lg-2 col-form-label" runat="server" Text="Label">Weight(Kg)</asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="emp_weight" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>
                                                <asp:Label ID="Label53" CssClass="col-lg-2 col-form-label" runat="server" Text="Label">Blood Group</asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:DropDownList ID="DropDownList13" CssClass="form-control" runat="server">
                                                        <asp:ListItem>A+</asp:ListItem>
                                                        <asp:ListItem>A-</asp:ListItem>
                                                        <asp:ListItem>B+</asp:ListItem>
                                                        <asp:ListItem>B-</asp:ListItem>
                                                        <asp:ListItem>AB+</asp:ListItem>
                                                        <asp:ListItem>AB-</asp:ListItem>
                                                        <asp:ListItem>O+</asp:ListItem>
                                                        <asp:ListItem>O-</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>

                                                <asp:Label ID="Label54" CssClass="col-lg-1 col-form-label" runat="server" Text="Label">Date of Birth</asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="dob" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>
                                            </div>


                                            <div class="row mb-1 mt-1">
                                                <asp:Label ID="Label57" CssClass="col-lg-2 col-form-label" runat="server" Text="Label">Religion</asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:DropDownList ID="DropDownList14" CssClass="form-control" runat="server">
                                                        <asp:ListItem>Hinduilg</asp:ListItem>
                                                        <asp:ListItem>Christianity</asp:ListItem>
                                                        <asp:ListItem>Islam</asp:ListItem>
                                                        <asp:ListItem>Buddha</asp:ListItem>
                                                        <asp:ListItem>Jain</asp:ListItem>
                                                        <asp:ListItem>Persians</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <!-- row -->
                                        </div>
                                    </div>
                                </div>


                                <!--Tab-2 section 4-->
                                <div class="section-first ps-3 pe-3 mt-1 ">
                                    <!-- row -->
                                    <div class="row mb-1">
                                        <div class="col-lg-4 mt-2">
                                            <asp:Label ID="Label145" CssClass="col-form-labe sub-head" runat="server" Text="Reference Details"></asp:Label>
                                        </div>
                                        <div class="col-lg-8" style="text-align: right;">
                                            <button class=" btn edit" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample11" aria-expanded="false" aria-controls="collapseExample">
                                                Edit
                                            </button>
                                        </div>
                                    </div>
                                    <!-- row -->
                                    <div class="collapse" id="collapseExample11">
                                        <div class="card card-body">
                                            <!-- row -->
                                            <div class="row mb-1">
                                                <asp:Label ID="Label146" CssClass="col-lg-1 col-form-label" runat="server" Text="Name"></asp:Label>
                                                <div class="col-lg-2 mt-2">
                                                    <asp:TextBox ID="TextBox914" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Label148" CssClass="col-lg-1 col-form-label" runat="server" Text="Occupation"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox94" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Label149" CssClass="col-lg-1 col-form-label" runat="server" Text="Address"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox95" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Labeal149" CssClass="col-lg-1 col-form-label" runat="server" Text="Mobile No"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox96" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <!-- row -->

                                            <!-- row -->
                                            <div class="row mb-1">
                                                <asp:Label ID="Label147" CssClass="col-lg-1 col-form-label" runat="server" Text="Email Id"></asp:Label>
                                                <div class="col-lg-2 mt-2">
                                                    <asp:TextBox ID="TextBox100" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Label155" CssClass="col-lg-1 col-form-label" runat="server" Text="Relation"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox101" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>


                                            </div>
                                            <!-- row -->
                                        </div>
                                    </div>
                                </div>

                                <!--Tab-2 section 4-->
                                <div class="section-first ps-3 pe-3 mt-1 ">
                                    <!-- row -->
                                    <div class="row mb-1">
                                        <div class="col-lg-4 mt-2">
                                            <asp:Label ID="Label156" CssClass="col-form-labe sub-head" runat="server" Text="Family Emerency Contact Details"></asp:Label>
                                        </div>
                                        <div class="col-lg-8" style="text-align: right;">
                                            <button class=" btn edit" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample111" aria-expanded="false" aria-controls="collapseExample">
                                                Edit
                                            </button>
                                        </div>
                                    </div>
                                    <!-- row -->
                                    <div class="collapse" id="collapseExample111">
                                        <div class="card card-body">
                                            <!-- row -->
                                            <div class="row mb-1">
                                                <asp:Label ID="Label157" CssClass="col-lg-1 col-form-label" runat="server" Text="Person Name"></asp:Label>
                                                <div class="col-lg-2 mt-2">
                                                    <asp:TextBox ID="TextBox102" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Label158" CssClass="col-lg-1 col-form-label" runat="server" Text="Date Of Birth"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox103" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Label159" CssClass="col-lg-1 col-form-label" runat="server" Text="Relation"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox109" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Label160" CssClass="col-lg-1 col-form-label" runat="server" Text="Address"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox110" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <!-- row -->

                                            <!-- row -->
                                            <div class="row mb-1">
                                                <asp:Label ID="Label161" CssClass="col-lg-1 col-form-label" runat="server" Text="Blood Group"></asp:Label>
                                                <div class="col-lg-2 mt-2">
                                                    <asp:TextBox ID="TextBox111" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Label162" CssClass="col-lg-1 col-form-label" runat="server" Text="Email Id"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox112" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Label163" CssClass="col-lg-1 col-form-label" runat="server" Text="Profession"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox113" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <!-- row -->
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%-- Salary Details --%>
                            <div class="tab-pane fade" id="ex2-pills-3" role="tabpanel" aria-labelledby="ex2-tab-3">
                                <!--Tab-3 section-1-->
                                <div class="section-first p-3">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <!--Tab-3 section-1 half-1-->
                                            <div class="col-lg-8">
                                                <div class="section-first">
                                                    <!-- row -->
                                                    <div class="row mb-1">
                                                        <span class="sub-head">Statutoiry Details</span>
                                                    </div>
                                                    <!-- row -->

                                                    <!-- row -->
                                                    <div class="row mb-1" style="font-size:10px;">
                                                        <asp:Label ID="Label56" CssClass="col-lg-2 col-form-label" runat="server" Text="Label">PF</asp:Label>
                                                        <div class="col-lg-2 mt-2">
                                                            <asp:CheckBox ID="pf_chk" runat="server"/>
                                                            <asp:Label ID="Label58" CssClass="col-lg-2 col-form-labe mt-2" runat="server" Text="Yes / No"></asp:Label>
                                                        </div>

                                                        <asp:Label ID="Label59" CssClass="col-lg-2 col-form-label" runat="server" Text="Effective Form"></asp:Label>
                                                        <div class="col-lg-2">
                                                            <asp:TextBox ID="TextBox34" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                                                        </div>

                                                        <asp:Label ID="Label60" CssClass="col-lg-2 col-form-label" runat="server" Text="PF %"></asp:Label>
                                                        <div class="col-lg-2">
                                                            <asp:DropDownList ID="pf_per" CssClass="form-control" runat="server">
                                                                <asp:ListItem></asp:ListItem>
                                                                <asp:ListItem>12</asp:ListItem>
                                                                <asp:ListItem>24</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <!-- row -->

                                                    <!-- row -->
                                                    <div class="row mb-1">
                                                        <asp:Label ID="Label61" CssClass="col-lg-2 col-form-label" runat="server" Text="Label">PF No.</asp:Label>
                                                        <div class="col-lg-6">
                                                            <asp:TextBox ID="TextBox35" CssClass="form-control" runat="server"></asp:TextBox>
                                                        </div>

                                                        <asp:Label ID="Label64" CssClass="col-lg-2 col-form-label" runat="server" Text="UAN No."></asp:Label>
                                                        <div class="col-lg-2">
                                                            <asp:TextBox ID="TextBox36" CssClass="form-control" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <!-- row -->

                                                    <!-- row -->
                                                    <div class="row mb-1">
                                                        <asp:Label ID="Label62" CssClass="col-lg-2 col-form-label" runat="server" Text="Label">ESIC</asp:Label>
                                                        <div class="col-lg-2 mt-2">
                                                            <asp:CheckBox ID="esic_chk" runat="server" />
                                                            <asp:Label ID="Label63" CssClass="col-lg-2 col-form-labe mt-2" runat="server" Text="Yes / No"></asp:Label>
                                                        </div>

                                                        <asp:Label ID="Label65" CssClass="col-lg-2 col-form-label" runat="server" Text="Effective Form"></asp:Label>
                                                        <div class="col-lg-2">
                                                            <asp:TextBox ID="TextBox37" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                                                        </div>

                                                        <div class="col-lg-2">
                                                            <asp:Button ID="Button1" runat="server" CssClass="btn USLB" Text="Update SL Balance" />
                                                        </div>
                                                    </div>
                                                    <!-- row -->

                                                    <!-- row -->
                                                    <div class="row mb-1">
                                                        <asp:Label ID="Label67" CssClass="col-lg-2 col-form-label" runat="server" Text="Label">ESIC No.</asp:Label>
                                                        <div class="col-lg-6">
                                                            <asp:TextBox ID="TextBox38" CssClass="form-control" runat="server"></asp:TextBox>
                                                        </div>

                                                        <div class="col-lg-2">
                                                            <asp:Button ID="Button2" runat="server" CssClass="btn lwf" Text="LWF" />
                                                        </div>
                                                        <div class="col-lg-2 mt-2" style="text-align: right;">
                                                            <asp:CheckBox ID="CheckBox9" runat="server" />
                                                            <asp:Label ID="Label66" CssClass="col-lg-2 col-form-labe mt-2" runat="server" Text="Yes / No"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <!-- row -->

                                                    <!-- row -->
                                                    <div class="row">
                                                        <asp:Label ID="Label68" CssClass="col-lg-2 col-form-label" runat="server" Text="Bonus"></asp:Label>
                                                        <div class="col-lg-2 mt-2">
                                                            <asp:CheckBox ID="CheckBox10" runat="server" />
                                                            <asp:Label ID="Label69" CssClass="col-lg-2 col-form-labe mt-2" runat="server" Text="Yes / No"></asp:Label>
                                                        </div>

                                                        <asp:Label ID="Label70" CssClass="col-lg-2 col-form-label" runat="server" Text="Weekly Off"></asp:Label>
                                                        <div class="col-lg-2">
                                                            <asp:DropDownList ID="DropDownList15" CssClass="form-control" runat="server">
                                                                <asp:ListItem></asp:ListItem>
                                                                <asp:ListItem>SUN</asp:ListItem>
                                                                <asp:ListItem>MON</asp:ListItem>
                                                                <asp:ListItem>TUE</asp:ListItem>
                                                                <asp:ListItem>WED</asp:ListItem>
                                                                <asp:ListItem>THU</asp:ListItem>
                                                                <asp:ListItem>FRI</asp:ListItem>
                                                                <asp:ListItem>SAT</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>

                                                        <asp:Label ID="Label71" CssClass="col-lg-2 col-form-label" runat="server" Text="Emp Shift"></asp:Label>
                                                        <div class="col-lg-2">
                                                            <asp:DropDownList ID="DropDownList16" CssClass="form-control" runat="server"></asp:DropDownList>
                                                        </div>

                                                    </div>
                                                    <!-- row -->
                                                </div>



                                                <%-- Bank information --%>
                                                <div class="section-first  mt-2">
                                                    <!-- row -->
                                                    <div class="row mb-1">
                                                        <div class="col-lg-6 mt-2">
                                                            <asp:Label ID="Label72" CssClass="col-form-labe sub-head" runat="server" Text="Bank Details"></asp:Label>
                                                            <asp:CheckBox ID="CheckBox11" runat="server" />
                                                            <asp:Label ID="Label73" CssClass="col-lg-4 col-form-labe mt-2" runat="server" Text="Enable Editing in Bank Details"></asp:Label>

                                                        </div>
                                                        <div class="col-lg-6" style="text-align: right;">
                                                            <button class=" btn bankdtl" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample15" aria-expanded="false" aria-controls="collapseExample">
                                                                Edit
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <!-- row -->

                                                    <!-- row -->
                                                    <div class="collapse" id="collapseExample15">
                                                        <div class="card card-body">
                                                            <!-- row -->
                                                            <div class="row mb-1">
                                                                <asp:Label ID="Label74" CssClass="col-lg-2 col-form-label" runat="server" Text="Bank Name"></asp:Label>
                                                                <div class="col-lg-2">
                                                                    <asp:DropDownList ID="DropDownList19" CssClass="form-control" runat="server">
                                                                        <asp:ListItem></asp:ListItem>
                                                                        <asp:ListItem>AXIS BANK</asp:ListItem>
                                                                        <asp:ListItem>SBI BANK</asp:ListItem>
                                                                        <asp:ListItem>PNB BANK</asp:ListItem>
                                                                        <asp:ListItem>ICICI BANK</asp:ListItem>
                                                                        <asp:ListItem>KOTAK MAHINDRA BANK</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>

                                                                <asp:Label ID="Label76" CssClass="col-lg-2 col-form-label" runat="server" Text="A/C Type"></asp:Label>
                                                                <div class="col-lg-2">
                                                                    <asp:DropDownList ID="DropDownList17" CssClass="form-control" runat="server">
                                                                        <asp:ListItem></asp:ListItem>
                                                                        <asp:ListItem>Saving A/C</asp:ListItem>
                                                                        <asp:ListItem>Salaried A/C</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>

                                                                <asp:Label ID="Label77" CssClass="col-lg-2 col-form-label" runat="server" Text="A/C No."></asp:Label>
                                                                <div class="col-lg-2">
                                                                    <asp:TextBox ID="TextBox39" CssClass="form-control" runat="server"></asp:TextBox>
                                                                </div>

                                                            </div>
                                                            <!-- row -->

                                                            <!-- row -->
                                                            <div class="row mb-1">
                                                                <asp:Label ID="Label75" CssClass="col-lg-2 col-form-label" runat="server" Text="Branch Name"></asp:Label>
                                                                <div class="col-lg-2">
                                                                    <asp:TextBox ID="TextBox41" CssClass="form-control" runat="server"></asp:TextBox>
                                                                </div>
                                                                <div class="col-lg-4 mt-2">
                                                                    <asp:CheckBox ID="CheckBox12" runat="server" />
                                                                    <asp:Label ID="Label78" CssClass="col-lg-2 col-form-labe mt-2" runat="server" Text="A/C Document Verified"></asp:Label>
                                                                </div>

                                                                <asp:Label ID="Label79" CssClass="col-lg-2 col-form-label" runat="server" Text="Payment Mode"></asp:Label>
                                                                <div class="col-lg-2">
                                                                    <asp:DropDownList ID="DropDownList18" CssClass="form-control" runat="server">
                                                                        <asp:ListItem></asp:ListItem>
                                                                        <asp:ListItem>Saving A/C</asp:ListItem>
                                                                        <asp:ListItem>Salaried A/C</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>


                                                            </div>
                                                            <!-- row -->

                                                            <!-- row -->
                                                            <div class="row mb-1">
                                                                <asp:Label ID="Label80" CssClass="col-lg-2 col-form-label" runat="server" Text="IFSC Code"></asp:Label>
                                                                <div class="col-lg-2">
                                                                    <asp:TextBox ID="TextBox40" CssClass="form-control" runat="server"></asp:TextBox>
                                                                </div>
                                                                <div class="col-lg-4 mt-2">
                                                                    <asp:CheckBox ID="CheckBox13" runat="server" />
                                                                    <asp:Label ID="Label81" CssClass="col-lg-2 col-form-labe mt-2" runat="server" Text="Tick if Salary On Hold"></asp:Label>
                                                                </div>

                                                                <asp:Label ID="Label82" CssClass="col-lg-2 col-form-label" runat="server" Text="A/C Name"></asp:Label>
                                                                <div class="col-lg-2">
                                                                    <asp:TextBox ID="TextBox42" CssClass="form-control" runat="server"></asp:TextBox>
                                                                </div>


                                                            </div>
                                                            <!-- row -->

                                                            <!-- row -->
                                                            <div class="row mb-1">
                                                                <div class="col-lg-12 mt-1" style="text-align: right;">
                                                                    <asp:Button ID="Button3" runat="server" CssClass="btn BDupdate" Text="UPDATE" />
                                                                </div>
                                                            </div>
                                                            <!-- row -->
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="section-first mt-2">
                                                    <!-- row -->
                                                    <div class="row mb-0">
                                                        <asp:Label ID="Label83" CssClass="col-lg-3 col-form-label sub-head" runat="server" Text="Salary View Region"></asp:Label>
                                                        <div class="col-lg-2">
                                                            <asp:DropDownList ID="DropDownList20" CssClass="form-control" runat="server">
                                                                <asp:ListItem></asp:ListItem>
                                                                <asp:ListItem></asp:ListItem>
                                                                <asp:ListItem></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>

                                                    </div>
                                                    <!-- row -->

                                                    <!-- row -->
                                                    <div class="row mb-1 mt-4">
                                                        <asp:Label ID="Label84" CssClass="col-lg-4 col-form-label" runat="server" Text="Employee Punch Required"></asp:Label>
                                                        <asp:Label ID="Label85" CssClass="col-lg-2 col-form-label" runat="server" Text="Punch Type"></asp:Label>
                                                        <div class="col-lg-2">
                                                            <asp:DropDownList ID="DropDownList21" CssClass="form-control" runat="server">
                                                                <asp:ListItem></asp:ListItem>
                                                                <asp:ListItem>In Punch</asp:ListItem>
                                                                <asp:ListItem>Out Punch</asp:ListItem>
                                                                <asp:ListItem>In/Out Both Punch</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>

                                                        <div class="col-lg-3 mt-1">
                                                            <asp:Button ID="Button4" runat="server" CssClass="btn OTPV" Text="OTP Verification" />
                                                        </div>

                                                    </div>
                                                    <!-- row -->
                                                </div>
                                            </div>

                                            <!--Tab-3 section-1 half-2-->
                                            <div class="col-lg-4 SalaryDetails">
                                                <div class="title mt-0 mb-1">
                                                    <span class="sub-head">Salary Datails</span>
                                                </div>

                                                <!-- row -->
                                                <div class="row mb-1">
                                                    <asp:Label ID="Label86" CssClass="col-lg-3 col-form-label" runat="server" Text="Effective Form"></asp:Label>
                                                    <div class="col-lg-3">
                                                        <asp:TextBox ID="TextBox43" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                                                    </div>

                                                    <asp:Label ID="Label87" CssClass="col-lg-3 col-form-label" runat="server" Text="Emp. Basics"></asp:Label>
                                                    <div class="col-lg-3">
                                                        <asp:TextBox ID="TextBox44" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <!-- row -->

                                                <!-- row -->
                                                <div class="row mb-1">
                                                    <asp:Label ID="Label88" CssClass="col-lg-3 col-form-label" runat="server" Text="HRA"></asp:Label>
                                                    <div class="col-lg-3">
                                                        <asp:TextBox ID="TextBox45" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>

                                                    <asp:Label ID="Label89" CssClass="col-lg-3 col-form-label" runat="server" Text="Conveyance"></asp:Label>
                                                    <div class="col-lg-3">
                                                        <asp:TextBox ID="TextBox46" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <!-- row -->


                                                <!-- row -->
                                                <div class="row mb-1">
                                                    <asp:Label ID="Label90" CssClass="col-lg-3 col-form-label" runat="server" Text="Medical"></asp:Label>
                                                    <div class="col-lg-3">
                                                        <asp:TextBox ID="TextBox47" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>

                                                    <asp:Label ID="Label91" CssClass="col-lg-3 col-form-label" runat="server" Text="DA"></asp:Label>
                                                    <div class="col-lg-3">
                                                        <asp:TextBox ID="TextBox48" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <!-- row -->

                                                <!-- row -->
                                                <div class="row mb-1">
                                                    <asp:Label ID="Label92" CssClass="col-lg-3 col-form-label" runat="server" Text="Washing"></asp:Label>
                                                    <div class="col-lg-3">
                                                        <asp:TextBox ID="TextBox49" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>

                                                    <asp:Label ID="Label93" CssClass="col-lg-3 col-form-label" runat="server" Text="Monthly Gross"></asp:Label>
                                                    <div class="col-lg-3">
                                                        <asp:TextBox ID="TextBox50" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <!-- row -->

                                                <!-- row -->
                                                <div class="row mb-1">
                                                    <asp:Label ID="Label95" CssClass="col-lg-3 col-form-label" runat="server" Text="Annual Gross"></asp:Label>
                                                    <div class="col-lg-3">
                                                        <asp:TextBox ID="TextBox52" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>

                                                    <asp:Label ID="Label94" CssClass="col-lg-3 col-form-label" runat="server" Text="Emp Salary"></asp:Label>
                                                    <div class="col-lg-3">
                                                        <asp:TextBox ID="TextBox51" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>

                                                </div>
                                                <!-- row -->

                                                <!-- row -->
                                                <div class="row mb-1">
                                                    <asp:Label ID="Label96" CssClass="col-lg-3 col-form-label" runat="server" Text="PF"></asp:Label>
                                                    <div class="col-lg-3">
                                                        <asp:TextBox ID="TextBox53" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>

                                                    <asp:Label ID="Label97" CssClass="col-lg-3 col-form-label" runat="server" Text="ESIC"></asp:Label>
                                                    <div class="col-lg-3">
                                                        <asp:TextBox ID="TextBox54" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>

                                                </div>
                                                <!-- row -->

                                                <!-- row -->
                                                <div class="row mb-1">
                                                    <asp:Label ID="Label98" CssClass="col-lg-3 col-form-label" runat="server" Text="LWF"></asp:Label>
                                                    <div class="col-lg-3">
                                                        <asp:TextBox ID="TextBox55" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>

                                                    <asp:Label ID="Label99" CssClass="col-lg-3 col-form-label" runat="server" Text="PF Limit" ToolTip="PF Salary Limit"></asp:Label>
                                                    <div class="col-lg-3">
                                                        <asp:TextBox ID="TextBox56" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>

                                                </div>
                                                <!-- row -->

                                                <!-- row -->
                                                <div class="row mb-1">
                                                    <asp:Label ID="Label100" CssClass="col-lg-3 col-form-label" runat="server" Text="Bonus"></asp:Label>
                                                    <div class="col-lg-3">
                                                        <asp:TextBox ID="TextBox57" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>

                                                    <asp:Label ID="Label101" CssClass="col-lg-3 col-form-label" runat="server" Text="Uniform Amt"></asp:Label>
                                                    <div class="col-lg-3">
                                                        <asp:TextBox ID="TextBox58" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>

                                                </div>
                                                <!-- row -->

                                                <!-- row -->
                                                <div class="row mb-4" style="text-align: right;">
                                                    <div class="col-lg-12 mt-1">
                                                        <asp:Button ID="Button5" runat="server" CssClass="btn Salary_update" Text="Salary Update" />
                                                    </div>
                                                </div>
                                                <!-- row -->

                                                <!-- row -->
                                                <div class="row mb-1">
                                                </div>
                                                <!-- row -->
                                                <!-- row -->
                                                <div class="row mb-1" style="text-align: right;">
                                                    <div class="col-lg-2">
                                                        <button type="button" class="btn salarysummry" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                                            Show
                                                        </button>

                                                        <!-- Modal -->
                                                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog modal-xl">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Salary Details</h1>
                                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <asp:Label ID="Label102" CssClass="col-lg-3 col-form-label" runat="server" Text="CTC"></asp:Label>
                                                    <div class="col-lg-7">
                                                        <asp:TextBox ID="TextBox59" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <!-- row -->

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%-- Education Details --%>
                            <div class="tab-pane fade" id="ex2-pills-4" role="tabpanel" aria-labelledby="ex2-tab-4">
                                <div class="section-first p-3">
                                    <!-- row -->
                                    <div class="row mb-1">
                                        <div class="col-lg-2 mt-2">
                                            <asp:Label ID="Label141" CssClass="col-form-labe sub-head" runat="server" Text="Education Details"></asp:Label>
                                        </div>
                                        <div class="col-lg-10" style="text-align: right;">
                                            <button class=" btn edit" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample2" aria-expanded="false" aria-controls="collapseExample">
                                                Edit
                                            </button>
                                        </div>
                                    </div>
                                    <!-- row -->

                                    <div class="collapse" id="collapseExample2">
                                        <div class="card card-body">
                                            <!-- row -->
                                            <div class="row mb-1">
                                                <asp:Label ID="Label103" CssClass="col-lg-1 col-form-label" runat="server" Text="Degree"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox60" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Label104" CssClass="col-lg-1 col-form-label" runat="server" Text="University"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox61" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Label105" CssClass="col-lg-1 col-form-label" runat="server" Text="School"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox62" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Label107" CssClass="col-lg-1 col-form-label" runat="server" Text="Passing Year"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox64" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                            </div>
                                            <!-- row -->

                                            <!-- row -->
                                            <div class="row mb-1">
                                                <asp:Label ID="Label106" CssClass="col-lg-1 col-form-label" runat="server" Text="Percentage"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox63" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Label108" CssClass="col-lg-1 col-form-label" runat="server" Text="Language"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox65" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>
                                                <asp:Label ID="Label109" CssClass="col-lg-1 col-form-label" runat="server" Text="Understande"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox66" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Label110" CssClass="col-lg-1 col-form-label" runat="server" Text="Speak"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox67" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                            </div>
                                            <!-- row -->
                                            <div class="row mb-1">
                                                <asp:Label ID="Label111" CssClass="col-lg-1 col-form-label" runat="server" Text="Read"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox68" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                                <div class="col-lg-9" style="text-align: right">
                                                    <asp:Button ID="Button9" Text="Insert" CssClass="btn insert2" runat="server" />
                                                </div>


                                            </div>
                                            <!-- row -->
                                        </div>
                                    </div>

                                </div>


                                <div class="section-first pt-3 pb-3 mt-2">
                                    <!-- row -->
                                    <div class="row mb-1">
                                        <div class="col-lg-2 mt-2">
                                            <asp:Label ID="Label142" CssClass="col-form-labe sub-head" runat="server" Text="IT Skills"></asp:Label>
                                        </div>
                                        <div class="col-lg-10" style="text-align: right;">
                                            <button class=" btn edit" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample3" aria-expanded="false" aria-controls="collapseExample">
                                                Edit
                                            </button>
                                        </div>
                                    </div>
                                    <!-- row -->

                                    <div class="collapse" id="collapseExample3">
                                        <div class="card card-body">
                                            <!-- row -->
                                            <div class="row mb-1">
                                                <asp:Label ID="Label112" CssClass="col-lg-1 col-form-label" runat="server" Text="Technology"></asp:Label>
                                                <div class="col-lg-3">
                                                    <asp:TextBox ID="TextBox69" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Label113" CssClass="col-lg-1 col-form-label" runat="server" Text="Prof. Level" ToolTip="Proficiency Level"></asp:Label>
                                                <div class="col-lg-3">
                                                    <asp:TextBox ID="TextBox70" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Label114" CssClass="col-lg-1 col-form-label" runat="server" Text="Experience"></asp:Label>
                                                <div class="col-lg-3">
                                                    <asp:TextBox ID="TextBox71" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                            </div>
                                            <!-- row -->

                                            <!-- row -->
                                            <div class="row mb-1">
                                                <div class="col-lg-12" style="text-align: right">
                                                    <asp:Button ID="Button10" Text="Insert" CssClass="btn insert3" runat="server" />
                                                </div>
                                            </div>
                                            <!-- row -->

                                        </div>
                                    </div>
                                </div>

                                <div class="section-first p-3 mt-2 ">
                                    <!-- row -->
                                    <div class="row mb-1">
                                        <div class="col-lg-2 mt-2">
                                            <asp:Label ID="Label143" CssClass="col-form-labe sub-head" runat="server" Text="Work Experience"></asp:Label>
                                        </div>
                                        <div class="col-lg-10" style="text-align: right;">
                                            <button class=" btn edit" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample4" aria-expanded="false" aria-controls="collapseExample">
                                                Edit
                                            </button>
                                        </div>
                                    </div>
                                    <!-- row -->

                                    <div class="collapse" id="collapseExample4">
                                        <div class="card card-body">
                                            <!-- row -->
                                            <div class="row mb-1">
                                                <asp:Label ID="Label115" CssClass="col-lg-2 col-form-label" runat="server" Text="Company"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox72" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Label116" CssClass="col-lg-2 col-form-label" runat="server" Text="Designation"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox73" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Label117" CssClass="col-lg-2 col-form-label" runat="server" Text="Responsibilities"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox74" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                            </div>
                                            <!-- row -->

                                            <!-- row -->
                                            <div class="row mb-1">
                                                <asp:Label ID="Label118" CssClass="col-lg-2 col-form-label" runat="server" Text="Form Date"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox75" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Label119" CssClass="col-lg-2 col-form-label" runat="server" Text="To Date"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox76" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Label120" CssClass="col-lg-2 col-form-label" runat="server" Text="Settelment Done"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox77" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                            </div>
                                            <!-- row -->

                                            <!-- row -->
                                            <div class="row mb-1">
                                                <asp:Label ID="Label121" CssClass="col-lg-2 col-form-label" runat="server" Text="Salary"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox78" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Label122" CssClass="col-lg-2 col-form-label" runat="server" Text="Leave Reason"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox79" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                                <div class="col-lg-4" style="text-align: right">
                                                    <asp:Button ID="Button11" Text="Insert" CssClass="btn insert4" runat="server" />
                                                </div>
                                            </div>
                                            <!-- row -->
                                        </div>
                                    </div>
                                </div>


                                <div class="section-first p-3 mt-2 ">
                                    <!-- row -->
                                    <div class="row mb-1">
                                        <div class="col-lg-2 mt-2">
                                            <asp:Label ID="Label171" CssClass="col-form-labe sub-head" runat="server" Text="Nomination Details"></asp:Label>
                                        </div>
                                        <div class="col-lg-10" style="text-align: right;">
                                            <button class=" btn edit" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample16" aria-expanded="false" aria-controls="collapseExample">
                                                Edit
                                            </button>
                                        </div>
                                    </div>
                                    <!-- row -->

                                    <div class="collapse" id="collapseExample16">
                                        <div class="card card-body">
                                            <!-- row -->
                                            <div class="row mb-1">
                                                <asp:Label ID="Label172" CssClass="col-lg-2 col-form-label" runat="server" Text="Nominee For"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox117" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Label173" CssClass="col-lg-2 col-form-label" runat="server" Text="Member Name"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox118" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Label177" CssClass="col-lg-2 col-form-label" runat="server" Text="Relation"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox119" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                            </div>
                                            <!-- row -->

                                            <!-- row -->
                                            <div class="row mb-1">
                                                <asp:Label ID="Label178" CssClass="col-lg-2 col-form-label" runat="server" Text="Precentage"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox120" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Label179" CssClass="col-lg-2 col-form-label" runat="server" Text="Is Minor"></asp:Label>
                                                <div class="col-lg-2 mt-2">
                                                    <asp:CheckBox ID="CheckBox15" runat="server" />
                                                    <asp:Label ID="Label180" CssClass="col-lg-2 col-form-labe mt-2" runat="server" Text="Verified"></asp:Label>
                                                </div>
                                            </div>
                                            <!-- row -->
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%-- Full & Final --%>
                            <div class="tab-pane fade" id="ex2-pills-5" role="tabpanel" aria-labelledby="ex2-tab-5">
                                <div class="section-first p-3 ">
                                    <!-- row -->
                                    <div class="row mb-1">
                                        <span class="sub-head">No Dues Approvel</span>
                                    </div>
                                    <!-- row -->
                                    <!-- row -->
                                    <div class="row mb-1">
                                        <asp:Label ID="Label168" CssClass="col-lg-2 col-form-label" runat="server" Text="Head HR"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox114" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>

                                        <asp:Label ID="Label169" CssClass="col-lg-2 col-form-label" runat="server" Text="Account Department"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox115" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>

                                        <asp:Label ID="Label170" CssClass="col-lg-2 col-form-label" runat="server" Text="Head of Department"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox116" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>

                                    </div>
                                    <!-- row -->
                                </div>


                                <div class="section-first p-3 mt-2">
                                    <!-- row -->
                                    <div class="row mb-1">
                                        <span class="sub-head">Resignation Details</span>
                                    </div>
                                    <!-- row -->

                                    <!-- row -->
                                    <div class="row mb-1">
                                        <asp:Label ID="Label1" CssClass="col-lg-2 col-form-label" runat="server" Text="Resign Date"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox83" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                                        </div>

                                        <asp:Label ID="Label2" CssClass="col-lg-2 col-form-label" runat="server" Text="Resign Reason"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox84" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>

                                        <asp:Label ID="Label3" CssClass="col-lg-2 col-form-label" runat="server" Text="Notic Period"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox85" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>

                                    </div>
                                    <!-- row -->

                                    <!-- row -->
                                    <div class="row mb-1">
                                        <asp:Label ID="Label5" CssClass="col-lg-2 col-form-label" runat="server" Text="Shortfall in Notic Period"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox86" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <asp:Label ID="Label6" CssClass="col-lg-2 col-form-label" runat="server" TextMode="date" Text="Tantative leaving Date"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox87" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>

                                        <div class="col-lg-4 mt-2">
                                            <asp:CheckBox ID="CheckBox14" runat="server" />
                                            <asp:Label ID="Label26" CssClass="col-lg-2 col-form-labe mt-2" runat="server" Text="Excluded form Full Final Settlement"></asp:Label>
                                        </div>
                                    </div>
                                    <!-- row -->

                                    <!-- row -->
                                    <div class="row mb-1">
                                        <asp:Label ID="Label27" CssClass="col-lg-2 col-form-label" runat="server" Text="Remark"></asp:Label>
                                        <div class="col-lg-10">
                                            <asp:TextBox ID="TextBox88" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <!-- row -->

                                </div>


                                <div class="section-first p-3 mt-2 ">
                                    <!-- row -->
                                    <div class="row mb-1">
                                        <span class="sub-head">Exit Details</span>
                                    </div>
                                    <!-- row -->

                                    <!-- row -->
                                    <div class="row mb-1">
                                        <asp:Label ID="Label136" CssClass="col-lg-2 col-form-label" runat="server" Text="Separation Mode"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:DropDownList runat="server" CssClass="form-control">
                                                <asp:ListItem>Yes</asp:ListItem>
                                                <asp:ListItem>No</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                        <asp:Label ID="Label137" CssClass="col-lg-2 col-form-label" runat="server" Text="Exit Interview Done"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:DropDownList runat="server" CssClass="form-control">
                                                <asp:ListItem>Yes</asp:ListItem>
                                                <asp:ListItem>No</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                        <asp:Label ID="Label138" CssClass="col-lg-2 col-form-label" runat="server" Text="Last Working Date"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox97" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                                        </div>

                                    </div>
                                    <!-- row -->

                                    <!-- row -->
                                    <div class="row mb-1">
                                        <asp:Label ID="Label139" CssClass="col-lg-2 col-form-label" runat="server" Text="Date of Exit Interview"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox98" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                                        </div>

                                        <asp:Label ID="Label140" CssClass="col-lg-2 col-form-label" runat="server" Text="Date Of Settlement"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox99" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <!-- row -->

                                    <!-- row -->
                                    <div class="row mb-1">
                                        <asp:Label ID="Label133" CssClass="col-lg-2 col-form-label" runat="server" Text="Exit Interview"></asp:Label>
                                        <div class="col-lg-10">
                                            <asp:TextBox ID="TextBox91" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <!-- row -->

                                    <!-- row -->
                                    <div class="row m-auto">
                                        <div class="col-lg-12" style="text-align: center;">
                                            <asp:Button ID="TextBox89" runat="server" CssClass="btn ELWD" Text="Get OTP to Enable Last Working Date" />
                                        </div>
                                    </div>
                                    <!-- row -->
                                </div>

                            </div>

                            <%-- asset issu --%>
                            <div class="tab-pane fade" id="ex2-pills-6" role="tabpanel" aria-labelledby="ex2-tab-6">
                                <div class="section-first p-3 ">
                                    <!-- row -->
                                    <div class="row mb-1">
                                        <div class="col-lg-2 mt-2">
                                            <asp:Label ID="Label135" CssClass="col-form-labe sub-head" runat="server" Text="ASSET LIST"></asp:Label>
                                        </div>
                                        <div class="col-lg-10" style="text-align: right;">
                                            <button class=" btn edit" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                                Edit
                                            </button>
                                        </div>
                                    </div>
                                    <!-- row -->
                                    <div class="collapse" id="collapseExample">
                                        <div class="card card-body">
                                            <!-- row -->
                                            <div class="row mb-1">
                                                <asp:Label ID="Label29" CssClass="col-lg-2 col-form-label" runat="server" Text="Asset Category"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox90" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Label132" CssClass="col-lg-2 col-form-label" runat="server" Text="Serial No"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox92" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Label134" CssClass="col-lg-2 col-form-label" runat="server" Text="Asset Type"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox93" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>


                                            </div>
                                            <!-- row -->

                                            <!-- row -->
                                            <div class="row mb-1">
                                                <asp:Label ID="Label150" CssClass="col-lg-2 col-form-label" runat="server" Text="Asset Loc."></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox104" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Label151" CssClass="col-lg-2 col-form-label" runat="server" Text="Asset Status"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox105" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Label152" CssClass="col-lg-2 col-form-label" runat="server" Text="Issu Date"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox106" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                                                </div>


                                            </div>
                                            <!-- row -->

                                            <!-- row -->
                                            <div class="row">

                                                <asp:Label ID="Label153" CssClass="col-lg-2 col-form-label" runat="server" Text="Return Date"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox107" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Label154" CssClass="col-lg-2 col-form-label" runat="server" Text="Lost Date"></asp:Label>
                                                <div class="col-lg-2">
                                                    <asp:TextBox ID="TextBox108" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                                                </div>

                                                <div class="col-4" style="text-align: right;">
                                                    <asp:Button ID="Button8" runat="server" CssClass="btn insert5" Text="INSERT" />
                                                </div>
                                            </div>
                                            <!-- row -->

                                        </div>
                                    </div>

                                    <!--Asset list grid view-->
                                    <!-- row -->
                                    <div class="row m-auto">
                                        <asp:Panel ID="Panel1" runat="server">
                                            <asp:GridView ID="Asset" runat="server" CssClass="ms-3" Style="left: 3px; top: 0px; border: none; text-align: center; background-color: hsla(40deg, 4%, 36%, 0.25); position: relative; width: 98%; table-layout: auto;"
                                                ShowHeaderWhenEmpty="True" AutoGenerateSelectButton="false"
                                                CellPadding="3" ForeColor="Black" GridLines="Both" AllowPaging="true" PageSize="16">
                                                <FooterStyle BackColor="#CCCCCC" />
                                                <HeaderStyle Font-Bold="True" ForeColor="RoyalBlue" CssClass="text-center" Width="100%" />
                                                <SelectedRowStyle Font-Bold="True" ForeColor="White" />
                                                <PagerSettings FirstPageText="1" LastPageText="last" NextPageText="next" PreviousPageText="previous" />
                                                <PagerStyle ForeColor="Black" HorizontalAlign="Center" />
                                            </asp:GridView>
                                        </asp:Panel>
                                    </div>
                                    <!-- row -->


                                </div>
                            </div>

                            <%-- Documnets --%>
                            <div class="tab-pane fade" id="ex2-pills-7" role="tabpanel" aria-labelledby="ex2-tab-7">
                                <div class="section-first p-3 ">
                                    <!-- row -->
                                    <div class="row mb-1">
                                        <div class="col-lg-2 mt-2">
                                            <asp:Label ID="Label164" CssClass="col-form-labe sub-head" runat="server" Text="Documents"></asp:Label>
                                        </div>
                                        <!-- row -->

                                        <div class="row">
                                            <div class="col-lg-9">
                                                <!-- row -->
                                                <div class="row">
                                                    <div class="col-lg-3">
                                                        <asp:Label ID="Label174" CssClass="col-form-labe sub-head1" runat="server" Text="Upload Pan Card "></asp:Label><br />
                                                        <asp:Image ID="Image11" runat="server" ImageUrl="~/AutovynModules/Media/profile.jpg" Style="border-radius: 15px; width: 60%; height: 60%;" />
                                                        <asp:FileUpload ID="FileUpload10" runat="server" CssClass="uplodbtn" Style="width: 90%; margin-top: 4px; border-radius: 3px;" />
                                                    </div>

                                                    <div class="col-lg-3">
                                                        <asp:Label ID="Label175" CssClass="col-form-labe sub-head1" runat="server" Text="Upload Id Proof 1"></asp:Label><br />
                                                        <asp:Image ID="Image12" runat="server" ImageUrl="~/AutovynModules/Media/profile.jpg" Style="border-radius: 15px; width: 60%; height: 60%;" />
                                                        <asp:FileUpload ID="FileUpload11" runat="server" CssClass="uplodbtn" Style="width: 90%; margin-top: 4px; border-radius: 3px;" />
                                                    </div>

                                                    <div class="col-lg-3">
                                                        <asp:Label ID="Label176" CssClass="col-form-labe sub-head1" runat="server" Text="Upload Experience Letter"></asp:Label><br />
                                                        <asp:Image ID="Image13" runat="server" ImageUrl="~/AutovynModules/Media/profile.jpg" Style="border-radius: 15px; width: 60%; height: 60%;" />
                                                        <asp:FileUpload ID="FileUpload12" runat="server" CssClass="uplodbtn" Style="width: 90%; margin-top: 4px; border-radius: 3px;" />
                                                    </div>
                                                </div>
                                                <!-- row -->

                                                <!-- row -->
                                                <div class="row">
                                                    <div class="col-lg-3">
                                                        <asp:Label ID="Label165" CssClass="col-form-labe sub-head1" runat="server" Text="Upload Id Proof 2"></asp:Label><br />
                                                        <asp:Image ID="Image2" runat="server" ImageUrl="~/AutovynModules/Media/profile.jpg" Style="border-radius: 15px; width: 60%; height: 60%;" />
                                                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="uplodbtn" Style="width: 90%; margin-top: 4px; border-radius: 3px;" />
                                                    </div>

                                                    <div class="col-lg-3">
                                                        <asp:Label ID="Label166" CssClass="col-form-labe sub-head1" runat="server" Text="Upload Offer Letter"></asp:Label><br />
                                                        <asp:Image ID="Image3" runat="server" ImageUrl="~/AutovynModules/Media/profile.jpg" Style="border-radius: 15px; width: 60%; height: 60%;" />
                                                        <asp:FileUpload ID="FileUpload2" runat="server" CssClass="uplodbtn" Style="width: 90%; margin-top: 4px; border-radius: 3px;" />
                                                    </div>

                                                    <div class="col-lg-3">
                                                        <asp:Label ID="Label167" CssClass="col-form-labe sub-head1" runat="server" Text="Upload Approvel Authority"></asp:Label><br />
                                                        <asp:Image ID="Image4" runat="server" ImageUrl="~/AutovynModules/Media/profile.jpg" Style="border-radius: 15px; width: 60%; height: 60%;" />
                                                        <asp:FileUpload ID="FileUpload3" runat="server" CssClass="uplodbtn" Style="width: 90%; margin-top: 4px; border-radius: 3px;" />
                                                    </div>
                                                </div>
                                                <!-- row -->
                                            </div>

                                            <div class="col-lg-3">
                                                <!-- row -->
                                                <div class="row">
                                                    <div class="col-12">
                                                        <asp:Button ID="Button7" runat="server" CssClass="btn showimg" Text="Show Image" />
                                                    </div>
                                                </div>
                                                <!-- row -->

                                                <!-- row -->
                                                <div class="row">
                                                    <div class="col-12">
                                                        <asp:Button ID="Button12" runat="server" CssClass="btn uploadimg" Text="Upload" />
                                                    </div>
                                                </div>
                                                <!-- row -->
                                            </div>
                                        </div>



                                    </div>
                                </div>

                            </div>

                            <%-- Verification --%>
                            <div class="tab-pane fade" id="ex2-pills-8" role="tabpanel" aria-labelledby="ex2-tab-8">
                                <div class="section-first p-3 ">
                                    <!-- row -->
                                    <div class="row mb-1">
                                        <div class="col-lg-2 mt-2">
                                            <asp:Label ID="Label181" CssClass="col-form-labe sub-head" runat="server" Text="Police Verification"></asp:Label>
                                        </div>
                                    </div>
                                    <!-- row -->

                                    <!-- row -->
                                    <div class="row mb-1">
                                        <asp:Label ID="Label182" CssClass="col-lg-2 col-form-label" runat="server" Text="Receipt Date"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox121" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                                        </div>

                                        <asp:Label ID="Label183" CssClass="col-lg-1 col-form-label" runat="server" Text="Receipt No"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox122" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>

                                        <asp:Label ID="Label184" CssClass="col-lg-2 col-form-label" runat="server" Text="Agency Remark"></asp:Label>
                                        <div class="col-lg-3">
                                            <asp:TextBox ID="TextBox123" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <!-- row -->

                                    <!-- row -->
                                    <div class="row">
                                        <div class="col-12" style="text-align: right;">
                                            <asp:Button ID="Button13" runat="server" CssClass="btn apv" Text="Attach Police Verification" />
                                        </div>
                                    </div>
                                    <!-- row -->


                                </div>

                                <div class="section-first p-3 mt-2 ">
                                    <!-- row -->
                                    <div class="row mb-1">
                                        <div class="col-lg-2 mt-2">
                                            <asp:Label ID="Label185" CssClass="col-form-labe sub-head" runat="server" Text="Background Verification"></asp:Label>
                                        </div>
                                    </div>
                                    <!-- row -->

                                    <!-- row -->
                                    <div class="row mb-1">
                                        <asp:Label ID="Label186" CssClass="col-lg-2 col-form-label" runat="server" Text="Date Of Verification"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox124" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                                        </div>

                                        <asp:Label ID="Label187" CssClass="col-lg-1 col-form-label" runat="server" Text="Agency Name"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox125" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>

                                        <asp:Label ID="Label188" CssClass="col-lg-2 col-form-label" runat="server" Text="Agency Remark"></asp:Label>
                                        <div class="col-lg-3">
                                            <asp:TextBox ID="TextBox126" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <!-- row -->
                                </div>
                            </div>

                            <%-- Mobile App --%>
                            <div class="tab-pane fade" id="ex2-pills-9" role="tabpanel" aria-labelledby="ex2-tab-9">
                                <div class="section-first p-3 ">
                                    <!-- row -->
                                    <div class="row mb-1">
                                        <div class="col-lg-2 mt-2">
                                            <asp:Label ID="Label189" CssClass="col-form-labe sub-head" runat="server" Text="Mobile App Access"></asp:Label>
                                        </div>
                                    </div>
                                    <!-- row -->

                                    <div class="section-first">
                                        <!-- row -->
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <asp:CheckBox ID="CheckBox16" runat="server" />
                                                <asp:Label ID="Label197" CssClass="col-lg-2 col-form-labe mt-2" runat="server" Text="Enable Mobile App Access / Login (Yes/No)"></asp:Label>
                                            </div>
                                        </div>
                                        <!-- row -->
                                    </div>

                                    <!-- row -->
                                    <div class="row mb-1 mt-3">
                                        <asp:Label ID="Label190" CssClass="col-lg-2 col-form-label" runat="server" Text="Mobile IMEI Number"></asp:Label>
                                        <div class="col-lg-3">
                                            <asp:TextBox ID="TextBox127" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-1"></div>
                                        <asp:Label ID="Label191" CssClass="col-lg-2 col-form-label" runat="server" Text="Android Mobile Id "></asp:Label>
                                        <div class="col-lg-3">
                                            <asp:TextBox ID="TextBox128" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <!-- row -->

                                    <!-- row -->
                                    <div class="row mb-1 mt-3">
                                        <asp:Label ID="Label192" CssClass="col-lg-2 col-form-label" runat="server" Text="Allow Mobile App Punch in/out"></asp:Label>
                                        <div class="col-lg-1">
                                            <asp:DropDownList runat="server" CssClass="form-control">
                                                <asp:ListItem>Yes</asp:ListItem>
                                                <asp:ListItem>No</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                        <asp:Label ID="Label198" CssClass="col-lg-2 col-form-label" runat="server" Text="Allow Mobile Mispunch Request "></asp:Label>
                                        <div class="col-lg-1">
                                            <asp:DropDownList runat="server" CssClass="form-control">
                                                <asp:ListItem>Yes</asp:ListItem>
                                                <asp:ListItem>No</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                        <asp:Label ID="Label199" CssClass="col-lg-2 col-form-label" runat="server" Text="Allow App Punching Approval "></asp:Label>
                                        <div class="col-lg-1">
                                            <asp:DropDownList runat="server" CssClass="form-control">
                                                <asp:ListItem>Yes</asp:ListItem>
                                                <asp:ListItem>No</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                        <asp:Label ID="Label200" CssClass="col-lg-2 col-form-label" runat="server" Text="Allow Mobile App Leave Request "></asp:Label>
                                        <div class="col-lg-1">
                                            <asp:DropDownList runat="server" CssClass="form-control">
                                                <asp:ListItem>Yes</asp:ListItem>
                                                <asp:ListItem>No</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <!-- row -->


                                    <!-- row -->
                                    <div class="row mb-1 mt-3">
                                        <asp:Label ID="Label227" CssClass="col-lg-2 col-form-label" runat="server" Text="Allow Attendance Calander View"></asp:Label>
                                        <div class="col-lg-1">
                                            <asp:DropDownList runat="server" CssClass="form-control">
                                                <asp:ListItem>Yes</asp:ListItem>
                                                <asp:ListItem>No</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <!-- row -->

                                    <!-- row -->
                                    <div class="row">
                                        <div class="col-12" style="text-align: right;">
                                            <asp:Button ID="Button14" runat="server" CssClass="btn apv" Text="SAVE" />
                                        </div>
                                    </div>
                                    <!-- row -->

                                </div>

                            </div>

                            <%-- Others --%>
                            <div class="tab-pane fade " id="ex2-pills-10" role="tabpanel" aria-labelledby="ex2-tab-10">
                                <div class="section-first p-3 ">

                                    <!-- row -->
                                    <div class="row mb-1">
                                        <asp:Label ID="Label193" CssClass="col-lg-1 col-form-label" runat="server" Text="Label">Last Comp.</asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox129" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>

                                        <asp:Label ID="Label194" CssClass="col-lg-2 col-form-label" runat="server" Text="Label">Branch</asp:Label>
                                        <div class="col-lg-2">
                                            <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>


                                        <asp:Label ID="Label195" CssClass="col-lg-2 col-form-label" runat="server" Text="High Qualification"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox130" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <!-- row -->

                                    <!-- row -->
                                    <div class="row mb-1">
                                        <asp:Label ID="Label196" CssClass="col-lg-1 col-form-label" runat="server" Text="Label">Emp. Status</asp:Label>
                                        <div class="col-lg-2">

                                            <asp:DropDownList ID="DropDownList3" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>

                                        <asp:Label ID="Label201" CssClass="col-lg-2 col-form-label" runat="server" Text="Prev.Experience"></asp:Label>
                                        <div class="col-lg-2">

                                            <asp:TextBox ID="TextBox131" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>


                                        <asp:Label ID="Label202" CssClass="col-lg-2 col-form-label" runat="server" Text="User Name"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox132" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>


                                    </div>
                                    <!-- row -->

                                    <!-- row -->
                                    <div class="row mb-1">
                                        <asp:Label ID="Label203" CssClass="col-lg-1 col-form-label" runat="server" Text="Label">Nationality</asp:Label>
                                        <div class="col-lg-2">
                                            <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server">
                                                <asp:ListItem>Indian</asp:ListItem>
                                                <asp:ListItem></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <asp:Label ID="Label204" CssClass="col-lg-2 col-form-label" runat="server" Text="Applicatoin ID"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox133" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <asp:Label ID="Label205" CssClass="col-lg-2 col-form-label" runat="server" Text="Comp. Name"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox134" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <!-- row -->

                                    <!-- row -->
                                    <div class="row mb-1">
                                        <asp:Label ID="Label206" CssClass="col-lg-1 col-form-label" runat="server" Text="Label">Appr. Auth.</asp:Label>
                                        <div class="col-lg-2">
                                            <asp:DropDownList ID="DropDownList8" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                        <asp:Label ID="Label207" CssClass="col-lg-2 col-form-label" runat="server" Text="Predesignation"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:DropDownList ID="DropDownList9" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                        <asp:Label ID="Label208" CssClass="col-lg-2 col-form-label" runat="server" Text="Bio. Metric ID"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:DropDownList ID="DropDownList28" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <!-- row -->

                                    <!-- row -->
                                    <div class="row mb-1">
                                        <asp:Label ID="Label209" CssClass="col-lg-1 col-form-label" runat="server" Text="Label">Emp. Type</asp:Label>
                                        <div class="col-lg-2">
                                            <asp:DropDownList ID="DropDownList35" CssClass="form-control" runat="server"></asp:DropDownList>

                                        </div>
                                        <asp:Label ID="Label210" CssClass="col-lg-2 col-form-label" runat="server" Text="Emp. Level"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:DropDownList ID="DropDownList29" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                        <asp:Label ID="Label211" CssClass="col-lg-2 col-form-label" runat="server" Text="Fun. Area"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:DropDownList ID="DropDownList30" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <!-- row -->

                                    <!-- row -->
                                    <div class="row mb-1">
                                        <asp:Label ID="Label212" CssClass="col-lg-1 col-form-label" runat="server" Text="Label">Unit</asp:Label>
                                        <div class="col-lg-2">
                                            <asp:DropDownList ID="DropDownList31" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                        <asp:Label ID="Label213" CssClass="col-lg-2 col-form-label" runat="server" Text="Joining Type"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:DropDownList ID="DropDownList32" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                        <asp:Label ID="Label214" CssClass="col-lg-2 col-form-label" runat="server" Text="AD User Name"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox135" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <!-- row -->

                                    <!-- row -->
                                    <div class="row mb-1">
                                        <asp:Label ID="Label215" CssClass="col-lg-1 col-form-label" runat="server" Text="Label">Sub Branch</asp:Label>
                                        <div class="col-lg-2">
                                            <asp:DropDownList ID="DropDownList33" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>

                                        <asp:Label ID="Label216" CssClass="col-lg-2 col-form-label" runat="server" Text="Grade"></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:DropDownList ID="DropDownList34" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>

                                        <asp:Label ID="Label217" CssClass="col-lg-2 col-form-label" runat="server" Text="Label">Prop. Retir date</asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox136" CssClass="form-control" placeholder="DD/MM/YYYY" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <!-- row -->

                                    <!-- row -->
                                    <div class="row mb-1">
                                        <asp:Label ID="Label218" CssClass="col-lg-1 col-form-label" runat="server" Text="Extension No."></asp:Label>
                                        <div class="col-lg-2">
                                            <asp:TextBox ID="TextBox137" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-1 mt-2">
                                            <asp:CheckBox ID="CheckBox17" runat="server" />
                                            <asp:Label ID="Label219" CssClass="col-lg-2 col-form-labe mt-2" runat="server" Text="AD Status"></asp:Label>
                                        </div>
                                    </div>
                                    <!-- row -->

                                    <!-- row -->
                                    <div class="row mt-3 mb-1">

                                        <div class="col-lg-7">
                                            <asp:Label ID="Label220" CssClass="col-lg-12 col-form-label" Style="color: royalblue" runat="server" Text="Verification Status"></asp:Label>

                                            <!-- row -->
                                            <div class="row">
                                                <asp:Label ID="Label221" CssClass="col-lg-2 col-form-label" runat="server" Text="Created By"></asp:Label>
                                                <div class="col-lg-4">
                                                    <asp:TextBox ID="TextBox138" CssClass="form-control " runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Label222" CssClass="col-lg-2 col-form-label" runat="server" Text="Created On"></asp:Label>
                                                <div class="col-lg-4">
                                                    <asp:TextBox ID="TextBox139" placeholder="DD/MM/YYYY" CssClass="form-control  " runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <!-- row -->

                                            <!-- row -->
                                            <div class="row mt-2">
                                                <asp:Label ID="Label223" CssClass="col-lg-2 col-form-label" runat="server" Text="Last Modified By"></asp:Label>
                                                <div class="col-lg-4">
                                                    <asp:TextBox ID="TextBox140" CssClass="form-control " runat="server"></asp:TextBox>
                                                </div>

                                                <asp:Label ID="Label224" CssClass="col-lg-2 col-form-label" runat="server" Text="Last Modified On"></asp:Label>
                                                <div class="col-lg-4">
                                                    <asp:TextBox ID="TextBox141" placeholder="DD/MM/YYYY" CssClass="form-control  " runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <!-- row -->

                                            <!-- row -->
                                            <div class="row mt-2">
                                                <asp:Label ID="Label225" CssClass="col-lg-2 col-form-label" runat="server" Text="Machine Name"></asp:Label>
                                                <div class="col-lg-4">
                                                    <asp:TextBox ID="TextBox142" CssClass="form-control " runat="server"></asp:TextBox>
                                                </div>


                                            </div>
                                            <!-- row -->

                                        </div>

                                        <div class="col-lg-4">

                                            <asp:Label ID="Label226" CssClass="col-lg-12 col-form-label" runat="server" Style="color: royalblue" Text="Roles and Responsibiliities"></asp:Label>
                                            <%--<asp:TextBox ID="TextBox114" style="height:114px" CssClass="form-control  col-lg-12" runat="server"></asp:TextBox>--%>
                                            <asp:TextBox ID="TextBox143" runat="server" CssClass="form-control  col-lg-12" TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox>

                                        </div>
                                        <!-- row -->
                                    </div>


                                    <!--Extra details-->



                                </div>

                            </div>
                        </div>
                        <!-- Pills content -->
                    </div>
                </div>

                 <%-- Buttons sections --%>
                   <div class="col-lg-1 button-sactions" style="background-color: #a7e2cb;">
                            <div class="img-box">
                                <asp:ImageButton ID="ImageButton1" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Save.png"/>
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
                                <asp:ImageButton ID="ImageButton5" runat="server" CssClass="img-btn" ImageUrl="~/AutovynModules/Media/Print.png" />
                                <asp:Label ID="Label235" CssClass="col-form-label img-lbl" runat="server"  Text="Print"></asp:Label>
                            </div>
                    </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
     <script>
         $(document).ready(function () {
             $('#ContentPlaceHolder1_Emp_code').keypress(function (e) {
                 if (e.which == 13) {
                     e.preventDefault();
                     var searchValue = $(this).val();
                     fetch('HRMS.aspx/GetData', {
                         method: 'POST',
                         headers: {
                             'Content-Type': 'application/json; charset=utf-8'
                         },
                         body: JSON.stringify({ searchTerm: searchValue })
                     })
                         .then(response => response.json())
                         .then(data => {
                             var suggestions = JSON.parse(data.d);
                             console.log(suggestions.length);
                             // parse the JSON string and extract the array of objects
                             if (suggestions.length === 0) {
                                 // show alert message as vehicle not delivered
                                 alert("No data");
                                 location.reload();

                             } else {

                                 $('#ContentPlaceHolder1_F_Name').val(suggestions[0].EMPFIRSTNAME);
                                 document.getElementById("ContentPlaceHolder1_F_Name").setAttribute("readonly", "true");
                                 $('#ContentPlaceHolder1_L_Name').val(suggestions[0].EMPLASTNAME);
                                 document.getElementById("ContentPlaceHolder1_L_Name").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_Pan_No').val(suggestions[0].panno);
                                 document.getElementById("ContentPlaceHolder1_Pan_No").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_address').val(suggestions[0].currentaddress1);
                                 document.getElementById("ContentPlaceHolder1_address").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_city').val(suggestions[0].City);
                                 document.getElementById("ContentPlaceHolder1_city").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_pin_no').val(suggestions[0].ppincode);
                                 document.getElementById("ContentPlaceHolder1_pin_no").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_Location').val(suggestions[0].location);
                                 document.getElementById("ContentPlaceHolder1_pin_no").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_DropDownList23').val(suggestions[0].gender_code);
                                 document.getElementById("ContentPlaceHolder1_DropDownList23").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_state').val(suggestions[0].State);
                                 document.getElementById("ContentPlaceHolder1_state").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_dob').val(suggestions[0].dob);
                                 document.getElementById("ContentPlaceHolder1_dob").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_mob_no').val(suggestions[0].mobileno);
                                 document.getElementById("ContentPlaceHolder1_mob_no").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_father_name').val(suggestions[0].fatherName);
                                 document.getElementById("ContentPlaceHolder1_father_name").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_mother_name').val(suggestions[0].mothername);
                                 document.getElementById("ContentPlaceHolder1_mother_name").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_emp_height').val(suggestions[0].empheight);
                                 document.getElementById("ContentPlaceHolder1_emp_height").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_emp_weight').val(suggestions[0].empweight);
                                 document.getElementById("ContentPlaceHolder1_emp_weight").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_land_line').val(suggestions[0].landlineno);
                                 document.getElementById("ContentPlaceHolder1_land_line").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_uid_no').val(suggestions[0].uid_no);
                                 document.getElementById("ContentPlaceHolder1_uid_no").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_DropDownList22').val(suggestions[0].EmpType);
                                 document.getElementById("ContentPlaceHolder1_DropDownList22").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_section').val(suggestions[0].SECTION);
                                 document.getElementById("ContentPlaceHolder1_section").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_DropDownList24').val(suggestions[0].REGION);
                                 document.getElementById("ContentPlaceHolder1_DropDownList24").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_DropDownList37').val(suggestions[0].EMPLOYEEDESIGNATION);
                                 document.getElementById("ContentPlaceHolder1_DropDownList37").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_branch_code').val(suggestions[0].Loc_Code);
                                 $('#ContentPlaceHolder1_dse_code').val(suggestions[0].ERP_DSE);
                                 $('#ContentPlaceHolder1_modl_code').val(suggestions[0].Modl_Code);


                             }

                         })
                         .catch(error => {
                             console.log(error);
                         });
                 }
             });
         });
     </script>

     <script>
         $(document).ready(function () {
             $('#ContentPlaceHolder1_Emp_code').keydown(function (e) {
                 if (e.which == 9) { // check if Tab key is pressed
                     e.preventDefault();
                     var searchValue = $(this).val();
                     fetch('HRMS.aspx/GetData', {
                         method: 'POST',
                         headers: {
                             'Content-Type': 'application/json; charset=utf-8'
                         },
                         body: JSON.stringify({ searchTerm: searchValue })
                     })
                         .then(response => response.json())
                         .then(data => {
                             var suggestions = JSON.parse(data.d);
                             console.log(suggestions.length);
                             // parse the JSON string and extract the array of objects
                             if (suggestions.length === 0) {
                                 // show alert message as vehicle not delivered
                                 alert("No data");
                                 location.reload();

                             } else {

                                 $('#ContentPlaceHolder1_F_Name').val(suggestions[0].EMPFIRSTNAME);
                                 document.getElementById("ContentPlaceHolder1_F_Name").setAttribute("readonly", "true");
                                 $('#ContentPlaceHolder1_L_Name').val(suggestions[0].EMPLASTNAME);
                                 document.getElementById("ContentPlaceHolder1_L_Name").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_Pan_No').val(suggestions[0].panno);
                                 document.getElementById("ContentPlaceHolder1_Pan_No").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_address').val(suggestions[0].currentaddress1);
                                 document.getElementById("ContentPlaceHolder1_address").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_city').val(suggestions[0].City);
                                 document.getElementById("ContentPlaceHolder1_city").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_pin_no').val(suggestions[0].ppincode);
                                 document.getElementById("ContentPlaceHolder1_pin_no").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_Location').val(suggestions[0].location);
                                 document.getElementById("ContentPlaceHolder1_pin_no").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_DropDownList23').val(suggestions[0].gender_code);
                                 document.getElementById("ContentPlaceHolder1_DropDownList23").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_state').val(suggestions[0].State);
                                 document.getElementById("ContentPlaceHolder1_state").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_dob').val(suggestions[0].dob);
                                 document.getElementById("ContentPlaceHolder1_dob").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_mob_no').val(suggestions[0].mobileno);
                                 document.getElementById("ContentPlaceHolder1_mob_no").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_father_name').val(suggestions[0].fatherName);
                                 document.getElementById("ContentPlaceHolder1_father_name").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_mother_name').val(suggestions[0].mothername);
                                 document.getElementById("ContentPlaceHolder1_mother_name").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_emp_height').val(suggestions[0].empheight);
                                 document.getElementById("ContentPlaceHolder1_emp_height").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_emp_weight').val(suggestions[0].empweight);
                                 document.getElementById("ContentPlaceHolder1_emp_weight").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_land_line').val(suggestions[0].landlineno);
                                 document.getElementById("ContentPlaceHolder1_land_line").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_uid_no').val(suggestions[0].uid_no);
                                 document.getElementById("ContentPlaceHolder1_uid_no").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_DropDownList22').val(suggestions[0].EmpType);
                                 document.getElementById("ContentPlaceHolder1_DropDownList22").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_section').val(suggestions[0].SECTION);
                                 document.getElementById("ContentPlaceHolder1_section").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_DropDownList24').val(suggestions[0].REGION);
                                 document.getElementById("ContentPlaceHolder1_DropDownList24").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_DropDownList37').val(suggestions[0].designation);
                                 document.getElementById("ContentPlaceHolder1_DropDownList37").setAttribute("readonly", "true");

                                 $('#ContentPlaceHolder1_branch_code').val(suggestions[0].Loc_Code);
                                 $('#ContentPlaceHolder1_dse_code').val(suggestions[0].ERP_DSE);
                                 $('#ContentPlaceHolder1_modl_code').val(suggestions[0].Modl_Code);

                             }

                         })
                         .catch(error => {
                           
                         });
                 }
             });
         });
     </script>

    <script>
        // Get references to the checkbox and textboxes
        const chk1 = document.getElementById('same');
        const tx1 = document.getElementById('ContentPlaceHolder1_address');
        const tx2 = document.getElementById('ContentPlaceHolder1_address2');
        const tx3 = document.getElementById('ContentPlaceHolder1_city');
        const tx4 = document.getElementById('ContentPlaceHolder1_city2');
        const tx5 = document.getElementById('ContentPlaceHolder1_state');
        const tx6 = document.getElementById('ContentPlaceHolder1_state2');
        const tx7 = document.getElementById('ContentPlaceHolder1_pin_no');
        const tx8 = document.getElementById('ContentPlaceHolder1_pin_no2');
        const tx9 = document.getElementById('ContentPlaceHolder1_land_line');
        const tx10 = document.getElementById('ContentPlaceHolder1_land_line2');
        const tx11 = document.getElementById('ContentPlaceHolder1_mob_no');
        const tx12 = document.getElementById('ContentPlaceHolder1_land_line');
        const tx13 = document.getElementById('ContentPlaceHolder1_TextBox24');
        const tx14 = document.getElementById('ContentPlaceHolder1_land_line');
        const tx15 = document.getElementById('ContentPlaceHolder1_mob_no');
        const tx16 = document.getElementById('ContentPlaceHolder1_mob_no2');



        // Add a click event listener to the checkbox
        chk1.addEventListener('click', () => {
            // Check if the checkbox is checked
            if (chk1.checked) {
                // Fill in the value of textbox 1 and 2 into textbox 3 and 4
                tx2.value = tx1.value;
                tx4.value = tx3.value;
                tx6.value = tx5.value;
                tx8.value = tx7.value;
                tx10.value = tx9.value;
                tx16.value = tx15.value;


            } else {
                // If the checkbox is unchecked, clear the values of textbox 3 and 4
                tx2.value = '';
                tx4.value = '';
                tx6.value = '';
                tx8.value = '';
                tx10.value = '';
                tx16.value = '';


            }
        });

    </script>

   






































        </div>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</asp:Content>
