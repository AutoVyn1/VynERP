Imports System.Globalization

Module PublicModule
    'Public Function SqlDate(ByVal str As String) As String
    '    ' "'," & IIf(Phy_Date.Text = "  /  /", "Null", "'" + Phy_Date.Text + "'") & _
    '    'If (str <> "  /  /" And str <> "  /  /" And str <> "") Then
    '    '    Return "CDate('" + str + "')"
    '    'Else
    '    '    Return "Null"
    '    'End If
    '    If (str <> "  /  /" And str <> "  /  /" And str <> "") Then
    '        Return "'" + CDate(str).ToString("yyyy/MM/dd") + "'"
    '        'Return "CDate('" + str + "')"
    '    Else
    '        Return "Null"
    '    End If
    'End Function

    'Public Function SqlDate(ByVal MyDate As String)

    '    Dim RetVal As String = ""
    '    If MyDate.Trim = "" Then Return ""
    '    Try
    '        If MyDate <> "  /  /" Then
    '            RetVal = "'" + CDate(MyDate).ToString("yyyy/MM/dd") + "'"
    '        Else
    '            RetVal = "Null"
    '        End If
    '    Catch ex As Exception
    '        RetVal = "'" + CDate(MyDate).ToString(" ") + "'"
    '    End Try

    '    Return RetVal




    'End Function

    Public Function SqlDate(ByVal MyDate As String)

        Dim culture As New CultureInfo("en-GB") ' Use UK date format
        Dim dateValue As DateTime
        If DateTime.TryParse(MyDate, culture, DateTimeStyles.None, dateValue) Then
            Return dateValue.ToString("MM/dd/yy")
        Else
            Return Nothing
        End If

    End Function



End Module
