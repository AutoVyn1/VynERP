Imports System
Imports System.Net
Imports System.Text

Module WA_TEST_MODULE
    'Private CON As New ConClass
    Public WA_Mob, WA_MSG, WA_KEY, WA_Instance, WA_Image As String
    Public MAIL_ID, MAIL_SUB As String
    Public Sub WAMSG()
        Dim WebRequest As HttpWebRequest
        'WA_Mob = "919799318629"
        'MAIL_ID = "yuvraj@autovyn.com"
        Dim instance_id As String = WA_Instance
        Dim token As String = WA_KEY
        Dim mobile_number As String = WA_Mob
        '  Dim ultramsgApiUrl As String = "https://app.nationalbulksms.com/api/send-text.php?number=" & WA_Mob & "&msg=" & WA_MSG & "&apikey=" & WA_KEY & "&instance=" & WA_Instance & ""
        Dim ultramsgApiUrl As String = "https://app.nationalbulksms.com/api/send-text.php?"

        If WA_Image <> "" Then
            ultramsgApiUrl = "https://app.nationalbulksms.com/api/send-media.php?"
            WA_Image = "&media=" & WA_Image & ""
        End If

        WebRequest = HttpWebRequest.Create(ultramsgApiUrl)

        WA_KEY = "b7bb5cecab0f94922762b271ffec8f04db5437ce"
        WA_Instance = "U4MBhWGZxQuitP1"
        Dim MyWA_MSG As String = WA_MSG
        MyWA_MSG += vbNewLine + vbNewLine + "{AUTOVYN-ERP}"

        MyWA_MSG = MyWA_MSG.Replace("""", "").Replace("'", "").Replace("&", "-").Trim
        Dim postdata As String = "number=" & WA_Mob & "&msg=" & MyWA_MSG & "" & WA_Image & "&apikey=" & WA_KEY & "&instance=" & WA_Instance & ""

        Dim enc As UTF8Encoding = New System.Text.UTF8Encoding()
        Dim postdatabytes As Byte() = enc.GetBytes(postdata)
        WebRequest.Method = "POST"
        WebRequest.ContentType = "application/x-www-form-urlencoded"
        'WebRequest.GetRequestStream().Write(postdatabytes)
        WebRequest.GetRequestStream().Write(postdatabytes, 0, postdatabytes.Length)
        Dim ret As New System.IO.StreamReader(WebRequest.GetResponse().GetResponseStream())
        Console.WriteLine(ret.ReadToEnd())

        ' CON.TSql("Insert into WA_HST values (1,'" & WA_Mob & "','" & MyWA_MSG & "'," & DbPath.Log_code & "," & QueryDate(Now.ToString("dd/MM/yy")) & "," & Now.ToString("HH.mm") & ")")
        '     CON.TSql("Update WA_HST set WA_ACNTID="&  &" where 

        'If MAIL_ID <> "" Then EMAILSENDER("", MAIL_SUB, MAIL_ID,,, WA_MSG)
    End Sub
End Module
