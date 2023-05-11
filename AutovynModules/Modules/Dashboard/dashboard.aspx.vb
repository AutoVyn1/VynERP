Imports System.IO
Imports System.Web.Services
Imports Newtonsoft.Json
Public Class dashboard
    Inherits System.Web.UI.Page
    Private con As New Connection
    Private dt As New DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Try
            If Not IsPostBack Then
                dse_list()

            End If
        Catch ex As Exception

        End Try


    End Sub



    <WebMethod()>
    Public Shared Function GetChartData(grp_name As String, frm_year As String, to_year As String, type_sts As String) As String

        Dim b As String
        If type_sts = "0" Then
            b = ""
        Else
            b = "and Acnt_Post.Loc_Code= '" + type_sts + "'"

        End If


        Dim con As New Connection

        Dim TranDt As DataTable
        TranDt = con.ReturnDtTable("select YEAR(Acnt_Date) as year,sum(iif(amt_drcr=1,post_amt,post_amt*-1)) as cl_bal from acnt_post  where ledg_ac in(select ledg_code from ledg_mst where group_code=53) group by YEAR(Acnt_Date) order by YEAR(Acnt_Date)")

        'Convert the DataTable to a JSON string
        Dim json As String = JsonConvert.SerializeObject(TranDt)

        'Return the JSON string
        Return json
    End Function


    Private Sub dse_list()
        Try
            dt = con.ReturnDtTable("select Group_Code,Group_Name from Grup_Mst where Sub_Group>1")
            dt.Rows.Add()
            dt.Rows(dt.Rows.Count - 1)("Group_Code") = 0
            dt.Rows(dt.Rows.Count - 1)("Group_Name") = "----Select----"
            dt = dt.Select("Group_Code>=0", "Group_Code").CopyToDataTable
            grp_name.DataSource = dt
            grp_name.DataTextField = "Group_Name"
            grp_name.DataValueField = "Group_Code"
            grp_name.DataBind()
        Catch ex As Exception

        End Try
    End Sub







End Class