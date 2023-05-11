<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AutovynModules/AUTOVYN.Master" CodeBehind="chassis_allot.aspx.vb" Inherits="AutovynERP.chassis_allot" %>

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
						<span>Chassis-Allotment</span>
					</div>
				</div>
				<div class="row">
					<div class="col-12 m-auto">
						<!-- row -->

						<asp:Panel ID="Main_Panel" runat="server">
							<div class="row m-auto g-2">
								<asp:Label ID="Label19" CssClass="col-lg-2 col-form-label" runat="server" Text="Invoice No. "></asp:Label>
								<div class="col-lg-4">
									<asp:TextBox ID="CustName" CssClass="form-control" runat="server"></asp:TextBox>
								</div>

								<asp:Label ID="Label2" CssClass="col-lg-2 col-form-label" runat="server" Text="Date"></asp:Label>
								<div class="col-lg-4">
									<asp:TextBox ID="Curr_Date" CssClass="form-control" runat="server"></asp:TextBox>
								</div>
							</div>
							<!-- row -->
							<!-- row -->

							<!-- row -->
							<div class="row m-auto g-2">
								<asp:Label ID="Label1" CssClass="col-lg-2 col-form-label" runat="server" Text="Customer Id"></asp:Label>
								<div class="col-lg-4">
									<asp:TextBox ID="CustAddress" CssClass="form-control" runat="server"></asp:TextBox>
								</div>

								<asp:Label ID="Label6" CssClass="col-lg-2 col-form-label" runat="server" Text="Customer Name"></asp:Label>
								<div class="col-lg-4">
									<asp:TextBox ID="location" CssClass="form-control" runat="server"></asp:TextBox>
								</div>
							</div>
							<!-- row -->
							<!-- row -->
							<div class="row m-auto g-2">
								<asp:Label ID="Label3" CssClass="col-lg-2 col-form-label" runat="server" Text="Vehicle Model"></asp:Label>
								<div class="col-lg-4">
								<asp:TextBox ID="gp_no" CssClass="form-control" runat="server"></asp:TextBox>
								</div>

								<asp:Label ID="Label4" CssClass="col-lg-2 col-form-label" runat="server" Text="Color"></asp:Label>
								<div class="col-lg-4">
									<asp:TextBox ID="del_date" CssClass="form-control" runat="server"></asp:TextBox>

								</div>
							</div>
							<!-- row -->

							<div class="row m-auto g-2">
								<asp:Label ID="Label10" CssClass="col-lg-2 col-form-label" runat="server" Text="Vin"></asp:Label>
								<div class="col-lg-4 ">
									<asp:TextBox ID="dms_inv" CssClass="form-control" runat="server"></asp:TextBox>

								</div>

								<asp:Label ID="Label5" CssClass="col-lg-2 col-form-label" runat="server" Text="Chassis No."></asp:Label>
								<div class="col-lg-4">
									<asp:TextBox ID="cust_name" CssClass="form-control" runat="server"></asp:TextBox>
								</div>
							</div>

							<div class="row m-auto g-2">
								<asp:Label ID="Label8" CssClass="col-lg-2 col-form-label" runat="server" Text="Dse/RM"></asp:Label>
								<div class="col-lg-4 ">
									<asp:DropDownList ID="DSE_Name"  runat="server" CssClass=" ">
									</asp:DropDownList>
								</div>

								
							</div>
							<!-- row -->
							<div class="row m-auto g-2">
								<asp:Label ID="Label9" CssClass="col-lg-2 col-form-label" runat="server" Text="Remark"></asp:Label>
								<div class="col-lg-10 ">
																	<asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>

								</div>

							
							</div>

							
						</asp:Panel>

						<!-- row -->
						<div class="row buttons mt-3">
							<div class="col-lg-12">
								<asp:Button class="bottombuttons" ID="Submit" runat="server" Text="Submit" />
							</div>
						</div>

						<div class="row m-auto g-2">
								<asp:Label ID="Label7" CssClass="col-lg-2 col-form-label" runat="server" Text="Search Stock"></asp:Label>
								<div class="col-lg-4 ">
									<asp:TextBox ID="TextBox3" CssClass="form-control" runat="server"></asp:TextBox>

								
								</div>

								<asp:Label ID="Label11" CssClass="col-lg-2 col-form-label" runat="server" Text="Ageing >="></asp:Label>
								<div class="col-lg-4">
									<asp:TextBox ID="TextBox4" CssClass="form-control" runat="server"></asp:TextBox>
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


	    <%-- LOAD DATA --%>
<script>
	$(document).ready(function () {
		$('#ContentPlaceHolder1_dms_inv').on('keypress', function (e) {
			if (e.which === 13) {
				e.preventDefault();
				var searchValue = $(this).val();
				fetch('chassis_allot.aspx/GetData2', {
					method: 'POST',
					headers: {
						'Content-Type': 'application/json; charset=utf-8'
					},
					body: JSON.stringify({ searchTerm: searchValue })
				})
					.then(function (response) {
						return response.json();
					})
					.then(function (data) {
						var suggestions = JSON.parse(data.d);
						console.log(suggestions.length);
						// parse the JSON string and extract the array of objects
						if (suggestions.length === 0) {
							// show alert message as vehicle not delivered
							Swal.fire({
								title: "No data for this invoice",
								icon: "warning",
								showConfirmButton: true
							})
								.then(function () {
									location.reload();
								});
						}
						else {
							$('#ContentPlaceHolder1_gp_no').val(suggestions[0].modl_name);
							$('#ContentPlaceHolder1_gp_no').attr('readonly', 'true');
							
							$('#ContentPlaceHolder1_del_date').val(suggestions[0].Clr_No);
							$('#ContentPlaceHolder1_del_date').attr('readonly', 'true');

							$('#ContentPlaceHolder1_cust_name').val(suggestions[0].Chas_No);
							$('#ContentPlaceHolder1_cust_name').attr('readonly', 'true');
							console.log(suggestions[0].chas_No)
						}
					})
					.catch(function (error) {
						console.log(error);
					});
			}
		});
	});
</script>


	<script>
		VirtualSelect.init({
			ele: '#ContentPlaceHolder1_DSE_Name',
			showOptionsOnlyOnSearch: true
		});
	</script>

	
</asp:Content>


