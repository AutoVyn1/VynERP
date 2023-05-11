Public Class WorkshopDiscount
    Inherits System.Web.UI.Page
    Private con As New Connection
    Private dt As New DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            Branch_list()
            Modl_Var_list()
            curr_date.Text = Now.ToString("dd") + "/" + Now.ToString("MM") + "/" + Now.ToString("yyyy")
        Catch ex As Exception

        End Try
    End Sub

    Private Sub Branch_list()
        Try
            dt = con.ReturnDtTable("Select godw_Name,Godw_Code from Godown_Mst where Export_type<3  order by godw_code")
            dt.Rows.Add()
            dt.Rows(dt.Rows.Count - 1)("Godw_Code") = 0
            dt.Rows(dt.Rows.Count - 1)("godw_Name") = "Select"
            dt = dt.Select("Godw_Code>=0", "Godw_Code").CopyToDataTable
            branch.DataSource = dt
            branch.DataTextField = "godw_Name"
            branch.DataValueField = "Godw_Code"
            Session("Br_code") = branch.SelectedValue
            branch.DataBind()
        Catch ex As Exception

        End Try
    End Sub

    Private Sub Modl_Var_list()
        Try
            dt = con.ReturnDtTable("select misc_name, misc_code from misc_mst where misc_type=14")
            dt.Rows(dt.Rows.Count - 1)("misc_code") = 0
            dt.Rows(dt.Rows.Count - 1)("misc_name") = "Select"
            dt = dt.Select("isnull(misc_code,0)>=0", "misc_code").CopyToDataTable
            modl_varient.DataSource = dt
            modl_varient.DataTextField = "misc_name"
            modl_varient.DataValueField = "misc_code"
            modl_varient.DataBind()
        Catch ex As Exception

        End Try
    End Sub

    Private Sub MesgBox(ByVal sMessage As String)
        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('" & sMessage & "')", True)
    End Sub

    Private Sub Submit_Click(sender As Object, e As EventArgs) Handles Save_Data.Click
        Try
            con.TSql("INSERT INTO workshop_disc VALUES('" + cust_name.Text + "','" + Mobile_no.Text + "'," + SqlDate(curr_date.Text) + ",'" + email.Text + "','" + job_card.Text + "','" + bill_no.Text + "','" + inv_type.Text + "','" + Session("Br_code") + "','" + service_ad.Text + "' ,'" + modl_varient.Text + "','" + disc_type.Text + "','" + inv_val.Text + "','" + disc_amt.Text + "','" + disc_reason.Text + "','" + appr_name.Text + "','" + appr_amt.Text + "','" + appr_status.Text + "','" + remark.Text + "')")
            MesgBox("inserted")
            Response.Redirect(Request.Url.AbsoluteUri)
        Catch ex As Exception
            MesgBox("not inserted")
        End Try

    End Sub
End Class