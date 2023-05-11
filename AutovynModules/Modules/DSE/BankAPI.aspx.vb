Public Class BankAPI
    Inherits System.Web.UI.Page
    Private con As New Connection
    Private dt As New DataTable

    Private Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Dim showhideDiv As HtmlControl = CType(Me.FindControl("showhide"), HtmlControl)
        'showhideDiv.Style("display") = "none"
        Try
            If Not IsPostBack Then

            End If
            If Session("user_name") = "" Then
                Response.Redirect("../../../Default.aspx")
            End If
        Catch ex As Exception

        End Try
    End Sub

    Public Sub MesgBox(ByVal sMessage As String)
        Dim sb As New System.Text.StringBuilder
        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('" & sMessage & "')", True)
    End Sub

    Private Function RetMyArr(ByVal PymtMode As String) As String
        Dim RetVal As Integer = 0
        Try
            If PymtMode = "NEFT" Then RetVal = 12
            If PymtMode = "RTGS" Then RetVal = 22
            If PymtMode = "IMPS" Then RetVal = 12
            If PymtMode = "CMS" Then RetVal = 27
            If PymtMode = "Other" Then RetVal = 12
        Catch ex As Exception

        End Try
        Return RetVal
    End Function

    Private Sub ViewStatement_Clicked(ByVal sender As Object, ByVal e As System.EventArgs) Handles ViewStatement.Click
        Try
            findPymt(UTRNo.Text)
            Dim Len As Integer = RetMyArr(SearchBy.Text)
            Dim Amt As String = ""
            If UTRNo.Text.Trim.Length >= Len Then
                If dt.Rows.Count > 0 Then
                    BnkName.Text = dt.Rows(0)("BANK_NAME").ToString
                    Trans_ID.Text = dt.Rows(0)("TXN_NO").ToString
                    Trans_Date.Text = dt.Rows(0)("TXNDATE").ToString
                    Chq_No.Text = dt.Rows(0)("CHEQUENO").ToString
                    Dbt_Amt.Text = dt.Rows(0)("Debit").ToString + dt.Rows(0)("Credit").ToString
                    Bank_Narr.Text = dt.Rows(0)("REMARKS").ToString
                    StmtView.Text = "**--View Statement Of " + BnkName.Text.ToString + "--**"
                End If
            Else
                MesgBox("Invalid Parameter, Please Check and try again..!!")
            End If

            'Dim showhideDiv As HtmlControl = CType(Me.FindControl("showhide"), HtmlControl)
            'If showhideDiv IsNot Nothing Then
            '    If showhideDiv.Style("display") = "none" Then
            '        showhideDiv.Style("display") = "block"
            '    Else
            '        showhideDiv.Style("display") = "none"
            '    End If
            'End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub findPymt(Searchvalue As String)
        Try
            dt = con.ReturnDtTable("select * from API_BANK_STATEMENT where remarks like '%" & Searchvalue & "%'")
        Catch ex As Exception

        End Try
    End Sub

    Private Sub cancelBtn_Clicked(sender As Object, e As EventArgs) Handles CancelBtn.Click
        Try
            MesgBox("Are you Sure you want to exit!!")
            Response.Redirect("../../../LoginPage.aspx")
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Remark_TextChanged(sender As Object, e As EventArgs) Handles Remark.TextChanged
        Try
            If Remark.Text.Trim.Length < 20 Then
                RemarksMSG.Text = "Invalid User Remark!"
                PrintBtn.Enabled = False
            ElseIf Remark.Text.Trim.Length > 20 Then
                RemarksMSG.Text = ""
                PrintBtn.Enabled = True
            End If
        Catch ex As Exception

        End Try
    End Sub
End Class