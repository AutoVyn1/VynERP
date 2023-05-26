<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AutovynModules/AUTOVYN.Master" CodeBehind="Insurance.aspx.vb" Inherits="AutovynERP.Insurance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<%-- swet --%>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

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
						<span>Insurance Payment Link Generator</span>
					</div>
				</div>
				<div class="row">
					<div class="col-12 m-auto">
						<!-- row -->

						<asp:Panel ID="Main_Panel" runat="server">
							<div class="row m-auto g-2">
								<asp:Label ID="Label19" CssClass="col-lg-2 col-form-label" runat="server" Text="Customer Name"></asp:Label>
								<div class="col-lg-4">
									<asp:TextBox ID="CustName" CssClass="form-control" runat="server"></asp:TextBox>
								</div>

								<asp:Label ID="Label2" CssClass="col-lg-2 col-form-label" runat="server" Text="Customer Email"></asp:Label>
								<div class="col-lg-4">
									<asp:TextBox ID="CustEmail" CssClass="form-control" runat="server"></asp:TextBox>
								</div>
							</div>
							<!-- row -->
							<!-- row -->

							<!-- row -->
							<div class="row m-auto g-2">
								<asp:Label ID="Label1" CssClass="col-lg-2 col-form-label" runat="server" Text="Customer Address"></asp:Label>
								<div class="col-lg-4">
									<asp:TextBox ID="CustAddress" CssClass="form-control" runat="server"></asp:TextBox>
								</div>

								<asp:Label ID="Label6" CssClass="col-lg-2 col-form-label" runat="server" Text="Location"></asp:Label>
								<div class="col-lg-4">
									<asp:TextBox ID="location" CssClass="form-control" runat="server"></asp:TextBox>
								</div>
							</div>
							<!-- row -->
							<!-- row -->
							<div class="row m-auto g-2">
								<asp:Label ID="Label3" CssClass="col-lg-2 col-form-label" runat="server" Text="Mobile Number"></asp:Label>
								<div class="col-lg-4">
									<asp:TextBox ID="CustMobile" CssClass="form-control " runat="server"></asp:TextBox>
								</div>

								<asp:Label ID="Label4" CssClass="col-lg-2 col-form-label" runat="server" Text="Vehicle Number"></asp:Label>
								<div class="col-lg-4">
									<asp:TextBox ID="VehicleNo" CssClass="form-control" oninput="validateVehicleNo()" runat="server"></asp:TextBox>
								</div>
							</div>
							<!-- row -->

							<div class="row m-auto g-2">
								<asp:Label ID="Label10" CssClass="col-lg-2 col-form-label" runat="server" Text="DSE Name"></asp:Label>
								<div class="col-lg-4 ">
									<asp:DropDownList ID="DSE_Name"  runat="server" CssClass=" ">
									</asp:DropDownList>
								</div>

								<asp:Label ID="Label5" CssClass="col-lg-2 col-form-label" runat="server" Text="Insurance Amount"></asp:Label>
								<div class="col-lg-4">
									<asp:TextBox ID="InsuranceAmt" CssClass="form-control" runat="server"></asp:TextBox>
								</div>
							</div>

							<!-- row -->

						</asp:Panel>

						<!-- row -->
						<div class="row buttons mt-3">
							<div class="col-lg-12">
								<asp:Button class="bottombuttons" ID="Submit" OnClientClick="return validateDropDown();" runat="server" Text="Submit" />
							</div>
						</div>

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

							</div>
						</div>

						<div class="row buttons mt-3">
							<asp:Panel ID="Panel1" CssClass="grid_panel" runat="server">
								<asp:GridView ID="gv_Employees" runat="server" Style="top: 0px; border: 1px solid #6fd472; text-align: center; border-collapse: inherit; background-color: hsla(40deg, 4%, 36%, 0.35); position: relative; width: 100%; table-layout: auto;"
									ShowHeaderWhenEmpty="True" CellPadding="3" BackColor="White" PagerStyle-CssClass="myPagerStyle" RowStyle-CssClass="my-class" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1">
									<Columns>
										<asp:CommandField ShowSelectButton="True" HeaderText="Send Link" ButtonType="Image" SelectImageUrl="https://png.pngtree.com/element_our/20190529/ourmid/pngtree-link-icon-image_1198606.jpg" SelectText="Edit">
											<ControlStyle Width="20px" />
											<ItemStyle HorizontalAlign="center" CssClass="ms-3" VerticalAlign="Middle" Width="80px" />
										</asp:CommandField>

										<asp:CommandField ButtonType="Button" ControlStyle-CssClass="btn" HeaderText="Action" ShowDeleteButton="True" ShowEditButton="True" ShowHeader="True" />

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


	<%-- Function for allowing only numbers and length of numbers --%>
	<script>    
		function restrictInput(event) {
			var charCode = (event.which) ? event.which : event.keyCode;
			if (charCode > 31 && (charCode < 48 || charCode > 57)) {
				event.preventDefault();
			}
			var value = document.getElementById("ContentPlaceHolder1_CustMobile").value;
			if (value.length >= 10) {
				event.preventDefault();
			}
		}

		function Onlynumber(event) {
			var charCode = (event.which) ? event.which : event.keyCode;
			if (charCode > 31 && (charCode < 48 || charCode > 57)) {
				event.preventDefault();
			}
		}

		function addSuffix(event) {
			var value = document.getElementById("ContentPlaceHolder1_InsuranceAmt").value;
			if (!value.endsWith(".00")) {
				document.getElementById("ContentPlaceHolder1_InsuranceAmt").value = value + ".00";
			}
		}

		var custMobile = document.getElementById("ContentPlaceHolder1_CustMobile");
		var insuamount = document.getElementById("ContentPlaceHolder1_InsuranceAmt");

		if (custMobile.addEventListener) {
			custMobile.addEventListener("keypress", restrictInput);
		} else if (custMobile.attachEvent) {
			custMobile.attachEvent("onkeypress", restrictInput);
		}

		if (insuamount.addEventListener) {
			insuamount.addEventListener("keypress", Onlynumber);
			insuamount.addEventListener("blur", addSuffix);
		} else if (insuamount.attachEvent) {
			insuamount.attachEvent("onkeypress", Onlynumber);
			insuamount.attachEvent("onblur", addSuffix);
		}
	</script>

	<script>
		VirtualSelect.init({
			ele: '#ContentPlaceHolder1_DSE_Name',
			showOptionsOnlyOnSearch: true
		});
    </script>

	<%-- For input Validation  --%>
    <script type="text/javascript">
		function validateDropDown() {
			var custname = document.getElementById('ContentPlaceHolder1_CustName');
			var email = document.getElementById('ContentPlaceHolder1_CustEmail');
			var address = document.getElementById('ContentPlaceHolder1_CustAddress');
			var location = document.getElementById('ContentPlaceHolder1_location');
			var mobile = document.getElementById('ContentPlaceHolder1_CustMobile');
			var vehi_no = document.getElementById('ContentPlaceHolder1_VehicleNo');
			var dse = document.getElementById('ContentPlaceHolder1_DSE_Name');
			var isnurance = document.getElementById('ContentPlaceHolder1_InsuranceAmt');

			if (mobile.value.length < 10) {
				Swal.fire({
					icon: 'warning',
					title: 'Please Enter 10 digit number',
					text: '',
				}).then(function () {
					custname.focus();
				});
				return false;
			}

			if (custname.value.length < 3) {
				Swal.fire({
					icon: 'warning',
					title: 'Please Enter a valid customer name',
					text: '',
				}).then(function () {
					custname.focus();
				});
				return false;
			}
			if (email.value.length <10) {
				Swal.fire({
					icon: 'warning',
					title: 'Please Enter valid email',
					text: '',
				}).then(function () {
					custname.focus();
				});
				return false;
			}

			if (address.value.length < 3) {
				Swal.fire({
					icon: 'warning',
					title: 'Please the adress',
					text: '',
				}).then(function () {
					custname.focus();
				});
				return false;
			}

			if (location.value.length < 3) {
				Swal.fire({
					icon: 'warning',
					title: 'Please enter the location',
				});
				return false;
			}

			if (vehi_no.value.length < 10 || vehi_no.value.length > 12  ) {
				Swal.fire({
					icon: 'warning',
					title: 'Please enter valid vehicle no.',
				});
				return false;
			}

			if (dse.value == '0') {
				Swal.fire({
					icon: 'warning',
					title: 'Please select DSE',
				});
				return false;
			}

			if (isnurance.value.length < 3) {
				Swal.fire({
					icon: 'warning',
					title: 'Please enter insurance amount',
				});
				return false;
			}
			return true;
		}
	</script>
    <%-- For input Validation  --%>

	<script>
		function validateVehicleNo() {
			var vehicleNo = document.getElementById('VehicleNo').value;

			// Validate length
			if (vehicleNo.length !== 10) {
				document.getElementById('VehicleNo').setCustomValidity('Please enter a 10-character vehicle number.');
			} else {
				document.getElementById('VehicleNo').setCustomValidity('');
			}

			// Validate format
			var regex = /^[A-Za-z]{2}\d{2}[A-Za-z]{2}\d{4}$/;
			if (!regex.test(vehicleNo)) {
				document.getElementById('VehicleNo').setCustomValidity('Please enter a vehicle number in the format: AA11AA1111');
			} else {
				document.getElementById('VehicleNo').setCustomValidity('');
			}
		}


	</script>

	
</asp:Content>


