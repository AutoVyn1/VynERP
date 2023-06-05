<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="newsample.aspx.vb" Inherits="AutovynERP.newsample" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Apex Chart Example</title>
   <%-- Apex charts --%>
	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
	<%-- Apex charts --%>
</head>
<body>
    <form id="form1" runat="server">
        <div id="chart">Manoj swami</div>

        <script>
            // Access the server-side generated chartData
            var data = chartData;

            // Chart options
            var options = {
                chart: {
                    type: 'bar',
                    height: 350
                },
                series: data.Series,
                xaxis: {
                    categories: data.Labels
                }
            };

            // Create the chart instance
            var chart = new ApexCharts(document.querySelector("#chart"), options);

            // Render the chart
            chart.render();
		</script>
    </form>
</body>
</html>

