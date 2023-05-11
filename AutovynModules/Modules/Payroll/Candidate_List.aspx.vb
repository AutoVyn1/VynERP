Public Class Candidate_List
    Inherits System.Web.UI.Page
    Private con As New Connection
    Public dt As New DataTable
    Public Mydt As New DataTable


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'dt = con.ReturnDtTable("select Candidate_Code,CANDIDATE_NAME,Email,Position,Expected_Salary,Location,Last_Designation from Interview_Mst")
        'Candidates.DataSource = dt
        'Candidates.DataBind()
        'CurrentTable = dt
    End Sub

    Private Property CurrentTable As DataTable
        Get
            Return TryCast(ViewState("CurrentTable"), DataTable)
        End Get
        Set(value As DataTable)
            ViewState("CurrentTable") = value
        End Set
    End Property

    Protected Sub Candidates_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles Candidates.RowDataBound
        If e.Row.RowType = DataControlRowType.Header Then
            ' Modify the column header text
            e.Row.Cells(0).Text = "Select"
            e.Row.Cells(1).Text = "Candidate Code"
            e.Row.Cells(2).Text = "Candidate Name"
            e.Row.Cells(3).Text = "Email"
            e.Row.Cells(4).Text = "Position"
            e.Row.Cells(5).Text = "Expexted Salary"
            e.Row.Cells(6).Text = "Location"
            e.Row.Cells(7).Text = "Last designation"
        End If
    End Sub

    Private Sub loadvalues()
        dt = con.ReturnDtTable("select * from Interview_Mst where Candidate_Code='" + Cand_code.Text + "' ")
        If dt.Rows.Count > 0 Then
            Cand_name.Text = dt.Rows(0)("CANDIDATE_NAME").ToString
            mobile.Text = dt.Rows(0)("Mobile_No").ToString
            email.Text = dt.Rows(0)("Email").ToString
            positionap.Text = dt.Rows(0)("Position").ToString
            positionpre.Text = dt.Rows(0)("Last_Designation").ToString
            location.Text = dt.Rows(0)("Location").ToString
            Crctc.Text = dt.Rows(0)("Last_Salary").ToString
            Exctc.Text = dt.Rows(0)("Expected_Salary").ToString
            tot_exp.Text = dt.Rows(0)("Tot_Exp").ToString
            ind_exp.Text = dt.Rows(0)("Tot_Ind_Exp").ToString
            pre_comp.Text = dt.Rows(0)("Pre_Comp1").ToString
            manager.Text = dt.Rows(0)("Last_Mgr_Name").ToString
            manager_mob.Text = dt.Rows(0)("Last_Mgr_mob").ToString
            intr_name.Text = dt.Rows(0)("intr_name").ToString
            Hr_status.Text = dt.Rows(0)("hr_status").ToString
            Hr_date.Text = dt.Rows(0)("hr_date").ToString
            hr_remark.Text = dt.Rows(0)("hr_remark").ToString
            Hod_name.Text = dt.Rows(0)("hod_name").ToString
            Hod_status.Text = dt.Rows(0)("hod_status").ToString
            Hod_date.Text = dt.Rows(0)("hod_date").ToString
            hod_remr.Text = dt.Rows(0)("hod_remark").ToString

        End If
    End Sub

    Private Sub valueSearch(value As String)
        dt = con.ReturnDtTable("select Candidate_Code,CANDIDATE_NAME,Email,Position,Expected_Salary,Location,Last_Designation from Interview_Mst where concat(Candidate_Code,CANDIDATE_NAME) like '%" & value & "%'")
        Candidates.DataSource = dt
        Candidates.DataBind()
        CurrentTable = dt
    End Sub

    'search
    Protected Sub search_Click(ByVal sender As Object, ByVal e As EventArgs) Handles search.Click
        valueSearch(searchbox.Text)
    End Sub


    Protected Sub Candidates_SelectedIndexChanged(sender As Object, e As EventArgs) Handles Candidates.SelectedIndexChanged
        Cand_code.Text = Candidates.SelectedRow.Cells(1).Text
        Session("TempVariable") = Candidates.SelectedRow.Cells(1).Text
        loadvalues()
        resumme_load()
    End Sub

    Protected Sub Candidates_PageIndexChanging(ByVal sender As Object, ByVal e As GridViewPageEventArgs) Handles Candidates.PageIndexChanging
        Candidates.PageIndex = e.NewPageIndex
        ' Call the method to bind data to the GridView
        Candidates.DataSource = CurrentTable
        Candidates.DataBind()


    End Sub

    Protected Sub resumme_load()
        dt = con.ReturnDtTable("select * from interview_mst where Candidate_Code='" + Cand_code.Text + "' ")
        Mydt = con.ReturnDtTable("select DOC_NAME,DOC_PATH,columndoc_type from Candidate_Doc where EMP_CODE='" + Cand_code.Text + "' and columndoc_type='RESUME'")

        If Mydt.Rows.Count > 0 Then
            'Dim fileName1 As String = Mydt.Rows(0)("DOC_NAME").ToString
            Image1.ImageUrl = "~/Documents/" & Mydt.Rows(0)("DOC_NAME").ToString


            'Dim fileUrl1 As String = "~/Documents/" & fileName1
            'Image1.ImageUrl = fileUrl1
        Else
            Image1.ImageUrl = " "
        End If
    End Sub

    'Protected Sub print_Click(sender As Object, e As EventArgs) Handles print.Click
    '    If Cand_code.Text = "" Then
    '        MsgBox("please select the Candidate")
    '    Else
    '        Response.Redirect("Cystal_report/Candidate_Crystal_report.aspx")
    '    End If
    'End Sub

    Protected Sub update_Click1(sender As Object, e As EventArgs) Handles update.Click
        Try
            If Cand_code.Text = "" Then
                MsgBox("please select the Candidate")
            Else
                con.TSql("update Interview_Mst SET CANDIDATE_NAME = '" + Cand_name.Text + "',Mobile_No = '" + mobile.Text + "',email = '" + email.Text + "',Position = '" + positionap.Text + "',location = '" + location.Text + "',Last_Salary = '" + Crctc.Text + "',Expected_Salary = '" + Exctc.Text + "',Last_Designation = '" + positionpre.Text + "',
                tot_exp = '" + tot_exp.Text + "',Tot_Ind_Exp = '" + ind_exp.Text + "',pre_comp1 = '" + pre_comp.Text + "',Last_Mgr_Name = '" + manager.Text + "',Last_mgr_mob = '" + manager_mob.Text + "',Intr_name = '" + intr_name.Text + "',Hr_status = '" + Hr_status.SelectedValue + "',Hr_date = '" + Hr_date.Text + "',Hr_Remark = '" + hr_remark.Text + "',HOD_name = '" + Hod_name.Text + "',
                HOD_status = '" + Hod_status.SelectedValue + "',HOD_date = '" + Hod_date.Text + "',Hod_Remark = '" + hod_remr.Text + "' WHERE Candidate_Code='" + Cand_code.Text + "' ")
                MsgBox("Update Successful")
                Response.Redirect(Request.Url.AbsoluteUri)
            End If

        Catch ex As Exception

        End Try
    End Sub
End Class
