Imports System.Data.SqlClient

Public Class Connection

    Public SqlCon As New SqlConnection
    Private com As New SqlCommand
    Private ReadOnly com1 As New SqlCommand
    Private comb As New SqlCommandBuilder
    Private adp As New SqlDataAdapter
    'Private sdr As SqlDataReader
    'Private tran As SqlTransaction
    'Private ds As New DataSet
    'Private dt As New DataTable
    Private _strCurrentTableName As String

    Public Sub New()
        Dim DbPath As New DbPath
        Dim dbpath2 As New LoginPage
        Dim cond1 As String
        Dim locpaths As String

        cond1 = LoginPage.newstring
        locpaths = LoginPage.locpath1



        'If String.IsNullOrEmpty(cond1) Then
        '    setInitialValue(DbPath.LocPath)
        'Else
        '    setInitialValue1(locpaths)
        'End If

        setInitialValue(DbPath.LocPath)
    End Sub

    Private Sub setInitialValue(ByVal ConPath As String)

        Try
            'If (SqlCon.State = ConnectionState.Closed) Then
            SqlCon = New SqlConnection(ConPath)
            SqlCon.Open()
            com = New SqlCommand
            com.Connection = SqlCon
            com.CommandType = CommandType.Text
            comb = New SqlCommandBuilder
            comb.RefreshSchema()
            adp = New SqlDataAdapter
            adp.SelectCommand = com
            'End If
        Catch ex As Exception

        End Try

    End Sub

    Private Sub setInitialValue1(ByVal ConPath As String)

        Try

            SqlCon = New SqlConnection(ConPath)
            SqlCon.Open()
            com = New SqlCommand
            com.Connection = SqlCon
            com.CommandType = CommandType.Text
            comb = New SqlCommandBuilder
            comb.RefreshSchema()
            adp = New SqlDataAdapter
            adp.SelectCommand = com

        Catch ex As Exception

        End Try

    End Sub



    Public Sub ConClose()
        Try
            If (SqlCon.State = ConnectionState.Open) Then
                SqlCon.Close()

            End If
        Catch ex As Exception

        End Try
    End Sub

    Public Sub TSql(ByVal qstr As String)
        Try
            If (SqlCon.State = ConnectionState.Closed) Then
                SqlCon.Open()
            End If
            com.CommandText = qstr
            com.ExecuteNonQuery()
        Catch ex As Exception

        End Try
    End Sub


    Public Function ReturnDtTable(ByVal qstr As String) As DataTable
        Try
            If (SqlCon.State = ConnectionState.Closed) Then
                SqlCon.Open()
            End If
            Dim sqlCom As New SqlCommand(qstr, SqlCon)
            adp.SelectCommand = sqlCom
            Dim ds As New DataSet
            adp.Fill(ds, "temp_dt")
            Return ds.Tables("temp_dt")

        Catch ex As Exception

        End Try
#Disable Warning
    End Function
#Disable Warning
    Public Function ExecuteScaler(ByVal aggr As String) As Object
        Try
            If (SqlCon.State = ConnectionState.Closed) Then
                SqlCon.Open()
            End If
            com.CommandText = aggr
            com.CommandType = CommandType.Text
            Return com.ExecuteScalar
        Catch ex As Exception

        End Try

    End Function


    Public Function Delbtn(ByVal aggr As String) As Object
        Try
            If (SqlCon.State = ConnectionState.Closed) Then
                SqlCon.Open()
            End If
            com.CommandText = aggr
            com.CommandType = CommandType.Text
            Return com1.CommandText
        Catch ex As Exception

        End Try
#Disable Warning
    End Function
#Disable Warning

    Public Function Fillds(ByVal ssql As String, ByVal tblname As String) As DataSet
        Try
            _strCurrentTableName = "TBL" + Guid.NewGuid().ToString().Replace("-", "").Trim
            If (SqlCon.State = ConnectionState.Closed) Then
                SqlCon.Open()
            End If

            'ssql = "Select Misc_Code,Misc_Name,80,Misc_Type,5,Misc_HOD,5 from Misc_Mst where Export_type<3 and misc_type=51"
            With com
                .CommandText = ssql
                .CommandType = CommandType.Text
                '.Transaction = tran
                .Connection = SqlCon
            End With

            adp.Fill(Gds, tblname)
            ' dt = Gds.Tables(tblname)

            Return Gds

        Catch ExSql As SqlClient.SqlException
            ' MsgBox(ExSql.Message, MsgBoxStyle.Critical, "[" & ExSql.Source & Title & "]")
            Return Gds
        Catch Ex As Exception
            'MsgBox(Ex.Message, MsgBoxStyle.Critical, "[" & Ex.Source & Title & "]")
            Return Gds
        Finally
            ' SqlCon.Close()
        End Try
    End Function


End Class
