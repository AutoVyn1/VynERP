Imports System.Web.Services
Imports Newtonsoft.Json

Public Class chassis_allot
	Inherits System.Web.UI.Page
	Private con As New Connection
	Private dt As New DataTable
	Private link As String
	Private Dse_Mob As String
	Private Aprvl_Mob As String
	Private LinkId As Integer = 0
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If Not IsPostBack Then
			Curr_Date.Text = Now.ToString("dd") & "/" & Now.ToString("MM") & "/" & Now.ToString("yyyy")
			dse_list()
			'veh_color_list()
			'Modl_Var_list()
		End If

	End Sub

	Private Sub dse_list()
		Try
			dt = con.ReturnDtTable("select srno,empcode+' - '+empfirstname as Emp_Name from EMPLOYEEMASTER where ISNULL(srno,'')<>'' and export_type<3")
			dt.Rows.Add()
			dt.Rows(dt.Rows.Count - 1)("srno") = 0
			dt.Rows(dt.Rows.Count - 1)("Emp_Name") = "----Select----"
			dt = dt.Select("srno>=0", "srno").CopyToDataTable
			DSE_Name.DataSource = dt
			DSE_Name.DataTextField = "Emp_Name"
			DSE_Name.DataValueField = "srno"
			DSE_Name.DataBind()
		Catch ex As Exception

		End Try
	End Sub

	'Private Sub veh_color_list()
	'	Try
	'		dt = con.ReturnDtTable("select misc_name,misc_code from misc_mst where misc_type=10 AND MISC_NAME<>''")
	'		dt.Rows(dt.Rows.Count - 1)("misc_code") = 0
	'		dt.Rows(dt.Rows.Count - 1)("misc_name") = "----Select----"
	'		dt = dt.Select("isnull(misc_code,0)>=0", "misc_code").CopyToDataTable
	'		veh_color.DataSource = dt
	'		veh_color.DataTextField = "misc_name"
	'		veh_color.DataValueField = "misc_code"
	'		veh_color.DataBind()
	'	Catch ex As Exception

	'	End Try
	'End Sub

	'Private Sub Modl_Var_list()
	'	Try
	'		dt = con.ReturnDtTable("select misc_name, misc_code from misc_mst where misc_type=14")
	'		dt.Rows(dt.Rows.Count - 1)("misc_code") = 0
	'		dt.Rows(dt.Rows.Count - 1)("misc_name") = "----Select----"
	'		dt = dt.Select("isnull(misc_code,0)>=0", "misc_code").CopyToDataTable
	'		modl_var.DataSource = dt
	'		modl_var.DataTextField = "misc_name"
	'		modl_var.DataValueField = "misc_code"
	'		modl_var.DataBind()
	'	Catch ex As Exception

	'	End Try
	'End Sub

	<WebMethod()>
	Public Shared Function GetData2(searchTerm As String) As String
		Dim con As New Connection
		Dim dt As DataTable = con.ReturnDtTable("select (select Modl_Name from Modl_Mst where item_code=CHAS_MST.Modl_Code) as modl_name,
		Clr_No,Chas_No from CHAS_MST where VIN='" + searchTerm + "'")

		' Assuming you have already fetched the data into a DataTable called dt
		' Create a new empty list of dictionary to store the rows of data

		Return JsonConvert.SerializeObject(dt)



	End Function
End Class