<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AutovynModules/AUTOVYN.Master" CodeBehind="Demo_Car_FUEL.aspx.vb" Inherits="AutovynERP.Demo_Car_FUEL" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <%-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <%-- google font--%>
   <%-- <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet" />--%>
    <%-- animation --%>
<%--    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>--%>--%>

   <%-- <%-- autocomplete --%>
    <%--<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>--%>
    <%-- autocomplete --%>--%>

    <%-- select2 --%>
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <%-- selct 2 --%>
    <%-- swet --%>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        * {
            margin:0;
            padding:0;
            font-family: 'Dosis', sans-serif;
            scrollbar-width: thin;
            scrollbar-color: #397524 #DFE9EB;
        }

        .form-control {
            text-transform: uppercase;
        }
        .margin-top{
            margin-top:50px;
        }

        .ui-autocomplete {
            max-height: 300px; /* Set the max height of the suggestion panel */
            overflow-y: auto; /* Add a vertical scrollbar */
            overflow-x: hidden;
        }

        /*.navbar {
            box-shadow: 0px 2px 6px -1px rgba(0,0,0,0.75);
            -webkit-box-shadow: 0px 2px 6px -1px rgba(0,0,0,0.75);
            -moz-box-shadow: 0px 2px 6px -1px rgba(0,0,0,0.75);
            background: #DBE6F6;*/ /* fallback for old browsers */
            /*background: linear-gradient(to right, #DBE6F6,var(--bs-highlight-bg));
        }*/

        .title {
            text-align: center;
        }

            .title span {
                text-align: center;
                font-weight: 700;
                font-size: 28px;
                text-transform: uppercase;
            }

        .section-first {
            background: rgb(255 251 229);
            padding: 4px 9px;
            -webkit-box-shadow: -1px -4px 22px -8px rgb(0 0 0 / 75%);
            -moz-box-shadow: -1px -4px 22px -8px rgba(0, 0, 0, 0.75);
            box-shadow: -1px 10px 4px -9px rgb(0 0 0 / 56%);
            border-radius: 10px;
        }



        .disable {
            background-color: #eeece9;
        }

        .bottombuttons {
            background: #0568d5;
            border: none;
            border-radius: 5px;
            color: white;
            width: 40%;
            margin: 10px 0px;
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid  margin-top">
        <!--section 1-->
        <div class="section-first pt-0 ">
            <div class="title  mb-0">
                <span>Fuel Management System(Demo Car)</span>
            </div>

        </div>
        <div class="tab-contents w-100">

            <div class="section-first p-3">
                <div class="row mb-1">
                    <asp:Label ID="Label109" CssClass="col-md-2 col-form-label" runat="server" Text="Label">Reg. no.</asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="dms_inv" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-2">
                        <asp:Button ID="getdetail" CssClass="btn btn-primary" runat="server" Text="get detail" />
                    </div>
                    <div class="col-md-2">
                    </div>
                    <asp:Label ID="Label13" CssClass="col-md-2 col-form-label " runat="server" Text="Label">Date and Time</asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="date_time_now" CssClass="form-control disable" runat="server"></asp:TextBox>
                    </div>



                </div>
                <div class="row mb-1">




                    <asp:Label ID="Label12" CssClass="col-md-2 col-form-label " runat="server" Text="Label">Seq No.</asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="seq_no" CssClass="form-control disable" runat="server"></asp:TextBox>
                    </div>


                    <asp:Label ID="Label108" CssClass="col-md-2 col-form-label  " runat="server" Text="Label">Branch Name</asp:Label>
                    <div class="col-md-2 ">
                        <asp:TextBox ID="branch_name" CssClass="form-control disable" runat="server"></asp:TextBox>
                        <asp:HiddenField ID="branch_code" runat="server" />
                        <asp:HiddenField ID="loc_code" runat="server" />
                    </div>

                    <asp:Label ID="Label9" CssClass="col-md-2 col-form-label" runat="server" Text="Label">Model Name</asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="modl_name" CssClass="form-control disable" runat="server"></asp:TextBox>
                        <asp:HiddenField ID="modl_code" runat="server" />

                    </div>
                </div>


                <div class="row mb-1">


                    <%--<asp:Label ID="Label31" CssClass="col-md-2 col-form-label" runat="server" Text="Label">GatePass No.</asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="gp_no" CssClass="form-control disable" runat="server"></asp:TextBox>
                    </div>
                    <asp:Label ID="Label32" CssClass="col-md-2 col-form-label" runat="server" Text="Label">GatePass Date</asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="gp_date_new" CssClass="form-control disable" runat="server"></asp:TextBox>
                    </div>--%>

                    <asp:Label ID="Label38" CssClass="col-md-2 col-form-label" runat="server" Text="Label">Km driven </asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="km_driven" CssClass="form-control disable" runat="server"></asp:TextBox>
                    </div>

                    <asp:Label ID="Label4" CssClass="col-md-2 col-form-label" runat="server" Text="Label">Average</asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="km_avg" CssClass="form-control disable" runat="server"></asp:TextBox>
                        <asp:HiddenField ID="dse_code" runat="server" />

                    </div>

                    

                </div>

                <div class="row mb-1">




                    <asp:Label ID="Label5" CssClass="col-md-2 col-form-label " runat="server" Text="Label">Chassis no.</asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="Chas_no" CssClass="form-control disable" runat="server"></asp:TextBox>
                    </div>


                    <asp:Label ID="Label7" CssClass="col-md-2 col-form-label  " runat="server" Text="Label">Engine No.</asp:Label>
                    <div class="col-md-2 ">
                        <asp:TextBox ID="engn_no" CssClass="form-control disable" runat="server"></asp:TextBox>
                        <asp:HiddenField ID="HiddenField3" runat="server" />
                        <asp:HiddenField ID="HiddenField4" runat="server" />
                    </div>

                    
                </div>

                <div class="row mb-1">




                    <asp:Label ID="Label1" CssClass="col-md-2 col-form-label " runat="server" Text="Label">From</asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="loc_fr" CssClass="form-control " runat="server"></asp:TextBox>
                    </div>


                    <asp:Label ID="Label2" CssClass="col-md-2 col-form-label  " runat="server" Text="Label">To</asp:Label>
                    <div class="col-md-2 ">
                        <asp:TextBox ID="loc_to" CssClass="form-control " runat="server"></asp:TextBox>
                        <asp:HiddenField ID="HiddenField1" runat="server" />
                        <asp:HiddenField ID="HiddenField2" runat="server" />
                    </div>

                    <asp:Label ID="Label10" CssClass="col-md-2 col-form-label" runat="server" Text="Label">Type Of fuel</asp:Label>
                    


                       
                        <div class="col-md-2">
                        <asp:DropDownList ID="fuel_type" CssClass="form-control" runat="server">
                            <asp:ListItem CssClass="form-control" Value="">Select</asp:ListItem>
                            <asp:ListItem CssClass="form-control" Value="1">Petrol</asp:ListItem>
                            <asp:ListItem CssClass="form-control" Value="2">Diesel</asp:ListItem>
                            <asp:ListItem CssClass="form-control" Value="3">CNG</asp:ListItem>
                            

                        </asp:DropDownList>
                    </div>
              

                    
                </div>


                <div class="row mb-1">
                    <asp:Label ID="Label8" CssClass="col-md-2 col-form-label" runat="server" Text="Label">Customer Name</asp:Label>
                    <div class="col-md-6">
                        <asp:TextBox ID="cust_name" CssClass="form-control " runat="server"></asp:TextBox>
                    </div>

                    <asp:Label ID="Label11" CssClass="col-md-2 col-form-label" runat="server" Text="Label">Quantity</asp:Label>
                    <div class="col-md-2">
                        <asp:DropDownList ID="fuel_qty" CssClass="form-control" runat="server">
                            <asp:ListItem CssClass="form-control" Value="">Select</asp:ListItem>
                            <asp:ListItem CssClass="form-control" Value="1">1 LTR</asp:ListItem>
                            <asp:ListItem CssClass="form-control" Value="2">2 LTR</asp:ListItem>
                            <asp:ListItem CssClass="form-control" Value="3">3 LTR</asp:ListItem>
                            <asp:ListItem CssClass="form-control" Value="4">4 LTR</asp:ListItem>
                            <asp:ListItem CssClass="form-control" Value="5">5 LTR</asp:ListItem>
                            <asp:ListItem CssClass="form-control" Value="6">6 LTR</asp:ListItem>
                            <asp:ListItem CssClass="form-control" Value="7">7 LTR</asp:ListItem>
                            <asp:ListItem CssClass="form-control" Value="8">8 LTR</asp:ListItem>
                            <asp:ListItem CssClass="form-control" Value="9">9 LTR</asp:ListItem>
                            <asp:ListItem CssClass="form-control" Value="10">10 LTR</asp:ListItem>
                            <asp:ListItem CssClass="form-control" Value="11">11 LTR</asp:ListItem>
                            <asp:ListItem CssClass="form-control" Value="12">12 LTR</asp:ListItem>
                            <asp:ListItem CssClass="form-control" Value="13">13 LTR</asp:ListItem>
                            <asp:ListItem CssClass="form-control" Value="14">14 LTR</asp:ListItem>
                            <asp:ListItem CssClass="form-control" Value="15">15 LTR</asp:ListItem>



                        </asp:DropDownList>
                    </div>

                </div>

               


                <div class="row mb-1">
                </div>

                <div class="row mb-1">



                    <asp:Label ID="Label39" CssClass="col-md-2 col-form-label" runat="server" Text="Label">Driver Name</asp:Label>
                    <div class="col-md-6">
                        <asp:TextBox ID="slip_to" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <asp:Label ID="Label3" CssClass="col-md-2 col-form-label" runat="server" Text="Label">Enq. No.</asp:Label>
                    <div class="col-md-2">
                        <asp:TextBox ID="enquery" MaxLength="20" CssClass="form-control" runat="server"></asp:TextBox>
                      
                    </div>

                </div>

                <div class="row mb-1">
                    <asp:Label ID="Label6" CssClass="col-md-2 col-form-label" runat="server" Text="Label">Remark</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox ID="remark" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>
        <!-- row -->
        <div class="container-fluid mt-3">
            <div class="row text-center">
                <div>
                    <asp:Button ID="print" class="col-2" CssClass="btn btn-primary" runat="server" Text="Print Fuel Slip" />
                    <asp:Button ID="reset" class="col-2" CssClass="btn btn-primary" runat="server"  Text="Reset" />
                </div>
            </div>
        </div>
        <!-- row -->

    </div>




    <script>
        $(document).ready(function () {
            // Add event listener to the reset button
            $("#ContentPlaceHolder1_reset").click(function (event) {
                event.preventDefault(); // Prevent default behavior of the button
                Swal.fire({
                    title: "Are you sure you want to reset the form?",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#3085d6",
                    cancelButtonColor: "#d33",
                    confirmButtonText: "Yes, reset it!"
                }).then(function (result) {
                    if (result.isConfirmed) {
                        const inputs = document.querySelectorAll('.form-control');
                        inputs.forEach(input => {
                            input.value = '';
                        });
                        
                    }
                });
            });
        });

    </script>



 <script>
     $(document).ready(function () {
         // Add event listener to the submit button
         $("#ContentPlaceHolder1_print").click(function () {

             // validation

             var seq_no = $("#ContentPlaceHolder1_seq_no").val().trim();
             if (seq_no == null || seq_no == "") {
                 alert("Please Enter Seq No.!");
                 $("#ContentPlaceHolder1_seq_no").focus();
                 return false;
             }

             var dms_inv = $("#ContentPlaceHolder1_dms_inv").val().trim();
             if (dms_inv == null || dms_inv == "") {
                 alert("Please Enter DMS inv No.!");
                 $("#ContentPlaceHolder1_dms_inv").focus();
                 return false;
             }

             var fuel_qty = $("#ContentPlaceHolder1_fuel_qty").val().trim();
             if (fuel_qty == null || fuel_qty == "") {
                 alert("Please Enter Fuel QTY!");
                 $("#ContentPlaceHolder1_fuel_qty").focus();
                 return false;
             }

             var slip_to = $("#ContentPlaceHolder1_slip_to").val().trim();
             if (slip_to == null || slip_to == "") {
                 alert("Please Enter the Rec.Name!");
                 $("#ContentPlaceHolder1_slip_to").focus();
                 return false;
             }

         });

     });
 </script>





</asp:Content>
