

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
                        <asp:TextBox ID="Year_From" CssClass="form-control" runat="server" onchange="compareDates()"></asp:TextBox>
                    </div>

                    <asp:Label ID="Label1" CssClass="col-sm-1 col-form-label" runat="server" Text="Date To"></asp:Label>
                    <div class="col-sm-1" style="width:138px;">
                        <asp:TextBox ID="Year_To" CssClass="form-control" runat="server" onchange="compareDates()"></asp:TextBox>
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
                <div class="col-md-8">
                <div class="box">
                  <div id="area"></div>
                </div>
              </div>
             
              <div class="col-md-4">
                <div class="box" style="height: 400px;">
                  <div id="donut"></div>
                </div>
              </div>
            </div>

            <div class="row mt-4 mb-4">
                 <div class="col-md-6">
                <div class="box">
                  <div id="bar"></div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="box">
                  <div id="line"></div>
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

<%--        <script>  
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
        </script>--%>

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
                                     text: 'Expenses',
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
                                     text: 'Expenses',
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
                                     text: 'Expenses',
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

                      

                         new ApexCharts(document.querySelector("#spark3"), spark3).render();
                         new ApexCharts(document.querySelector("#spark1"), spark1).render();
                         new ApexCharts(document.querySelector("#spark2"), spark2).render();
                         new ApexCharts(document.querySelector("#area"), optionsArea).render();


                         /* $('.br_name').text(br_name + ': ' + frm_year + '-' + to_year);*/
                         //chart.render();
                         if (chart1Data.map(function (row) { return row.year; }) != null && chart1Data.map(function (row) { return row.year; }) != "") {

                             spark3.updateSeries([{ data: chart1Data.map(function (row) { return row.cl_bal; }) }]);
                         }

                         if (chart2Data.map(function (row) { return row.year; }) != null && chart2Data.map(function (row) { return row.year; }) != "") {

                             spark1.updateSeries([{ data: chart2Data.map(function (row) { return row.cl_bal; }) }]);
                         }

                         if (chart3Data.map(function (row) { return row.year; }) != null && chart3Data.map(function (row) { return row.year; }) != "") {

                             spark2.updateSeries([{ data: chart3Data.map(function (row) { return row.cl_bal; }) }]);
                         }
                             optionsArea.updateSeries([{ data: chart4Data.map(function (row) { return row.cl_bal; }) }]);
                         
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

                         new ApexCharts(document.querySelector("#area"), optionsArea).render();

                         optionsArea.updateSeries([{ data: chart4Data.map(function (row) { return row.cl_bal; }) }]);

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

                         new ApexCharts(document.querySelector("#area"), optionsArea).render();

                         optionsArea.updateSeries([{ data: chart4Data.map(function (row) { return row.cl_bal; }) }]);

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

            // data for the sparklines that appear below header area
            var sparklineData = [47, 45, 54, 38, 56, 24, 65, 31, 37, 39, 62, 51, 35, 41, 35, 27, 93, 53, 61, 27, 54, 43, 19, 46];

            // the default colorPalette for this dashboard
            //var colorPalette = ['#01BFD6', '#5564BE', '#F7A600', '#EDCD24', '#F74F58'];
            var colorPalette = ['#00D8B6', '#008FFB', '#FEB019', '#FF4560', '#775DD0']

            


            var monthlyEarningsOpt = {
                chart: {
                    type: 'area',
                    height: 260,
                    background: '#eff4f7',
                    sparkline: {
                        enabled: true
                    },
                    offsetY: 20
                },
                stroke: {
                    curve: 'straight'
                },
                fill: {
                    type: 'solid',
                    opacity: 1,
                },
                series: [{
                    data: randomizeArray(sparklineData)
                }],
                xaxis: {
                    crosshairs: {
                        width: 1
                    },
                },
                yaxis: {
                    min: 0,
                    max: 130
                },
                colors: ['#dce6ec'],

                title: {
                    text: 'Total Earned',
                    offsetX: -30,
                    offsetY: 100,
                    align: 'right',
                    style: {
                        color: '#7c939f',
                        fontSize: '16px',
                        cssClass: 'apexcharts-yaxis-title'
                    }
                },
                subtitle: {
                    text: '$135,965',
                    offsetX: -30,
                    offsetY: 100,
                    align: 'right',
                    style: {
                        color: '#7c939f',
                        fontSize: '24px',
                        cssClass: 'apexcharts-yaxis-title'
                    }
                }
            }



            var monthlyEarningsChart = new ApexCharts(document.querySelector("#monthly-earnings-chart"), monthlyEarningsOpt);


           

            var optionsBar = {
                chart: {
                    type: 'bar',
                    height: 380,
                    width: '100%',
                    stacked: true,
                },
                plotOptions: {
                    bar: {
                        columnWidth: '45%',
                    }
                },
                colors: colorPalette,
                series: [{
                    name: "Sales",
                    data: [42, 52, 16, 55, 59, 51, 45, 32, 26, 33, 44, 51, 42, 56],
                }, {
                    name: "Profit",
                    data: [6, 12, 4, 7, 5, 3, 6, 4, 3, 3, 5, 6, 7, 4],
                }],
                labels: [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23],
                xaxis: {
                    labels: {
                        show: false
                    },
                    axisBorder: {
                        show: false
                    },
                    axisTicks: {
                        show: false
                    },
                },
                yaxis: {
                    axisBorder: {
                        show: false
                    },
                    axisTicks: {
                        show: false
                    },
                    labels: {
                        style: {
                            colors: '#78909c'
                        }
                    }
                },
                title: {
                    text: 'Monthly Sales',
                    align: 'left',
                    style: {
                        fontSize: '18px'
                    }
                }

            }

            var chartBar = new ApexCharts(document.querySelector('#bar'), optionsBar);
            chartBar.render();


            var optionDonut = {
                chart: {
                    type: 'donut',
                    width: '100%',
                    height: 400
                },
                dataLabels: {
                    enabled: false,
                },
                plotOptions: {
                    pie: {
                        customScale: 0.8,
                        donut: {
                            size: '75%',
                        },
                        offsetY: 20,
                    },
                    stroke: {
                        colors: undefined
                    }
                },
                colors: colorPalette,
                title: {
                    text: 'Department Sales',
                    style: {
                        fontSize: '18px'
                    }
                },
                series: [21, 23, 19, 14, 6],
                labels: ['Sales', 'Profit', 'CCP', 'EW', 'Insurance'],
                legend: {
                    position: 'left',
                    offsetY: 80
                }
            }

            var donut = new ApexCharts(
                document.querySelector("#donut"),
                optionDonut
            )
            donut.render();


            function trigoSeries(cnt, strength) {
                var data = [];
                for (var i = 0; i < cnt; i++) {
                    data.push((Math.sin(i / strength) * (i / strength) + i / strength + 1) * (strength * 2));
                }

                return data;
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


            // on smaller screen, change the legends position for donut
            var mobileDonut = function () {
                if ($(window).width() < 768) {
                    donut.updateOptions({
                        plotOptions: {
                            pie: {
                                offsetY: -15,
                            }
                        },
                        legend: {
                            position: 'bottom'
                        }
                    }, false, false)
                }
                else {
                    donut.updateOptions({
                        plotOptions: {
                            pie: {
                                offsetY: 20,
                            }
                        },
                        legend: {
                            position: 'left'
                        }
                    }, false, false)
                }
            }

            $(window).resize(function () {
                mobileDonut()
            });
        </script>

</asp:Content>


