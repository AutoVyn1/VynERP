Imports System.Data.SqlClient

Public Class InsurancePage
    Inherits System.Web.UI.Page
    Private con As New Connection
    Private com As New SqlCommand
    Private dt As New DataTable
    Private discaprvl As DataTable
    Private adp As New SqlDataAdapter

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Public Sub MesgBox(ByVal sMessage As String)
        Dim sb As New System.Text.StringBuilder
        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('" & sMessage & "')", True)
    End Sub

    Private Sub Submit_Click(sender As Object, e As EventArgs) Handles Submit.Click
        Try
            con.TSql("INSERT INTO DBO.insu_track VALUES('" + CustName.Text + "','" + CustAddress.Text + "','" + CustMobile.Text + "','" + CustEmail.Text + "','" + VehicleNo.Text + "','" + InsuranceAmt.Text + "','" + Remark.Text + "','" + PaymentMode.Text + "','" + datePicker.Text + "')")
            MesgBox("inserted")
            CustName.Text = ""
            CustAddress.Text = ""
            CustMobile.Text = ""
            CustEmail.Text = ""
            VehicleNo.Text = ""
            InsuranceAmt.Text = ""
            Remark.Text = ""
        Catch ex As Exception
            MesgBox("not inserted")
        End Try
    End Sub
End Class