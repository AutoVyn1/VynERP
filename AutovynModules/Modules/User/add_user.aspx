<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AutovynModules/AUTOVYN.Master" CodeBehind="add_user.aspx.vb" Inherits="AutovynERP.add_user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <%-- jquery --%>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>


    <%--<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>--%>

    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: 'Dosis', sans-serif;
            scrollbar-width: thin;
            scrollbar-color: #397524 #DFE9EB;
        }

        body {
            background-image: url("../../Media/loginbg.svg");
            font-size: 13px;
        }

        .main-section {
            margin-top: 60px;
        }

        input {
            text-transform: uppercase;
        }

        .pass {
            text-transform: none;
        }


        .title {
            text-align: center;
            height: 40px;
        }

            .title span {
                text-align: center;
                font-weight: 700;
                font-size: 20px;
                text-transform: uppercase;
            }



        .section-second {
            display: flex;
            justify-content: space-around;
            flex-direction: column;
            width: 100%;
            margin: auto;
            background: #ffffff91;
            padding: 18px 9px;
            -webkit-box-shadow: -1px -4px 22px -8px rgb(0 0 0 / 75%);
            -moz-box-shadow: -1px -4px 22px -8px rgba(0, 0, 0, 0.75);
            box-shadow: -1px 10px 4px -9px rgb(0 0 0 / 56%);
            border-radius: 10px;
        }

        .section-thrid {
            display: flex;
            justify-content: space-around;
            flex-direction: column;
            width: 100%;
            background: rgb(230, 191, 153);
            background: linear-gradient(90deg, rgba(230, 191, 153, 0.6935106806394433) 4%, rgba(167, 192, 255, 0.5954714649531687) 81%);
            padding: 10px 9px;
            -webkit-box-shadow: -1px -4px 22px -8px rgb(0 0 0 / 75%);
            -moz-box-shadow: -1px -4px 22px -8px rgba(0, 0, 0, 0.75);
            box-shadow: -1px 10px 4px -9px rgb(0 0 0 / 56%);
            border-radius: 10px;
        }

        .section-thrid {
            display: flex;
            justify-content: space-around;
            flex-direction: column;
            width: 100%;
            background: rgb(230, 191, 153);
            background: linear-gradient(90deg, rgba(230, 191, 153, 0.6935106806394433) 4%, rgba(167, 192, 255, 0.5954714649531687) 81%);
            padding: 18px 9px;
            -webkit-box-shadow: -1px -4px 22px -8px rgb(0 0 0 / 75%);
            -moz-box-shadow: -1px -4px 22px -8px rgba(0, 0, 0, 0.75);
            box-shadow: -1px 10px 4px -9px rgb(0 0 0 / 56%);
            border-radius: 10px;
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
            background: #232327;
            border: none;
            border-radius: 5px;
            color: white;
            width: 20%;
            height: 37px;
        }

        .btndirection {
            float: right;
            text-align: center;
        }

        .grid_panel {
            margin-bottom: 40px;
        }

        .dropify-wrapper {
            height: 100px !important;
        }

        .my-class td {
            padding: 0 5px;
        }


        @media screen and (max-width:480px) {
            .section-second {
                width: 100%;
            }

            .bottombuttons {
                width: 60%;
            }

            .grid_panel {
                overflow: scroll;
            }
        }

        @media screen and (max-width:720px) {

            .grid_panel {
                overflow: scroll;
            }
        }

        .check_box {
            justify-content: space-around;
            flex-direction: column;
            width: 50%;
            padding: 18px 9px;
            height: 225px;
            overflow-y: scroll; /* make the div scroll only vertically */
        }

            /* style the scrollbar */
            .check_box::-webkit-scrollbar {
                width: 5px; /* width of the scrollbar */
            }

            .check_box::-webkit-scrollbar-track {
                background: #f1f1f1; /* color of the track */
            }

            .check_box::-webkit-scrollbar-thumb {
                background: #c4c4c4; /* color of the thumb */
                border-radius: 10px; /* make the thumb round */
            }

                .check_box::-webkit-scrollbar-thumb:hover {
                    background: #a1a1a1; /* color of the thumb when hovering over it */
                }

        .check_box1 {
            display: flex;
            justify-content: space-around;
            flex-direction: column;
            width: 45%;
        }

        .child_box {
            margin-left: 20px;
            display: none;
        }

        .open .dropdown-menu {
            width: 100% !important;
        }

        .dropdown-menu {
            width: auto !important;
        }

        .open {
            margin-top: -216px !important;
            display: flex !important;
        }

        @media screen and (max-width: 400px) {
            .check_box {
                width: 45%;
            }
        }



        .checkbox-wrapper-19 {
            box-sizing: border-box;
            --background-color: #fff;
            --checkbox-height: 25px;
        }

        @-moz-keyframes dothabottomcheck-19 {
            0% {
                height: 0;
            }

            100% {
                height: calc(var(--checkbox-height) / 2);
            }
        }

        @-webkit-keyframes dothabottomcheck-19 {
            0% {
                height: 0;
            }

            100% {
                height: calc(var(--checkbox-height) / 2);
            }
        }

        @keyframes dothabottomcheck-19 {
            0% {
                height: 0;
            }

            100% {
                height: calc(var(--checkbox-height) / 2);
            }
        }

        @keyframes dothatopcheck-19 {
            0% {
                height: 0;
            }

            50% {
                height: 0;
            }

            100% {
                height: calc(var(--checkbox-height) * 1.2);
            }
        }

        @-webkit-keyframes dothatopcheck-19 {
            0% {
                height: 0;
            }

            50% {
                height: 0;
            }

            100% {
                height: calc(var(--checkbox-height) * 1.2);
            }
        }

        @-moz-keyframes dothatopcheck-19 {
            0% {
                height: 0;
            }

            50% {
                height: 0;
            }

            100% {
                height: calc(var(--checkbox-height) * 1.2);
            }
        }

        .checkbox-wrapper-19 input[type=checkbox] {
            display: none;
        }

        .checkbox-wrapper-19 .check-box {
            height: var(--checkbox-height);
            width: var(--checkbox-height);
            background-color: transparent;
            border: calc(var(--checkbox-height) * .1) solid #000;
            border-radius: 5px;
            position: relative;
            display: inline-block;
            -moz-box-sizing: border-box;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            -moz-transition: border-color ease 0.2s;
            -o-transition: border-color ease 0.2s;
            -webkit-transition: border-color ease 0.2s;
            transition: border-color ease 0.2s;
            cursor: pointer;
        }

            .checkbox-wrapper-19 .check-box::before,
            .checkbox-wrapper-19 .check-box::after {
                -moz-box-sizing: border-box;
                -webkit-box-sizing: border-box;
                box-sizing: border-box;
                position: absolute;
                height: 0;
                width: calc(var(--checkbox-height) * .2);
                background-color: #34b93d;
                display: inline-block;
                -moz-transform-origin: left top;
                -ms-transform-origin: left top;
                -o-transform-origin: left top;
                -webkit-transform-origin: left top;
                transform-origin: left top;
                border-radius: 5px;
                content: " ";
                -webkit-transition: opacity ease 0.5;
                -moz-transition: opacity ease 0.5;
                transition: opacity ease 0.5;
            }

            .checkbox-wrapper-19 .check-box::before {
                top: calc(var(--checkbox-height) * .72);
                left: calc(var(--checkbox-height) * .41);
                box-shadow: 0 0 0 calc(var(--checkbox-height) * .05) var(--background-color);
                -moz-transform: rotate(-135deg);
                -ms-transform: rotate(-135deg);
                -o-transform: rotate(-135deg);
                -webkit-transform: rotate(-135deg);
                transform: rotate(-135deg);
            }

            .checkbox-wrapper-19 .check-box::after {
                top: calc(var(--checkbox-height) * .37);
                left: calc(var(--checkbox-height) * .05);
                -moz-transform: rotate(-45deg);
                -ms-transform: rotate(-45deg);
                -o-transform: rotate(-45deg);
                -webkit-transform: rotate(-45deg);
                transform: rotate(-45deg);
            }

            .checkbox-wrapper-19 input[type=checkbox]:checked + .check-box,
            .checkbox-wrapper-19 .check-box.checked {
                border-color: #34b93d;
            }

                .checkbox-wrapper-19 input[type=checkbox]:checked + .check-box::after,
                .checkbox-wrapper-19 .check-box.checked::after {
                    height: calc(var(--checkbox-height) / 2);
                    -moz-animation: dothabottomcheck-19 0.2s ease 0s forwards;
                    -o-animation: dothabottomcheck-19 0.2s ease 0s forwards;
                    -webkit-animation: dothabottomcheck-19 0.2s ease 0s forwards;
                    animation: dothabottomcheck-19 0.2s ease 0s forwards;
                }

                .checkbox-wrapper-19 input[type=checkbox]:checked + .check-box::before,
                .checkbox-wrapper-19 .check-box.checked::before {
                    height: calc(var(--checkbox-height) * 1.2);
                    -moz-animation: dothatopcheck-19 0.4s ease 0s forwards;
                    -o-animation: dothatopcheck-19 0.4s ease 0s forwards;
                    -webkit-animation: dothatopcheck-19 0.4s ease 0s forwards;
                    animation: dothatopcheck-19 0.4s ease 0s forwards;
                }

        /*  #ContentPlaceHolder1_branch_list input{
	  margin: 7px !important;
  }*/

        .check_box input {
            margin: 7px !important;
        }

        .red_req {
            color: red;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid main-section">
        <%-- section 2 --%>
        <div class="row">
            <div class="col-md-7">
                <div class="section-second ">
                    <!-- row -->
                    <div class="container-fluid">
                        <%-- section 1 --%>
                        <div class="row ">
                            <div class="title">
                                <span>Add User</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 m-auto">
                                <!-- row -->

                                <asp:Panel ID="Main_Panel" runat="server">
                                    <div class="row m-auto g-2">
                                        <asp:Label ID="Label19" CssClass="col-lg-3 col-form-label" runat="server" Text="">User Name<label class="red_req">*</label></asp:Label>
                                        <div class="col-lg-9">
                                            <asp:TextBox ID="user_Name" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>

                                    </div>
                                    <!-- row -->
                                    <!-- row -->

                                    <!-- row -->
                                    <div class="row m-auto g-2">
                                        <asp:Label ID="Label1" CssClass="col-lg-3 col-form-label" runat="server" Text="">Email</asp:Label>
                                        <div class="col-lg-9">
                                            <asp:TextBox ID="email" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>

                                    </div>

                                    <div class="row m-auto g-2"></div>

                                    <div class="row m-auto g-2">
                                        <asp:Label ID="Label2" CssClass="col-lg-3 col-form-label" runat="server" Text="">Mobile<label class="red_req">*</label></asp:Label>
                                        <div class="col-lg-9">
                                            <asp:TextBox ID="user_mobile" MaxLength="10" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>

                                        <%--	<asp:Label ID="Label6" CssClass="col-lg-2 col-form-label" runat="server" Text="Pan No."></asp:Label>
										<div class="col-lg-4">
											<asp:TextBox ID="pan_no" CssClass="form-control" runat="server"></asp:TextBox>
										</div>--%>
                                    </div>

                                    <div class="row m-auto g-2">
                                        <asp:Label ID="Label3" CssClass="col-lg-3 col-form-label" runat="server" Text="">Password<label class="red_req">*</label></asp:Label>
                                        <div class="col-lg-9">
                                            <asp:TextBox ID="user_id" CssClass="form-control pass" runat="server"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row m-auto g-2">
                                        <asp:Label ID="Label4" CssClass="col-lg-3 col-form-label" runat="server" Text="">Confirm Password<label class="red_req">*</label></asp:Label>
                                        <div class="col-lg-9">
                                            <asp:TextBox ID="user_pass" CssClass="form-control pass" runat="server"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row m-auto g-2">
                                        <asp:Label ID="Label5" CssClass="col-lg-3 col-form-label" runat="server" Text="Isactive"></asp:Label>
                                        <div class="col-lg-9" style="margin-top: 10px;">

                                            <div class="checkbox-wrapper-19">
                                                <asp:CheckBox ID="isactive" runat="server" />
                                                <label for="<%= isactive.ClientID %>" class="check-box"></label>
                                            </div>

                                        </div>

                                    </div>



                                </asp:Panel>


                            </div>
                        </div>
                        <!-- row -->
                    </div>
                </div>
            </div>
            <div class="col-md-5">
                <div class="section-second" style="height: 336px;">
                    <!-- row -->
                    <div class="container-fluid">
                        <div class="row m-auto g-2">
                            <div class="row ">
                                <div class="title">
                                    <span>Rights</span>
                                </div>
                            </div>
                            <div class="check_box">

                                <div>
                                    <asp:CheckBox ID="parent1" runat="server" CssClass="check_child" />
                                    Finance
                                    <div data-parentid="<%= parent1.ClientID %>" class="child_box">
                                        <asp:CheckBox ID="child_1_1" runat="server" />
                                        Finance Form<br />
                                        <asp:CheckBox ID="child_1_2" runat="server" />
                                        View Summary<br />
                                    </div>
                                </div>
                                <div>
                                    <asp:CheckBox ID="parent2" runat="server" CssClass="check_child" />
                                    Insurance 
                                    <div data-parentid="<%= parent2.ClientID %>" class="child_box">
                                        <asp:CheckBox ID="child_2_1" runat="server" />
                                        CRE
				                         <br />
                                        <asp:CheckBox ID="child_2_2" runat="server" />
                                        Insurance Response
				                         <br />
                                    </div>
                                </div>

                                <div>
                                    <asp:CheckBox ID="parent3" runat="server" CssClass="check_child" />
                                    Sales
	                                <div data-parentid="<%= parent3.ClientID %>" class="child_box">
                                        <asp:CheckBox ID="child_3_1" runat="server" />
                                        Discount Approval<br />
                                        <asp:CheckBox ID="child_3_2" runat="server" />
                                        Discount Approval Report
	                                	<br />
                                        <asp:CheckBox ID="child_3_3" runat="server" />
                                        Sales Discount Approval
	                                	<br />
                                        <asp:CheckBox ID="child_3_4" runat="server" />
                                        Sales Discount Approval Report
	                                	<br />
                                    </div>
                                </div>

                                <div>
                                    <asp:CheckBox ID="parent4" runat="server" CssClass="check_child" />
                                    True Value
                                    <div data-parentid="<%= parent4.ClientID %>" class="child_box">
                                        <asp:CheckBox ID="child_4_1" runat="server" />
                                        True Value
				                        <br />
                                    </div>
                                </div>

                                <div>
                                    <asp:CheckBox ID="parent5" runat="server" CssClass="check_child" />
                                    ICM
                                    <div data-parentid="<%= parent5.ClientID %>" class="child_box">
                                        <asp:CheckBox ID="child_5_1" runat="server" />
                                        DSE Checklist
				                        <br />
                                    </div>
                                </div>

                                <div>
                                    <asp:CheckBox ID="parent6" runat="server" CssClass="check_child" />
                                    Fuel Slip
                                    <div data-parentid="<%= parent6.ClientID %>" class="child_box">
                                        <asp:CheckBox ID="child_6_1" runat="server" />
                                        New Car Fuel Voucher<br />
                                        <asp:CheckBox ID="child_6_2" runat="server" />
                                        Demo Car Fuel Voucher
				                        <br />
                                        <asp:CheckBox ID="child_6_3" runat="server" />
                                        Testing Function 
				                        <br />
                                        <asp:CheckBox ID="child_6_4" runat="server" />
                                        New Car Voucher Summary
				                        <br />
                                        <asp:CheckBox ID="child_6_5" runat="server" />
                                        Demo Car Voucher Summary
				                        <br />
                                    </div>
                                </div>

                                <div>
                                    <asp:CheckBox ID="parent7" runat="server" CssClass="check_child" />
                                    Reports
                                    <div data-parentid="<%= parent7.ClientID %>" class="child_box">
                                        <asp:CheckBox ID="child_7_1" runat="server" />
                                        Group Report<br />
                                        <asp:CheckBox ID="child_7_2" runat="server" />
                                        Vehicle Delivery Report
				                        <br />
                                        <asp:CheckBox ID="child_7_3" runat="server" />
                                        Discounts Report 
				                        <br />
                                        <asp:CheckBox ID="child_7_4" runat="server" />
                                        EW Report 
				                        <br />
                                        <asp:CheckBox ID="child_7_5" runat="server" />
                                        MGA Report 
				                        <br />
                                        <asp:CheckBox ID="child_7_6" runat="server" />
                                        CCP Report 
				                        <br />
                                    </div>
                                </div>

                                <div>
                                    <asp:CheckBox ID="parent8" runat="server" CssClass="check_child" />
                                    Add User
              
                                </div>

                                <div>
                                    <asp:CheckBox ID="parent9" runat="server" CssClass="check_child" />
                                    Dashboard
                                    <div data-parentid="<%= parent9.ClientID %>" class="child_box">
                                        <asp:CheckBox ID="child_9_1" runat="server" />
                                        Group Dashboard<br />
                                        <asp:CheckBox ID="child_9_2" runat="server" />
                                        Leadger Dashboard
				                        <br />
                                        <asp:CheckBox ID="child_9_3" runat="server" />
                                        Discounts Dashboard 
				                        <br />
                                        <asp:CheckBox ID="child_9_4" runat="server" />
                                        Other Sales
				                        <br />
                                        <asp:CheckBox ID="child_9_5" runat="server" />
                                        Outstanding
				                        <br />
                                    </div>
                                </div>


                            </div>



                            <div class="check_box">
                                <asp:CheckBoxList runat="server" ID="branch_list"></asp:CheckBoxList>
                            </div>

                        </div>

                    </div>

                </div>

            </div>

            <!-- row -->
            <div class="row buttons mt-3">
                <div class="col-lg-12" style="margin-bottom: 20px;">
                    <asp:Button class="bottombuttons" OnClientClick="return validateDropDown();" ID="Submit" runat="server" Text="Add User" />
                </div>
            </div>

        </div>
    </div>
    <%-- swet --%>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

    <script>
        $('[type="checkbox"]').change(function () {
            var shouldBeDisplayed = $(this).prop('checked');
            $('div[data-parentid="' + $(this).attr('id') + '"]').toggle(shouldBeDisplayed);
        });
    </script>

    <script>

        function appr_SelectedIndexChanged() {
            var va = document.getElementById("ContentPlaceHolder1_user_Name").value;

            //document.getElementById("ContentPlaceHolder1_user_Name").value = "";
            document.getElementById("ContentPlaceHolder1_user_mobile").value = "";
            document.getElementById("ContentPlaceHolder1_email").value = "";
            document.getElementById("ContentPlaceHolder1_user_id").value = "";
            document.getElementById("ContentPlaceHolder1_user_pass").value = "";

            var che = document.getElementById("ContentPlaceHolder1_isactive");
            che.checked = false;

            for (var i = 1; i <= 9; i++) {
                var id = "ContentPlaceHolder1_parent" + i
                var inputs = document.getElementById(id);
                inputs.checked = false;


                var parentIDs = ['', '<%= parent1.ClientID %>', '<%= parent2.ClientID %>', '<%= parent3.ClientID %>', '<%= parent4.ClientID %>', '<%= parent5.ClientID %>', '<%= parent6.ClientID %>', '<%= parent7.ClientID %>', '<%= parent9.ClientID %>'];
                if (i <= 9) {
                    if (i == 8) {
                        continue;

                        var parentID = parentIDs[i];
                        var parentDiv = document.querySelector('div[data-parentid="' + parentID + '"]');
                        var childCount = parentDiv.querySelectorAll('input[type="checkbox"]').length;

                        for (var j = 1; j <= childCount; j++) {

                            var child_id = "ContentPlaceHolder1_child_" + i + "_" + j;
                            var child_inputs = document.getElementById(child_id);
                            child_inputs.checked = false;
                        }
                    }
                }
            }

            var igww = ContentPlaceHolder1_branch_list.rows.length;
            for (var i = 0; i < igww; i++) {
                var idww = "ContentPlaceHolder1_branch_list_" + i
                var inputwws = document.getElementById(idww);
                inputwws.checked = false;

            }



            $.ajax({
                type: "POST",
                url: "add_user.aspx/GetChartData2",
                data: "{va:'" + va + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    // Parse the JSON string to a JavaScript object

                    var data = JSON.parse(response.d);


                    var user_name = data[0].user_name;
                    var user_pass = data[0].user_pass;
                    var isactive = data[0].isactive;
                    var mobile = data[0].user_mobile;
                    var email = data[0].user_email;
                    var str = data[0].MULTI_LOC;

                    document.getElementById("ContentPlaceHolder1_user_Name").value = user_name;
                    document.getElementById("ContentPlaceHolder1_user_mobile").value = mobile;
                    document.getElementById("ContentPlaceHolder1_email").value = email;
                    document.getElementById("ContentPlaceHolder1_user_id").value = user_pass;
                    document.getElementById("ContentPlaceHolder1_user_pass").value = user_pass;
                    if (isactive == "Y") {
                        var check = document.getElementById("ContentPlaceHolder1_isactive");
                        check.checked = true;
                    }


                    var seriesData = [];
                    var check
                    for (var i = 0; i < data.length; i++) {
                        seriesData.push(data[i].menu_option);
                    }

                    if (seriesData.includes('1')) {
                        check = document.getElementById("ContentPlaceHolder1_parent1");
                        check.checked = true;
                        $('div[data-parentid="' + $('#ContentPlaceHolder1_parent1').attr('id') + '"]').toggle(true);

                        if (seriesData.includes('1.1')) {
                            check = document.getElementById("ContentPlaceHolder1_child_1_1");
                            check.checked = true;
                        }
                        if (seriesData.includes('1.2')) {
                            check = document.getElementById("ContentPlaceHolder1_child_1_2");
                            check.checked = true;
                        }
                    }
                    if (seriesData.includes('2')) {
                        check = document.getElementById("ContentPlaceHolder1_parent2");
                        check.checked = true;
                        $('div[data-parentid="' + $('#ContentPlaceHolder1_parent2').attr('id') + '"]').toggle(true);

                        if (seriesData.includes('2.1')) {
                            check = document.getElementById("ContentPlaceHolder1_child_2_1");
                            check.checked = true;
                        }
                        if (seriesData.includes('2.2')) {
                            check = document.getElementById("ContentPlaceHolder1_child_2_2");
                            check.checked = true;
                        }
                    }
                    if (seriesData.includes('3')) {
                        check = document.getElementById("ContentPlaceHolder1_parent3");
                        check.checked = true;
                        $('div[data-parentid="' + $('#ContentPlaceHolder1_parent3').attr('id') + '"]').toggle(true);

                        if (seriesData.includes('3.1')) {
                            check = document.getElementById("ContentPlaceHolder1_child_3_1");
                            check.checked = true;
                        }
                        if (seriesData.includes('3.2')) {
                            check = document.getElementById("ContentPlaceHolder1_child_3_2");
                            check.checked = true;
                        }
                        if (seriesData.includes('3.3')) {
                            check = document.getElementById("ContentPlaceHolder1_child_3_3");
                            check.checked = true;
                        }
                        if (seriesData.includes('3.4')) {
                            check = document.getElementById("ContentPlaceHolder1_child_3_4");
                            check.checked = true;
                        }

                    }
                    if (seriesData.includes('4')) {
                        check = document.getElementById("ContentPlaceHolder1_parent4");
                        check.checked = true;
                        $('div[data-parentid="' + $('#ContentPlaceHolder1_parent4').attr('id') + '"]').toggle(true);

                        if (seriesData.includes('4.1')) {
                            check = document.getElementById("ContentPlaceHolder1_child_4_1");
                            check.checked = true;
                        }
                    }
                    if (seriesData.includes('5')) {
                        check = document.getElementById("ContentPlaceHolder1_parent5");
                        check.checked = true;
                        $('div[data-parentid="' + $('#ContentPlaceHolder1_parent5').attr('id') + '"]').toggle(true);

                        if (seriesData.includes('5.1')) {
                            check = document.getElementById("ContentPlaceHolder1_child_5_1");
                            check.checked = true;
                        }
                    }
                    if (seriesData.includes('6')) {
                        check = document.getElementById("ContentPlaceHolder1_parent6");
                        check.checked = true;
                        $('div[data-parentid="' + $('#ContentPlaceHolder1_parent6').attr('id') + '"]').toggle(true);

                        if (seriesData.includes('6.1')) {
                            check = document.getElementById("ContentPlaceHolder1_child_6_1");
                            check.checked = true;
                        }
                        if (seriesData.includes('6.2')) {
                            check = document.getElementById("ContentPlaceHolder1_child_6_2");
                            check.checked = true;
                        }
                        if (seriesData.includes('6.3')) {
                            check = document.getElementById("ContentPlaceHolder1_child_6_3");
                            check.checked = true;
                        }
                        if (seriesData.includes('6.4')) {
                            check = document.getElementById("ContentPlaceHolder1_child_6_4");
                            check.checked = true;
                        }
                        if (seriesData.includes('6.5')) {
                            check = document.getElementById("ContentPlaceHolder1_child_6_5");
                            check.checked = true;
                        }
                    }
                    if (seriesData.includes('7')) {
                        check = document.getElementById("ContentPlaceHolder1_parent7");
                        check.checked = true;
                        $('div[data-parentid="' + $('#ContentPlaceHolder1_parent7').attr('id') + '"]').toggle(true);

                        if (seriesData.includes('7.1')) {
                            check = document.getElementById("ContentPlaceHolder1_child_7_1");
                            check.checked = true;
                        }
                        if (seriesData.includes('7.2')) {
                            check = document.getElementById("ContentPlaceHolder1_child_7_2");
                            check.checked = true;
                        }
                        if (seriesData.includes('7.3')) {
                            check = document.getElementById("ContentPlaceHolder1_child_7_3");
                            check.checked = true;
                        }
                        if (seriesData.includes('7.4')) {
                            check = document.getElementById("ContentPlaceHolder1_child_7_4");
                            check.checked = true;
                        }
                        if (seriesData.includes('7.5')) {
                            check = document.getElementById("ContentPlaceHolder1_child_7_5");
                            check.checked = true;
                        }
                        if (seriesData.includes('7.6')) {
                            check = document.getElementById("ContentPlaceHolder1_child_7_6");
                            check.checked = true;
                        }
                    }
                    if (seriesData.includes('8')) {
                        check = document.getElementById("ContentPlaceHolder1_parent8");
                        check.checked = true;
                    }
                    if (seriesData.includes('9')) {
                        check = document.getElementById("ContentPlaceHolder1_parent9");
                        check.checked = true;
                        $('div[data-parentid="' + $('#ContentPlaceHolder1_parent9').attr('id') + '"]').toggle(true);

                        if (seriesData.includes('9.1')) {
                            check = document.getElementById("ContentPlaceHolder1_child_9_1");
                            check.checked = true;
                        }
                        if (seriesData.includes('9.2')) {
                            check = document.getElementById("ContentPlaceHolder1_child_9_2");
                            check.checked = true;
                        }
                        if (seriesData.includes('9.3')) {
                            check = document.getElementById("ContentPlaceHolder1_child_9_3");
                            check.checked = true;
                        }
                        if (seriesData.includes('9.4')) {
                            check = document.getElementById("ContentPlaceHolder1_child_9_4");
                            check.checked = true;
                        }
                        if (seriesData.includes('9.5')) {
                            check = document.getElementById("ContentPlaceHolder1_child_9_5");
                            check.checked = true;
                        }
                        
                    }

                    var multi_loc = str.split(",");
                    var igr = ContentPlaceHolder1_branch_list.rows.length;
                    for (var i = 0; i < igr; i++) {

                        var multi_locid = "ContentPlaceHolder1_branch_list_" + i;
                        var multi_loc_check = document.getElementById(multi_locid);


                        if (multi_loc.includes(multi_loc_check.value)) {

                            multi_loc_check.checked = true;
                        }
                    }

                },
                error: function (xhr, ajaxOptions, thrownError) {
                    // Handle the error
                    console.log(xhr.status + ': ' + thrownError);
                }
            });
        }

        document.getElementById('ContentPlaceHolder1_user_Name').addEventListener("blur", appr_SelectedIndexChanged);

    </script>

    <script>
        var inputElement = document.getElementById("ContentPlaceHolder1_user_mobile");
        inputElement.addEventListener("keydown", restrictInput);
        inputElement.addEventListener("input", restrictInput);
        inputElement.addEventListener("touchstart", restrictInput);
        inputElement.addEventListener("touchend", restrictInput);


        function restrictInput(event) {

            var inputElement = event.target;
            var inputValue = inputElement.value;

            // Remove non-numeric characters from the input value
            inputValue = inputValue.replace(/\D/g, "");

            // Update the input value with the cleaned numeric value
            inputElement.value = inputValue;
        }
    </script>

    <script>


        function compare_Input() {
            var pass = document.getElementById('ContentPlaceHolder1_user_id').value;
            var confr_pass = document.getElementById('ContentPlaceHolder1_user_pass').value;


            if (pass != confr_pass) {

                var box = document.getElementById('ContentPlaceHolder1_user_pass')
                box.value = "";
                box.style.border = '2px solid red';

            }
            else {
                var box = document.getElementById('ContentPlaceHolder1_user_pass')
                box.style.border = '';
            }

        }
        document.getElementById('ContentPlaceHolder1_user_pass').addEventListener("blur", compare_Input);
        document.getElementById('ContentPlaceHolder1_user_id').addEventListener("blur", compare_Input);
       /* document.getElementById('ContentPlaceHolder1_APRVL_AMT').attachEvent("blur", compare_Input);*/

    </script>

    <script>
        var submitBtn = document.getElementById("Submit");

        // Add an event listener for the keydown event on the form
        document.querySelector("form").addEventListener("keydown", function (event) {
            // Check if the Enter key was pressed
            if (event.keyCode === 13) {
                // Prevent the default form submission behavior
                event.preventDefault();

                // Do any other actions you want to do when the Enter key is pressed
                // For example, you could call a function to validate the form data here

                // Focus on the submit button to indicate that it isif the data has been disable then we have to create a separate code that is ery useful when we create any new request regarding to our new databse system oin our databse ssiyemtm there are several things that is keep in minded beffore foun to the further process ith system the sytem that is very important while we  c disabled


                submitBtn.focus();
            }
        });
    </script>

    <script type="text/javascript">
        function validateDropDown() {
            var name = document.getElementById("ContentPlaceHolder1_user_Name").value;
            var mobile = document.getElementById("ContentPlaceHolder1_user_mobile").value;
            var email = document.getElementById("ContentPlaceHolder1_email").value;
            var pass = document.getElementById("ContentPlaceHolder1_user_id").value;
            var con_pass = document.getElementById("ContentPlaceHolder1_user_pass").value;

            if (name == '') {
                Swal.fire({
                    icon: 'warning',
                    title: 'Please Enter User Name',
                    text: '',
                }).then(function () {
                    branch.focus();
                });
                return false;
            }
            if (mobile == '') {
                Swal.fire({
                    icon: 'warning',
                    title: 'Please Enter User Mobile',
                });
                return false;
            }
            if (mobile.length < 10) {
                Swal.fire({
                    icon: 'warning',
                    title: 'Please Enter Valid Mobile No',
                });
                return false;
            }

            if (pass == '') {
                Swal.fire({
                    icon: 'warning',
                    title: 'Please Enter User Password',
                });
                return false;
            }
            if (con_pass == '') {
                Swal.fire({
                    icon: 'warning',
                    title: 'Please Confirm Your Password',
                });
                return false;
            }

            return true;
        }
    </script>


</asp:Content>

