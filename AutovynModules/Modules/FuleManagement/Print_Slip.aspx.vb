Public Class Print_Slip
    Inherits System.Web.UI.Page
    Private con As New Connection
    Private dt As New DataTable
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim dt1 As DataTable = con.ReturnDtTable("select tran_type from fuel_predict where seq='" + Session("fuel_inv") + "'")
        Dim validator As String = dt1.Rows(0)("tran_type").ToString
        If validator = 1 Then
            Try
                Dim dt As DataTable = con.ReturnDtTable("select * from fuel_predict where seq='" + Session("fuel_inv") + "'")
                slipno.Text = dt.Rows(0)("seq").ToString
                slipdate.Text = dt.Rows(0)("form_date").ToString
                dmsno.Text = dt.Rows(0)("dms_inv_no").ToString

                deldate.Text = dt.Rows(0)("del_date").ToString
                gpno.Text = dt.Rows(0)("gatepass_no").ToString
                gpdate.Text = dt.Rows(0)("gatepass_date").ToString
                ftype.Text = dt.Rows(0)("fuel_type").ToString
                fqty.Text = dt.Rows(0)("qty").ToString
                print_date.Text = DateTime.Now.ToString()
            Catch ex As Exception

            End Try
        ElseIf validator = 2 Then
            Dim dt As DataTable = con.ReturnDtTable("select * from fuel_predict where seq='" + Session("fuel_inv") + "'")
            dms_inv.Text = "Reg. No."
            deldate1.Text = "From"
            gpno1.Text = "To"
            gpdate1.Text = "Driver Name"

            slipno.Text = dt.Rows(0)("seq").ToString
            slipdate.Text = dt.Rows(0)("form_date").ToString
            dmsno.Text = dt.Rows(0)("reg_no").ToString
            deldate.Text = dt.Rows(0)("loc_from").ToString
            gpno.Text = dt.Rows(0)("loc_to").ToString
            gpdate.Text = dt.Rows(0)("driv_name").ToString
            ftype.Text = dt.Rows(0)("fuel_type").ToString
            fqty.Text = dt.Rows(0)("qty").ToString
            print_date.Text = DateTime.Now.ToString()

        End If

    End Sub
End Class
