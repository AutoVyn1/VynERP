Imports System.Web.Services
Imports Newtonsoft.Json

Public Class testingdate
    Inherits System.Web.UI.Page
    Private con As New Connection
    Private dt As New DataTable
    Public jsonString As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Protected Sub print_Click(sender As Object, e As EventArgs) Handles print.Click
        Dim dt As DataTable = con.ReturnDtTable("select dms_inv_no,seq from fuel_predict where dms_inv_no='" + dms_inv.Text + "' or seq='" + seq_no.Text + "' ")
        If dt.Rows.Count > 0 Then
            ' Show alert message
            If dt.Rows(0)("seq").ToString <> "" Then
                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: 'Please generate new seq', text: 'For this invoice', icon: 'warning', showConfirmButton: true}).then(function() { window.location.href='" & Request.Url.AbsoluteUri & "'; });", True)
            Else
                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: 'Voucher Already Created', text: 'For this invoice', icon: 'warning', showConfirmButton: true}).then(function() { window.location.href='" & Request.Url.AbsoluteUri & "'; });", True)
            End If

        Else
            Dim print_date1 As String
            print_date1 = SqlDate(del_date.Text)
            Dim print_date As String = DateTime.Now.ToString()
            Dim user_name As String = Session("user_name")
            con.TSql("INSERT INTO fuel_predict (seq,print_date,tran_type,user_name, branch_name, gatepass_no, del_date, cust_name, fuel_type, dse_name,dms_inv_no,form_date, gatepass_date, model_name, qty, slip_to, remark) VALUES ('" + seq_no.Text + "','" + print_date + "','1','" + user_name + "','" + branch_code.Value + "','" + gp_no.Text + "','" + print_date1 + "','" + cust_name.Text + "','" + fuel_type.Text + "','" + dse_code.Value + "','" + dms_inv.Text + "','" + date_time_now.Text + "','" + gp_date_new.Text + "','" + modl_code.Value + "','" + fuel_qty.SelectedValue + "','" + slip_to.Text + "','" + remark.Text + "')")
            Session("fuel_inv") = seq_no.Text
            Response.Redirect("Print_Slip.aspx")

        End If

    End Sub

End Class
