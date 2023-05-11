Imports System.Data.SqlClient
Public Class UserLogin
    Inherits System.Web.UI.Page
    Private con As New Connection

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Private Sub loginBtn_Click(sender As Object, e As EventArgs) Handles loginBtn.Click
        Try
            con = New Connection
            Dim dt As DataTable
            dt = con.ReturnDtTable("Select * from user_tbl where Export_Type<3 and user_code='" & Comp_Code.Text & "' and user_name='" & User_Name.Text & "' and user_pwd='" & Password.Text & "'")
            If dt.Rows.Count > 0 Then
                Session("user_name") = User_Name.Text
                Session("Log_code") = Val(dt.Rows(0)("User_Code").ToString)
                Session("login_name") = dt.Rows(0)("User_Name").ToString
                Session("QueryLoc") = dt.Rows(0)("Multi_Loc").ToString
                Response.Redirect("MainPage.aspx")
            End If

        Catch ex As Exception

        End Try
    End Sub

    Public Sub MesgBox(ByVal sMessage As String)
        Dim sb As New System.Text.StringBuilder
        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('" & sMessage & "')", True)
    End Sub
End Class