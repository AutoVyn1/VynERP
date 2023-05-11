Public Class Candidate_Home
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            Dim url = Request.Url.AbsoluteUri
            Dim myarr = url.Split("?")
            mobile.Text = myarr(1).ToString.Replace("Mobile=", "")
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub update_Click(sender As Object, e As EventArgs) Handles update.Click
        Try
            Dim mob As String
            mob = mobile.Text
            Link_to_WA(mob)
        Catch ex As Exception

        End Try
    End Sub

    Private Sub Link_to_WA(ByVal mob As String)
        Try
            Dim msg As String
            msg = "Please Fill This Form below the link is available
                   Click to link https://test.autovyn.com/Admin/Payroll/Interview_Info/Candidate_Info.aspx?Mobile=" & mob & "
                   & open InterView Form
                   Regards " & vbNewLine & ""
            WA_MSG = msg
            WA_Mob = "91" & mobile.Text
            WAMSG()
        Catch ex As Exception

        End Try
    End Sub
End Class