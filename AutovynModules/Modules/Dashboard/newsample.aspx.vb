Imports Newtonsoft.Json

Public Class newsample

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' Retrieve the necessary data from your data source or perform calculations
            Dim chartData As New ChartData()
            chartData.Series = New Integer() {44, 55, 41, 17, 15}
            chartData.Labels = New String() {"A", "B", "C", "D", "E"}

            ' Serialize the chart data to JSON
            Dim serializedData As String = JsonConvert.SerializeObject(chartData)

            ' Register the serialized data as a JavaScript variable
            ClientScript.RegisterStartupScript(Me.GetType(), "ChartScript", $"var chartData = {serializedData};", True)
        End If
    End Sub
End Class

Public Class ChartData
        Public Property Series As Integer()
        Public Property Labels As String()
    End Class
