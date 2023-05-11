<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AutovynModules/AUTOVYN.Master" CodeBehind="DSE_insu_page.aspx.vb" Inherits="AutovynERP.DSE_insu_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<%-- swet --%>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>


	<style>
		* {
			margin: 0;
			padding: 0;
			font-family: 'Ubuntu', sans-serif;
		}

		body {
			background-image: url("../../Media/loginbg.svg");
			font-size: 13px;
		}

		.main-section {
			margin-top: 60px;
		}

		.title {
			text-align: center;
			height: 40px;
		}

		.navbar {
			display: none;
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
			width: 60%;
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

		.dropify-wrapper {
			height: 100px !important;
		}

		@media screen and (max-width:480px) {
			.section-second {
				width: 100%;
			}

			.bottombuttons {
				width: 60%;
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
						<span>Insurance Approval</span>
					</div>
				</div>
				<div class="row">
					<div class="col-12 m-auto">
						<!-- row -->

						<asp:Panel ID="Main_Panel" runat="server">
							<div class="row m-auto g-2">
								<asp:Label ID="Label19" CssClass="col-lg-3 col-form-label" runat="server" Text="Customer Name"></asp:Label>
								<div class="col-lg-7">
									<asp:TextBox ID="CustName" CssClass="form-control" required runat="server"></asp:TextBox>
								</div>
							</div>
							<!-- row -->

							<!-- row -->
							<div class="row m-auto g-2">
								<asp:Label ID="Label1" CssClass="col-lg-3 col-form-label" runat="server" Text="Customer Address"></asp:Label>
								<div class="col-lg-7">
									<asp:TextBox ID="CustAddress" CssClass="form-control" runat="server"></asp:TextBox>
								</div>
							</div>
							<!-- row -->
							<!-- row -->
							<div class="row m-auto g-2">
								<asp:Label ID="Label3" CssClass="col-lg-3 col-form-label" runat="server" Text="Mobile Number"></asp:Label>
								<div class="col-lg-2">
									<asp:TextBox ID="CustMobile" CssClass="form-control " required runat="server"></asp:TextBox>
								</div>

								<asp:Label ID="Label4" CssClass="col-lg-3 col-form-label" runat="server" Text="Vehicle Number"></asp:Label>
								<div class="col-lg-2">
									<asp:TextBox ID="VehicleNo" CssClass="form-control" runat="server"></asp:TextBox>
								</div>
							</div>
							<!-- row -->

							<!-- row -->
							<div class="row m-auto g-2">
								<asp:Label ID="Label2" CssClass="col-lg-3 col-form-label" runat="server" Text="Customer Email"></asp:Label>
								<div class="col-lg-7">
									<asp:TextBox ID="CustEmail" CssClass="form-control" runat="server"></asp:TextBox>
								</div>
							</div>
							<!-- row -->


							<div class="row m-auto g-2">
								<asp:Label ID="Label10" CssClass="col-lg-3 col-form-label" runat="server" Text="DSE Name"></asp:Label>
								<div class="col-lg-7">
									<asp:DropDownList ID="DSE_Name" runat="server" CssClass="form-control">
									</asp:DropDownList>
								</div>
							</div>

							<div class="row m-auto g-2">
								<asp:Label ID="Label5" CssClass="col-lg-3 col-form-label" runat="server" Text="Insurance Amount"></asp:Label>
								<div class="col-lg-7">
									<asp:TextBox ID="InsuranceAmt" CssClass="form-control" required runat="server"></asp:TextBox>
								</div>
							</div>





							<!-- row -->

						</asp:Panel>

						<asp:Panel ID="Aprvl_Panel" runat="server">

							<!-- row -->
							<div class="row m-auto g-2">
								<asp:Label ID="Label6" CssClass="col-lg-3 col-form-label" runat="server" Text="Payment Mode"></asp:Label>
								<div class="col-lg-7">
									<asp:DropDownList ID="PaymentMode" runat="server" CssClass="form-control">
										<asp:ListItem> </asp:ListItem>
										<asp:ListItem>Cash</asp:ListItem>
										<asp:ListItem>Cheque</asp:ListItem>
										<asp:ListItem>NEFT</asp:ListItem>
										<asp:ListItem>Wallet</asp:ListItem>
										<asp:ListItem>Other</asp:ListItem>
									</asp:DropDownList>
								</div>
							</div>
							<!-- row -->
							<div class="row m-auto g-2">

								<asp:Label ID="Label7" CssClass="col-lg-3 col-form-label" runat="server" Text="Date"></asp:Label>
								<div class="col-lg-2">
									<asp:TextBox ID="datePicker" runat="server" CssClass="form-control"></asp:TextBox>
								</div>

								<asp:Label ID="Label9" CssClass="col-lg-3 col-form-label" runat="server" Text="Received Amount"></asp:Label>
								<div class="col-lg-2">
									<asp:TextBox ID="recv_amt" CssClass="form-control" runat="server"></asp:TextBox>
								</div>


							</div>
							<!-- row -->

							<!-- row -->
							<div class="row m-auto g-2">
								<asp:Label ID="Label8" CssClass="col-lg-3 col-form-label" runat="server" Text="Remark"></asp:Label>
								<div class="col-lg-7">
									<asp:TextBox ID="Remark" runat="server" CssClass="form-control"></asp:TextBox>
								</div>
							</div>

							<div class="row m-auto g-2 text-center justify-content-center">
								<div class="col-4">
									<asp:FileUpload ID="rcpt_image" Class="dropify" runat="server" />

								</div>

							</div>
						</asp:Panel>
						<!-- row -->
						<div class="row buttons mt-3">
							<div class="col-lg-12">
								<asp:Button class="bottombuttons" ID="Submit" runat="server" Text="Change Status" />

							</div>
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

		function Onlynumber(event) {
			var charCode = (event.which) ? event.which : event.keyCode;
			if (charCode > 31 && (charCode < 48 || charCode > 57)) {
				event.preventDefault();
			}
		}

		function addSuffix(event) {
			var value = document.getElementById("ContentPlaceHolder1_recv_amt").value;
			if (!value.endsWith(".00")) {
				document.getElementById("ContentPlaceHolder1_recv_amt").value = value + ".00";
			}
		}

		var recv_amtw = document.getElementById("ContentPlaceHolder1_recv_amt");


		if (recv_amtw.addEventListener) {
			recv_amtw.addEventListener("keypress", Onlynumber);
			recv_amtw.addEventListener("blur", addSuffix);
		} else if (recv_amtw.attachEvent) {
			recv_amtw.attachEvent("onkeypress", Onlynumber);
			recv_amtw.attachEvent("onblur", addSuffix);
		}
	</script>

</asp:Content>

