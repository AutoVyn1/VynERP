<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AutovynModules/AUTOVYN.Master" CodeBehind="common_disc.aspx.vb" Inherits="AutovynERP.common_disc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<%-- swet --%>

	<%-- jquery --%>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

	<%-- select library --%>
	<link rel="stylesheet" href="../../JS/ListSelect/virtual-select.min.css" />
	<script type="text/javascript" src="../../JS/ListSelect/virtual-select.min.js"></script>
	<%-- select library --%>
	

	<style>
		
		*{
            margin:0;
            padding:0;
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
			background: #5c9d5c;
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

		.my-class td{
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
		.red_req{
			color:red;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="container-fluid main-section">
		<%-- section 2 --%>
		<div class="section-second ">
			<!-- row -->
			<div class="container-fluid">
				<%-- section 1 --%>
				<div class="row ">
					<div class="title">
						<span>Discount Approval</span>
					</div>
				</div>
				<div class="row">
					<div class="col-12 m-auto">
						<!-- row -->

						<asp:Panel ID="Main_Panel" runat="server">
							<div class="row m-auto g-2">
								<asp:Label ID="Label19" CssClass="col-lg-2 col-form-label" runat="server" Text="">Customer Name <label class="red_req">*</label></asp:Label>
								<div class="col-lg-4">
									<asp:TextBox ID="CustName" CssClass="form-control" runat="server"></asp:TextBox>
								</div>

								<asp:Label ID="Label2" CssClass="col-lg-2 col-form-label" runat="server" Text="">Mobile<label class="red_req">*</label></asp:Label>
								<div class="col-lg-4">
									<asp:TextBox ID="cust_mobile" MaxLength="10" CssClass="form-control"  runat="server"></asp:TextBox>
								</div>
							</div>
							<!-- row -->
							<!-- row -->

							<!-- row -->
							<div class="row m-auto g-2">
								<asp:Label ID="Label1" CssClass="col-lg-2 col-form-label" runat="server" Text="">Veh. no.<label class="red_req">*</label></asp:Label>
								<div class="col-lg-4">
									<asp:TextBox ID="VehicleNo" CssClass="form-control" MaxLength="10" placeholder="AA 00 AA 0000" title="Enter Valid Reg. Number E.g. AA 00 AA 0000 " runat="server"></asp:TextBox>
								</div>

								<asp:Label ID="Label6" CssClass="col-lg-2 col-form-label" runat="server" Text="">Pan No.<label class="red_req">*</label></asp:Label>
								<div class="col-lg-4">
									<asp:TextBox ID="pan_no" CssClass="form-control" MaxLength="10" placeholder="AAAAA9999A" title="Enter Valid Pan Number E.g. AAAAA9999A " runat="server"></asp:TextBox>
								</div>
							</div>
							<!-- row -->
							
							<div class="row m-auto g-2">
								<asp:Label ID="Label10" CssClass="col-lg-2 col-form-label" runat="server" Text="">Discount Type<label class="red_req">*</label></asp:Label>
								<div class="col-lg-4 ">
									<asp:DropDownList ID="disc_type"  runat="server" CssClass="form-control">
										   <asp:ListItem Value="">--Select type--</asp:ListItem>
                                                <asp:ListItem Value="MGA">MGA</asp:ListItem>
                                                <asp:ListItem Value="Services">Services</asp:ListItem>
                                                <asp:ListItem Value="Body Shop">Body Shop</asp:ListItem>
                                                <asp:ListItem Value="TV">TV</asp:ListItem>
                                                <asp:ListItem Value="Insurance">Insurance</asp:ListItem>
									</asp:DropDownList>
								</div>

								<asp:Label ID="Label5" CssClass="col-lg-2 col-form-label" runat="server" Text="">Discount Amount<label class="red_req">*</label></asp:Label>
								<div class="col-lg-4">
									<asp:TextBox ID="disc_Amt" CssClass="form-control digitOnly" runat="server"></asp:TextBox>
								</div>
							</div>

							<!-- row -->
							<div class="row m-auto g-2">
								<asp:Label ID="Label3" CssClass="col-lg-2 col-form-label" runat="server" Text="Remark"></asp:Label>
								<div class="col-lg-10">
									<asp:TextBox ID="remark" TextMode="multiline" Columns="50" Rows="3"  CssClass="form-control " runat="server"></asp:TextBox>
								</div>

								
							</div>
							<!-- row -->

								<div class="row m-auto g-2">
								<asp:Label ID="Label4" CssClass="col-lg-2 col-form-label" runat="server" Text="">Disc Requested By<label class="red_req">*</label></asp:Label>
								<div class="col-lg-4 ">
									<asp:DropDownList ID="SRM" class="resetting" selectionmode="multiple" data-silent-initial-value-set="true" name="native-select" data-search="true"  runat="server">
									
									</asp:DropDownList>
								</div>

								<asp:Label ID="Label8" CssClass="col-lg-2 col-form-label" runat="server" Text="DSE No."></asp:Label>
								<div class="col-lg-4">
									<asp:TextBox ID="Req_mobno" CssClass="form-control"   runat="server"></asp:TextBox>
								</div>
							</div>

							<!-- row -->


								<!-- row -->

								<div class="row m-auto g-2">
								<asp:Label ID="Label9" CssClass="col-lg-2 col-form-label" runat="server" Text="">Disc Approver By<label class="red_req">*</label></asp:Label>
								<div class="col-lg-4 ">
									<asp:DropDownList ID="Aprvl_By" class="resetting" selectionmode="multiple" data-silent-initial-value-set="true" name="native-select" data-search="true" runat="server">
									
									</asp:DropDownList>
								</div>

								<asp:Label ID="Label11" CssClass="col-lg-2 col-form-label" runat="server" Text="Approver No."></asp:Label>
								<div class="col-lg-4">
									<asp:TextBox ID="approver_no" CssClass="form-control"  runat="server"></asp:TextBox>
								</div>
							</div>

							<!-- row -->


						</asp:Panel>

						<asp:Panel ID="Aprvl_Panel" runat="server">
								<div class="row m-auto g-2">
									<asp:Label ID="Label14" CssClass="col-lg-2 col-form-label" runat="server" Text="Disc Approved"></asp:Label>
								<div class="col-lg-2">
									<asp:TextBox ID="APRVL_AMT" CssClass="form-control" runat="server" ></asp:TextBox>
								</div>
								<asp:Label ID="Label12" CssClass="col-lg-1 col-form-label" runat="server" Text="Status"></asp:Label>
								<div class="col-lg-2">
									<asp:DropDownList ID="APRVL_STATUS" CssClass="form-control" runat="server">
									  <asp:ListItem Value="">Select</asp:ListItem>
                                                <asp:ListItem Value="Approve">Approve</asp:ListItem>
                                                <asp:ListItem Value="Reject">Reject</asp:ListItem>
                                                <asp:ListItem Value="Pending">Pending</asp:ListItem>
									</asp:DropDownList>
								</div>

								<asp:Label ID="Label13" CssClass="col-lg-1 col-form-label" runat="server" Text="Approval Remark"></asp:Label>
								<div class="col-lg-4">
									<asp:TextBox ID="APRVL_REMARK" CssClass="form-control"  runat="server"></asp:TextBox>
								</div>
							</div>
					    </asp:Panel>
						<!-- row -->
						<div class="row buttons mt-3">
							<div class="col-lg-12" style="margin-bottom: 20px;">
								<asp:Button class="bottombuttons" ID="Submit" OnClientClick="return validateDropDown();" runat="server" Text="Generate Discount Request Link" />
								<asp:Button class="bottombuttons" ID="Update" OnClientClick="return validateDropDown();" runat="server" Text="Update" />
							</div>
						</div>

						<asp:Panel ID="filter_panel" runat="server">
						<div class="container-fluid">
							<div class="row mt-1 mb-1 amt-box">

								<asp:Label ID="Label7" Class="col-2 col-form-label amt-box-lbl" runat="server" Text="Customer Name/Location/Number"></asp:Label>
								<div class="col-lg-3  amt-box-total">
									<asp:TextBox ID="searchbox" Class="col-2 form-control" runat="server"></asp:TextBox>
								</div>

								<div class="col-lg-1 amt-box-total-1">
									<asp:Button ID="search" Class="btn" runat="server" Text="Filter" />
								</div>

								<div class="col-lg-1 amt-box-total-1">
									<asp:Button ID="viewall" Class="btn" runat="server" Text="viewall" />
								</div>

                                <asp:HiddenField ID="update_id" runat="server" />
								<%--<input type="hidden" name="update_id" id="update_id"/>--%>

							</div>
						</div>
						</asp:Panel>
						<div class="row buttons mt-3">
							<asp:Panel ID="Panel1" CssClass="grid_panel" runat="server">
								<asp:GridView ID="gv_Employees" runat="server" Style="top: 0px; border: 1px solid #6fd472; text-align: center; border-collapse: inherit; background-color: hsla(40deg, 4%, 36%, 0.35); position: relative; width: 100%; table-layout: auto;"
									ShowHeaderWhenEmpty="True" CellPadding="3" BackColor="White" PagerStyle-CssClass="myPagerStyle" RowStyle-CssClass="my-class" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1">
									<Columns>
										<asp:CommandField ShowSelectButton="True" HeaderText="Send Link" ButtonType="Image" SelectImageUrl="https://png.pngtree.com/element_our/20190529/ourmid/pngtree-link-icon-image_1198606.jpg" SelectText="Edit">
											<ControlStyle Width="20px" />
											<ItemStyle HorizontalAlign="center" CssClass="ms-3" VerticalAlign="Middle" Width="80px" />
										</asp:CommandField>

										<asp:ButtonField ButtonType="Button" HeaderText="Edit" ShowHeader="True" Text="Edit" CommandName="Edit" />
										<asp:ButtonField ButtonType="Button" HeaderText="Delete" ShowHeader="True" Text="delete" CommandName="Delete" />

									</Columns>
									<AlternatingRowStyle BackColor="White" />
									<HeaderStyle BackColor="#6B696B" Font-Bold="true" Font-Size="Larger" ForeColor="White" />
									<RowStyle BackColor="#f5f5f5"  />
									<HeaderStyle BackColor="#0C4160" ForeColor="WhiteSmoke" Width="100%" />
									<FooterStyle BackColor="#CCCCCC" />
									<HeaderStyle Font-Bold="True" ForeColor="White" Width="100%" />
									<PagerSettings FirstPageText="1" LastPageText="last" NextPageText="next" PreviousPageText="previous" />
									<PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
								</asp:GridView>

							</asp:Panel>
						</div>
					</div>
				</div>
				<!-- row -->
			</div>
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<!-- InputMask -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/inputmask/inputmask.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/inputmask/inputmask.date.extensions.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/inputmask/inputmask.extensions.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/css/inputmask.css" />

	<%-- dropify --%>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

	<script type="text/javascript" src="../../JS/ListSelect/virtual-select.min.js"></script>

	<%-- dropify --%>
	<%-- dropify --%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://jeremyfagis.github.io/dropify/dist/js/dropify.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://jeremyfagis.github.io/dropify/dist/css/dropify.min.css" />
	<%-- dropify --%>

	<script>
        $(function () {
            var inputmask = new Inputmask("99/99/9999", { placeholder: 'dd/MM/yyyy' });
            inputmask.mask($('[id*=datePicker]'));
        });

        $(".dropify").dropify();
    </script>

	<script>

       
		function compare_Input() {
			var appr_amt = document.getElementById('ContentPlaceHolder1_APRVL_AMT').value;
            var disc_amt = document.getElementById('ContentPlaceHolder1_disc_Amt').value;

            if (!appr_amt.endsWith(".00") && appr_amt != "") {
                document.getElementById("ContentPlaceHolder1_APRVL_AMT").value = appr_amt + ".00";
			}

			var ap_amt = parseInt(document.getElementById('ContentPlaceHolder1_APRVL_AMT').value);
			var di_amt = parseInt(document.getElementById('ContentPlaceHolder1_disc_Amt').value);

            if (ap_amt > di_amt) {
                Swal.fire({
                    icon: 'warning',
                    title: 'Approved Amount Should be Lower Than Requested Amount',
                    text: '',
				}).then(function () {
                    var box = document.getElementById('ContentPlaceHolder1_APRVL_AMT')
					box.value = "";
                    box.style.border = '2px solid red';
                    box.focus();

                });
			}

         
		}
        document.getElementById('ContentPlaceHolder1_APRVL_AMT').addEventListener("blur", compare_Input);
       /* document.getElementById('ContentPlaceHolder1_APRVL_AMT').attachEvent("blur", compare_Input);*/

    </script>


	<%-- Function for allowing only numbers and length of numbers --%>

	<script>
        var inputElement = document.getElementById("ContentPlaceHolder1_cust_mobile");
        inputElement.addEventListener("keydown", restrictInput);
        inputElement.addEventListener("input", restrictInput);
        inputElement.addEventListener("touchstart", restrictInput);
        inputElement.addEventListener("touchend", restrictInput);

        var inputElement1 = document.getElementById("ContentPlaceHolder1_disc_Amt");
        inputElement1.addEventListener("keydown", restrictInput);
        inputElement1.addEventListener("input", restrictInput);
        inputElement1.addEventListener("touchstart", restrictInput);
		inputElement1.addEventListener("touchend", restrictInput);
        inputElement1.addEventListener("blur", addSuffix);

        var inputElement2 = document.getElementById("ContentPlaceHolder1_APRVL_AMT");
        inputElement2.addEventListener("keydown", restrictInput);
        inputElement2.addEventListener("input", restrictInput);
        inputElement2.addEventListener("touchstart", restrictInput);
		inputElement2.addEventListener("touchend", restrictInput);
        inputElement2.addEventListener("blur", addSuffix);

        function restrictInput(event) {

            var inputElement = event.target;
			var inputValue = inputElement.value;

            /*console.log(inputElement)*/

            // Remove non-numeric characters from the input value
            inputValue = inputValue.replace(/\D/g, "");

            // Update the input value with the cleaned numeric value
			inputElement.value = inputValue;

            
		}

		function addSuffix(event) {

			var inputValue = event.target;
			var value = inputValue.value;

            if (!value.endsWith(".00")) {
                inputValue.value = value + ".00";
            }
		}

    </script>


	<script>    
       
        function restrictspecial_char_pan(event) {
            var charCode = (event.which) ? event.which : event.keyCode;
            if ((charCode > 31 && charCode < 48) || (charCode > 57 && charCode < 65) || (charCode > 90 && charCode < 97) || charCode > 122) {
                event.preventDefault();
			}


            var value = document.getElementById("ContentPlaceHolder1_pan_no").value;
            if (value.length >= 10) {
                event.preventDefault();
            }
          
		}

        function restrictspecial_char_veh(event) {
            var charCode = (event.which) ? event.which : event.keyCode;
            if ((charCode > 31 && charCode < 48) || (charCode > 57 && charCode < 65) || (charCode > 90 && charCode < 97) || charCode > 122) {
                event.preventDefault();
            }
            var value = document.getElementById("ContentPlaceHolder1_VehicleNo").value;
            if (value.length >= 10) {
                event.preventDefault();
            }

        }

        var VehicleNo = document.getElementById("ContentPlaceHolder1_VehicleNo");
        var pan_no = document.getElementById("ContentPlaceHolder1_pan_no");

        if (VehicleNo.addEventListener) {
            VehicleNo.addEventListener("keypress", restrictspecial_char_veh);
        } else if (VehicleNo.attachEvent) {
            VehicleNo.attachEvent("onkeypress", restrictspecial_char_veh);
		}

        if (pan_no.addEventListener) {
            pan_no.addEventListener("keypress", restrictspecial_char_pan);
        } else if (pan_no.attachEvent) {
            pan_no.attachEvent("onkeypress", restrictspecial_char_pan);
        }

    </script>
	<script>
        VirtualSelect.init({
            ele: '#ContentPlaceHolder1_Aprvl_By',
            showOptionsOnlyOnSearch: true
		});

        VirtualSelect.init({
            ele: '#ContentPlaceHolder1_SRM',
            showOptionsOnlyOnSearch: true
        });
    </script>

<script>

    function appr_SelectedIndexChanged() {
		var va = document.getElementById("ContentPlaceHolder1_SRM").value;



        $.ajax({
            type: "POST",
            url: "common_disc.aspx/GetChartData2",
            data: "{va:'" + va + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                // Parse the JSON string to a JavaScript object
                var data = JSON.parse(response.d);

                var appr = data[0].mobile_no;
                document.getElementById("ContentPlaceHolder1_Req_mobno").value = appr;


            },
            error: function (xhr, ajaxOptions, thrownError) {
                // Handle the error
                console.log(xhr.status + ': ' + thrownError);
            }
        });
	}

    document.getElementById('ContentPlaceHolder1_SRM').addEventListener("change", appr_SelectedIndexChanged);
       
</script>


    <script>

        function appr_SelectedIndexChanged() {
            var va = document.getElementById("ContentPlaceHolder1_Aprvl_By").value;

			$.ajax({
                type: "POST",
                url: "common_disc.aspx/GetChartData",
                data: "{va:'" + va + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    // Parse the JSON string to a JavaScript object
                    var data = JSON.parse(response.d);

                    var appr = data[0].mobile_no;
                    document.getElementById("ContentPlaceHolder1_approver_no").value = appr;


                },
                error: function (xhr, ajaxOptions, thrownError) {
                    // Handle the error
                    console.log(xhr.status + ': ' + thrownError);
                }
            });
        }

        document.getElementById('ContentPlaceHolder1_Aprvl_By').addEventListener("change", appr_SelectedIndexChanged);

    </script>

	<script type="text/javascript">
        function validateDropDown() {
            var name = document.getElementById("ContentPlaceHolder1_CustName").value;
            var mobile = document.getElementById("ContentPlaceHolder1_cust_mobile").value;
            var VehicleNo = document.getElementById("ContentPlaceHolder1_VehicleNo").value;
            var pan = document.getElementById("ContentPlaceHolder1_pan_no").value;
            var type = document.getElementById("ContentPlaceHolder1_disc_type").value;
            var amt = document.getElementById("ContentPlaceHolder1_disc_Amt").value;
            var srm = document.getElementById("ContentPlaceHolder1_SRM").value;
            var aprvl = document.getElementById("ContentPlaceHolder1_Aprvl_By").value;

            if (name == '') {
                Swal.fire({
                    icon: 'warning',
                    title: 'Please Enter Customer Name',
                    text: '',
                }).then(function () {
                    branch.focus();
                });
                return false;
            }
            if (mobile == '') {
                Swal.fire({
                    icon: 'warning',
                    title: 'Please Enter Mobile No.',
                });
                return false;
			}
			if (mobile.length < 10) {
                Swal.fire({
                    icon: 'warning',
                    title: 'Please Enter Valid Mobile No.',
                });
                return false;
            }

            if (VehicleNo == '') {
                Swal.fire({
                    icon: 'warning',
                    title: 'Please Enter Vehicle No',
                });
                return false;
			}
			if (VehicleNo.length < 10) {
                Swal.fire({
                    icon: 'warning',
                    title: 'Please Enter Valid Vehicle No.',
                });
                return false;
            }
            if (pan == '') {
                Swal.fire({
                    icon: 'warning',
                    title: 'Please Enter Pan No.',
                });
                return false;
			}

			if (pan.length < 10) {
                Swal.fire({
                    icon: 'warning',
                    title: 'Please Enter Valid Pan No.',
                });
                return false;
			}

            if (type == '') {
                Swal.fire({
                    icon: 'warning',
                    title: 'Please Choose Disc Type',
                });
                return false;
			}
            if (amt == '') {
                Swal.fire({
                    icon: 'warning',
                    title: 'Please Enter Amount',
                });
                return false;
			}
            if (srm == '') {
                Swal.fire({
                    icon: 'warning',
                    title: 'Please Select SRM',
                });
                return false;
			}
            if (aprvl == '') {
                Swal.fire({
                    icon: 'warning',
                    title: 'Please Select Aproval',
                });
                return false;
			}

            $.ajax({
                type: "POST",
                url: "common_disc.aspx/GetChartData",
                data: "{va:'" + va + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    // Parse the JSON string to a JavaScript object
                    var data = JSON.parse(response.d);

                    var appr = data[0].mobile_no;
                    document.getElementById("ContentPlaceHolder1_approver_no").value = appr;


                },
                error: function (xhr, ajaxOptions, thrownError) {
                    // Handle the error
                    console.log(xhr.status + ': ' + thrownError);
                }
            });
        
		}

    </script>

</asp:Content>
