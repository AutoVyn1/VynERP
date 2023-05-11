Imports System.Drawing
Imports System.IO
Imports System.Web.Services
Imports System.Windows.Input
Imports Newtonsoft.Json


Public Class HRMS
    Inherits System.Web.UI.Page
    Private con As New Connection
    Public dt As New DataTable
    Public result As String
    Private dt2 As New DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            dt = con.ReturnDtTable("select * from edu_cation")
            Asset.DataSource = dt
            Asset.DataBind()
            location_Data()
            grup()
            region()
            Department()
            designaiton()
        End If

    End Sub

    Protected Sub OnShow(sender As Object, e As EventArgs)
        ErrorMessage(Me, "", "Your data has been submitted successfully")
    End Sub

    Public Sub ErrorMessage(ByVal Control As UI.Control, ByVal Message As String, Optional ByVal Title As String = "Alert", Optional ByVal callback As String = "")
        Try
            ScriptManager.RegisterStartupScript(Control, Control.GetType, "Script", "swal('" + Title + "','" + Message + "','success');", True)
        Catch ex As Exception
        End Try
    End Sub

    <WebMethod()>
    Public Shared Function GetData(searchTerm As String) As String
        Dim con As New Connection
        Dim dt As DataTable = con.ReturnDtTable("select EmpType,SECTION,REGION,EMPFIRSTNAME,EMPLASTNAME,panno,currentaddress1,ppincode,mobileno,landlineno,fatherName,mothername,convert(varchar,dob,103) as dob,empheight,empweight,pfper,uid_no,
        (select misc_name from misc_mst where misc_type=85 and LOCATION=misc_code) as branch,location,
        (select misc_name from misc_mst where misc_type=68 and section=misc_code) as Grup,section,
        (select misc_code from misc_mst where misc_type=95 and EMPLOYEEDESIGNATION=misc_name) as designation,section,
        (select misc_name from misc_mst where misc_type=81 and DIVISION=misc_code) as Department,division,
        (select misc_name from misc_mst where misc_type=3 and misc_code=CSTATE) as State,CSTATE,
        (select misc_name from misc_mst where misc_type=1 and misc_code=CCITY) as City,CCITY, CASE gender
         WHEN 'Male' THEN 1
         WHEN 'Female' THEN 2
         END AS gender_code
            from EMPLOYEEMASTER where empcode='" + searchTerm + "'")

        Return JsonConvert.SerializeObject(dt)
    End Function

    Protected Sub UploadFile(sender As Object, e As EventArgs)
        Dim folderPath As String = Server.MapPath("~/Files/")
        'Check whether Directory (Folder) exists.
        If Not Directory.Exists(folderPath) Then
            'If Directory (Folder) does not exists Create it.
            Directory.CreateDirectory(folderPath)
        End If

        'Save the File to the Directory (Folder).
        profile_Upload.SaveAs(folderPath & Path.GetFileName(profile_Upload.FileName))

        'Display the Picture in Image control.
        User_profile.ImageUrl = "~/Files/" & Path.GetFileName(profile_Upload.FileName)

    End Sub

    Protected Sub Emp_code_TextChanged(sender As Object, e As EventArgs)
        Try
            dt = con.ReturnDtTable("select EMPFIRSTNAME,EMPLASTNAME,panno,currentaddress1,ppincode,mobileno,landlineno,fatherName,mothername,convert(varchar,dob,103) as dob,empheight,empweight,pfper,uid_no,
(select misc_name from misc_mst where misc_type=85 and LOCATION=misc_code) as branch,location,
(select misc_name from misc_mst where misc_type=68 and section=misc_code) as Grup,section,
(select misc_name from misc_mst where misc_type=81 and DIVISION=misc_code) as Department,division,
(select misc_name from misc_mst where misc_type=3 and misc_code=CSTATE) as State,CSTATE,
(select misc_name from misc_mst where misc_type=1 and misc_code=CCITY) as City,CCITY
            from EMPLOYEEMASTER where empcode='" & Emp_code.Text & "'")
            If dt.Rows.Count > 0 Then
                F_Name.Text = dt.Rows(0)("Empfirstname").ToString
                L_Name.Text = dt.Rows(0)("Emplastname").ToString
                Pan_No.Text = dt.Rows(0)("panno").ToString
                'dept.SelectedValue = dt.Rows(0)("Department").ToString
                address.Text = dt.Rows(0)("currentaddress1").ToString
                city.Text = dt.Rows(0)("City").ToString
                pin_no.Text = dt.Rows(0)("ppincode").ToString
                state.Text = dt.Rows(0)("State").ToString
                dob.Text = dt.Rows(0)("dob").ToString
                mob_no.Text = dt.Rows(0)("mobileno").ToString
                father_name.Text = dt.Rows(0)("fatherName").ToString
                mother_name.Text = dt.Rows(0)("mothername").ToString
                emp_height.Text = decimalValue(dt.Rows(0)("empheight").ToString)
                emp_weight.Text = decimalValue(dt.Rows(0)("empweight").ToString)
                land_line.Text = dt.Rows(0)("landlineno").ToString
                uid_no.Text = dt.Rows(0)("uid_no").ToString
                'Interview_Date.Text = dt.Rows(0)("interview_date").ToString
                'Joining_Date.Text = dt.Rows(0)("currentjoindate").ToString
                'Bank_Name.Text = dt.Rows(0)("bankname").ToString
                'Ac_No.Text = dt.Rows(0)("bankaccountno").ToString
                'Ac_Type.Text = dt.Rows(0)("account_type").ToString
                'Pymt_Mode.Text = dt.Rows(0)("paymentmode").ToString
                'Ac_Name.Text = dt.Rows(0)("emp_ac_name").ToString
                'Ifsc_Code.Text = dt.Rows(0)("ifsc_code").ToString
                'pf_per.Text = dt.Rows(0)("pfper").ToString
                'Designation.Text = dt.Rows(0)("EMPLOYEEDESIGNATION").ToString
                'Spouse_Name.Text = dt.Rows(0)("SPOUSENAME").ToString
                Location.SelectedValue = dt.Rows(0)("location").ToString
                section.SelectedValue = dt.Rows(0)("section").ToString
            End If

        Catch ex As Exception

        End Try
    End Sub

    Private Sub Emp_Salary_Det()
        If pf_chk.Checked = True Then
            pf_per.Text = dt.Rows(0)("pfper").ToString
        End If
    End Sub

    Private Sub grup()
        dt = con.ReturnDtTable("select misc_name,misc_code from misc_mst where misc_type=68")
        section.DataTextField = "misc_name"
        section.DataValueField = "misc_code"
        section.DataSource = dt
        section.DataBind()
    End Sub

    Private Sub region()
        dt = con.ReturnDtTable("select misc_name,misc_code from misc_mst where misc_type=91")
        DropDownList24.DataTextField = "misc_name"
        DropDownList24.DataValueField = "misc_code"
        DropDownList24.DataSource = dt
        DropDownList24.DataBind()
    End Sub

    Private Sub designaiton()
        dt = con.ReturnDtTable("select misc_name,misc_code from misc_mst where misc_type=95")
        DropDownList37.DataTextField = "misc_name"
        DropDownList37.DataValueField = "misc_code"
        DropDownList37.DataSource = dt
        DropDownList37.DataBind()
    End Sub

    Private Sub Department()
        dt = con.ReturnDtTable("select misc_name,misc_code from misc_mst where misc_type=81")
        dept.DataTextField = "misc_name"
        dept.DataValueField = "misc_code"
        dept.DataSource = dt
        dept.DataBind()
    End Sub

    Private Sub location_Data()
        dt = con.ReturnDtTable("select misc_name,misc_code from misc_mst where misc_type=85")
        Location.DataTextField = "misc_name"
        Location.DataValueField = "misc_code"
        Location.DataSource = dt
        Location.DataBind()
    End Sub

    Protected Sub pf_chk_CheckedChanged(sender As Object, e As EventArgs)
        Try
            Emp_Salary_Det()
        Catch ex As Exception

        End Try
    End Sub

    Private Sub gecode_click(sender As Object, e As EventArgs) Handles gen_code.Click
        dt = con.ReturnDtTable("select range_name , range_code from Godown_Mst where godw_code=1")
        Dim genrcode As String = dt.Rows(0)("range_code").ToString
        Dim genrname As String = dt.Rows(0)("range_name").ToString

        Emp_code.Text = genrname & (genrcode + 1)
    End Sub

    Protected Sub ImageButton3_Click(sender As Object, e As EventArgs) Handles ImageButton3.Click
        ' Clear all form data

        Response.Redirect(Request.Url.AbsoluteUri)
        'For Each ctrl As Control In Page.Controls
        '    ClearControl(ctrl)
        'Next
    End Sub

    Private Sub ClearControl(ctrl As Control)
        If TypeOf ctrl Is TextBox Then
            DirectCast(ctrl, TextBox).Text = String.Empty
        ElseIf TypeOf ctrl Is DropDownList Then
            DirectCast(ctrl, DropDownList).SelectedIndex = 0
        ElseIf TypeOf ctrl Is CheckBox Then
            DirectCast(ctrl, CheckBox).Checked = False
        End If

        ' Recursively clear child controls
        For Each child As Control In ctrl.Controls
            ClearControl(child)
        Next
    End Sub



End Class