Public Class WorkshopDiscountApprovalReport
    Inherits System.Web.UI.Page
    Private con As New Connection
    Private dt As New DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        date_form.Text = "01" + "/" + Now.ToString("MM") + "/" + Now.ToString("yyyy")
        date_upto.Text = Now.ToString("dd") + "/" + Now.ToString("MM") + "/" + Now.ToString("yyyy")
    End Sub

    Private Sub Show2_Click(sender As Object, e As EventArgs) Handles workshop.Click
        Try
            dt = con.ReturnDtTable(" select 0 as Srno, appr_status, cust_name,Mobile_no, email,(select godw_name from Godown_Mst where Godown_Mst.Godw_Code=branch) as Branch,service_ad,job_card,bill_no,(select top 1 misc_name from misc_mst where misc_type=14) as Modl_Var,remark,inv_type,inv_val,disc_type,disc_amt,disc_reason,appr_name,appr_amt,date from workshop_disc where date between " & SqlDate(date_form.Text) & " and " & SqlDate(date_upto.Text) & " and appr_status='" & appr_status.Text & "'")
            worshop_data.DataSource = dt
            For i As Integer = 0 To dt.Rows.Count - 1
                dt.Rows(i)("srNo") = i + 1
            Next
            worshop_data.DataBind()
            worshop_data.Width = 5000
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub dataGrid_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles worshop_data.RowDataBound
        e.Row.Cells(0).Width = New Unit("42px")
        e.Row.Cells(1).Width = New Unit("70px")
        e.Row.Cells(2).Width = New Unit("150px")
        e.Row.Cells(3).Width = New Unit("100px")
        e.Row.Cells(4).Width = New Unit("200px")
        e.Row.Cells(5).Width = New Unit("100px")
        e.Row.Cells(6).Width = New Unit("100px")
        e.Row.Cells(7).Width = New Unit("80px")
        e.Row.Cells(8).Width = New Unit("300px")
        e.Row.Cells(9).Width = New Unit("300px")
        e.Row.Cells(10).Width = New Unit("300px")
        e.Row.Cells(11).Width = New Unit("300px")
        e.Row.Cells(12).Width = New Unit("300px")
        e.Row.Cells(13).Width = New Unit("300px")
        e.Row.Cells(14).Width = New Unit("300px")
        e.Row.Cells(15).Width = New Unit("300px")
        e.Row.Cells(16).Width = New Unit("300px")
        e.Row.Cells(17).Height = New Unit("50px")
    End Sub


End Class