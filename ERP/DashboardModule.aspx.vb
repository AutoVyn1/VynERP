Imports System.Data.SqlClient

Public Class DashboardModule
    Inherits System.Web.UI.Page
    Private ReadOnly con As New Connection
    'Private ReadOnly SqlCon As New SqlConnection
    'Private ReadOnly com As New SqlCommand
    'Private ReadOnly com1 As New SqlCommand
    'Private ReadOnly comb As New SqlCommandBuilder
    'Private ReadOnly adp As New SqlDataAdapter
    'Private ReadOnly sdr As SqlDataReader
    'Private tran As SqlTransaction
    'Private ds As New DataSet
    'Private dt As New DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        user.Text = Convert.ToString(Session("User_name"))
    End Sub


    Protected Sub Insuranced_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Insuranced.Click
        Response.Redirect("InsurancePage.aspx")
    End Sub

    Public Sub MesgBox(ByVal sMessage As String)
        Dim sb As New System.Text.StringBuilder
        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('" & sMessage & "')", True)
    End Sub

    Private Sub CashierLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CashierLogind.Click
        Dim CashierCode = Convert.ToString(con.ExecuteScaler("select max(Post_AC) from user_tbl where user_name = '" + user.Text.ToString() + "' and export_type <3"))
        If (Convert.ToString(CashierCode) <> "") Then
            Session("cashCode") = CashierCode
            Response.Redirect("CashierPage.aspx")
        Else
            MesgBox("YOU Are Not Cashier, Go back and try again")
        End If
    End Sub

    Protected Sub SalesModule_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SalesModuled.Click
        Response.Redirect("SalesModule.aspx")
    End Sub
    Protected Sub TrueValue_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles TrueValue.Click
        Response.Redirect("TrueValue.aspx")
    End Sub
    Protected Sub Exchange_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Exchange.Click
        Response.Redirect("Exchange.aspx")
    End Sub
    Protected Sub Finance_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Finance.Click
        Response.Redirect("Finance.aspx")
    End Sub

End Class