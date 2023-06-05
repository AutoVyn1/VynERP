Imports System.Globalization

Module PublicModule
    Public Function Apexchart(ByVal json As String, ByVal label As String, ByVal divname As String, type As String, extra As String)

        ' Create a new ApexChart with the JSON data
        Dim chart As New StringBuilder()
        chart.Append("<script>")
        chart.Append("var options = {")
        chart.Append("  chart: {")
        chart.Append("    type: '" + type + "',")
        chart.Append("    height: 350")
        chart.Append("  },")
        chart.Append("  series: [{")
        chart.Append("    name: 'Tax Amount',")
        chart.Append("    data: " & json)
        chart.Append("  }],")
        chart.Append(extra)
        chart.Append("  xaxis: {")
        chart.Append("    type: 'category',")
        chart.Append("    categories: " & label)
        chart.Append("  }")
        chart.Append("};")
        chart.Append("var chart = new ApexCharts(document.querySelector('#" + divname + "'), options);")
        chart.Append("chart.render();")
        chart.Append("</script>")

        Return chart

    End Function

    Public Function SqlDate(ByVal MyDate As String)

        Dim culture As New CultureInfo("en-GB") ' Use UK date format
        Dim dateValue As DateTime
        If DateTime.TryParse(MyDate, culture, DateTimeStyles.None, dateValue) Then
            Return dateValue.ToString("MM/dd/yy")
        Else
            Return Nothing
        End If

    End Function



End Module
