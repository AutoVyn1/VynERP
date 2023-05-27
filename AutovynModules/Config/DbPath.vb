Imports System.Configuration
Imports System.Data.SqlClient


Public Class DbPath

    Public Shared Log_code As Integer, login_name As String, QueryLoc As String, EmpPos As Integer, CompCode As String, CompName As String, login_color As String, FYear As String, CompHeading As String, Browser_Name As String, Primary_key As String, frmMode As String, Ver_Release As String = ""
    Public Shared ServerPath As String, HOPath As String, LocPath As String, ImgPath As String, MstPath As String, SelectedYear As String, DbDrive As String
    Public Shared SQLInstance As String, HOSQLInstance As String, SQLPWD, OldDbPath As String, DbName As String, DBDriveName As String = "", DBPrefix As String = "I", DbId As String = "001DB"
    Public Shared DateFrom, DateUpto, week As String
    Dim loginpage As New LoginPage


    Public Sub GetLocalDbPath()
        Dim MyClientId As String = ""

        If Not LoginPage.clientid Is Nothing Then
            'MyClientId = LoginPage.clientid.Replace(".", "").Trim
            MyClientId = HttpContext.Current.Session("client_id").Replace(".", "").Trim

        Else
            Exit Sub
            '   HttpContext.Current.Response.Redirect("AutovynModules/Credintial/LoginPage.aspx")
            '  Response.Redirect("../../DefaultPage/DefaultPage.aspx")
        End If

        If LoginPage.clientid = "" Then
            'HttpContext.Current.Response.Redirect("AutovynModules/Credintial/LoginPage.aspx")
            Exit Sub
        End If
        Dim f() As String = System.Environment.GetCommandLineArgs
        Dim UID As String = "aadil"
        SQLPWD = "aadil@#5010"
        SQLInstance = "103.74.65.22,4650"
        DbName = "OM02DB21"
        LocPath = "Data Source=" & SQLInstance & ";Initial Catalog=" & DbName & ";User ID=" & UID & ";Password=" & SQLPWD & ""
        LocPath = ConfigurationManager.ConnectionStrings("" & MyClientId & "").ConnectionString
        'Create a new instance of the SqlConnectionStringBuilder class
        Dim builder As New SqlConnectionStringBuilder(ConfigurationManager.ConnectionStrings("" & MyClientId & "").ConnectionString)

        'Extract the data from the connection string and store them in separate variables
        SQLInstance = builder.DataSource
        DbName = builder.InitialCatalog

        SelectedYear = FYear
    End Sub

    Public Sub GetServerDbPath(ByVal fYear As String)
        SelectedYear = fYear
    End Sub

    Public Sub New()
        Try
            GetLocalDbPath()
        Catch ex As Exception

        End Try

    End Sub


End Class
