Public Class FinanceSummary
    Inherits System.Web.UI.Page
    Private con As New Connection
    Public dt As New DataTable
    Private calltable As String
    Private inv As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            calltable = "select top 300 DMS_Inv,CONCAT(ledg_name,'(',(cust_id),')') As Customer_Name,ph1,PF_Charges, fin_dono,convert(varchar,INV_date,103) as Invoice_dATE ,Payout_Rate, Payout_Amt,  FLoan_Status as Status from ICM_MST"
            dt = con.ReturnDtTable(calltable)
            gv_Employees.DataSource = dt
            gv_Employees.DataBind()
        Catch ex As Exception

        End Try
    End Sub

    Private Sub valueSearch(value As String)
        dt = con.ReturnDtTable("select DMS_Inv, CONCAT(ledg_name,'(',(cust_id),')') As Customer_Name,ph1,  PF_Charges,fin_dono,convert(varchar,INV_date,103) as Invoice_dATE ,  Payout_Rate, Payout_Amt,  FLoan_Status As Status from ICM_MST where concat(DMS_Inv, ledg_name,cust_id,FLoan_Status) Like '%" & value & "%'")
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
            e.Row.Cells(1).Text = "DMS invoice"
            e.Row.Cells(2).Text = "Cust. Name(ID)"
            e.Row.Cells(3).Text = "Mobile"
            e.Row.Cells(4).Text = "PF Charge"
            e.Row.Cells(5).Text = "Do No."
            e.Row.Cells(6).Text = "Inv. Date"
        End If
        If e.Row.RowType = DataControlRowType.DataRow Then
            For i As Integer = 0 To e.Row.Cells.Count - 1
                If i <> 3 Then
                    Dim cell As TableCell = e.Row.Cells(i)
                    Dim value As Double
                    If Double.TryParse(cell.Text, value) Then
                        cell.Text = value.ToString("F2")
                    End If
                End If
            Next
        End If
    End Sub

    'Private Sub filterdata()
    '    dt = con.ReturnDtTable("select  DMS_Inv,CONCAT(ledg_name,'(',(cust_id),')') As Customer_Name,ph1,PF_Charges,fin_dono,convert(varchar,INV_date,103) as Invoice_dATE ,  Payout_Rate, Payout_Amt, FLoan_Status as Status from ICM_MST where Inv_dATE between '" + datefrom.Text + "' and '" + dateupto.Text + "' order by Inv_dATE  ")
    '    gvEmployees.DataSource = dt
    '    gvEmployees.DataBind()
    'End Sub

    'Protected Sub gvEmployees_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles gvEmployees.PageIndexChanging
    '    gvEmployees.PageIndex = e.NewPageIndex
    '    If searchbox.Text = "" And datefrom.Text = "" And dateupto.Text = "" Then
    '        dt = con.ReturnDtTable(calltable)
    '        gvEmployees.DataSource = dt
    '        gvEmployees.DataBind()
    '    Else
    '        If Not String.IsNullOrEmpty(searchbox.Text) Then
    '            valueSearch(searchbox.Text)
    '            datefrom.Text = ""
    '            dateupto.Text = ""
    '        Else
    '            filterdata()
    '        End If
    '    End If
    'End Sub
    'View All data 
    Protected Sub viewall_Click(sender As Object, e As EventArgs) Handles viewall.Click
        dt = con.ReturnDtTable(calltable)
        gv_Employees.DataSource = dt
        gv_Employees.DataBind()
    End Sub
    'filter button
    'Protected Sub filter_Click(sender As Object, e As EventArgs) Handles filter.Click
    '    filterdata()
    '    searchbox.Text = ""
    'End Sub
    'Edit button click

    Protected Sub gvEmployees_SelectedIndexChanged1(sender As Object, e As EventArgs) Handles gv_Employees.SelectedIndexChanged
        Try
            Session("InvNo") = gv_Employees.SelectedRow.Cells(1).Text
            Response.Redirect("FinanceForm.aspx")
        Catch ex As Exception

        End Try
    End Sub

    Private Property CurrentTable As DataTable
        Get
            Return TryCast(ViewState("CurrentTable"), DataTable)
        End Get
        Set(value As DataTable)
            ViewState("CurrentTable") = value
        End Set
    End Property

    Protected Sub GrdView_PageIndexChanging(ByVal sender As Object, ByVal e As GridViewPageEventArgs) Handles gv_Employees.PageIndexChanging
        gv_Employees.PageIndex = e.NewPageIndex
        gv_Employees.DataSource = CurrentTable
        Me.gv_Employees.PageIndex = e.NewPageIndex
        Me.DataBind()

    End Sub

End Class