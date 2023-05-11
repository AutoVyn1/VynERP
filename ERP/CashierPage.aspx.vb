Imports System.Data.SqlClient

Public Class CashierPage
    Inherits System.Web.UI.Page
    Private ReadOnly con As New Connection
    'Private ReadOnly com As New SqlCommand
    'Private ReadOnly dt As New DataTable
    'Private ReadOnly discaprvl As DataTable
    'Private ReadOnly adp As New SqlDataAdapter

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        cashLedg.Text = Session("cashCode")
        Dim fetchLedgName = Convert.ToString(con.ExecuteScaler("select max(Ledg_Name) from Ledg_Mst where Ledg_Code in( ( '" + cashLedg.Text + "')) and export_type <3 "))
        cashLedg.Text = Convert.ToString(fetchLedgName)
    End Sub

    Public Sub MesgBox(ByVal sMessage As String)
        Dim sb As New System.Text.StringBuilder
        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('" & sMessage & "')", True)
    End Sub

    Protected Sub Submitcash_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Submitcash.Click
        Try
            If (Valid() = True) Then
                con.TSql("INSERT INTO DBO.cash_dtl VALUES('" + cashier_id.Text + "','" + ledg_code.Text + "','" + enterdate.Text + "','" + amount.Text + "','" + cnt_2000.Text + "','" + amt_2000.Text + "','" + total_2000.Text + "','" + cnt_500.Text + "','" + amt_500.Text + "','" + total_500.Text + "','" + cnt_200.Text + "','" + amt_200.Text + "','" + total_200.Text + "','" + cnt_100.Text + "','" + amt_100.Text + "','" + total_100.Text + "','" + cnt_50.Text + "','" + amt_50.Text + "','" + total_50.Text + "','" + cnt_20.Text + "','" + amt_20.Text + "','" + total_20.Text + "','" + cnt_10.Text + "','" + amt_10.Text + "','" + total_10.Text + "','" + total_bal.Text + "')")
                MesgBox("inserted")
                cashier_id.Text = ""
                ledg_code.Text = ""
                amount.Text = ""
                amt_2000.Text = " "
                amt_500.Text = " "
                amt_200.Text = " "
                amt_100.Text = " "
                amt_50.Text = " "
                amt_20.Text = " "
                amt_10.Text = " "
                total_2000.Text = " "
                total_500.Text = " "
                total_200.Text = " "
                total_100.Text = " "
                total_50.Text = " "
                total_20.Text = " "
                total_10.Text = " "
                total_bal.Text = " "
            End If

        Catch ex As Exception
            MesgBox("not inserted")
        End Try
    End Sub
    Private Sub Total_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Total.Click
        CompareAmount()
        'AddValue()
    End Sub

    Private Sub AddValue()
        Dim a = cnt_2000.Text
        Dim tot = Convert.ToString(a) * amt_2000.Text
        total_2000.Text = tot.ToString()
        Dim b As Integer = Integer.Parse(cnt_500.Text)
        Dim tot1 As String = Convert.ToString(b * Integer.Parse(amt_500.Text))
        total_500.Text = tot1.ToString()
        Dim c As Integer = Integer.Parse(cnt_200.Text)
        Dim tot2 As String = Convert.ToString(c * Integer.Parse(amt_200.Text))
        total_200.Text = tot2.ToString()
        Dim d As Integer = Integer.Parse(cnt_100.Text)
        Dim tot3 As String = Convert.ToString(d * Integer.Parse(amt_100.Text))
        total_100.Text = tot3.ToString()
        Dim f As Integer = Integer.Parse(cnt_50.Text)
        Dim tot4 As String = Convert.ToString(f * Integer.Parse(amt_50.Text))
        total_50.Text = tot4.ToString()
        Dim g As Integer = Integer.Parse(cnt_20.Text)
        Dim tot5 As String = Convert.ToString(g * Integer.Parse(amt_20.Text))
        total_20.Text = tot5.ToString()
        Dim h As Integer = Integer.Parse(cnt_10.Text)
        Dim tot6 As String = Convert.ToString(h * Integer.Parse(amt_10.Text))
        total_10.Text = tot6.ToString()

        Dim sum, sum1, sum2, sum3, sum4, sum5, sum6, maintotal As Integer
        sum = Convert.ToInt32(tot)
        sum1 = Convert.ToInt32(tot1)
        sum2 = Convert.ToInt32(tot2)
        sum3 = Convert.ToInt32(tot3)
        sum4 = Convert.ToInt32(tot4)
        sum5 = Convert.ToInt32(tot5)
        sum6 = Convert.ToInt32(tot6)
        maintotal = sum + sum1 + sum2 + sum3 + sum4 + sum5 + sum6
        total_bal.Text = maintotal.ToString()
    End Sub

    Private Sub CompareAmount()
        If (total_bal.Text = amount.Text) Then
            MesgBox("Amount Compared and data will be send")
        Else
            MesgBox("Amount doesn't Compared")
        End If
    End Sub

#Disable Warning IDE0052 ' Remove unread private members
    Private errorMsg As String = ""
#Enable Warning IDE0052 ' Remove unread private members
    Private Function Valid() As Boolean
        errorMsg = ""
        Dim IsOk As Boolean = True

        If String.IsNullOrEmpty(amount.Text) Then
            IsOk = False
            errorMsg += "Amount is blank!" & Environment.NewLine
            MesgBox("Please fill amount field")
            amount.Focus()
        ElseIf String.IsNullOrEmpty(cashier_id.Text) Then
            IsOk = False
            errorMsg += "Csahier id is blank!" & Environment.NewLine
            MesgBox("Please fill Cashier Id field")
            cashier_id.Focus()
        ElseIf String.IsNullOrEmpty(ledg_code.Text) Then
            IsOk = False
            errorMsg += "Ledger Code is blank!" & Environment.NewLine
            MesgBox("Please fill Ledger Code field")
            ledg_code.Focus()
        Else
        End If

        Return IsOk
    End Function
End Class