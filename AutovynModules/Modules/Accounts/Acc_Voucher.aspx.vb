Public Class Acc_Voucher1
    Inherits System.Web.UI.Page
    Private con As New Connection
    Private dt As New DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Not IsPostBack Then
                book_name_list()
                Cash_Bank_list()
                Ledg_acc_list()
                Post_branch_list()
                Instument_type_list()
            End If
            If Session("user_name") = "" Then
                Response.Redirect("../../../Default.aspx")
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub book_name_list()
        Try
            dt = con.ReturnDtTable("select top 100 book_code,book_name from book_mst")
            Book_name.DataSource = dt
            Book_name.DataTextField = "book_name"
            Book_name.DataValueField = "book_code"
            Book_name.DataBind()
        Catch ex As Exception

        End Try
    End Sub

    Private Sub Cash_Bank_list()
        Try
            dt = con.ReturnDtTable("select misc_name, misc_code from misc_mst where misc_type=59")
            CashbankAcc.DataSource = dt
            CashbankAcc.DataTextField = "misc_name"
            CashbankAcc.DataValueField = "misc_code"
            CashbankAcc.DataBind()
        Catch ex As Exception

        End Try
    End Sub

    Private Sub Ledg_acc_list()
        Try
            dt = con.ReturnDtTable("select top 500 ledg_name,ledg_code from ledg_mst")
            Ledg_acc.DataSource = dt
            Ledg_acc.DataTextField = "ledg_name"
            Ledg_acc.DataValueField = "ledg_code"
            Ledg_acc.DataBind()
        Catch ex As Exception

        End Try
    End Sub

    Private Sub Post_branch_list()
        Try
            dt = con.ReturnDtTable("select godw_name, godw_code from godown_mst")
            Post_branch.DataSource = dt
            Post_branch.DataTextField = "godw_name"
            Post_branch.DataValueField = "godw_code"
            Post_branch.DataBind()
        Catch ex As Exception

        End Try
    End Sub
    Private Sub Instument_type_list()
        Try
            dt = con.ReturnDtTable("select misc_name,misc_code from misc_mst where misc_type=39")
            Inst_type.DataSource = dt
            Inst_type.DataTextField = "misc_name"
            Inst_type.DataValueField = "misc_code"
            Inst_type.DataBind()
        Catch ex As Exception

        End Try
    End Sub

End Class