<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AutovynModules/AUTOVYN.Master"  CodeBehind="Dealer_setup.aspx.vb" Inherits="AutovynERP.Dealer_setup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<%-- Jquery and bootstrap Alert --%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<%-- Jquery and bootstrap Alert --%>

	<%-- Sweet Alert --%>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<%-- Sweet Alert --%>

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

	<%-- Apex charts --%>
	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
	<%-- Apex charts --%>

	<%-- virtual select link --%>
	<script type="text/javascript" src="../../JS/ListSelect/virtual-select.min.js"></script>
	<link rel="stylesheet" href="../../JS/ListSelect/virtual-select.min.css" />
	<%-- virtual select link --%>

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

  .check_box input{
	  margin: 7px !important;
  }
  .red_req{
	  color:red;
  }

	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="container-fluid main-section">
		<%-- section 2 --%>
		<div class="row">
			<div class="col-md-12">
				<div class="section-second ">
					<!-- row -->
					<div class="container-fluid">
						<%-- section 1 --%>
						<div class="row ">
							<div class="title">
								<span>New Dealer Setup</span>
							</div>
						</div>
						<div class="row">
							<div class="col-12 m-auto">
								<!-- row -->

								<asp:Panel ID="Main_Panel" runat="server">
									<div class="row m-auto g-2">
										<asp:Label ID="Label4" CssClass="col-lg-3 col-form-label" runat="server" Text="">Dealer id<label class="red_req">*</label></asp:Label>
										<div class="col-lg-3">
											<asp:TextBox ID="dealer_id" CssClass="form-control" runat="server"></asp:TextBox>
										</div>

									</div>
									<div class="row m-auto g-2">
										<asp:Label ID="Label19" CssClass="col-lg-3 col-form-label" runat="server" Text="">Creator Name<label class="red_req">*</label></asp:Label>
										<div class="col-lg-3">
											<asp:TextBox ID="user_Name" CssClass="form-control" runat="server"></asp:TextBox>
										</div>

										<asp:Label ID="Label1" CssClass="col-lg-3 col-form-label" runat="server" Text="">Email</asp:Label>
										<div class="col-lg-3">
											<asp:TextBox ID="email" CssClass="form-control" runat="server"></asp:TextBox>
										</div>

									</div>

									

									<div class="row m-auto g-2">
										<asp:Label ID="Label2" CssClass="col-lg-3 col-form-label" runat="server" Text="">Mobile<label class="red_req">*</label></asp:Label>
										<div class="col-lg-3">
											<asp:TextBox ID="user_mobile" CssClass="form-control" runat="server"></asp:TextBox>
										</div>

										<asp:Label ID="Label3" CssClass="col-lg-3 col-form-label" runat="server" Text="">Password<label class="red_req">*</label></asp:Label>
										<div class="col-lg-3">
											<asp:TextBox ID="user_id" CssClass="form-control pass" runat="server"></asp:TextBox>
										</div>
									</div>
									
									<!-- row -->
						<div class="row buttons mt-3">
							<div class="col-lg-12">
								<asp:Button class="bottombuttons" ID="execute" OnClientClick="return validateDropDown();" runat="server" Text="Run Setup" />
								<asp:Button class="bottombuttons" ID="drop" OnClientClick="return validateDropDown();" runat="server" Text="Drop Setup" />

							</div>
						</div>
									
								</asp:Panel>


							</div>
						</div>
						<!-- row -->
					</div>
				</div>
			</div>
		
		</div>
	</div>

<%-- For input Validation  --%>
    <script type="text/javascript">
		function validateDropDown() {
			var custname = document.getElementById('ContentPlaceHolder1_dealer_id');
			var email = document.getElementById('ContentPlaceHolder1_user_Name');
			var address = document.getElementById('ContentPlaceHolder1_user_id');
			var location = document.getElementById('ContentPlaceHolder1_user_mobile');

			if (custname.value.length < 4) {
				Swal.fire({
					icon: 'warning',
					title: 'Please Enter a valid dealer id',
					text: '',
				}).then(function () {
					custname.focus();
				});
				return false;
			}
			if (email.value.length <3) {
				Swal.fire({
					icon: 'warning',
					title: 'Please Enter valid username',
					text: '',
				}).then(function () {
					custname.focus();
				});
				return false;
			}

			if (address.value.length <1) {
				Swal.fire({
					icon: 'warning',
					title: 'Please enter the password',
					text: '',
				}).then(function () {
					custname.focus();
				});
				return false;
			}

			if (location.value.length < 3) {
				Swal.fire({
					icon: 'warning',
					title: 'Please enter the moblie',
				});
				return false;
			}
			

			return true;
		}
	</script>
    <%-- For input Validation  --%>
</asp:Content>


