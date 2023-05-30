<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AutovynModules/AUTOVYN.Master" CodeBehind="group_report.aspx.vb" Inherits="AutovynERP.group_report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<%-- local style for grid --%>
	<link rel="stylesheet" href="../../CSS/Gridview.css" />
	<%-- local style --%>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="../../JS/ListSelect/virtual-select.min.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

	<script type="text/javascript" src="../../JS/ListSelect/virtual-select.min.js"></script>

	<style>
	    * {
	        margin: 0;
	        padding: 0;
	        box-sizing: border-box;
	        scrollbar-width: thin;
	        scrollbar-color: #397524 #DFE9EB;
	    }

	        /* Chrome, Edge and Safari */
	        *::-webkit-scrollbar {
	            width: 7px;
	            width: 7px;
	        }

	        *::-webkit-scrollbar-track {
	            border-radius: 5px;
	            background-color: aliceblue;
	        }

	            *::-webkit-scrollbar-track:hover {
	                background-color: #B8C0C2;
	            }

	            *::-webkit-scrollbar-track:active {
	                background-color: #B8C0C2;
	            }

	        *::-webkit-scrollbar-thumb {
	            border-radius: 5px;
	            background-color: #397524;
	        }

	            *::-webkit-scrollbar-thumb:hover {
	                background-color: #62A34B;
	            }

	            *::-webkit-scrollbar-thumb:active {
	                background-color: #62A34B;
	            }

	    .main-section {
	        margin-top: 60px;
	        margin-bottom: 60px;
	    }


	    .navbar {
	    }

	    .date-section {
	        background-color: gainsboro;
	    }

	    .date {
	        font-size: 20px;
	        font-weight: 700;
	    }

	    .view {
	        background-color: green;
	        border: none;
	        padding: 8px 28px;
	        color: #ffffff;
	    }

	    .tabs-lbl {
	        background-color: cornflowerblue;
	        margin: 6px 10px;
	        height: 37px;
	        border-radius: 6px;
	        color: #fff;
	    }

	    .status-section {
	        /*  background-color: aliceblue;*/
	        margin: 20px 10px;
	        /*    border-radius:10px;
            -webkit-box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
            -moz-box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
            box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);*/
	    }

	    .sub-head {
	        padding: 7px 0;
	        -webkit-box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
	        -moz-box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
	        box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
	    }

	    .status {
	        font-size: 18px;
	        font-weight: 700;
	    }

	    .sub-head {
	        padding: 7px 0;
	        -webkit-box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
	        -moz-box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
	        box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
	    }

	    .loc-sub-head {
	        padding: 7px 0;
	        display: flex;
	        justify-content: space-around;
	    }


	    .status {
	        font-size: 18px;
	        font-weight: 700;
	    }

	    .lbl {
	        font-size: 20px;
	        font-weight: bold;
	        text-transform: uppercase;
	        color: green;
	    }

	    .loc-box {
	        height: 130px;
	        width: 100%;
	        -webkit-box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
	        -moz-box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
	        box-shadow: -2px 6px 15px -11px rgb(0 0 0 / 75%);
	        border-radius: 6px;
	        text-align: center;
	        margin-right: 0px;
	        font-size: 18px;
	        font-weight: 700;
	    }

	    .total {
	        background-color: #a7e2cb;
	        height: 59px;
	        border-radius: 6px 6px 40px 40px;
	        padding-top: 16px;
	        color: #000000;
	        font-size: 12px;
	        font-weight: 700;
	    }

	    .panel {
	        width: 16%;
	    }

	    .report-grid {
	        height: 60vh;
	    }

	    @media screen and (max-width: 827px) {
	        .panel {
	            width: 30%;
	        }
	    }

	    @media screen and (max-width: 768px) {
	        .panel {
	            width: 30%;
	        }
	    }

	    @media screen and (max-width: 480px) {
	        .loc-box {
	            height: 130px;
	            width: 100%;
	        }

	        .panel {
	            width: 48%;
	        }

	        .view {
	            width: 100%;
	            margin-top: 10px;
	        }
	    }

	    #Volume_Label {
	        font-size: 20px;
	        font-weight: bold;
	    }



	    #ContentPlaceHolder1_Chart1 {
	        height: 398px !important;
	        width: 854px !important;
	        border-width: 0px;
	    }


	    .popup {
	        display: none; /*
            position: absolute;*/
	        width: 96%;
	        height: 100%;
	        /*
            transform: translate(-50%, -50%);
            z-index: 999;*/
	        background-color: #e9e9e9;
	        padding: 20px;
	        border: 1px solid #ccc;
	        margin-left: 2%;
	        margin-top: -10px;
	        /*margin-top: -46%;*/
	    }

	    .chart {
	    }

	   

	    #chart {
	    }

	    .vscomp-dropbox {
	        width: 117% !important;
	    }

	    .pop-comp-wrapper {
	        max-width: 200px !important;
	        width: 117% !important;
	    }
	</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="container-fluid main-section">
		<%-- Status Section --%>
		<div class="row status-section">
			<div class="col-12">
				<div class="col-3 mt-1">
					<asp:Label ID="Label4" runat="server" Text="GROUP LEVEL STATUS" CssClass="status"></asp:Label>
				</div>
				<div class="row sub-head">


					<asp:Label ID="Label5" CssClass="col-sm-1 col-form-label" runat="server" Text="Branch"></asp:Label>
					<div class="col-sm-2">
						<asp:DropDownList ID="branch_list" CssClass="form-control" runat="server">
						</asp:DropDownList>
					</div>

					<asp:Label ID="Label2" CssClass="col-sm-1 col-form-label" runat="server" Text="Date From"></asp:Label>
					<div class="col-sm-1" style="width: 138px;">
						<asp:TextBox ID="Year_From" CssClass="form-control" placeholder="MM/DD/YYYY" onchange="compareDates()" runat="server" ></asp:TextBox>
					</div>

					<asp:Label ID="Label1" CssClass="col-sm-1 col-form-label" runat="server" Text="Date To"></asp:Label>
					<div class="col-sm-1" style="width: 138px;">
						<asp:TextBox ID="Year_To" CssClass="form-control" placeholder="MM/DD/YYYY" onchange="compareDates()" runat="server" ></asp:TextBox>
					</div>

					<asp:Label ID="Label3" CssClass="col-sm-1 col-form-label" runat="server" Text="Group"></asp:Label>
					<div class="col-sm-2">
						<asp:DropDownList ID="grp_name" Class="resetting" selectionmode="multiple" data-silent-initial-value-set="true" name="native-select" data-search="true" runat="server">
						</asp:DropDownList>
					</div>

					<div class="col-sm-1">
						<asp:Button ID="Load_Location" Text="Load" runat="server" OnClientClick="return validateDropDown();" CssClass="btn view" />
					</div>

				</div>

				<asp:Panel ID="Amount_Panel" Class="box_panel" runat="server">
					<div style="text-align: right;">
						<asp:Label ID="Label6" CssClass="lbl" runat="server" Text="Graph"></asp:Label>
						<button type="button" class="btn grp_show"><i class="fa fa-bar-chart"></i></button>
					</div>
					<asp:Label ID="Volume_lbl" CssClass="lbl" runat="server" Text=""></asp:Label>
					<asp:GridView ID="Amount_Grid" runat="server" CssClass="vyn-grid" ShowHeaderWhenEmpty="True" RowStyle-CssClass="my-class" CellSpacing="1" CellPadding="3" GridLines="None" BackColor="White" PagerStyle-CssClass="myPagerStyle">
						<AlternatingRowStyle CssClass="dotted-line" />
						<HeaderStyle CssClass="vyn-grid-header" />
						<RowStyle CssClass="vyn-grid-row" />
						<SelectedRowStyle CssClass="selected-row" />
						<PagerSettings FirstPageText="1" LastPageText="last" NextPageText="next" PreviousPageText="previous" />
						<PagerStyle CssClass="pager-style" />
					</asp:GridView>


				</asp:Panel>


			</div>
			<div class='popup'>
				<h5 align="center">Ledger Outstanding Graph
					<label class="br_name"></label>
				</h5>
				<div id="chart" class="chart">
				</div>
				<button id="closePopupBtn" class="btn" style="background-color: #e55a5a; font-weight: bolder;">CLOSE</button>
			</div>

		</div>

	</div>



	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/inputmask/inputmask.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/inputmask/inputmask.date.extensions.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/inputmask/inputmask.extensions.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/css/inputmask.css" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />

	<script>
        $(function () {
				   var inputmask = new Inputmask("99/99/9999", { placeholder: 'dd/mm/yyyy' });
				   inputmask.mask($('[id*=DateLabel]'));
			   });
	</script>

	<script type="text/javascript">
        function validateDropDown() {
            var year_from = document.getElementById("ContentPlaceHolder1_Year_From").value;
            var year_to = document.getElementById("ContentPlaceHolder1_Year_To").value;


            if (year_from == '' || year_to == '') {
                Swal.fire({
                    icon: 'warning',
                    title: 'Please Enter Year',
                });
                return false;
            }
            if (year_from.length < 4 || year_to.length < 4) {
                Swal.fire({
                    icon: 'warning',
                    title: 'Please Enter Valid Year',
                });
                return false;
            }
        }
    </script>

	<script>
        VirtualSelect.init({
				   ele: '#ContentPlaceHolder1_grp_name',
				   showOptionsOnlyOnSearch: true
			   });
	</script>

	   <script>
           var inputElement = document.getElementById("ContentPlaceHolder1_Year_From");
           inputElement.addEventListener("keydown", restrictInput);
           inputElement.addEventListener("input", restrictInput);
           inputElement.addEventListener("touchstart", restrictInput);
           inputElement.addEventListener("touchend", restrictInput);

           var inputElement1 = document.getElementById("ContentPlaceHolder1_Year_To");
           inputElement1.addEventListener("keydown", restrictInput);
           inputElement1.addEventListener("input", restrictInput);
           inputElement1.addEventListener("touchstart", restrictInput);
           inputElement1.addEventListener("touchend", restrictInput);

           function restrictInput(event) {

               var inputElement = event.target;
               var inputValue = inputElement.value;

               // Remove non-numeric characters from the input value
               inputValue = inputValue.replace(/\D/g, "");
               if (inputValue.length > 0) {
                   event.preventDefault();
               }
               // Update the input value with the cleaned numeric value
               inputElement.value = inputValue;
           }
       </script>

<script>

        $(".grp_show").click(function () {

				   $('.box_panel').css("display", "none");

				   var frm_year = $('#ContentPlaceHolder1_Year_From').val();
				   var to_year = $('#ContentPlaceHolder1_Year_To').val();
				   var type_sts = $('#ContentPlaceHolder1_branch_list').val();
				   var grp_name = $('#ContentPlaceHolder1_grp_name').val();

				   $.ajax({
					   type: "POST",
					   url: "group_report.aspx/GetChartData",
					   data: "{grp_name: '" + grp_name + "',frm_year: '" + frm_year + "',to_year: '" + to_year + "',type_sts: '" + type_sts + "'}",
					   contentType: "application/json; charset=utf-8",
					   dataType: "json",
					   success: function (response) {
						   // Parse the JSON string to a JavaScript object
						   var data = JSON.parse(response.d);

						   var seriesData = [];
						   var seriesData3 = [];

						   for (var i = 0; i < data.length; i++) {
							   seriesData.push(data[i].Cl_Bal);
						   }

						   for (var i = 0; i < data.length; i++) {
							   seriesData3.push(data[i].Ledg_Name);
						   }


						   // Update the options object with the series data

						   var options = {
							   chart: {
								   height: 280,
								   type: 'area',
							   },
							   dataLabels: {
								   enabled: false
							   },
							   series: [{
								   name: 'CI Bal.',
								   data: seriesData
							   }],
							   xaxis: {
								   title: {
									   text: 'Ledg Name'
								   },
								   categories: seriesData3
							   },
							   yaxis: {
								   title: {
									   text: 'CI Bal.'
								   }
							   }
						   };


						   var chart = new ApexCharts(document.querySelector("#chart"), options);


						   /* $('.br_name').text(br_name + ': ' + frm_year + '-' + to_year);*/
						   chart.render();
						   chart.updateSeries([{ data: seriesData }]);

					   },
					   error: function (xhr, ajaxOptions, thrownError) {
						   // Handle the error
						   console.log(xhr.status + ': ' + thrownError);
					   }
				   });

				   var popup = $('.popup');
				   $("body").append(popup);
				   popup.show();


			   });

	</script>

	<script>
        // Get the close button element
			   var closePopupBtn = document.getElementById("closePopupBtn");

			   // Get the popup element
			   var popup = document.querySelector('.popup');
			   var Amount_Panel = document.querySelector('.box_panel');

			   closePopupBtn.addEventListener("click", function () {
				   // Hide the popup
				   popup.style.display = "none";
				   Amount_Panel.style.display = "block";
			   });
	</script>

	<script>  
        $(function () {

				   $('#ContentPlaceHolder1_Year_From').datepicker(
					   {
						   changeMonth: true,
						   changeYear: true,
						   yearRange: '1950:2100'
					   });
			   });

			   $(function () {

				   $('#ContentPlaceHolder1_Year_To').datepicker(
					   {
						   changeMonth: true,
						   changeYear: true,
						   yearRange: '1950:2100'
					   });
			   });
	</script>

	<script>
        function compareDates() {
				   const fromDate = new Date(document.getElementById("ContentPlaceHolder1_Year_From").value);
				   const toDate = new Date(document.getElementById("ContentPlaceHolder1_Year_To").value);

				   if (toDate < fromDate) {
					   alert("To date must be greater than from date.");
					   document.getElementById("ContentPlaceHolder1_Year_To").value = "";
				   }
			   }
	</script>

	<%--    <script>
        function updateToDateMin() {
            const fromDate = new Date(document.getElementById("ContentPlaceHolder1_Year_From").value);
            const toDateInput = document.getElementById("ContentPlaceHolder1_Year_To");
            toDateInput.min = fromDate.toISOString().split('T')[0];

            if (toDateInput.value < toDateInput.min) {
                toDateInput.value = toDateInput.min;
            }
        }
    </script>--%>

	<%--    <script>

        $(function () {
            var from = $("#ContentPlaceHolder1_Year_From").val();
            var to = $("#ContentPlaceHolder1_Year_To").val();

            if (Date.parse(from) > Date.parse(to)) {
                alert("Invalid Date Range");
            }
        });
    </script>--%>
</asp:Content>


