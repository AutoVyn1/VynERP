Public Class Demo_car_smry
    Inherits System.Web.UI.Page
    Private con As New Connection
    Public dt As New DataTable
    Public dt1 As New DataTable
    Private calltable As String
    Private inv As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            calltable = "select seq,reg_no,enq_cust_name,fuel_type,qty,driv_name,loc_from,loc_to,print_date from fuel_predict where tran_type='2' order by seq"
            dt1 = con.ReturnDtTable("select seq,SUM(qty) as quantity from fuel_predict group by seq")


            dt = con.ReturnDtTable(calltable)
            gv_Employees.DataSource = dt
            gv_Employees.DataBind()

        Catch ex As Exception

        End Try
    End Sub

    Private Sub valueSearch(value As String)
        dt = con.ReturnDtTable("select seq,reg_no,enq_cust_name,fuel_type,qty,driv_name,loc_from,loc_to,print_date from fuel_predict where concat(dms_inv_no, enq_cust_name) Like '%" & value & "%' order by seq")
        gv_Employees.DataSource = dt
        gv_Employees.DataBind()
    End Sub

    Protected Sub search_Click(ByVal sender As Object, ByVal e As EventArgs) Handles search.Click
        valueSearch(searchbox.Text)
    End Sub

    Private Sub gvEmployees_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gv_Employees.RowDataBound
        If e.Row.RowType = DataControlRowType.Header Then
            For i = 0 To e.Row.Cells.Count - 1
                Dim cell2 As TableCell = e.Row.Cells(i)
                cell2.Width = New Unit("40px")
            Next
            Dim cell As TableCell = e.Row.Cells(1)
            e.Row.Cells(0).Text = "Seq. No."
            e.Row.Cells(1).Text = "Reg. No."
            'e.Row.Cells(2).HorizontalAlign = HorizontalAlign.Left ' Set the alignment of header cell to left
            e.Row.Cells(2).Text = "Customer Name"
            e.Row.Cells(3).Text = "Fuel Type"
            e.Row.Cells(4).Text = "Quantity(Ltr)"
            e.Row.Cells(5).Text = "Driver Name"
            e.Row.Cells(6).Text = "From"
            e.Row.Cells(7).Text = "To"
            e.Row.Cells(8).Text = "Print Date"

        End If
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Cells(2).HorizontalAlign = HorizontalAlign.Left ' Set the alignment of all data cells to left
            e.Row.Cells(5).HorizontalAlign = HorizontalAlign.Left
            e.Row.Cells(5).CssClass = "uppercase"
            e.Row.Cells(3).CssClass = "uppercase"
        End If

    End Sub


End Class