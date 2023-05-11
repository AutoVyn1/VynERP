<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AutovynModules/AUTOVYN.Master" CodeBehind="Reminder_Set.aspx.vb" Inherits="AutovynERP.Reminder_Set1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: 'Dosis', sans-serif;
        }

        body{
            font-size: 13px;
        }


        #error_message {
            background-color: red;
            color: #fff;
            font-size: 13px;
            text-align:center;
        }

        .main-section{
            margin-top:70px;
        }


        .section-first{
            padding:10px 9px;
            border-radius: 4px;
            background-color: #a7e2cb;
            margin:1px 0;
            box-shadow: 0px 2px 6px -1px rgba(0,0,0,0.75);
            -webkit-box-shadow: 0px 2px 6px -1px rgba(0,0,0,0.75);
            -moz-box-shadow: 0px 2px 6px -1px rgba(0,0,0,0.75);
        }

        .frequency{
            background-color: #a7e2cb;
            padding: 10px 0;
            color: #ffffff;
            /*border-radius:10px;*/
           /* box-shadow: 0px 2px 6px -1px rgba(0,0,0,0.75);
            -webkit-box-shadow: 0px 2px 6px -1px rgba(0,0,0,0.75);
            -moz-box-shadow: 0px 2px 6px -1px rgba(0,0,0,0.75);*/
        }

        .sub-head{
            color:darkgreen;
        }

        .submit{
            background-color: #529352e3;
            color: #fff;
            width:24%;
            margin-top:10px;
        }


        .view{
            background-color: #529352e3;
            color: #fff;
            width:24%;
            margin-top:10px;
        }

        @media screen and (max-width:820px){
            .text-box-w{
                width:75%;
            }

            .lbl-w{
                width:25%;
            }
        }

        @media screen and (max-width:480px){
            .text-box-w{
                width:75%;
            }

            .lbl-w{
                width:25%;
            }
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container main-section">
            <div class="section-first">
                <div class="row">
                    <div class="col-lg-5 d-flex m-auto">
                        <asp:Label ID="mob_lbl" CssClass="col-lg-3 col-form-label" runat="server" Text="Name Of Reminder"></asp:Label>
                        <asp:TextBox ID="Remind_Name" CssClass="col-lg-6 form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>


            <div class="section-first mt-2">
                <div class="row d-flex justify-content-between mb-2">
                    <div class="col-lg-2">
                        <asp:Label ID="Label2" CssClass="col-form-label sub-head" runat="server" Text="Frequency"></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <div id="error_message"></div>
                    </div>
                </div>
                <!-- row -->
                <div class="row mb-1 frequency">
                    <asp:Label ID="Label123" CssClass="col-lg-2 col-form-label" runat="server" Text="Label">Shedule Day</asp:Label>
                    <div class="col-lg-2">
                        <asp:DropDownList ID="Sch_Day" CssClass="form-control" runat="server">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                            <asp:ListItem>13</asp:ListItem>
                            <asp:ListItem>14</asp:ListItem>
                            <asp:ListItem>15</asp:ListItem>
                            <asp:ListItem>16</asp:ListItem>
                            <asp:ListItem>17</asp:ListItem>
                            <asp:ListItem>18</asp:ListItem>
                            <asp:ListItem>19</asp:ListItem>
                            <asp:ListItem>20</asp:ListItem>
                            <asp:ListItem>21</asp:ListItem>
                            <asp:ListItem>22</asp:ListItem>
                            <asp:ListItem>23</asp:ListItem>
                            <asp:ListItem>24</asp:ListItem>
                            <asp:ListItem>25</asp:ListItem>
                            <asp:ListItem>26</asp:ListItem>
                            <asp:ListItem>27</asp:ListItem>
                            <asp:ListItem>28</asp:ListItem>
                            <asp:ListItem>29</asp:ListItem>
                            <asp:ListItem>30</asp:ListItem>
                            <asp:ListItem>31</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <asp:Label ID="label1111" CssClass="col-lg-2 col-form-label" runat="server" Text="Label">Time</asp:Label>
                    <div class="col-lg-2">
                        <asp:TextBox ID="Sch_Time" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <asp:Label ID="label1" CssClass="col-lg-2 col-form-label" runat="server" Text="Label">Duration</asp:Label>
                    <div class="col-lg-2">
                        <asp:DropDownList ID="Sch_Duration" CssClass="form-control" runat="server">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Monthly</asp:ListItem>
                            <asp:ListItem>Yearly</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <!-- row -->

                <div class="row">
                    <div class="row mt-4">
                        <div class="col-lg-5 d-flex m-auto">
                            <asp:Label ID="Label3" CssClass="col-lg-3 col-form-label lbl-w" runat="server" Text="Mobile No."></asp:Label>
                            <asp:TextBox ID="Mob_No" CssClass="col-lg-6 form-control text-box-w" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row mt-1">
                        <div class="col-lg-5 d-flex m-auto">
                            <asp:Label ID="Label4" CssClass="col-lg-3 col-form-label lbl-w" runat="server" Text="To"></asp:Label>
                            <asp:TextBox ID="Mail_To" CssClass="col-lg-6 form-control text-box-w" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row mt-1">
                        <div class="col-lg-5 d-flex m-auto">
                            <asp:Label ID="Label5" CssClass="col-lg-3 col-form-label lbl-w" runat="server" Text="CC"></asp:Label>
                            <asp:TextBox ID="Mail_CC" CssClass="col-lg-6 form-control text-box-w" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row mt-1">
                        <div class="col-lg-5 d-flex m-auto"> 
                            <asp:Label ID="Label6" CssClass="col-lg-3 col-form-label lbl-w" runat="server" Text="Subject"></asp:Label>
                            <asp:TextBox ID="Mail_Sub" CssClass="col-lg-6 form-control text-box-w" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row mt-1">
                        <div class="col-lg-5 d-flex m-auto">
                            <asp:Label ID="Label7" CssClass="col-lg-3 col-form-label lbl-w" runat="server" Text="Body"></asp:Label>
                             <asp:TextBox ID="Mail_body" runat="server" TextMode="MultiLine" Height="100" Width="380" CssClass="form-control text-box-w"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row mt-1">
                        <div class="col-lg-5 d-flex m-auto">
                            <asp:CheckBox ID="Deactivate" runat="server" />
                            <asp:Label ID="Label8" CssClass="col-lg-4 col-form-labe ps-2" runat="server" Text="Tick to Deactivated"></asp:Label>
                        </div>
                    </div>

                     <div class="row mt-1">
                        <div class="col-lg-5 d-flex m-auto justify-content-between">
                           <asp:Button ID="submit" runat="server" CssClass="btn btn-success submit" Text="Submit" OnClientClick="Validate();" />
                           <asp:Button ID="Button1" runat="server" CssClass="btn btn-success view" Text="View" />
                        </div>
                    </div>
                </div>
            </div>

        </div>

    <script type="text/javascript" src="../../JS/ListSelect/virtual-select.min.js"></script>
<script>

    const var1 = document.getElementById("Deactivate").value;
    const varBtn = document.getElementById("submit").value;

    function Validate() {
        if (var1.cheked) {
            return true;
        }
        else {
            return false;
        }
    }
    $(document).ready(function () {
        $("#ContentPlaceHolder1_Mob_No").keyup(function (e) {
            if ($(this).val().match(/[^0-9]/g, '')) {
                $("#error_message").html("Digits Only").show().fadeOut("slow");
                $(this).val($(this).val().replace(/[^0-9]/g, ''));
                console.log("=====")
                errorflag = 1;
            } else {
                console.log("==tt===")
            }
        });
        $("#ContentPlaceHolder1_Mob_No").bind('paste', function (e) {
            setTimeout(function () { $(this).keyup(); }, 30);
        });

        $("#ContentPlaceHolder1_Mail_To").keyup(function (e) {
            if ($("#Mail_To").index("@").match(/[^@]/g,'')) {
                $("#error_message").html("Enter Valid Mail").show().fadeOut("slow");
                console.log("====")
                errorflag = 1;
            } else {
                console.log("==t===")
            }
        });
        $("#ContentPlaceHolder1_Mail_To").bind('paste', function (e) {
            setTimeout(function () { $(this).keyup(); }, 30);
        });
        $("#ContentPlaceHolder1_Mail_body").keyup(function (e) {
            if ($("#Mail_body").length <= 50) {
                $("#error_message").html("Enter More than 50 Char.").show().fadeOut("slow");
                console.log("====")
                errorflag = 1;
            } else {
                console.log("==t===")
            }
        });
        $("#ContentPlaceHolder1_Mail_body").bind('paste', function (e) {
            setTimeout(function () { $(this).keyup(); }, 30);
        });
    });

    function validate() {
        var mail_to = document.getElementById("Mail_To").value;
        var Mail_CC = document.getElementById("Mail_CC").value;
        error_message.style.padding = "7px";
        var text;

        if (mail_to.indexOf("@") == -1) {
            text = "Enter Valid To Mail";
            error_message.innerHTML = text;
            return false;
        }

        if (Mail_CC.indexOf("@") == -1) {
            text = "Enter Valid CC Mail";
            error_message.innerHTML = text;
            return false;
        }

        return true;
    }

</script>

</asp:Content>
