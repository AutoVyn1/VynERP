<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AutovynModules/AUTOVYN.Master" CodeBehind="NewCar_summaray.aspx.vb" Inherits="AutovynERP.NewCar_summaray" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

    <style>
        *{
            margin:0;
            padding:0;
            font-family: 'Dosis', sans-serif;
            scrollbar-width: thin;
            scrollbar-color: #397524 #DFE9EB;
        }

        body {
            font-family: sans-serif;
            background-image: url("../../Media/loginbg.svg");
            font-size: 12px;
        }
        .chart{
            margin-bottom:150px;
            background-color:#c9c9c9;
        }
        #chart {
            max-width: 650px;
            margin: 35px auto;
        }
        .left-align {
            text-align: left;
        }
        .form-control {
           
            height: 29px;
            border-radius: 0px;
        }
        .uppercase{
            text-transform:uppercase;
        }
        




        .main-section{
            margin-top:60px;
        }

            /* Chrome, Edge and Safari */
            *::-webkit-scrollbar {
                width: 7px;
                width: 7px;
            }

            *::-webkit-scrollbar-track {
                border-radius: 5px;
                background-color:#fff0;
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

                .grid_panel{
                    height:520px;
                }
                tbody {
                    border:1px solid #000 !important;
                }

                .filter , .print{
                    background-color:seagreen;
                    color:#ffffff;
                    width:9%;
                }




         .myPagerStyle a {
             color: #3366FF;
             text-decoration: none;
             padding: 10px;
         }

         .myPagerStyle span {
             text-decoration: none;
             padding: 10px;
             border: none;
         }

         .myPagerStyle a:hover {
             background-color: #3366FF;
             color: #FFFFFF;
         }

         .myPagerStyle .selected {
             background-color: #3366FF;
             color: #FFFFFF;
             font-weight: bold;
         }

         .myPagerStyle .first a {
             font-weight: bold;
             color: #3366FF;
             border: none;
             padding: 5px;
         }

             .myPagerStyle .first a:hover {
                 background-color: transparent;
                 color: #3366FF;
                 text-decoration: none;
             }


         .search, .view_all {
             background-color: seagreen;
             width: 100%;
             padding: 5px 5px;
             color: #ffffff;
             border: none;
             border-radius: 6px;
         }

         @media screen and (max-width:820px) {

             .amt-box {
                 width: 100%;
                 display: flex;
             }

             .amt-box-lbl {
                 width: 27%;
                 margin-top: 10px;
             }

             .amt-box-total {
                 width: 40%;
                 margin-top: 10px;
             }

             .amt-box-total-1 {
                 width: 10%;
             }

             .search, .view_all {
                 margin-top: 13px;
             }
         }

               @media screen and (max-width:480px) {
            
            .amt-box {
                width: 100%;
                display: flex;
            }

            .amt-box-lbl {
                width: 48%;
                margin-top: 10px;
                font-size:10px;
            }

            .amt-box-total {
                width: 50%;
                margin-top: 10px;
            }

            .amt-box-total-1{
               width: 50%;
               margin: auto;
            }

            .search, .view_all {
                 margin-top: 13px;
             }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid main-section">
        <div class="row">
            <div class="col-lg-12">
                <%-- header lines --%>
                <div class="container-fluid">
                    <div class="row mt-1 mb-1 amt-box">

                        <asp:Label ID="Label1" Class="col-2 col-form-label amt-box-lbl" runat="server" Text="Customer Name/Invoice No."></asp:Label>
                        <div class="col-lg-3  amt-box-total">
                            <asp:TextBox ID="searchbox" Class="col-2 form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="col-lg-1 amt-box-total-1">
                            <asp:Button ID="search" Class="search" runat="server" Text="Search" />
                        </div>

                        <div class="col-lg-1 amt-box-total-1">
                            <asp:Button ID="viewall" Class="view_all" runat="server" Text="Viewall" />
                        </div>
                    </div>
                </div>
                <%-- Grid panel --%>
                <div>
                    <asp:Panel ID="Panel1" CssClass="grid_panel" ScrollBars="Horizontal" runat="server">
                        <asp:GridView ID="gv_Employees" runat="server" CssClass="" Style="top: 0px; border: 1px solid #6fd472; text-align: center; border-collapse: inherit; background-color: hsla(40deg, 4%, 36%, 0.25); position: relative; width: 100%; table-layout: auto;"
                            ShowHeaderWhenEmpty="True" CellPadding="3" GridLines="both" BackColor="White" PagerStyle-CssClass="myPagerStyle" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1">
                           <%-- <Columns>
                                <asp:CommandField ShowSelectButton="True" HeaderText="Edit" ButtonType="Image" SelectImageUrl="~/AutovynModules/Media/edit.png" SelectText="Edit">
                                    <ControlStyle Width="20px" />
                                    <ItemStyle HorizontalAlign="center" CssClass="ms-3" VerticalAlign="Middle" Width="80px" />
                                </asp:CommandField>
                            </Columns>--%>
                            <AlternatingRowStyle BackColor="White" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="true" Font-Size="Larger" ForeColor="White" />
                            <RowStyle BackColor="#f5f5f5" />
                            <HeaderStyle BackColor="#0C4160" ForeColor="WhiteSmoke" Width="100%" />
                            <FooterStyle BackColor="#CCCCCC" />
                            <SelectedRowStyle Font-Size="Large" />
                            <HeaderStyle Font-Bold="True" ForeColor="White" Width="100%" />
                            <SelectedRowStyle BackColor="#336699" Font-Bold="True" ForeColor="White" />
                            <PagerSettings FirstPageText="1" LastPageText="last" NextPageText="next" PreviousPageText="previous" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        </asp:GridView>

                    </asp:Panel>

                    <div id="chart" class="chart"></div>


                </div>


            </div>
        </div>
    </div>


    <script type="text/javascript">  
     
    </script>
    <!-- InputMask -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/inputmask/inputmask.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/inputmask/inputmask.date.extensions.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/inputmask/inputmask.extensions.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/css/inputmask.css" />

    <script>
        $(function () {
            var inputmask = new Inputmask("99/99/9999", { placeholder: 'dd/mm/yyyy' });
            inputmask.mask($('[id*=ContentPlaceHolder1_datefrom]'));
            inputmask.mask($('[id*=ContentPlaceHolder1_dateupto]'));
        });
    </script>

<script>
    // Call the web method to get the data
    $.ajax({
        type: "POST",
        url: "NewCar_summaray.aspx/GetChartData",
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            // Parse the JSON string to a JavaScript object
            var data = JSON.parse(response.d);

            // Populate the series data from the JavaScript object
            var seriesData = [];
            for (var i = 0; i < data.length; i++) {
                seriesData.push(data[i].quantity);
            }

            // Update the options object with the series data
            var options = {
                chart: {
                    height: 280,
                    type: 'bar',
                },
                dataLabels: {
                    enabled: false
                },
                series: [{
                    name: 'Fuel In Ltr',
                    data: seriesData
                }],
                xaxis: {
                    title: {
                        text: 'Months'
                    },
                    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
                },
                yaxis: {
                    title: {
                        text: 'Quantity(In Litre)'
                    }
                }
            };

            // Create the chart
            var chart = new ApexCharts(document.querySelector("#chart"), options);
            chart.render();
        },
        error: function (xhr, ajaxOptions, thrownError) {
            // Handle the error
            console.log(xhr.status + ': ' + thrownError);
        }
    });
</script>

</asp:Content>
