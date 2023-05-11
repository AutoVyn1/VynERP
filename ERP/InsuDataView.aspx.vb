Imports System.Data.SqlClient

Public Class InsuDataView
    Inherits System.Web.UI.Page
    Private con As New Connection
    Private com As New SqlCommand
    Private dt As New DataTable
    Private discaprvl As DataTable
    Private adp As New SqlDataAdapter

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        dt = con.ReturnDtTable("select row_number() over (order by Cust_Name asc) as srNo, * from insu_track")
        dataGrid.DataSource = dt
        For i As Integer = 0 To dt.Rows.Count - 1
            dt.Rows(i)("srNo") = i + 1
        Next
        dataGrid.DataBind()
    End Sub

    Protected Sub dataGrid_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.Header Then
            e.Row.Cells(0).Text = "srNo"
            e.Row.Cells(1).Text = "Cust_Name"
            e.Row.Cells(2).Text = "Cust_Address"
            e.Row.Cells(3).Text = "Mobile_Number"
            e.Row.Cells(4).Text = "Mobile_Number"
            e.Row.Cells(5).Text = "Vehicle_No"
            e.Row.Cells(6).Text = "Insurance_Amt"
            e.Row.Cells(7).Text = "Remark"
            e.Row.Cells(8).Text = "Payment_Mode"
            e.Row.Cells(9).Text = "Date"
        End If
    End Sub

    Protected Sub dataGrid_SelectedIndexChanging(sender As Object, e As GridViewSelectEventArgs)

    End Sub
End Class