Public Class SalesDiscountApprovalReport
    Inherits System.Web.UI.Page
    Private con As New Connection
    Private dt As New DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Not IsPostBack Then
                date_form.Text = "01/" & Now.ToString("MM/yyyy")
                date_upto.Text = Now.ToString("dd/MM/yyyy")
            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Saleshow_Click(sender As Object, e As EventArgs) Handles Saleshow.Click
        Try
            dt = con.ReturnDtTable("
 SET DATEFORMAT dmy select 0 as Srno, cust_name,Mob,(select godw_name from Godown_Mst where Godown_Mst.Godw_Code=location) as Branch,
(select top 1 misc_name from misc_mst where misc_type=14 and misc_code=Modl_Var) as Modl_Var, 
status,remark from dise_aprvl where curr_Date between '" & SqlDate(date_form.Text) & "' and '" & SqlDate(date_upto.Text) & "' ")

            'and status='" & appr_status.Text & "'

            For i As Integer = 0 To dt.Rows.Count - 1
                dt.Rows(i)("srNo") = i + 1
            Next
            sales_Data.DataSource = dt
            sales_Data.DataBind()
        Catch ex As Exception

        End Try
    End Sub

End Class