

<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AutovynModules/AUTOVYN.Master" CodeBehind="dashboard.aspx.vb"  Inherits="AutovynERP.dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="../../JS/ListSelect/virtual-select.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

  <script type="text/javascript" src="../../JS/ListSelect/virtual-select.min.js"></script>

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
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

        .main-section{
            margin-top:60px;
            margin-bottom:60px;
        }


        .navbar {
            
        }

        .date-section{
            background-color:gainsboro;
        }

        .date{
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
            border-radius:6px;
            color:#fff;
        }

         .status-section{
            background-color: aliceblue;
            margin: 20px 10px;
            border-radius:10px;
            -webkit-box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
            -moz-box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
            box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
        }

        .sub-head{
            padding: 7px 0;
             -webkit-box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
            -moz-box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
            box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
        }

        .status{
            font-size: 18px;
            font-weight: 700;
        }
        .sub-head{
            padding: 7px 0;
             -webkit-box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
            -moz-box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
            box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
        }
        
        .loc-sub-head{
            padding: 7px 0;
            display: flex;
            justify-content: space-around;
        }


        .status{
            font-size: 18px;
            font-weight: 700;

        }

        .lbl {
            font-size: 20px;
            font-weight: bold;
            text-transform: uppercase;
            color: green;
        }

        .loc-box{
            height:130px;
            width :100%;
            -webkit-box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
            -moz-box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
            box-shadow: -2px 6px 15px -11px rgb(0 0 0 / 75%);
            border-radius: 6px;
            text-align:center;
            margin-right: 0px;
            font-size:18px;
            font-weight:700;
        }

        .total {
            background-color:#a7e2cb;
            height: 59px;
            border-radius: 6px 6px 40px 40px;
            padding-top: 16px;
            color:#000000;
            font-size:12px;
            font-weight:700;
        }

        .panel{
            width:16%;
        }

        .report-grid{
            height:60vh;
        }

        @media screen and (max-width: 827px) {
            .panel{
            width:30%;
        }
        }
        
        @media screen and (max-width: 768px) {
            .panel{
            width:30%;
        }
        }

        @media screen and (max-width: 480px) {
        .loc-box {
            height: 130px;
            width:100%;
        }
        .panel{
            width:48%;
        }

         .view{
                width:100%;
                margin-top:10px;
            }
        }
        #Volume_Label {
            font-size:20px;
            font-weight:bold;
        }
        h1, h2, h3, h4, h5, h6, strong {
  font-weight: 600;
}

.content-area {
 
  margin: 0 auto;
}

#topnav {
  background: #37474f;
  height: 60px;
  display: flex;
  flex-direction: row;
  align-items: center;
  font-size: 14px;
}

.admin-menu {
  color: #fff;
  font-size: 16px;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 15px;
  flex: 0.05 0 0;
}

.logo {
  display: flex;
  flex-direction: row;
  align-items: center;
  flex: 1 0 0;
}

.logo-t {
  width: 32px;
  height: 32px;
  border: 2px solid #26c6da;
  text-align: center;
  line-height: 28px;
  border-radius: 50%;
  margin-right: 15px;
  margin-left: 5px;
  padding-left: 3px;
}

.search-bar {
  flex: 2 0 0;
  align-items: center;
  justify-content: space-between;
  background: #232e34;
  overflow: hidden;
  display: flex;
  height: 36px;
  border-radius: 35px;
  color: rgba(255,255,255,0.5);
}

.search-bar-dropdown {
  flex: 1 0 0;
  height: 40px;
  line-height: 40px;
  padding: 0 18px;
  margin-right: 15px;
  background: #2c393f;

}
.search-bar-input {
  flex: 2 0 0;
  display: flex;
  justify-content: flex-end;
  padding: 0 18px;
  line-height: 40px;
  align-items: center;
}

.search-bar-input input[type="text"] {
  width: 100%;
  background: transparent;
  border: 0;
  color: rgba(255,255,255,0.5);
}
.search-bar-input input:focus{
  outline: none;
}

.box.banana_map {
  color: #fff;
  background: #eff4f7;
  padding: 0;
  box-shadow: none;
}
.box.banana_map .title {
  padding-top: 40px;
  padding-left: 25px;
  font-size: 16px;
}
.box.banana_map .subtitle {
  font-weight: 700;
  padding-top: 10px;
  padding-left: 25px;
  font-size: 22px;
}

.box {
  max-height: 444px;
}

.box .banana {
  min-height: 404px;
  background-image: url('img/banana.png');
  background-size: cover;
}
.box .map {
  min-height: 404px;
  background-image: url('img/map.png');
  background-size: cover;
}
.box .cog-icon {
  cursor: pointer;
  position: absolute;
  right: 55px;
  top: 25px;
  z-index: 10;
}

@media screen and (max-width:760px) {
  #topnav { flex-wrap: wrap; }
  .admin-menu { flex-basis: 20%; }
  .logo { justify-content: flex-end; padding-right: 10px; }
  .logo { flex-basis: 80%; }
  .topnav-rightmenu, .search-bar { display: none; }
}

.box {
  box-shadow: 0px 1px 22px -12px #607D8B;
  background-color: #fff;
  padding: 25px 35px 25px 30px;
}

#monthly-earnings-chart #apexcharts-canvas {
  position: relative;
}
#monthly-earnings-chart #apexcharts-canvas:after {
  content: "";
  position: absolute;
  left: 0;
  right: 58%;
  top: 0;
  bottom: 0;
  background: #24bdd3;
  opacity: 0.65;
}
#monthly-earnings-chart #apexcharts-title-text {
  font-weight: 600;
}
#monthly-earnings-chart #apexcharts-subtitle-text {
  font-weight: 700;
}
.monthly-earnings-text {
  position: absolute;
  left: 70px;
  top: 187px;
  color: #fff;
  z-index: 10;
}

.monthly-earnings-text h6 {
  font-size: 16px;
}
.chart-title h5 {
  font-size: 18px;
  color: rgba(51,51,51,1);
  margin-bottom: 38px;
}


@media screen and (max-width:760px) {
  .monthly-earnings-text {
    left: 30px;
  }
  .box {
    padding: 25px 0;
  }
}

.sparkboxes .box {
  padding: 3px 0 0 0;
  position: relative;
}

#spark1, #spark2, #spark3, #spark4 {
  position: relative;
  padding-top: 15px;
}


/* overrides */
.sparkboxes #apexcharts-subtitle-text { fill: #8799a2 !important; }


.spinner-border {
  display: none;
}
.get_data{
    display: inline-block;
    background-color: #6464fb;
    color: white;
    padding: 4px;
    border: 1px solid #6464fb;
    border-radius: 5px;
    box-shadow: 2px 1px 6px #817c7c;
}
.get_data:hover{
    cursor:pointer;
}
.get_data:active{
        cursor: pointer;
    background-color: #bebef3;
    border: 1px solid #bebef3;
    padding: 1px;
}
    </style>
 
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
                        <asp:DropDownList ID="grp_name" Class="resetting" selectionmode="multiple"  data-silent-initial-value-set="true" name="native-select" data-search="true" runat="server">
                         
                        </asp:DropDownList>
                    </div>

                    <div class="col-sm-1">
                        <%--<asp:Button ID="Load_Location" Text="Load" runat="server" CssClass="btn view" />--%>
                        <label id="Load_Location" class="get_data"> Get Data</label>
                        <a  ></a>

                    </div>

                </div>

        
    <div id="wrapper">
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
                <div class="box" >
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
            VirtualSelect.init({
                ele: '#ContentPlaceHolder1_grp_name',
                showOptionsOnlyOnSearch: true
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

             $("#Load_Location").click(function () {

                 var frm_year = $('#ContentPlaceHolder1_Year_From').val();
                 var to_year = $('#ContentPlaceHolder1_Year_To').val();
                 var grp_name = $('#ContentPlaceHolder1_grp_name').val();

                 $.ajax({
                     type: "POST",
                     url: "dashboard.aspx/GetChartData",
                     data: "{grp_name: '" + grp_name + "',frm_year: '" + frm_year + "',to_year: '" + to_year + "'}",
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     success: function (response) {
                         // Parse the JSON string to a JavaScript object
                         var data = JSON.parse(response.d);

                       

                         var chart1Data = data.DataTable1;
                         var chart2Data = data.DataTable2;
                         var chart3Data = data.DataTable3;
                         var chart4Data = data.DataTable4;
                         var chart5Data = data.DataTable5;
                         
                         var total1 = 0;
                         for (var i = 0; i < chart1Data.length; i++) {
                             total1 += chart1Data[i].cl_bal;
                         }

                         var total2 = 0;
                         for (var i = 0; i < chart2Data.length; i++) {
                             total2 += chart2Data[i].cl_bal;
                         }

                         var total3 = 0;
                         for (var i = 0; i < chart3Data.length; i++) {
                             total3 += chart3Data[i].cl_bal;
                         }

                         var spark3 = {
                             series: [{
                                 name: 'Cl Bal.',
                                 data: chart1Data.map(function (row) { return row.cl_bal; }),
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
                                     text: 'Yearly Expenses (In Lakh)',
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
                             }
                         };

                         var spark1 = {
                             series: [{
                                 name: 'Cl Bal.',
                                 data: chart2Data.map(function (row) { return row.cl_bal; }),
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
                                     text: 'Monthly Expenses (In Lakh)',
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
                             }
                         };

                         var spark2 = {
                             series: [{
                                 name: 'Cl Bal.',
                                 data: chart3Data.map(function (row) { return row.cl_bal; }),
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
                                     text: 'Quarterly Expenses (In Lakh)',
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
                                 //labels: {
                                 //    formatter: function (y) {
                                 //        return y.toFixed(0);
                                 //    }
                                 //}
                             },
                             xaxis: {
                                 type: chart3Data.map(function (row) { return row.Quarter; }),
                                 labels: {
                                     rotate: -90
                                 }
                             }
                         };

                         var optionsArea = {
                             series: [{
                                 name: 'Cl Bal.',
                                 data: chart4Data.map(function (row) { return row.cl_bal; }),
                             }],
                             //labels: chart4Data.map(function (row) { return row.day; }),
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
                                 text: 'Daily Expenses (In Thousands)',
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
                                 x: {
                                     format: "yyyy",
                                 },
                                 fixed: {
                                     enabled: false,
                                     position: 'topRight'
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
                             series: chart5Data.map(function (row) { return row.cl_bal; }),

							 chart: {
								 width: 580,
								 type: 'pie',
								 events: {
									 dataPointSelection: function (event, chartContext, config) {

										 var ee = config.dataPointIndex;

										 var xValue = config.w.config.labels[ee];

										 console.log(xValue)

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

						 //for comparision chart
						 var options = {
							 series: [{
								 name: 'Current Year',
								 data: chart2Data.map(function (row) { return row.cl_bal; }),
							 },
							 {
								 name: 'Last year',
								 data: chart2Data.map(function (row) { return row.cl_bal; }),
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
								 type: chart2Data.map(function (row) { return row.Month; }),
								 labels: {
									 rotate: -90
								 }
							 },
							 yaxis: {
								 title: {
									 text: '$ (thousands)'
								 }
							 },
							 fill: {
								 opacity: 1
							 },
							 tooltip: {
								 y: {
									 formatter: function (val) {
										 return "$ " + val + " thousands"
									 }
								 }
							 }
						 };

						 var chart6 = new ApexCharts(document.querySelector("#bar"), options);
                         

                         var chart1 = new ApexCharts(document.querySelector("#spark3"), spark3);
                         var chart2 =new ApexCharts(document.querySelector("#spark1"), spark1);
                         var chart3 =new ApexCharts(document.querySelector("#spark2"), spark2);
                         var chart4 =new ApexCharts(document.querySelector("#area"), optionsArea);
                         var chart5 = new ApexCharts(document.querySelector("#donut"), optionDonut);


                         chart1.render();
                         chart2.render();
                         chart3.render();
                         chart4.render();
                         chart5.render();
						 chart6.render();

                         chart1.updateSeries([{ data: chart1Data.map(function (row) { return row.cl_bal; }) }]);
                         chart2.updateSeries([{ data: chart2Data.map(function (row) { return row.cl_bal; }) }]);
                         chart3.updateSeries([{ data: chart3Data.map(function (row) { return row.cl_bal; }) }]);
                         chart4.updateSeries([{ data: chart4Data.map(function (row) { return row.cl_bal; }) }]);
						 chart6.updateSeries([{ data: chart6Data.map(function (row) { return row.cl_bal; }) }]);

                         //chart5.updateSeries([{ data: chart5Data.map(function (row) { return row.cl_bal; }) }]);
                        
                         
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
                     url: "dashboard.aspx/GetChartData2",
                     data: "{grp_name: '" + grp_name + "',frm_year: '" + frm_year + "',to_year: '" + to_year + "', xValue:'" + xValue +"'}",
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     success: function (response) {
                         // Parse the JSON string to a JavaScript object
                         var data = JSON.parse(response.d);

                         var chart1Data = data.DataTable1;

                         var optionsArea = {
                             series: [{
                                 name: 'Cl Bal.',
                                 data: chart1Data.map(function (row) { return row.cl_bal; }),
                             }],
                             //labels: chart4Data.map(function (row) { return row.day; }),
                             chart: {
                                 type: 'area',
                                 height: 350
                             },
                             dataLabels: {
                                 enabled: false
                             },
                             stroke: {
                                 curve: 'straight'
                             },

                             title: {
                                 text: 'Daily Expenses',
                                 align: 'left',
                                 style: {
                                     fontSize: '14px'
                                 }
                             },
                             xaxis: {
                                 type: chart1Data.map(function (row) { return row.Month; }),
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
                                 x: {
                                     format: "yyyy",
                                 },
                                 fixed: {
                                     enabled: false,
                                     position: 'topRight'
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
                         quat_chart.updateSeries([{ data: chart1Data.map(function (row) { return row.cl_bal; }) }]);

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
                     url: "dashboard.aspx/GetChartData_day",
                     data: "{grp_name: '" + grp_name + "',frm_year: '" + frm_year + "',to_year: '" + to_year + "', xValue:'" + xValue + "'}",
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     success: function (response) {
                         // Parse the JSON string to a JavaScript object
                         var data = JSON.parse(response.d);

                         var chart1Data = data.DataTable1;

                         var optionsAr = {
                             series: [{
                                 name: 'Cl Bal.',
                                 data: chart1Data.map(function (row) { return row.cl_bal; }),
                             }],
                             //labels: chart4Data.map(function (row) { return row.day; }),
                             chart: {
                                 type: 'area',
                                 height: 350
                             },
                             dataLabels: {
                                 enabled: false
                             },
                             stroke: {
                                 curve: 'straight'
                             },

                             title: {
                                 text: 'Daily Expenses',
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
                                 x: {
                                     format: "yyyy",
                                 },
                                 fixed: {
                                     enabled: false,
                                     position: 'topRight'
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
                         day_chart.updateSeries([{ data: chart1Data.map(function (row) { return row.cl_bal; }) }]);

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
                     url: "dashboard.aspx/GetChartData_branch",
                     data: "{grp_name: '" + grp_name + "',frm_year: '" + frm_year + "',to_year: '" + to_year + "', xValue:'" + xValue + "'}",
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     success: function (response) {
                         // Parse the JSON string to a JavaScript object
                         var data = JSON.parse(response.d);



                         var chart1Data = data.DataTable1;
                         var chart2Data = data.DataTable2;
                         var chart3Data = data.DataTable3;
                         var chart4Data = data.DataTable4;
                         

                     

                         var spark3 = {
                             series: [{
                                 name: 'Cl Bal.',
                                 data: chart1Data.map(function (row) { return row.cl_bal; }),
                             }],
                             labels: chart1Data.map(function (row) { return row.year; }),
                             chart: {
                                 type: 'bar',
                                 height: 160
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
                                     text: 'Yearly Expenses(In Lakh)',
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
                                 //labels: {
                                 //    formatter: function (y) {
                                 //        return y.toFixed(0);
                                 //    }
                                 //}
                             },
                             xaxis: {
                                 type: chart1Data.map(function (row) { return row.year; }),
                                 labels: {
                                     rotate: -90
                                 }
                             }
                         };

                         var spark1 = {
                             series: [{
                                 name: 'Cl Bal.',
                                 data: chart2Data.map(function (row) { return row.cl_bal; }),
                             }],
                             labels: chart2Data.map(function (row) { return row.Month; }),
                             chart: {
                                 type: 'bar',
                                 height: 160,
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
									 text: 'Monthly Expenses(In Lakh)',
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
                             }
                         };

                         var spark2 = {
                             series: [{
                                 name: 'Cl Bal.',
                                 data: chart3Data.map(function (row) { return row.cl_bal; }),
                             }],
                             labels: chart3Data.map(function (row) { return row.Quarter; }),
                             chart: {
                                 type: 'bar',
                                 height: 160,
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
									 text: 'Quarterly Expenses(In Lakh)',
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
                                 //labels: {
                                 //    formatter: function (y) {
                                 //        return y.toFixed(0);
                                 //    }
                                 //}
                             },
                             xaxis: {
                                 type: chart3Data.map(function (row) { return row.Quarter; }),
                                 labels: {
                                     rotate: -90
                                 }
                             }
                         };

                         var optionsArea = {
                             series: [{
                                 name: 'Cl Bal.',
                                 data: chart4Data.map(function (row) { return row.cl_bal; }),
                             }],
                             //labels: chart4Data.map(function (row) { return row.day; }),
                             chart: {
                                 type: 'area',
                                 height: 350
                             },
                             dataLabels: {
                                 enabled: false
                             },
                             stroke: {
                                 curve: 'straight'
                             },

                             title: {
                                 text: 'Daily Expenses',
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
                                 x: {
                                     format: "yyyy",
                                 },
                                 fixed: {
                                     enabled: false,
                                     position: 'topRight'
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


                         var chart1 = new ApexCharts(document.querySelector("#spark3"), spark3);
                         var chart2 = new ApexCharts(document.querySelector("#spark1"), spark1);
                         var chart3 = new ApexCharts(document.querySelector("#spark2"), spark2);
                         var chart4 = new ApexCharts(document.querySelector("#area"), optionsArea);
                        // var chart5 = new ApexCharts(document.querySelector("#donut"), optionDonut);


                         chart1.render();
                         chart2.render();
                         chart3.render();
                         chart4.render();
                        // chart5.render();

                         chart1.updateSeries([{ data: chart1Data.map(function (row) { return row.cl_bal; }) }]);
                         chart2.updateSeries([{ data: chart2Data.map(function (row) { return row.cl_bal; }) }]);
                         chart3.updateSeries([{ data: chart3Data.map(function (row) { return row.cl_bal; }) }]);
                         chart4.updateSeries([{ data: chart4Data.map(function (row) { return row.cl_bal; }) }]);
                         //chart5.updateSeries([{ data: chart5Data.map(function (row) { return row.cl_bal; }) }]);
                         //chart5.updateSeries([{ data: chart5Data.map(function (row) { return row.loc_name; }) }]);


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
                     url: "dashboard.aspx/GetChartData_day",
                     data: "{grp_name: '" + grp_name + "',frm_year: '" + frm_year + "',to_year: '" + to_year + "', xValue:'" + xValue + "'}",
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     success: function (response) {
                         // Parse the JSON string to a JavaScript object
                         var data = JSON.parse(response.d);

                         var chart1Data = data.DataTable1;

                         var optionsAr = {
                             series: [{
                                 name: 'Cl Bal.',
                                 data: chart1Data.map(function (row) { return row.cl_bal; }),
                             }],
                             //labels: chart4Data.map(function (row) { return row.day; }),
                             chart: {
                                 type: 'area',
                                 height: 350
                             },
                             dataLabels: {
                                 enabled: false
                             },
                             stroke: {
                                 curve: 'straight'
                             },

                             title: {
                                 text: 'Daily Expenses',
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
                                 x: {
                                     format: "yyyy",
                                 },
                                 fixed: {
                                     enabled: false,
                                     position: 'topRight'
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
                         day_chart.updateSeries([{ data: chart1Data.map(function (row) { return row.cl_bal; }) }]);

                     },
                     error: function (xhr, ajaxOptions, thrownError) {
                         // Handle the error
                         console.log(xhr.status + ': ' + thrownError);
                     }
                 });
             }
		 </script>
        

       <%-- <script>
          
            //for comparision chart
			var options = {
				series: [{
					name: 'Net Profit',
					data: [44, 55, 57, 56, 61, 58, 63, 60, 66]
                },
                    {
					name: 'Free Cash Flow',
					data: [35, 41, 36, 26, 45, 48, 52, 53, 41]
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
					categories: ['Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct'],
				},
				yaxis: {
					title: {
						text: '$ (thousands)'
					}
				},
				fill: {
					opacity: 1
				},
				tooltip: {
					y: {
						formatter: function (val) {
							return "$ " + val + " thousands"
						}
					}
				}
			};

			var chart = new ApexCharts(document.querySelector("#bar"), options);
			chart.render();


            // a small hack to extend height in website sample dashboard
            chartLine.render().then(function () {
                var ifr = document.querySelector("#wrapper");
                if (ifr.contentDocument) {
                    ifr.style.height = ifr.contentDocument.body.scrollHeight + 20 + 'px';
                }
            });

		</script>--%>

</asp:Content>


