<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AutovynModules/AUTOVYN.Master" CodeBehind="Candidate_Info.aspx.vb" Inherits="AutovynERP.Candidate_Info" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
        }

        body{
            font-size:13px;
        }

        .main-section{
            margin-top:60px;
        }

        body {
            background-image: linear-gradient(to top, #cfd9df 0%, #e2ebf0 100%);
        }

        .sub-head {
            font-size: 15px;
            color: royalblue;
            font-weight: 500;
        }

        .uplodbtn {
            width: 28%;
            border: none;
        }

        @media screen and (max-width:480px) {
            .border-bottom-silver {
                border-bottom: 3px solid silver;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid main-section">
            <!-- Candidate. Details-->
            <div class="section-first p-3 ">
                <div class="row mb-1">
                    <div class="col-md-2 mt-2">
                        <asp:Label ID="Label141" CssClass="col-form-labe sub-head" runat="server" Text="Candidate  Details"></asp:Label>
                    </div>
                </div>
                <!-- row -->
                <div class="row mb-1">
                    <asp:Label ID="Label108" CssClass="col-md-2 col-form-label" runat="server" Text="Label">Candidate Code(*)</asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="Cand_code" CssClass="form-control" runat="server"></asp:TextBox>
                        
                    </div>

                    <asp:Label ID="Label109" CssClass="col-md-2 col-form-label" runat="server" Text="Label">Candidate Name(*)</asp:Label>
                    <div class="col-md-6">
                        <asp:TextBox ID="Cand_name" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>


                    
                </div>
                <!-- row -->

                <!-- row -->
                <div class="row mb-1">
                    <asp:Label ID="Label110" CssClass="col-md-2 col-form-label" runat="server" Text="Mobile(*) "></asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="mobile" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <asp:Label ID="Label111" CssClass="col-md-2 col-form-label" runat="server" Text="Label">Email(*)</asp:Label>
                    <div class="col-md-6">
                        <asp:TextBox ID="email" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    


                </div>
                <!-- row -->

                <!-- row -->
                <div class="row mb-1">
                    <asp:Label ID="Label167" CssClass="col-md-2 col-form-label" runat="server" Text="Position Applied For(*)"></asp:Label>
                    <div class="col-md-2">

                        <asp:TextBox ID="position" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>


                    <asp:Label ID="Label168" CssClass="col-md-2 col-form-label" runat="server" Text="Location"></asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="location" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <asp:Label ID="Label169" CssClass="col-md-2 col-form-label" runat="server" Text="Label">Last salary</asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="last_salary" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    
                </div>
                <!-- row -->

                <!-- row -->
                <div class="row mb-1">
                    <asp:Label ID="Label170" CssClass="col-md-2 col-form-label" runat="server" Text="Expected  salary"></asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="expected_sal" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <asp:Label ID="Label171" CssClass="col-md-2 col-form-label" runat="server" Text="Last Designation"></asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="last_desg" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <asp:Label ID="Label173" CssClass="col-md-2 col-form-label" runat="server" Text="Total exp."></asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="total_exp" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    
                </div>
                <!-- row -->

                

                <!-- row -->
                <div class="row mb-1">
                    <asp:Label ID="Label177" CssClass="col-md-2 col-form-label" runat="server" Text="Total Industry Exp."></asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="industry_exp" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <asp:Label ID="Label181" CssClass="col-md-2 col-form-label" runat="server" ToolTip="" Text="Label">Last Company Name</asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="last_comp" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <asp:Label ID="Label182" CssClass="col-md-2 col-form-label" runat="server" ToolTip="" Text="Last Company Designation"></asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="last_desgcomp" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    
                    </div>
                
                <!-- row -->

                <!-- row -->
                <div class="row mb-1 ">
                    <asp:Label ID="Label183" CssClass="col-md-2 col-form-label" runat="server"  ToolTip="" Text="Last Company Joining Date"></asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="last_join_date" placeholder="DD/MM/YYYY" CssClass="form-control"   runat="server"></asp:TextBox>
                    </div>

                    <asp:Label ID="Label184" CssClass="col-md-2 col-form-label" runat="server" Text="Label">Last Company Leaving  Date</asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="last_leav_date" CssClass="form-control" placeholder="DD/MM/YYYY"  runat="server"></asp:TextBox>
                        </div>
                    <asp:Label ID="Label186" CssClass="col-md-2 col-form-label" runat="server" Text="Last Company Salary"></asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="last_com_salary" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    
                </div>
                <!-- row -->

                <!-- row -->
                <div class="row">
                    <asp:Label ID="Label178" CssClass="col-md-2 col-form-label" runat="server" Text="Label">Last Manager Name</asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="last_manager" CssClass="form-control" runat="server"></asp:TextBox>

                    </div>
                    <asp:Label ID="Label179" CssClass="col-md-2 col-form-label" runat="server" Text="Last Manager Designation"></asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="manager_desg" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <asp:Label ID="Label180" CssClass="col-md-2 col-form-label" runat="server" Text="Last Manager Mobile"></asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="manager_mob" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <!-- row -->

            </div>
            <!-- Candidate. Details-->



            <!-- DOCS. UPLOAD-->
            <div class="section-first p-3 ">
                <!-- row -->
                <div class="row  ">
                    <div class="row mb-1">
                        <div class="col-md-2 ">
                            <asp:Label ID="Label1" CssClass="col-form-labe sub-head" runat="server" Text="Documenets Upload "></asp:Label>
                        </div>
                    </div>

                    <!-- row -->
                    <div class="row text-center justify-content-between ">
                        <div class="col-md-2  border-bottom-silver">
                            <asp:Label ID="Label2" CssClass="col-form-labe sub-head1" runat="server" Text="Upload photo "></asp:Label><br />

                            <asp:Image ID="Image1" runat="server" ImageUrl="~/AutovynModules/Media/profile.jpg" Style="border-radius: 15px; width: 60%; height: 60%;" />
                            <asp:FileUpload ID="Profile_upload" Accept=".png,.jpg,.jpeg"  runat="server"  CssClass="form-control" Style="width: 90%; margin-top: 4px; border-radius: 3px;" />
                        </div>
                        <div class="col-md-2  border-bottom-silver">
                            <asp:Label ID="Label174" CssClass="col-form-labe sub-head1" runat="server" Text="Upload Aadhar Card "></asp:Label><br />

                            <asp:Image ID="Image11" runat="server" ImageUrl="~/AutovynModules/Media/profile.jpg" Style="border-radius: 15px; width: 60%; height: 60%;" />
                            <asp:FileUpload ID="Aadhar_Upload" Accept=".png,.jpg,.jpeg" runat="server"  CssClass="form-control" Style="width: 90%; margin-top: 4px; border-radius: 3px;" />
                        </div>

                        <div class="col-md-2 border-bottom-silver">
                            <asp:Label ID="Label175" CssClass="col-form-labe sub-head1" runat="server" Text="Upload PAN Card"></asp:Label><br />
                            <asp:Image ID="Image12" runat="server" ImageUrl="~/AutovynModules/Media/profile.jpg" Style="border-radius: 15px; width: 60%; height: 60%;" />
                            <asp:FileUpload ID="PAN_Upload" Accept=".png,.jpg,.jpeg" runat="server" CssClass="form-control" Style="width: 90%; margin-top: 4px; border-radius: 3px;" />
                        </div>

                        <div class="col-md-2 border-bottom-silver">
                            <asp:Label ID="Label176" CssClass="col-form-labe sub-head1" runat="server" Text="Upload Salary Slip"></asp:Label><br />
                            <asp:Image ID="Image13" runat="server" ImageUrl="~/AutovynModules/Media/profile.jpg" Style="border-radius: 15px; width: 60%; height: 60%;" />
                            <asp:FileUpload ID="Salary_Upload" Accept=".png,.jpg,.jpeg" runat="server" CssClass="form-control" Style="width: 90%; margin-top: 4px; border-radius: 3px;" />
                        </div>

                        <div class="col-md-2 border-bottom-silver">
                            <asp:Label ID="Label165" CssClass="col-form-labe sub-head1" runat="server" Text="Upload Driving License"></asp:Label><br />
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/AutovynModules/Media/profile.jpg" Style="border-radius: 15px; width: 60%; height: 60%;" />
                            <asp:FileUpload ID="License_Upload" Accept=".png,.jpg,.jpeg" runat="server" CssClass="form-control" Style="width: 90%; margin-top: 4px; border-radius: 3px;" />
                        </div>

                        <div class="col-md-2 border-bottom-silver">
                            <asp:Label ID="Label3" CssClass="col-form-labe sub-head1" runat="server" Text="Upload Resume"></asp:Label><br />
                            <asp:Image ID="Image3" runat="server" ImageUrl="~/AutovynModules/Media/profile.jpg" Style="border-radius: 15px; width: 60%; height: 60%;" />
                            <asp:FileUpload ID="resumeupload" Accept=".png,.jpg,.jpeg" runat="server" CssClass="form-control" Style="width: 90%; margin-top: 4px; border-radius: 3px;" />
                        </div>
                    </div>
                    <!-- row -->
                    <!--row-->
                </div>
                <!-- row -->
                <!-- row -->
                
                <div class="container-fluid mt-3">
                <div class="row text-center">
                    <div >
                        <asp:Button ID="submit" class="col-2" CssClass="btn btn-dark" runat="server" Text="Upload Files And Submit Details " />
                      <%--  <asp:Button ID="Button1" class="col-2" CssClass="btn btn-dark" runat="server" Text="View Candidates" />--%>

                    </div>
                    <asp:Label ID="ShowMsg" runat="server"></asp:Label>
                </div>
                    </div>
                <!-- row -->
            </div>
            <!-- DOCS. UPLOAD-->
        </div>
</asp:Content>
