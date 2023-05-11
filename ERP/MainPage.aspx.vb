Public Class MainPage
    Inherits System.Web.UI.Page
    Public login As New UserLogin

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Not IsPostBack Then
                comp.Text = "Welcome " & Session("user_name")
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub DashboardModule_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles DashboardMod.Click

    End Sub
    Private Sub Logout_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LogoutBtn.Click

    End Sub

End Class