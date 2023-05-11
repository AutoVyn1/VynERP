Public Class Reminder_Set1
    Inherits System.Web.UI.Page
    Private con As New Connection
    Private dt As New DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Private Sub MesgBox(ByVal sMessage As String)
        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('" & sMessage & "')", True)
    End Sub

    Protected Sub Submit_CLick(ByVal sender As Object, ByVal e As System.EventArgs) Handles submit.Click
        Try
            con.TSql("INSERT INTO REMIND_SEC VALUES('" & Remind_Name.Text & "','" & Sch_Day.Text & "','" & Sch_Time.Text & "','" & Sch_Duration.Text & "','" & Mob_No.Text & "','" & Mail_To.Text & "','" & Mail_CC.Text & "','" & Mail_Sub.Text & "','" & Mail_body.Text & "','" & Deactivate.Text & "')")
            MesgBox("inserted")
            Response.Redirect(Request.Url.AbsoluteUri)
        Catch ex As Exception

        End Try
    End Sub

End Class