Public Class general_disc_report
    Inherits System.Web.UI.Page
    Private con As New Connection
    Private dt As New DataTable
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
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
                dt = con.ReturnDtTable("select cust_name,cust_mob,veh_reg,disc_type,aprvl_amt,req_by,aprvl_by from disc_web where aprvl_status='" + appr_status.Text + "' and curr_Date between '" & date_form.Text & "' and '" & date_upto.Text & "' ")

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

End Class