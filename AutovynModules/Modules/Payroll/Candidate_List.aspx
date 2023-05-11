<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AutovynModules/AUTOVYN.Master" CodeBehind="Candidate_List.aspx.vb" Inherits="AutovynERP.Candidate_List" %>
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

        body{
          background-image: linear-gradient(to top, #cfd9df 0%, #e2ebf0 100%);
        }
        .black{
            color: black;
        }
        .resume{
         display: none;
         z-index: 1;
         position: absolute;
         background-image: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
         border-radius: 12px;
         margin-left:12.5%;
         width: 75%;
         margin-top: 0px;
        }
        .profile{
           /* transition:transform .2s;
            height:800px;
            width:400px;*/

        }
        .profile:hover{
           
            /*transform: scale(2.8);*/

        }
        .bold{
            font-weight:600;
        }
        .sub-head{
            font-size:15px;
            color:royalblue;
            font-weight:500;
        }
        .uplodbtn {
            width: 28%;
            border:none;
        }
        @media screen and (max-width:480px) {
            .border-bottom-silver {
                border-bottom: 3px solid silver;
            }
        }
        @media screen and (max-width:480px) {
            .panel1{
                overflow:scroll;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid main-section">
        <div class="row text-center mb-0  ">
                        <h4>List of Candidates</h4>
                </div>
        <!--Grid View Details-->

        <div class="container-fluid">
             <div class="section-first  ">
                <div class="row mb-1">
                    <!-- Modal -->
                    <div id="signupModal" class="container-fluid resume" ">
                        <div class="row mb-1">
                                    <div class=" text-center mt-2">
                                        <asp:Label ID="Label4" CssClass="col form-label sub-head" runat="server" Text="Candidate-Resume">
                                        </asp:Label>
                                    </div>
                                </div>
                        <div class="row">
                            
                            <div class="img-fluid">
                                <asp:Image ID="Image1" CssClass="profile img-fluid" AlternateText="No Image"  runat="server" />
                            </div>
                        </div>
                        
                        <div class="row mb-1 ">
                            <div class="col text-center">
                            <asp:Button ID="cancel" class="col-2" CssClass="btn btn-dark" OnClientClick="Hidemodal(); return false;" runat="server" Text="Cancel" />

                            </div>

                            </div>


                    </div>
                    <!-- Modal -->
                    
                </div>
                <div class="row ms-2 mb-0">
                    <asp:Label ID="Label19" CssClass="col-md-1 col-form-label" runat="server" Text="Label">Search name</asp:Label>
                 <asp:TextBox ID="searchbox" Class="col-2 " runat="server"></asp:TextBox>
                    <div class="col-2">
                    <asp:Button ID="search" Class="col btn btn-dark " runat="server" Text="Search" />
                        </div>
                        </div>
                 <asp:Panel ID="Panel1" CssClass="panel1" runat="server"  >
                     <asp:GridView ID="Candidates" runat="server" CssClass="ms-3" Style="left: 3px; top: 0px; border: none;  background-color: hsla(40deg, 4%, 36%, 0.25); position: relative; width: 98%; table-layout: auto;"
                         ShowHeaderWhenEmpty="True" CellPadding="3" ForeColor="Black"  PageSize="3" AllowPaging="True">
                         <Columns>
                             <asp:CommandField ShowSelectButton="True" HeaderText="Edit" ButtonType="Image" SelectImageUrl="~/Documents/—Pngtree—vector edit icon_4013714.png" SelectText="Edit">
                                 <ControlStyle Width="20px" />
                                 <ItemStyle HorizontalAlign="Left" CssClass="ms-3" VerticalAlign="Middle" Width="200px" />
                             </asp:CommandField>

                             

                             
                         </Columns>
                         <FooterStyle BackColor="#CCCCCC" />
                         <HeaderStyle Font-Bold="True" ForeColor="RoyalBlue" Width="100%" />
                         <SelectedRowStyle Font-Bold="True" ForeColor="White" />
                         <PagerSettings FirstPageText="1" LastPageText="last" NextPageText="next" PreviousPageText="previous" />
                         <PagerStyle ForeColor="Black" HorizontalAlign="Center" />
                     </asp:GridView>
                 </asp:Panel>

                
                 </div>
            </div>

        <!--Grid View Details-->

        <div class="container-fluid" id="intdetails">
            <!-- Interview. Details-->
            <div class="section-first p-1 ">
                <div class="row mb-1">
                    <div class="col-md-2 mt-2">
                        <asp:Label ID="Label3" CssClass="col-form-labe sub-head" runat="server" Text="Interview Details"></asp:Label>
                    </div>
                </div>
                <!-- row -->
                <div class="row mb-1">
                    <asp:Label ID="Label13" CssClass="col-md-2 col-form-label" runat="server" Text="Label">Interviewer name</asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="intr_name" CssClass="form-control" runat="server"></asp:TextBox>
                        
                    </div>

                    <asp:Label ID="Label16" CssClass="col-md-2 bold col-form-label" runat="server" Text="Label">HR Status</asp:Label>
                    <div class="col-md-2">
                       
                        <asp:DropDownList CssClass="form-control" ID="Hr_status" runat="server">
                            <asp:ListItem >Scheduled For next round</asp:ListItem>
                            <asp:ListItem>On Hold</asp:ListItem>
                            <asp:ListItem>Rejected</asp:ListItem>
                            <asp:ListItem>Selected</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <asp:Label ID="Label34" CssClass="col-md-2 col-form-label" runat="server" Text="Label">HR Interview Date</asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="Hr_date" CssClass="form-control" placeholder="DD/MM/YYYY"  runat="server"></asp:TextBox>
                        
                    </div>

                </div>
                <!-- row -->

                <!-- row -->
                <div class="row mb-1">
                    <asp:Label ID="Label22" CssClass="col-md-2 col-form-label" runat="server" Text="HR Remark"></asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox ID="hr_remark" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    
                    
                </div>
                <!-- row -->

            </div>

            <div class="section-first p-1 ">
                
                <!-- row -->
                <div class="row mb-1">
                    <asp:Label ID="Label25" CssClass="col-md-2 col-form-label" runat="server" Text="Label">HOD Name</asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="Hod_name" CssClass="form-control" runat="server"></asp:TextBox>
                        
                    </div>

                    <asp:Label ID="Label28" CssClass="col-md-2 bold col-form-label" runat="server" Text="Label">HOD Status</asp:Label>
                    <div class="col-md-2">
                        <asp:DropDownList CssClass="form-control" ID="Hod_status" runat="server">
                            <asp:ListItem>Scheduled For next round</asp:ListItem>
                            <asp:ListItem>On Hold</asp:ListItem>
                            <asp:ListItem>Rejected</asp:ListItem>
                            <asp:ListItem>Selected</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <asp:Label ID="Label37" CssClass="col-md-2 col-form-label" runat="server" Text="Label">HOD Interview Date</asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="Hod_date" CssClass="form-control" placeholder="DD/MM/YYYY"  runat="server"></asp:TextBox>
                        
                    </div>

                </div>
                <!-- row -->

                <!-- row -->
                <div class="row mb-1">
                    <asp:Label ID="Label31" CssClass="col-md-2 col-form-label" runat="server" Text="HOD Remark"></asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox ID="hod_remr" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    
                    
                </div>
                <!-- row -->

            </div>
            <!-- Interview. Details-->
           
            
        </div>
        <div class="container-fluid" id="candetails">
            <!-- Candidate. Details-->
            <div class="section-first p-1 ">
                <div class="row mb-1">
                    <div class="col-md-2 ">
                        <asp:Label ID="Label141" CssClass="col-form-labe sub-head" runat="server" Text="Candidate  Information"></asp:Label>
                    </div>
                </div>
                <!-- row -->
                <div class="row mb-1">
                    <asp:Label ID="Label108" CssClass="col-md-2 col-form-label" runat="server" Text="Label">Candidate code</asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="Cand_code" CssClass="form-control" runat="server"></asp:TextBox>
                        
                    </div>

                    <asp:Label ID="Label109" CssClass="col-md-2 col-form-label" runat="server" Text="Label">Name</asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="Cand_name" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <asp:Label ID="Label1" CssClass="col-md-2 col-form-label" runat="server" Text="Label">Mobile</asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="mobile" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>


                    
                </div>
                <!-- row -->

                <!-- row -->
                <div class="row mb-1">
                    <asp:Label ID="Label110" CssClass="col-md-2 col-form-label" runat="server" Text="Email"></asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="email" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <asp:Label ID="Label111" CssClass="col-md-2 col-form-label" runat="server" Text="Label">location</asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="location" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <asp:Label ID="Label2" CssClass="col-md-2 col-form-label" runat="server" Text="Label">Position Applied</asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="positionap" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    
                </div>
                <!-- row -->

                <!-- row -->
                <div class="row mb-1">
                    <asp:Label ID="Label167" CssClass="col-md-2 col-form-label" runat="server" Text="Previous Position"></asp:Label>
                    <div class="col-md-2">

                        <asp:TextBox ID="positionpre" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>


                    <asp:Label ID="Label168" CssClass="col-md-2 col-form-label" runat="server" Text="Current CTC"></asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="Crctc" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <asp:Label ID="Label169" CssClass="col-md-2 col-form-label" runat="server" Text="Label">Expeceted CTC</asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="Exctc" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    
                </div>
                <!-- row -->

                <!-- row -->
                <div class="row mb-1">
                    <asp:Label ID="Label170" CssClass="col-md-2 col-form-label" runat="server" Text="Total Experience"></asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="tot_exp" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <asp:Label ID="Label171" CssClass="col-md-2 col-form-label" runat="server" Text="Industrial Exp."></asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="ind_exp" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <asp:Label ID="Label173" CssClass="col-md-2 col-form-label" runat="server" Text="Previous Company"></asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="pre_comp" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    
                </div>
                <!-- row -->

                

                <!-- row -->
                <div class="row mb-1">
                    <asp:Label ID="Label177" CssClass="col-md-2 col-form-label" runat="server" Text="Company Manager name"></asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="manager" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <asp:Label ID="Label181" CssClass="col-md-2 col-form-label" runat="server" ToolTip="" Text="Label">Manager Mobile</asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="manager_mob" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        
                    </div>

                </div>
                <div class="row mb-0">
                    <div class="row text-center justify-content-center">
                            <div class="col-2">
                            <asp:Button ID="view" class="" CssClass="btn btn-dark" OnClientClick="showModal();return false;"  runat="server" Text="View resume" />

                            </div>
                            <div class="col-1">
                            <asp:Button ID="update" class="" CssClass="btn btn-dark"  runat="server" Text="Save" />

                            </div>
                             <div class="col-1">
                            <asp:Button ID="print" class="" CssClass="btn btn-dark"   runat="server" Text="Print" />

                            </div>

                        </div>
                </div>
                </div>
        </div>
     </div>
</asp:Content>
