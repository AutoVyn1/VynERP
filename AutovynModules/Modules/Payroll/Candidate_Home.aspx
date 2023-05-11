<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AutovynModules/AUTOVYN.Master" CodeBehind="Candidate_Home.aspx.vb" Inherits="AutovynERP.Candidate_Home" %>
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

 

        .main-head{
            text-align:center;
            font-size:28px;
            font-weight:700;
            margin:10px 0;

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
            .panel1{
                overflow:scroll;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid main-section">
        <div class="section-first">
            <!-- row -->
            <div class="row mb-1">
                <span class="main-head">Link Creation For Candidate Interview</span>
            </div>
            <!-- row -->
            <div class="row">
                <asp:Label ID="Label109" CssClass="col-md-2 col-form-label" runat="server" Text="Label">Candidate Name(*)</asp:Label>
                <div class="col-md-2">
                    <asp:TextBox ID="name" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                <asp:Label ID="Label1" CssClass="col-md-1 col-form-label" runat="server" Text="Reporting HR"></asp:Label>
                <div class="col-md-2">
                    <asp:DropDownList CssClass="form-control" ID="Report_Hr" runat="server">
                        <asp:ListItem>Name1</asp:ListItem>
                        <asp:ListItem>Name2</asp:ListItem>
                        <asp:ListItem>Name3</asp:ListItem>
                        <asp:ListItem>Name4</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <asp:Label ID="Label3" CssClass="col-md-2 col-form-label" runat="server" Text="Label">Interview Date & time</asp:Label>
                <div class="col-lg-3 d-flex">
                    <asp:TextBox ID="int_date" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:TextBox ID="int_time" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <!-- row -->
            <div class="row mt-2">
                <asp:Label ID="Label110" CssClass="col-md-2 col-form-label" runat="server" Text="Mobile(*) "></asp:Label>
                <div class="col-md-2">
                    <asp:TextBox ID="mobile" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                <asp:Label ID="Label111" CssClass="col-md-1 col-form-label" runat="server" Text="Label">Email(*)</asp:Label>
                <div class="col-md-2">
                    <asp:TextBox ID="email" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                <asp:Label ID="Label2" CssClass="col-md-2 col-form-label" runat="server" Text="Label">Position</asp:Label>
                <div class="col-md-2">
                    <asp:DropDownList CssClass="form-control" ID="position" runat="server">
                        <asp:ListItem>developer</asp:ListItem>
                        <asp:ListItem>support</asp:ListItem>
                        <asp:ListItem>backend</asp:ListItem>
                        <asp:ListItem>frontend</asp:ListItem>
                        <asp:ListItem>frontend</asp:ListItem>
                        <asp:ListItem>frontend</asp:ListItem>
                        <asp:ListItem>frontend</asp:ListItem>

                    </asp:DropDownList>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-3">
                    <asp:Button ID="update" class="" CssClass="btn btn-dark" runat="server" Text="Save" />
                </div>
            </div>


        </div>
    </div>

    <script type="text/javascript">
    function showModal() {
        var modal = document.getElementById("signupModal");
        var candetails = document.getElementById("candetails")
        candetails.style.display = "none";
        var Panel1 = document.getElementById("Panel1")
        Panel1.style.display = "none";
        modal.style.display = "block";
    }


    function hideModal() {
        var modal = document.getElementById("signupModal");
        var candetails = document.getElementById("candetails")
        candetails.style.display = "block";
        var Panel1 = document.getElementById("Panel1")
        Panel1.style.display = "block";
        modal.style.display = "none";
    }
</script>
<script>
    $(function () {
        $("#int_date").datepicker({
            dateFormat: "dd/mm/yy"
        });
    });
</script>
</asp:Content>
