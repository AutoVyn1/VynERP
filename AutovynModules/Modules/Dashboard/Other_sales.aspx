<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AutovynModules/AUTOVYN.Master" CodeBehind="Other_sales.aspx.vb"  Inherits="AutovynERP.Other_sales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<%-- Local style --%>
	<link rel="stylesheet" href="../../CSS/Dashboard.css" />
	<%-- Local style --%>

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


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid main-section">
        <%-- Status Section --%>
        <div class="row status-section">
            <div class="col-12">
         <div class="row sub-head">
                  
                    <%--  <asp:Label ID="Label5" CssClass="col-sm-1 col-form-label" runat="server" Text="Branch"></asp:Label>
                  <div class="col-sm-2">
                        <asp:DropDownList ID="branch_list" CssClass="form-control" runat="server">
                        </asp:DropDownList>
                    </div>--%>

                    <asp:Label ID="Label2" CssClass="col-sm-1 col-form-label" runat="server" Text="Date From"></asp:Label>
                    <div class="col-sm-1" style="width:138px;">
                        <asp:TextBox ID="Year_From" CssClass="form-control" runat="server" onchange="compareDates()" placeholder="YYYY"></asp:TextBox>
                    </div>

                    <asp:Label ID="Label1" CssClass="col-sm-1 col-form-label" runat="server" Text="Date To"></asp:Label>
                    <div class="col-sm-1" style="width:138px;">
                        <asp:TextBox ID="Year_To" CssClass="form-control" runat="server" onchange="compareDates()" placeholder="YYYY"></asp:TextBox>
                    </div>

                   <asp:Label ID="Label3" CssClass="col-sm-1 col-form-label" runat="server" Text="Group"></asp:Label>
                    <div class="col-sm-2">
                        <asp:DropDownList ID="grp_name" CssClass="form-control" runat="server">
                           <asp:ListItem Value="">--Select type--</asp:ListItem>
                           <asp:ListItem Value="add_disc">EW Dashboard</asp:ListItem>
                           <asp:ListItem Value="cons_disc">MGA Dashboard</asp:ListItem>
                           <asp:ListItem Value="Exch_disc">CCP Dashboard</asp:ListItem>
                           <asp:ListItem Value="Corp_disc">VEHICLE DEL. Dashboard</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="col-sm-1">
                        <%--<asp:Button ID="Load_Location" Text="Load" runat="server" CssClass="btn view" />--%>
                        <label id="Load_Location" class="get_data"> Get Data</label>
                        <a  ></a>

                    </div>

                </div>
                <div class="mainloc_name" style="text-align:center; display:none; margin-top:3px;">
                    <h3 class="selectloc_name">Multi-Location Chart</h3>
                </div>
                

      <%--          <div class="progress" style="display:none;">
  <div class="color"></div>
</div>--%>
                <div class="center" style="display:none;">
  <div class="wave"></div>
  <div class="wave"></div>
  <div class="wave"></div>
  <div class="wave"></div>
  <div class="wave"></div>
  <div class="wave"></div>
  <div class="wave"></div>
  <div class="wave"></div>
  <div class="wave"></div>
  <div class="wave"></div>
</div>

        
    <div id="wrapper" class="blur_effect" style="display:none;">
      <div class="content-area">
        <div class="container-fluid">
        
          <div class="main">
            <div class="row sparkboxes mt-4 mb-4">
                 <div class="col-md-4">
                <div class="box box3">
                  <div id="spark3"></div>
                </div>
              </div>
              <div class="col-md-4">
                <div class="box box1">
                  <div id="spark1"></div>
                </div>
              </div>
              <div class="col-md-4">
                <div class="box box2">
                  <div id="spark2"></div>
                </div>
              </div>
             
            </div>

            <div class="row mt-5 mb-4">
                <div class="col-md-7">
                <div class="box">
                  <div id="area"></div>
                </div>
              </div>
             
              <div class="col-md-5">
                <div class="box">
                  <div id="donut"></div>
                </div>
              </div>
            </div>

            <div class="row mt-4 mb-4">
                 <div class="col-md-12">
                <div class="box">
                  <div id="bar"></div>
                </div>
              </div>
              <%--<div class="col-md-4">
                <div class="box">
                  <div id="line"></div>
                </div>
              </div>--%>
            </div>
          </div>
        </div>
      </div>
    </div>

 

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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>

    <script>
        $(function () {
            var inputmask = new Inputmask("99/99/9999", { placeholder: 'dd/mm/yyyy' });
            inputmask.mask($('[id*=DateLabel]'));
        });
    </script>

      

        	<script>
                function restrictInput(event) {
                    var charCode = (event.which) ? event.which : event.keyCode;
                    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                        event.preventDefault();
                    }
                    var value = document.getElementById("ContentPlaceHolder1_Year_From").value;

                    if (value.length >= 4) {
                        event.preventDefault();
                    }
                   
                }
                function restrictInput1(event) {
                    var charCode = (event.which) ? event.which : event.keyCode;
                    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                        event.preventDefault();
                    }
                    var value2 = document.getElementById("ContentPlaceHolder1_Year_To").value;

                    if (value2.length >= 4) {
                        event.preventDefault();
                    }
                }

                var Year_From = document.getElementById("ContentPlaceHolder1_Year_From");
                var Year_to = document.getElementById("ContentPlaceHolder1_Year_To");

                if (Year_From.addEventListener) {
                    Year_From.addEventListener("keypress", restrictInput);
                } else if (Year_From.attachEvent) {
                    Year_From.attachEvent("onkeypress", restrictInput);
                }

                if (Year_to.addEventListener) {
                    Year_to.addEventListener("keypress", restrictInput1);
                } else if (Year_to.attachEvent) {
                    Year_to.attachEvent("onkeypress", restrictInput1);
                }
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


         <script>

             function disableScroll() {
                 // Get the current page scroll position
                 scrollTop =
                     window.pageYOffset || document.documentElement.scrollTop;
                 scrollLeft =
                     window.pageXOffset || document.documentElement.scrollLeft,

                     // if any scroll is attempted,
                     // set this to the previous value
                     window.onscroll = function () {
                         window.scrollTo(scrollLeft, scrollTop);
                     };
             }

             function enableScroll() {
                 window.onscroll = function () { };
             }

             $("#Load_Location").click(function () {

                 var frm_year = $('#ContentPlaceHolder1_Year_From').val();
                 var to_year = $('#ContentPlaceHolder1_Year_To').val();
                 var grp_name = $('#ContentPlaceHolder1_grp_name').val();



                 $.ajax({
                     type: "POST",
                     url: "Other_sales.aspx/GetChartData",
                     data: "{grp_name: '" + grp_name + "',frm_year: '" + frm_year + "',to_year: '" + to_year + "'}",
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     beforeSend: function () {
                         $('.center').show();
                         $('.blur_effect').css("filter", "blur(4px)");
                         disableScroll()
                         /*$('body').css("overflow", "hidden");*/
                     },
                     complete: function () {
                         $('.center').hide();
                         /*$('.mainloc_name').show();*/
                         $('.blur_effect').css("filter", "");
                         enableScroll()
                         /*$('body').css("overflow", "");*/

                     },
                     success: function (response) {
                         // Parse the JSON string to a JavaScript object
                         var data = JSON.parse(response.d);

                       

                         var chart1Data = data.DataTable1;
                         var chart2Data = data.DataTable2;
                         var chart3Data = data.DataTable3;
                         var chart4Data = data.DataTable4;
                         var chart5Data = data.DataTable5;
                         var chart7Data = data.DataTable7;
                         
                         var total1 = 0;
                         for (var i = 0; i < chart1Data.length; i++) {
                             total1 += chart1Data[i].discount;
                         }

                         var total2 = 0;
                         for (var i = 0; i < chart2Data.length; i++) {
                             total2 += chart2Data[i].discount;
                         }

                         var total3 = 0;
                         for (var i = 0; i < chart3Data.length; i++) {
                             total3 += chart3Data[i].discount;
                         }

                         var spark3 = {
                             series: [{
                                 name: 'Cl Bal.',
                                 data: chart1Data.map(function (row) { return row.discount; }),
                             }],
                             labels: chart1Data.map(function (row) { return row.year; }),
                             chart: {
                                 type: 'bar',
                                 height: 180
                             },
                             plotOptions: {
                                 bar: {
                                     colors: {
                                         ranges: [{
                                             from: -1,
                                             to: -1000000000000000,
                                             color: '#F15B46'
                                         }, {
                                             from: -1000000000000000,
                                             to: 0,
                                             color: '#F15B46'
                                         }]
                                     },
                                     columnWidth: '40%',
                                 }
                             },
                             dataLabels: {
                                 enabled: false,
                             },
                             yaxis: {
                                 title: {
                                     text: 'Yearly',
                                     align: 'left',
                                     margin: 10,
                                     offsetX: 0,
                                     offsetY: 0,
                                     floating: false,
                                     style: {
                                         fontSize: '12px',
                                         fontWeight: 'bold',
                                         fontFamily: 'Roboto',
                                         color: '#263238'
                                     },
                                 }
                                 
                             },
                          
                             xaxis: {
                                 type: chart1Data.map(function (row) { return row.year; }),
                                 labels: {
                                     rotate: -90
                                 }
                             },
                             tooltip: {
                                 y: {
                                     formatter: function (val) {
                                         return val
                                     }
                                 }
                             }
                         };

                         var spark1 = {
                             series: [{
                                 name: 'Cl Bal.',
                                 data: chart2Data.map(function (row) { return row.discount; }),
                             }],
                             labels: chart2Data.map(function (row) { return row.Month; }),
                             chart: {
                                 type: 'bar',
                                 height: 180,
                                 events: {
                                     dataPointSelection: function (event, chartContext, config) {

                                         var ee = config.dataPointIndex;
                                         var xValue = config.w.config.xaxis.type[ee];

                                         myFunction_day(xValue);

                                     }
                                 }
                             },
                             plotOptions: {
                                 bar: {
                                     colors: {
                                         ranges: [{
                                             from: -1,
                                             to: -1000000000000000,
                                             color: '#F15B46'
                                         }, {
                                             from: -1000000000000000,
                                             to: 0,
                                             color: '#F15B46'
                                         }]
                                     },
                                     columnWidth: '60%',
                                 }
                             },
                             dataLabels: {
                                 enabled: false,
                             },
                             yaxis: {

                                 title: {
                                     text: 'Monthly',
                                     align: 'left',
                                     margin: 10,
                                     offsetX: 0,
                                     offsetY: 0,
                                     floating: false,
                                     style: {
                                         fontSize: '12px',
                                         fontWeight: 'bold',
                                         fontFamily: 'Roboto',
                                         color: '#263238'
                                     },
                                 },
                              
                             },
                             xaxis: {
                                 type: chart2Data.map(function (row) { return row.Month; }),
                                 labels: {
                                     rotate: -90
                                 }
                             },
                             tooltip: {
                                 y: {
                                     formatter: function (val) {
                                         return val 
                                     }
                                 }
                             }
                         };

                         var spark2 = {
                             series: [{
                                 name: 'Cl Bal.',
                                 data: chart3Data.map(function (row) { return row.discount; }),
                             }],
                             labels: chart3Data.map(function (row) { return row.Quarter; }),
                             chart: {
                                 type: 'bar',
                                 height: 180,
                                 events: {
                                     dataPointSelection: function (event, chartContext, config) {
                                        
                                         var ee = config.dataPointIndex;
                                         var xValue = config.w.config.xaxis.type[ee];

                                         myFunction(xValue);

                                     }
                                 }
                             },
                             plotOptions: {
                                 bar: {
                                     colors: {
                                         ranges: [{
                                             from: -1,
                                             to: -1000000000000000,
                                             color: '#F15B46'
                                         }, {
                                             from: -1000000000000000,
                                             to: 0,
                                             color: '#F15B46'
                                         }]
                                     },
                                     columnWidth: '50%',
                                 }
                             },
                             dataLabels: {
                                 enabled: false,
                             },
                             yaxis: {
                                 title: {
                                     text: 'Quarterly',
                                     align: 'left',
                                     margin: 10,
                                     offsetX: 0,
                                     offsetY: 0,
                                     floating: false,
                                     style: {
                                         fontSize: '12px',
                                         fontWeight: 'bold',
                                         fontFamily: 'Roboto',
                                         color: '#263238'
                                     },
                                 },
                                 
                             },
                             xaxis: {
                                 type: chart3Data.map(function (row) { return row.Quarter; }),
                                 labels: {
                                     rotate: -90
                                 }
                             },
                             tooltip: {
                                 y: {
                                     formatter: function (val) {
                                         return val 
                                     }
                                 }
                             }
                         };

                         var optionsArea = {
                             series: [{
                                 name: 'Cl Bal.',
                                 data: chart4Data.map(function (row) { return row.discount; }),
                             }],
                             labels: chart4Data.map(function (row) { return row.day; }),
                             chart: {
                                 type: 'area',
                                 height: 315
                             },
                             dataLabels: {
                                 enabled: false
                             },
                             stroke: {
                                 curve: 'straight'
                             },

                             title: {
                                 text: 'April Chart',
                                 align: 'left',
                                 style: {
                                     fontSize: '14px'
                                 }
                             },
                             xaxis: {
                                 type: chart4Data.map(function (row) { return row.day; }),
                                 axisBorder: {
                                     show: false
                                 },
                                 axisTicks: {
                                     show: false
                                 }
                             },
                             yaxis: {
                                 tickAmount: 4,
                                 floating: false,

                                 labels: {
                                     style: {
                                         colors: '#8e8da4',
                                     },
                                     offsetY: -7,
                                     offsetX: 0,
                                 },
                                 axisBorder: {
                                     show: false,
                                 },
                                 axisTicks: {
                                     show: false
                                 }
                             },
                             fill: {
                                 opacity: 0.5
                             },
                             tooltip: {
                                 y: {
                                     formatter: function (val) {
                                         return val 
                                     }
                                 }
                             },
                             grid: {
                                 yaxis: {
                                     lines: {
                                         offsetX: -30
                                     }
                                 },
                                 padding: {
                                     left: 20
                                 }
                             }
                         };

                         var optionDonut = {
                             series: chart5Data.map(function (row) { return row.discount; }),

                             chart: {
                                 width: 580,
                                 type: 'pie',
                                 height: 323,
                                 events: {
                                     dataPointSelection: function (event, chartContext, config) {

                                         var ee = config.dataPointIndex;
                                         var xValue = config.w.config.labels[ee];
                                         myFunction_branch(xValue);

                                     }
                                 }
                             },
                             labels: chart5Data.map(function (row) { return row.loc_name; }),
                             responsive: [{
                                 breakpoint: 480,
                                 options: {
                                     chart: {
                                         width: 100
                                     },
                                     legend: {
                                         position: 'bottom'
                                     }
                                 }
                             }]
                            
                         }

                         var comparision_bar = {
                             series: [{
                                 name: 'Current Year',
                                 data: chart2Data.map(function (row) { return row.discount; }),
                             }, {
                                 name: 'Previous Year',
                                 data: chart7Data.map(function (row) { return row.discount; }),
                             }],
                             chart: {
                                 type: 'bar',
                                 height: 350
                             },
                             plotOptions: {
                                 bar: {
                                     horizontal: false,
                                     columnWidth: '55%',
                                     endingShape: 'rounded'
                                 },
                             },
                             dataLabels: {
                                 enabled: false
                             },
                             stroke: {
                                 show: true,
                                 width: 2,
                                 colors: ['transparent']
                             },
                             xaxis: {
                                 categories: chart2Data.map(function (row) { return row.Month; }),
                             },
                             yaxis: {
                                 title: {
                                     text: 'Comparision Chart'
                                 }
                             },
                             fill: {
                                 opacity: 1
                             },
                             tooltip: {
                                 y: {
                                     formatter: function (val) {
                                         return  val 
                                     }
                                 }
                             }
                         };

                         $('#wrapper').show();
                         $('.mainloc_name').show();
                         $('.selectloc_name').text('Multi-Location Chart');

                         var chart1 = new ApexCharts(document.querySelector("#spark3"), spark3);
                         var chart2 =new ApexCharts(document.querySelector("#spark1"), spark1);
                         var chart3 =new ApexCharts(document.querySelector("#spark2"), spark2);
                         var chart4 =new ApexCharts(document.querySelector("#area"), optionsArea);
                         var chart5 = new ApexCharts(document.querySelector("#donut"), optionDonut);
                         var chart6 = new ApexCharts(document.querySelector("#bar"), comparision_bar);

                         /*$('.selectloc_name').text('Multi-Location Chart');*/

                         chart1.render();
                         chart2.render();
                         chart3.render();
                         chart4.render();
                         chart5.render();
                         chart6.render();

                         var far = chart5Data.map(function (row) { return row.discount; });
                         

                         chart1.updateSeries([{ data: chart1Data.map(function (row) { return row.discount; }) }]);
                         chart2.updateSeries([{ data: chart2Data.map(function (row) { return row.discount; }) }]);
                         chart3.updateSeries([{ data: chart3Data.map(function (row) { return row.discount; }) }]);
                         chart4.updateSeries([{ data: chart4Data.map(function (row) { return row.discount; }) }]);
                         chart5.updateSeries(far);
                         chart6.updateSeries([{ data: chart2Data.map(function (row) { return row.discount; }) }, { data: chart7Data.map(function (row) { return row.discount; }) }]);
                         //chart6.updateSeries([{ data: chart7Data.map(function (row) { return row.discount; }) }]);
                        

                         
                         
                     },
                     error: function (xhr, ajaxOptions, thrownError) {
                         // Handle the error
                         console.log(xhr.status + ': ' + thrownError);
                     }
                 });

             });

             function myFunction(xValue) {
                 var frm_year = $('#ContentPlaceHolder1_Year_From').val();
                 var to_year = $('#ContentPlaceHolder1_Year_To').val();
                 var grp_name = $('#ContentPlaceHolder1_grp_name').val();

                 $.ajax({
                     type: "POST",
                     url: "Other_sales.aspx/GetChartData2",
                     data: "{grp_name: '" + grp_name + "',frm_year: '" + frm_year + "',to_year: '" + to_year + "', xValue:'" + xValue +"'}",
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     success: function (response) {
                         // Parse the JSON string to a JavaScript object
                         var data = JSON.parse(response.d);
                         var quarter = "";
                         var da = [];
                         if (xValue == "Q 1") {
                             quarter += "First Quarter"
                             da.push('April', 'May', 'June')
                         }
                         else if (xValue == "Q 2") {
                             quarter += "Second Quarter";
                             da.push('July', 'August', 'September')
                         }
                         else if (xValue == "Q 3") {
                             quarter += "Third Quarter"
                             da.push('October', 'November', 'December')
                         }
                         else if (xValue == "Q 4") {
                             quarter += "Fourth Quarter"
                             da.push('January', 'Feburary', 'March')
                         }
                         console.log(da);
                         var chart1Data = data.DataTable1;

                         var optionsArea = {
                             series: [{
                                 name: 'Cl Bal.',
                                 data: chart1Data.map(function (row) { return row.discount; }),
                             }],
                             labels: chart1Data.map(function (row) { return row.Month; }),
                             chart: {
                                 type: 'area',
                                 height: 315
                             },
                             dataLabels: {
                                 enabled: false
                             },
                             stroke: {
                                 curve: 'straight'
                             },

                             title: {
                                 text: '' + quarter+'',
                                 align: 'left',
                                 style: {
                                     fontSize: '14px'
                                 }
                             },
                             xaxis: {
                                 type: da,
                                 axisBorder: {
                                     show: false
                                 },
                                 axisTicks: {
                                     show: false
                                 }
                             },
                             yaxis: {
                                 tickAmount: 4,
                                 floating: false,

                                 labels: {
                                     style: {
                                         colors: '#8e8da4',
                                     },
                                     offsetY: -7,
                                     offsetX: 0,
                                 },
                                 axisBorder: {
                                     show: false,
                                 },
                                 axisTicks: {
                                     show: false
                                 }
                             },
                             fill: {
                                 opacity: 0.5
                             },
                             tooltip: {
                                 y: {
                                     formatter: function (val) {
                                         return val 
                                     }
                                 }
                             },
                             grid: {
                                 yaxis: {
                                     lines: {
                                         offsetX: -30
                                     }
                                 },
                                 padding: {
                                     left: 20
                                 }
                             }
                         };

                         var quat_chart = new ApexCharts(document.querySelector("#area"), optionsArea);

                         quat_chart.render();
                         quat_chart.updateSeries([{ data: chart1Data.map(function (row) { return row.discount; }) }]);

                     },
                     error: function (xhr, ajaxOptions, thrownError) {
                         // Handle the error
                         console.log(xhr.status + ': ' + thrownError);
                     }
                 });
             }

             function myFunction_day(xValue) {
                 var frm_year = $('#ContentPlaceHolder1_Year_From').val();
                 var to_year = $('#ContentPlaceHolder1_Year_To').val();
                 var grp_name = $('#ContentPlaceHolder1_grp_name').val();

                 $.ajax({
                     type: "POST",
                     url: "Other_sales.aspx/GetChartData_day",
                     data: "{grp_name: '" + grp_name + "',frm_year: '" + frm_year + "',to_year: '" + to_year + "', xValue:'" + xValue + "'}",
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     success: function (response) {
                         // Parse the JSON string to a JavaScript object
                         var data = JSON.parse(response.d);

                         var chart1Data = data.DataTable1;
                         var quarter = "";
                         if (xValue == "Jan") {
                             quarter += "January Chart"
                         }
                         else if (xValue == "Feb") {
                             quarter += "February Chart"
                         }
                         else if (xValue == "Mar") {
                             quarter += "March Chart"
                         }
                         else if (xValue == "Apr") {
                             quarter += "April Chart"
                         }
                         else if (xValue == "May") {
                             quarter += "May Chart"
                         }
                         else if (xValue == "Jun") {
                             quarter += "June Chart"
                         }
                         else if (xValue == "Jul") {
                             quarter += "July Chart"
                         }
                         else if (xValue == "Aug") {
                             quarter += "August Chart"
                         }
                         else if (xValue == "Sep") {
                             quarter += "September Chart"
                         }
                         else if (xValue == "Oct") {
                             quarter += "October Chart"
                         }
                         else if (xValue == "Nov") {
                             quarter += "November Chart"
                         }
                         else if (xValue == "Dec") {
                             quarter += "December Chart"
                         }
                         var optionsAr = {
                             series: [{
                                 name: 'Cl Bal.',
                                 data: chart1Data.map(function (row) { return row.discount; }),
                             }],
                             labels: chart1Data.map(function (row) { return row.day; }),
                             chart: {
                                 type: 'area',
                                 height: 315
                             },
                             dataLabels: {
                                 enabled: false
                             },
                             stroke: {
                                 curve: 'straight'
                             },

                             title: {
                                 text: '' + quarter +'',
                                 align: 'left',
                                 style: {
                                     fontSize: '14px'
                                 }
                             },
                             xaxis: {
                                 type: chart1Data.map(function (row) { return row.day; }),
                                 axisBorder: {
                                     show: false
                                 },
                                 axisTicks: {
                                     show: false
                                 }
                             },
                             yaxis: {
                                 tickAmount: 4,
                                 floating: false,

                                 labels: {
                                     style: {
                                         colors: '#8e8da4',
                                     },
                                     offsetY: -7,
                                     offsetX: 0,
                                 },
                                 axisBorder: {
                                     show: false,
                                 },
                                 axisTicks: {
                                     show: false
                                 }
                             },
                             fill: {
                                 opacity: 0.5
                             },
                             tooltip: {
                                 y: {
                                     formatter: function (val) {
                                         return val 
                                     }
                                 }
                             },
                             grid: {
                                 yaxis: {
                                     lines: {
                                         offsetX: -30
                                     }
                                 },
                                 padding: {
                                     left: 20
                                 }
                             }
                         };

                         var day_chart = new ApexCharts(document.querySelector("#area"), optionsAr);

                         day_chart.render();
                         day_chart.updateSeries([{ data: chart1Data.map(function (row) { return row.discount; }) }]);

                     },
                     error: function (xhr, ajaxOptions, thrownError) {
                         // Handle the error
                         console.log(xhr.status + ': ' + thrownError);
                     }
                 });
             }

             function myFunction_branch(xValue) {

                 var frm_year = $('#ContentPlaceHolder1_Year_From').val();
                 var to_year = $('#ContentPlaceHolder1_Year_To').val();
                 var grp_name = $('#ContentPlaceHolder1_grp_name').val();

                 $.ajax({
                     type: "POST",
                     url: "Other_sales.aspx/GetChartData_branch",
                     data: "{grp_name: '" + grp_name + "',frm_year: '" + frm_year + "',to_year: '" + to_year + "', xValue:'" + xValue + "'}",
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     beforeSend: function () {
                         $('.center').show();
                         $('.blur_effect').css("filter", "blur(4px)");
                         disableScroll()
                         /*$('body').css("overflow", "hidden");*/
                     },
                     complete: function () {
                         $('.center').hide();
                         /*$('.mainloc_name').show();*/
                         $('.blur_effect').css("filter", "");
                         enableScroll()
                         /*$('body').css("overflow", "");*/

                     },
                     success: function (response) {
                         // Parse the JSON string to a JavaScript object
                         var data = JSON.parse(response.d);



                         var chart1Data = data.DataTable1;
                         var chart2Data = data.DataTable2;
                         var chart3Data = data.DataTable3;
                         var chart4Data = data.DataTable4;
                         var chart5Data = data.DataTable5;
                         
                         var spark3 = {
                             series: [{
                                 name: 'Cl Bal.',
                                 data: chart1Data.map(function (row) { return row.discount; }),
                             }],
                             labels: chart1Data.map(function (row) { return row.year; }),
                             chart: {
                                 type: 'bar',
                                 height: 180
                             },
                             plotOptions: {
                                 bar: {
                                     colors: {
                                         ranges: [{
                                             from: -1,
                                             to: -1000000000000000,
                                             color: '#F15B46'
                                         }, {
                                             from: -1000000000000000,
                                             to: 0,
                                             color: '#F15B46'
                                         }]
                                     },
                                     columnWidth: '40%',
                                 }
                             },
                             dataLabels: {
                                 enabled: false,
                             },
                             yaxis: {
                                 title: {
                                     text: 'Yearly',
                                     align: 'left',
                                     margin: 10,
                                     offsetX: 0,
                                     offsetY: 0,
                                     floating: false,
                                     style: {
                                         fontSize: '12px',
                                         fontWeight: 'bold',
                                         fontFamily: 'Roboto',
                                         color: '#263238'
                                     },
                                 },
                                 
                             },
                             xaxis: {
                                 type: chart1Data.map(function (row) { return row.year; }),
                                 labels: {
                                     rotate: -90
                                 }
                             },
                             tooltip: {
                                 y: {
                                     formatter: function (val) {
                                         return val 
                                     }
                                 }
                             }
                         };

                         var spark1 = {
                             series: [{
                                 name: 'Cl Bal.',
                                 data: chart2Data.map(function (row) { return row.discount; }),
                             }],
                             labels: chart2Data.map(function (row) { return row.Month; }),
                             chart: {
                                 type: 'bar',
                                 height: 180,
                                 events: {
                                     dataPointSelection: function (event, chartContext, config) {

                                         var ee = config.dataPointIndex;
                                         var xValue = config.w.config.xaxis.type[ee];

                                         myFunction_day(xValue);

                                     }
                                 }
                             },
                             plotOptions: {
                                 bar: {
                                     colors: {
                                         ranges: [{
                                             from: -1,
                                             to: -1000000000000000,
                                             color: '#F15B46'
                                         }, {
                                             from: -1000000000000000,
                                             to: 0,
                                             color: '#F15B46'
                                         }]
                                     },
                                     columnWidth: '60%',
                                 }
                             },
                             dataLabels: {
                                 enabled: false,
                             },
                             yaxis: {

                                 title: {
                                     text: 'Monthly',
                                     align: 'left',
                                     margin: 10,
                                     offsetX: 0,
                                     offsetY: 0,
                                     floating: false,
                                     style: {
                                         fontSize: '12px',
                                         fontWeight: 'bold',
                                         fontFamily: 'Roboto',
                                         color: '#263238'
                                     },
                                 },

                             },
                             xaxis: {
                                 type: chart2Data.map(function (row) { return row.Month; }),
                                 labels: {
                                     rotate: -90
                                 }
                             },
                             tooltip: {
                                 y: {
                                     formatter: function (val) {
                                         return val 
                                     }
                                 }
                             }

                         };

                         var spark2 = {
                             series: [{
                                 name: 'Cl Bal.',
                                 data: chart3Data.map(function (row) { return row.discount; }),
                             }],
                             labels: chart3Data.map(function (row) { return row.Quarter; }),
                             chart: {
                                 type: 'bar',
                                 height: 180,
                                 events: {
                                     dataPointSelection: function (event, chartContext, config) {

                                         var ee = config.dataPointIndex;
                                         var xValue = config.w.config.xaxis.type[ee];

                                         myFunction(xValue);

                                     }
                                 }
                             },
                             plotOptions: {
                                 bar: {
                                     colors: {
                                         ranges: [{
                                             from: -1,
                                             to: -1000000000000000,
                                             color: '#F15B46'
                                         }, {
                                             from: -1000000000000000,
                                             to: 0,
                                             color: '#F15B46'
                                         }]
                                     },
                                     columnWidth: '50%',
                                 }
                             },
                             dataLabels: {
                                 enabled: false,
                             },
                             yaxis: {
                                 title: {
                                     text: 'Quarterly',
                                     align: 'left',
                                     margin: 10,
                                     offsetX: 0,
                                     offsetY: 0,
                                     floating: false,
                                     style: {
                                         fontSize: '12px',
                                         fontWeight: 'bold',
                                         fontFamily: 'Roboto',
                                         color: '#263238'
                                     },
                                 },
                                
                             },
                             xaxis: {
                                 type: chart3Data.map(function (row) { return row.Quarter; }),
                                 labels: {
                                     rotate: -90
                                 }
                             },
                             tooltip: {
                                 y: {
                                     formatter: function (val) {
                                         return val 
                                     }
                                 }
                             }
                         };

                         var optionsArea = {
                             series: [{
                                 name: 'Cl Bal.',
                                 data: chart4Data.map(function (row) { return row.discount; }),
                             }],
                             labels: chart4Data.map(function (row) { return row.day; }),
                             chart: {
                                 type: 'area',
                                 height: 315
                             },
                             dataLabels: {
                                 enabled: false
                             },
                             stroke: {
                                 curve: 'straight'
                             },

                             title: {
                                 text: 'April Chart',
                                 align: 'left',
                                 style: {
                                     fontSize: '14px'
                                 }
                             },
                             xaxis: {
                                 type: chart4Data.map(function (row) { return row.day; }),
                                 axisBorder: {
                                     show: false
                                 },
                                 axisTicks: {
                                     show: false
                                 }
                             },
                             yaxis: {
                                 tickAmount: 4,
                                 floating: false,

                                 labels: {
                                     style: {
                                         colors: '#8e8da4',
                                     },
                                     offsetY: -7,
                                     offsetX: 0,
                                 },
                                 axisBorder: {
                                     show: false,
                                 },
                                 axisTicks: {
                                     show: false
                                 }
                             },
                             fill: {
                                 opacity: 0.5
                             },
                             tooltip: {
                                 y: {
                                     formatter: function (val) {
                                         return  val 
                                     }
                                 }
                             },
                             grid: {
                                 yaxis: {
                                     lines: {
                                         offsetX: -30
                                     }
                                 },
                                 padding: {
                                     left: 20
                                 }
                             }
                         };

                         var comparision_bar = {
                             series: [{
                                 name: 'Current Year',
                                 data: chart2Data.map(function (row) { return row.discount; }),
                             }, {
                                 name: 'Previous Year',
                                 data: chart5Data.map(function (row) { return row.discount; }),
                             }],
                             chart: {
                                 type: 'bar',
                                 height: 350
                             },
                             plotOptions: {
                                 bar: {
                                     horizontal: false,
                                     columnWidth: '55%',
                                     endingShape: 'rounded'
                                 },
                             },
                             dataLabels: {
                                 enabled: false
                             },
                             stroke: {
                                 show: true,
                                 width: 2,
                                 colors: ['transparent']
                             },
                             xaxis: {
                                 categories: chart2Data.map(function (row) { return row.Month; }),
                             },
                             yaxis: {
                                 title: {
                                     text: 'Comparision Chart'
                                 }
                             },
                             fill: {
                                 opacity: 1
                             },
                             tooltip: {
                                 y: {
                                     formatter: function (val) {
                                         return   val 
                                     }
                                 }
                             }
                         };


                         var chart1 = new ApexCharts(document.querySelector("#spark3"), spark3);
                         var chart2 = new ApexCharts(document.querySelector("#spark1"), spark1);
                         var chart3 = new ApexCharts(document.querySelector("#spark2"), spark2);
                         var chart4 = new ApexCharts(document.querySelector("#area"), optionsArea);
                         var chart5 = new ApexCharts(document.querySelector("#bar"), comparision_bar);

                         $('.selectloc_name').text(xValue + ' Chart');

                         chart1.render();
                         chart2.render();
                         chart3.render();
                         chart4.render();
                         chart5.render();

                         chart1.updateSeries([{ data: chart1Data.map(function (row) { return row.discount; }) }]);
                         chart2.updateSeries([{ data: chart2Data.map(function (row) { return row.discount; }) }]);
                         chart3.updateSeries([{ data: chart3Data.map(function (row) { return row.discount; }) }]);
                         chart4.updateSeries([{ data: chart4Data.map(function (row) { return row.discount; }) }]);
                         chart5.updateSeries([{ data: chart2Data.map(function (row) { return row.discount; }) }, { data: chart5Data.map(function (row) { return row.discount; }) }]);

                     },
                     error: function (xhr, ajaxOptions, thrownError) {
                         // Handle the error
                         console.log(xhr.status + ': ' + thrownError);
                     }
                 });
             }

         </script>
        

        <script>
            Apex.grid = {
                padding: {
                    right: 0,
                    left: 0
                }
            }

            Apex.dataLabels = {
                enabled: false
            }

            var randomizeArray = function (arg) {
                var array = arg.slice();
                var currentIndex = array.length, temporaryValue, randomIndex;

                while (0 !== currentIndex) {

                    randomIndex = Math.floor(Math.random() * currentIndex);
                    currentIndex -= 1;

                    temporaryValue = array[currentIndex];
                    array[currentIndex] = array[randomIndex];
                    array[randomIndex] = temporaryValue;
                }

                return array;
            }


            var optionsLine = {
                chart: {
                    height: 340,
                    type: 'line',
                    zoom: {
                        enabled: false
                    }
                },
                plotOptions: {
                    stroke: {
                        width: 4,
                        curve: 'smooth'
                    },
                },
                colors: colorPalette,
                series: [
                    {
                        name: "Day Time",
                        data: trigoSeries(52, 20)
                    },
                    {
                        name: "Night Time",
                        data: trigoSeries(52, 27)
                    },
                ],
                title: {
                    floating: false,
                    text: 'Customers',
                    align: 'left',
                    style: {
                        fontSize: '18px'
                    }
                },
                subtitle: {
                    text: '168,215',
                    align: 'center',
                    margin: 30,
                    offsetY: 40,
                    style: {
                        color: '#222',
                        fontSize: '24px',
                    }
                },
                markers: {
                    size: 0
                },

                grid: {

                },
                xaxis: {
                    labels: {
                        show: false
                    },
                    axisTicks: {
                        show: false
                    },
                    tooltip: {
                        enabled: false
                    }
                },
                yaxis: {
                    tickAmount: 2,
                    labels: {
                        show: false
                    },
                    axisBorder: {
                        show: false,
                    },
                    axisTicks: {
                        show: false
                    },
                    min: 0,
                },
                legend: {
                    position: 'top',
                    horizontalAlign: 'left',
                    offsetY: -20,
                    offsetX: -30
                }

            }

            var chartLine = new ApexCharts(document.querySelector('#line'), optionsLine);

            // a small hack to extend height in website sample dashboard
            chartLine.render().then(function () {
                var ifr = document.querySelector("#wrapper");
                if (ifr.contentDocument) {
                    ifr.style.height = ifr.contentDocument.body.scrollHeight + 20 + 'px';
                }
            });
           
		</script>

</asp:Content>



