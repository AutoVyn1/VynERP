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
    Public Shared Function GetChartData(grp_name As String, frm_year As String, to_year As String) As String




        Dim con As New Connection

        Dim TranDt As DataTable
        TranDt = con.ReturnDtTable("SELECT CONCAT(CAST(YEAR(DATEADD(month, -3, Acnt_Date)) AS VARCHAR),'-', CAST(YEAR(DATEADD(month, 9, Acnt_Date)) AS VARCHAR) ) AS year,  SUM(IIF(amt_drcr = 1, post_amt, post_amt * -1)) AS cl_bal FROM acnt_post WHERE  ledg_ac IN (SELECT ledg_code FROM ledg_mst WHERE group_code = '" + grp_name + "')AND Acnt_Date BETWEEN  '04/01/" + frm_year + "' AND '03/31/" + to_year + "' GROUP BY CONCAT( CAST(YEAR(DATEADD(month, -3, Acnt_Date)) AS VARCHAR),  '-',  CAST(YEAR(DATEADD(month, 9, Acnt_Date)) AS VARCHAR) )ORDER BY  year")

        Dim TranDt1 As DataTable
        TranDt1 = con.ReturnDtTable("select 'Month '+cast(Month(Acnt_Date)AS VARCHAR) as Month,sum(iif(amt_drcr=1,post_amt,post_amt*-1)) as cl_bal from acnt_post  where ledg_ac in(select ledg_code from ledg_mst where group_code= '" + grp_name + "') and Acnt_Date between '04/01/" + frm_year + "' and '03/31/" + to_year + "' group by month(Acnt_Date) order by month(Acnt_Date)")

        Dim TranDt3 As DataTable
        TranDt3 = con.ReturnDtTable("SELECT YEAR(Acnt_Date) AS Year, 'Q ' + CAST(DATEPART(QUARTER, Acnt_Date) AS VARCHAR) AS Quarter, SUM(IIF(amt_drcr = 1, post_amt, post_amt * -1)) AS cl_bal FROM acnt_post WHERE ledg_ac IN (SELECT ledg_code FROM ledg_mst WHERE group_code = '" + grp_name + "') and Acnt_Date between '04/01/" + frm_year + "' and '03/31/" + to_year + "' GROUP BY YEAR(Acnt_Date), 'Q ' + CAST(DATEPART(QUARTER, Acnt_Date) AS VARCHAR) ORDER BY Year, Quarter")

        Dim TranDt4 As DataTable
        TranDt4 = con.ReturnDtTable("select  'Day '+ cast(day(Acnt_Date)AS VARCHAR) as day, sum(iif(amt_drcr=1,post_amt,post_amt*-1)) as cl_bal from acnt_post  where ledg_ac in(select ledg_code from ledg_mst where group_code= '" + grp_name + "') and Acnt_Date between '04/01/" + frm_year + "' and '04/30/" + frm_year + "' group by day(Acnt_Date) order by day(Acnt_Date)")

        Dim json = New With {
           .DataTable1 = TranDt,
           .DataTable2 = TranDt1,
           .DataTable3 = TranDt3,
           .DataTable4 = TranDt4
         }

        'Convert the DataTable to a JSON string
        Dim jsown As String = JsonConvert.SerializeObject(json)

        'Return the JSON string
        Return jsown
    End Function



    <WebMethod()>
    Public Shared Function GetChartData2(grp_name As String, frm_year As String, to_year As String, xValue As String) As String


        Dim con As New Connection
        Dim datew = ""

        If xValue = "Q 1" Then
            datew = "01/01/" + to_year + "' and '03/31/" + to_year + ""

        ElseIf xValue = "Q 2" Then
            datew = "04/01/" + frm_year + "' and '06/30/" + frm_year + ""

        ElseIf xValue = "Q 3" Then
            datew = "07/01/" + frm_year + "' and '09/30/" + frm_year + ""

        ElseIf xValue = "Q 4" Then
            datew = "10/01/" + frm_year + "' and '12/31/" + frm_year + ""

        End If

        Dim TranDt As DataTable
        TranDt = con.ReturnDtTable("select 'Month '+cast(Month(Acnt_Date)AS VARCHAR) as Month,sum(iif(amt_drcr=1,post_amt,post_amt*-1)) as cl_bal from acnt_post  where ledg_ac in(select ledg_code from ledg_mst where group_code= '" + grp_name + "') and Acnt_Date between '" + datew + "' group by month(Acnt_Date) order by month(Acnt_Date)")


        Dim json = New With {
           .DataTable1 = TranDt
         }

        'Convert the DataTable to a JSON string
        Dim jsown As String = JsonConvert.SerializeObject(json)

        'Return the JSON string
        Return jsown
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