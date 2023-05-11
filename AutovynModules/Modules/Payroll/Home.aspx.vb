Public Class Home
    Inherits System.Web.UI.Page
    Private dt As New DataTable
    Private con As New Connection
    Private chart As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            location_Data()
            department_data()
            group_data()
            'date
            If Not IsPostBack Then
                Dim currentDate As DateTime = DateTime.Now
                DateLabel.Text = currentDate.ToShortDateString()
            End If
        Catch ex As Exception
        End Try
    End Sub

    Private Sub location_Data()
        'dt = con.ReturnDtTable("select misc_name, misc_hod from misc_mst where misc_type=85 and misc_code in(select location from employeemaster where  location in (" & Convert.ToString(Session("QueryLoc")) & ")) ")
        dt = con.ReturnDtTable("select misc_name, misc_hod from misc_mst where misc_type=85 and misc_code in(select location from employeemaster where  location in (" & Convert.ToString(Session("QueryLoc")) & ")) ")
        Location.DataSource = dt
        Location.DataTextField = "misc_name"
        Location.DataValueField = "misc_hod"
        Session("location") = Location.SelectedValue
        Location.DataBind()
    End Sub

    Private Sub group_data()
        dt = con.ReturnDtTable("select misc_name,misc_code from misc_mst where misc_type=81")
        Group.DataSource = dt
        Group.DataTextField = "misc_name"
        Group.DataValueField = "misc_code"
        Group.DataBind()
    End Sub

    Private Sub department_data()
        dt = con.ReturnDtTable("select misc_name,misc_code from misc_mst where misc_type=68")
        Department.DataSource = dt
        Department.DataTextField = "misc_name"
        Department.DataValueField = "misc_code"
        Department.DataBind()
    End Sub

    Protected Sub Load_Location_Click(sender As Object, e As EventArgs) Handles Load_Location.Click
        Try
            Dim MyDay, MyMnth As Integer
            MyDay = DateLabel.Text.Split("/")(0)
            MyMnth = DateLabel.Text.Split("/")(1)
            chart = "SELECT [Status] as Atn_Status,Count(Status) as Status_Count FROM attendancetable,EMPLOYEEMASTER WHERE MONTH(DATEOFFICE)=" & MyMnth & " and day(DateOffice)=" & MyDay & " AND EMP_CODE=EMPCODE GROUP BY [Status]"
            dt = con.ReturnDtTable(chart)
            Attendance_Summary.DataSource = dt

            If dt.Rows.Count > 0 Then
                A_cnt.Text = dt.Rows(0)("Atn_Status") + ":       " + dt.Rows(0)("Status_Count").ToString
                HLF_cnt.Text = dt.Rows(1)("Atn_Status") + ":     " + dt.Rows(1)("Status_Count").ToString
                HWO_Cnt.Text = dt.Rows(2)("Atn_Status") + ":     " + dt.Rows(2)("Status_Count").ToString
                P_cnt.Text = dt.Rows(3)("Atn_Status") + ":       " + dt.Rows(3)("Status_Count").ToString
                P2_cnt.Text = dt.Rows(4)("Atn_Status") + ":      " + dt.Rows(4)("Status_Count").ToString
                P15_cnt.Text = dt.Rows(5)("Atn_Status") + ":     " + dt.Rows(5)("Status_Count").ToString
            End If

            dt = con.ReturnDtTable("SELECT EmpFirstName,(SELECT MISC_NAME FROM MISC_MST WHERE MISC_TYPE=85 AND LOCATION=MISC_HOD) AS LOCATION,
(SELECT MISC_NAME FROM MISC_MST WHERE MISC_TYPE=81 and SECTION=misc_code) AS GRUP,(SELECT MISC_NAME FROM MISC_MST WHERE MISC_TYPE=68 and division=misc_code) AS DEPARTMENT,
In1,Out1 FROM attendancetable,EMPLOYEEMASTER WHERE MONTH(DATEOFFICE)=" & MyMnth & " and day(dateoffice)=" & MyDay & " AND EMP_CODE=EMPCODE and location in(" & Session("location") & ")")
            Location_Grid.DataSource = dt
            Location_Grid.DataBind()
        Catch ex As Exception

        End Try
    End Sub


End Class