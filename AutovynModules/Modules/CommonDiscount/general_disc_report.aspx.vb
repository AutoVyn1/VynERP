Public Class general_disc_report
    Inherits System.Web.UI.Page
    Private con
    Private dt As New DataTable
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con = New Connection
        Try
            If Not IsPostBack Then
                date_form.Text = "01/" & Now.ToString("MM/yyyy")
                date_upto.Text = Now.ToString("dd/MM/yyyy")
            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Saleshow_Click(sender As Object, e As EventArgs) Handles Saleshow.Click
        Try

            If appr_status.Text = "" Then
                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: 'Please Select Your Report Status', text: '', icon: 'warning', showConfirmButton: true}).then(function() { window.location.href='" & Request.Url.AbsoluteUri & "'; });", True)
            Else
                dt = con.ReturnDtTable("select cust_name,veh_reg,disc_type,aprvl_amt,(select CONCAT(EMPFIRSTNAME,' ', EMPLASTNAME) AS REQ_BY from EMPLOYEEMASTER where req_BY=SRNO) as DSE,(select CONCAT(EMPFIRSTNAME,' ', EMPLASTNAME) AS DSE_NAME from EMPLOYEEMASTER where SRNO=APRVL_BY) as APRVL_BY, CURR_DATE from disc_web where aprvl_status='" + appr_status.Text + "' and curr_Date between '" & date_form.Text & "' and '" & date_upto.Text & "' ")

                'and status='" & appr_status.Text & "'

                'For i As Integer = 0 To dt.Rows.Count - 1
                '    dt.Rows(i)("srNo") = i + 1
                'Next
                sales_Data.DataSource = dt
                sales_Data.DataBind()
            End If

        Catch ex As Exception


        End Try
    End Sub

    Private Sub gv_Employees_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles sales_Data.RowDataBound
        If e.Row.RowType = DataControlRowType.Header Then
            e.Row.Cells(0).Text = "Cust. Name"
            e.Row.Cells(1).Text = "Vehicle No"
            e.Row.Cells(2).Text = "Disc Type"
            e.Row.Cells(3).Text = "Aprvl Amt"
            e.Row.Cells(4).Text = "DSE"
            e.Row.Cells(5).Text = "Approver"
            e.Row.Cells(6).Text = "Date"
        End If
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Cells(3).HorizontalAlign = HorizontalAlign.Right ' Set the alignment of all data cells to left

        End If

    End Sub

End Class