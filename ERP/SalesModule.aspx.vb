Imports System.Data.SqlClient

Public Class SalesModule
    Inherits System.Web.UI.Page
    Private con As New Connection
    Private com As New SqlCommand
    Private dt As New DataTable
    Private discaprvl As DataTable
    Private adp As New SqlDataAdapter

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        dt = con.ReturnDtTable("Select row_number() over (order by Ledger_Id) as srNo, Bill_No, Bill_Date, Ledger_Name, Ledger_Id, State_Code from DMS_ROW_DATA where tran_type=1")
        RetailData.DataSource = dt
        For i As Integer = 0 To dt.Rows.Count - 1
            dt.Rows(i)("srNo") = i + 1
        Next
        RetailData.DataBind()


    End Sub

    Protected Sub ViewFilterData_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ViewFilterData.Click
        FilterData(Search.Text)
    End Sub

    Public Sub FilterData(ValueToSearch As String)
        dt = con.ReturnDtTable("Select  ROW_NUMBER() over (order by ledger_name) as no, Bill_No, Bill_Date, Ledger_Name, Ledger_Id, State_Code from DMS_ROW_DATA where CONCAT(Bill_no, Bill_date,Ledger_name,ledger_id,state_code) like '%" & ValueToSearch & "%' and Tran_Type = 1")
        RetailData.DataSource = dt
        RetailData.DataBind()
    End Sub
    Protected Sub RetailData_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.Header Then
            e.Row.Cells(0).Text = "srNo"
            e.Row.Cells(1).Text = "Bill_No"
            e.Row.Cells(2).Text = "Bill_Date"
            e.Row.Cells(3).Text = "Ledger_Name"
            e.Row.Cells(4).Text = "Ledger_Id"
            e.Row.Cells(6).Text = "State_Code"
        End If
    End Sub






End Class