Public Class Cashier
    Inherits System.Web.UI.Page

    Private con As New Connection
    Private dt As New DataTable


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            Dim fetchLedgName = Convert.ToString(con.ExecuteScaler("select max(Ledg_Name) from Ledg_Mst where Ledg_Code in(" & Session("cashCode") & ") and export_type <3 "))
            Cash_Ledg.Text = Convert.ToString(fetchLedgName)
            cashier_id.Text = Session("Log_code")
        Catch ex As Exception

        End Try


    End Sub

    Public Sub MesgBox(ByVal sMessage As String)
        Dim sb As New System.Text.StringBuilder
        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('" & sMessage & "')", True)
    End Sub

    Protected Sub Submitcash_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Submitcash.Click
        Try
            If (total_bal.Text = amount.Text) Then
                Dim ledg_code As String = "select ledg_name,ledg_code from Ledg_Mst where ledg_code=" & Session("Log_code") & ""
                dt = con.ReturnDtTable(ledg_code)
                Dim saveCode As String = dt.Rows(0)("ledg_code").ToString
                If (Valid() = True) Then
                    Dim str As String = "Cash_Ledg, Acnt_Date, Opening_Bal, Note_2000,Qty_2000, Note_500,Qty_500, Note_200,Qty_200, Note_100,Qty_100, Note_50,Qty_50, Note_20,Qty_20, Note_10,Qty_10,Day_Close"
                    Dim qry As String = "INSERT INTO cash_sheet (" & str & ") VALUES ('" & saveCode & "','" & enterdate.Text & "','" & amount.Text & "','" & amt_2000.Text & "','" & total_2000.Text & "','" & amt_500.Text & "','" & total_500.Text & "','" & amt_200.Text & "','" & total_200.Text & "','" & amt_100.Text & "','" & total_100.Text & "','" & amt_50.Text & "','" & total_50.Text & "','" & amt_20.Text & "','" & total_20.Text & "','" & amt_10.Text & "','" & total_10.Text & "','" & total_bal.Text & "')"
                    con.TSql(qry)
                    Response.Redirect(Request.Url.AbsoluteUri)
                    Response.Redirect("../../DefaultPage/DefaultPage.aspx")
                End If
            Else
                MesgBox("Total Amount doesn't Match")
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private errorMsg As String = ""

    Private Function Valid() As Boolean
        errorMsg = ""
        Dim IsOk As Boolean = True

        If String.IsNullOrEmpty(amount.Text) Then
            IsOk = False
            errorMsg &= "Amount is blank!" & Environment.NewLine
            MesgBox("Please fill amount field")
            amount.Focus()
            'ElseIf String.IsNullOrEmpty(cashier_id.Text) Then
            '    IsOk = False
            '    errorMsg &= "Csahier id is blank!" & Environment.NewLine
            '    MesgBox("Please fill Cashier Id field")
            '    cashier_id.Focus()
            'ElseIf String.IsNullOrEmpty(ledg_code.Text) Then
            '    IsOk = False
            '    errorMsg &= "Ledger Code is blank!" & Environment.NewLine
            '    MesgBox("Please fill Ledger Code field")
            '    ledg_code.Focus()
        Else
        End If

        Return IsOk
    End Function
End Class