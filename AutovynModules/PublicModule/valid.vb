Module Valid

    '    Public Function SqlDate(ByVal Datestr As String)
    '        Try
    '            Dim Mydate As String = "'" + CDate(Datestr).ToString("yyyy-MM-dd") + "'"
    '            Return Mydate
    '        Catch ex As Exception

    '        End Try

    '#Disable Warning BC42105 ' Function doesn't return a value on all code paths
    '    End Function
    '#Enable Warning BC42105 ' Function doesn't return a value on all code paths

    Public Function decimalValue(ByVal dotValue As Double) As Object
        Dim value As String = dotValue
        Try
#Disable Warning BC42322
            value = Format(dotValue, "#0.00")

#Enable Warning BC42322
        Catch ex As Exception

        End Try
        Return value
#Disable Warning BC42105 ' Function doesn't return a value on all code paths
    End Function
#Enable Warning BC42105 ' Function doesn't return a value on all code paths

    Private Function SqlDate(ByVal MyDate As String)

        Dim RetVal As String = ""
        If MyDate.Trim = "" Then Return ""
        Try
            If MyDate <> "  /  /" Then
                RetVal = "'" + CDate(MyDate).ToString("yyyy/MM/dd") + "'"
            Else
                RetVal = "Null"
            End If
        Catch ex As Exception
            RetVal = "'" + CDate(MyDate).ToString(" ") + "'"
        End Try

        Return RetVal

    End Function

    'Public Sub MesgBox(ByVal sMessage As String)
    '    Dim sb As New System.Text.StringBuilder
    '    sb.Append("<script>")
    '    sb.Append("windows.onload=function() {")
    '    sb.Append("alert('" & sMessage & "')}")
    '    sb.Append("</script>")
    'End Sub

End Module
