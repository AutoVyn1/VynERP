Public Class LoginPage
    Inherits System.Web.UI.Page
    Public Shared newstring As String
    Public Shared clientid As String
    Public Shared locpath1 As String


    Private Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Session("user_name") = ""
        newstring = Session("user_name")
        If Not IsPostBack Then

        End If
    End Sub



    Public Sub MesgBox(ByVal sMessage As String)
        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('" & sMessage & "')", True)
    End Sub

    'Public Sub New()
    '    new_session()
    'End Sub

    'Private Function RetMyArr(ByVal PymtMode As String) As Integer
    '    Dim RetVal As Integer
    '    Try
    '        If PymtMode = "True Value" Then RetVal = 4
    '        If PymtMode = "Retail" Then RetVal = 5
    '        If PymtMode = "Payroll" Then RetVal = 6
    '        If PymtMode = "DSE" Then RetVal = 9
    '        If PymtMode = "Financier" Then RetVal = 10
    '        If PymtMode = "Insurance" Then RetVal = 11
    '    Catch ex As Exception

    '    End Try
    '    Return RetVal
    'End Function

    'Public Sub new_session()
    '    If Dealer_ID.Text <> "" Then
    '        HttpContext.Current.Session(client_session_key) = Dealer_ID.Text
    '    End If
    'End Sub



    Private Sub loginBtn_Click(sender As Object, e As EventArgs) Handles loginBtn.Click
        Try
            HttpContext.Current.Session("client_id") = Dealer_ID.Text
            If Dealer_ID.Text <> "" And User_Name.Text <> "" And inputPassword.Text <> "" Then
                clientid = Dealer_ID.Text
                QueryInit("BRANCH_MST")
                QueryInit("CHASSIS_MST")
                QueryInit("FINANCE_MST")
                QueryInit("COLOR_MST")
                QueryInit("LOAN_MST")
                QueryInit("VEH_MST")
                QueryInit("EMPLOYEEMASTER")
                QueryInit("MODEL_MST")
                QueryInit("STATE_MST")
                QueryInit("OLDCHASS_NO")


                If Dealer_ID.Text = "OMPL" Or Dealer_ID.Text = "ompl" Then
                    Session("Dlr_name") = "Ocean Motor Pvt. Ltd."

                ElseIf Dealer_ID.Text = "PMPL" Or Dealer_ID.Text = "pmpl" Then
                    Session("Dlr_name") = "Platinum Motor Pvt. Ltd."
                ElseIf Dealer_ID.Text = "BMPL" Or Dealer_ID.Text = "bmpl" Then
                    Session("Dlr_name") = "Bhatia Motors Pvt. Ltd."
                End If

                Dim dt1 As DataTable
                Dim Con As New Connection

                Con = New Connection
                Dim dt As DataTable
                dt = Con.ReturnDtTable("Select * from user_cloud where Export_Type<3 and user_name='" & User_Name.Text & "' and user_pass='" & inputPassword.Text & "' and isactive='Y'")

                'dt1 = Con.ReturnDtTable(" Select * from database_testing_connection where  user_name='" & User_Name.Text & "' and password='" & inputPassword.Text & "'")

                If dt.Rows.Count > 0 Then
                    Session("user_name") = User_Name.Text
                    Session("Log_code") = dt.Rows(0)("User_Code").ToString
                    Session("login_name") = dt.Rows(0)("user_name").ToString
                    Session("QueryLoc") = dt.Rows(0)("MULTI_LOC").ToString
                    newstring = Session("user_name")

                Else

                End If

                'If dt1.Rows.Count > 0 Then
                '    Session(" data_source") = dt1.Rows(0)(" dbData_Source")
                '    Session(" int_cat") = dt1.Rows(0)(" dbinitial_catalog")
                '    Session(" user_id") = dt1.Rows(0)(" dbuser_id")
                '    Session(" pwd") = dt1.Rows(0)(" dbpassword")
                '    Session(" intsec") = dt1.Rows(0)(" integerated_sec")

                'locpath1 = " Data Source=" & Session(" data_source") & ";Initial Catalog=" & Session("int_cat") & ";User ID=" & Session("user_id") & ";Password=" & Session("pwd") & ";Integrated Security=" & Session("intsec") & ""


                'Else
                '    newstring = ""
                'End If

                Response.Redirect("Loader.aspx")


            Else
                '  MsgBox("")
            End If

        Catch ex As Exception

        End Try

    End Sub



    Private Sub app_Click(sender As Object, e As EventArgs) Handles hide.Click
        Response.Redirect("../../EMP_A/Credintials/Index.aspx")
    End Sub
End Class