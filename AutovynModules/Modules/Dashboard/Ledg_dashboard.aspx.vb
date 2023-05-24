
Imports System.IO
Imports System.Web.Services
Imports Newtonsoft.Json

Public Class Ledg_dashboard
    Inherits System.Web.UI.Page
    Private con
    Private dt As New DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con = New Connection
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

        HttpContext.Current.Session("YourKey") = ""

        Dim TranDt As DataTable
        TranDt = con.ReturnDtTable("SELECT CONCAT(CAST(YEAR(DATEADD(month, -3, Acnt_Date)) AS VARCHAR),'-', CAST(YEAR(DATEADD(month, 9, Acnt_Date)) AS VARCHAR) ) AS year,  cast(SUM(IIF(amt_drcr = 1, post_amt, post_amt * -1))/100000 as varchar) + ' L' AS cl_bal FROM acnt_post WHERE  ledg_ac = '" + grp_name + "' AND Acnt_Date BETWEEN  '04/01/" + frm_year + "' AND '03/31/" + to_year + "' GROUP BY CONCAT( CAST(YEAR(DATEADD(month, -3, Acnt_Date)) AS VARCHAR),  '-',  CAST(YEAR(DATEADD(month, 9, Acnt_Date)) AS VARCHAR) )ORDER BY  year")

        Dim TranDt1 As DataTable
        TranDt1 = con.ReturnDtTable("SELECT  LEFT(DATENAME(MONTH, Acnt_Date), 3) AS [Month], CAST(SUM(IIF(amt_drcr = 1, post_amt, post_amt * -1)) / 100000 AS VARCHAR) + ' L' AS cl_bal FROM acnt_post WHERE ledg_ac = '" + grp_name + "'  AND Acnt_Date BETWEEN '04/01/" + frm_year + "' and '03/31/" + to_year + "' GROUP BY LEFT(DATENAME(MONTH, Acnt_Date), 3),year(Acnt_Date), MONTH(Acnt_Date) ORDER BY year(Acnt_Date),MONTH(Acnt_Date)")

        Dim TranDt3 As DataTable
        TranDt3 = con.ReturnDtTable("SELECT YEAR(DATEADD(MONTH, -3, Acnt_Date)) + CASE WHEN MONTH(Acnt_Date) <= 3 THEN 1 ELSE 0 END AS Year, 'Q ' + CAST(DATEPART(QUARTER, DATEADD(MONTH, -3, Acnt_Date)) AS VARCHAR) AS Quarter, CAST(SUM(IIF(amt_drcr = 1, post_amt, post_amt * -1)) / 100000 AS VARCHAR) + ' L' AS cl_bal FROM  acnt_post WHERE  ledg_ac = '" + grp_name + "'  AND Acnt_Date BETWEEN  '04/01/" + frm_year + "' and '03/31/" + to_year + "' GROUP BY YEAR(DATEADD(MONTH, -3, Acnt_Date)) + CASE WHEN MONTH(Acnt_Date) <= 3 THEN 1 ELSE 0 END, 'Q ' + CAST(DATEPART(QUARTER, DATEADD(MONTH, -3, Acnt_Date)) AS VARCHAR) ORDER BY Year, Quarter")

        Dim TranDt4 As DataTable
        TranDt4 = con.ReturnDtTable("select  'Day '+ cast(day(Acnt_Date)AS VARCHAR) as day, cast(sum(iif(amt_drcr=1,post_amt,post_amt*-1))/1000 AS VARCHAR) + ' K' as cl_bal from acnt_post  where ledg_ac = '" + grp_name + "'  and Acnt_Date between '04/01/" + frm_year + "' and '04/30/" + frm_year + "' group by day(Acnt_Date) order by day(Acnt_Date)")

        Dim TranDt5 As DataTable
        TranDt5 = con.ReturnDtTable("SELECT (SELECT top 1 Godw_Name FROM Godown_Mst where Godw_Code = Loc_Code) as loc_name, Loc_Code,CONCAT(CAST(YEAR(DATEADD(month, -3, Acnt_Date)) AS VARCHAR),'-', CAST(YEAR(DATEADD(month, 9, Acnt_Date)) AS VARCHAR) ) AS year, ABS(SUM(IIF(amt_drcr = 1, post_amt, post_amt * -1))) AS cl_bal FROM acnt_post WHERE  ledg_ac = '" + grp_name + "' AND Acnt_Date BETWEEN  '04/01/" + frm_year + "' AND '03/31/" + to_year + "'  GROUP BY CONCAT( CAST(YEAR(DATEADD(month, -3, Acnt_Date)) AS VARCHAR),  '-',  CAST(YEAR(DATEADD(month, 9, Acnt_Date)) AS VARCHAR) ), Loc_Code ORDER BY  year, Loc_Code")

        Dim prev_fromyear As String = frm_year - 1

        Dim prev_toyear As String = to_year - 1

        Dim TranDt7 As DataTable
        TranDt7 = con.ReturnDtTable("SELECT  LEFT(DATENAME(MONTH, Acnt_Date), 3) AS [Month], CAST(SUM(IIF(amt_drcr = 1, post_amt, post_amt * -1)) / 100000 AS VARCHAR) + ' L' AS cl_bal FROM acnt_post WHERE ledg_ac = '" + grp_name + "'  AND Acnt_Date BETWEEN '04/01/" + prev_fromyear + "' and '03/31/" + prev_toyear + "' GROUP BY LEFT(DATENAME(MONTH, Acnt_Date), 3), year(Acnt_Date), MONTH(Acnt_Date) ORDER BY year(Acnt_Date), MONTH(Acnt_Date)")


        Dim json = New With {
           .DataTable1 = TranDt,
           .DataTable2 = TranDt1,
           .DataTable3 = TranDt3,
           .DataTable4 = TranDt4,
           .DataTable5 = TranDt5,
           .DataTable7 = TranDt7
         }

        'Convert the DataTable to a JSON string
        Dim jsown As String = JsonConvert.SerializeObject(json)

        'Return the JSON string
        Return jsown
    End Function




    <WebMethod()>
    Public Shared Function GetChartData_branch(grp_name As String, frm_year As String, to_year As String, xValue As String) As String

        Dim con As New Connection
        Dim loccode_tab As DataTable
        loccode_tab = con.ReturnDtTable("select godw_code from Godown_Mst where godw_name='" + xValue + "'")

        Dim loc_code = loccode_tab.Rows(0)("godw_code").ToString

        HttpContext.Current.Session("YourKey") = loc_code


        Dim TranDt As DataTable
        TranDt = con.ReturnDtTable("SELECT CONCAT(CAST(YEAR(DATEADD(month, -3, Acnt_Date)) AS VARCHAR),'-', CAST(YEAR(DATEADD(month, 9, Acnt_Date)) AS VARCHAR) ) AS year, cast(sum(iif(amt_drcr=1,post_amt,post_amt*-1))/100000 AS VARCHAR) + ' L' AS cl_bal FROM acnt_post WHERE  ledg_ac = '" + grp_name + "' AND Acnt_Date BETWEEN  '04/01/" + frm_year + "' AND '03/31/" + to_year + "' and Loc_Code ='" + loc_code + "' GROUP BY CONCAT( CAST(YEAR(DATEADD(month, -3, Acnt_Date)) AS VARCHAR),  '-',  CAST(YEAR(DATEADD(month, 9, Acnt_Date)) AS VARCHAR) )ORDER BY  year")

        Dim TranDt1 As DataTable
        TranDt1 = con.ReturnDtTable("SELECT  LEFT(DATENAME(MONTH, Acnt_Date), 3) AS [Month], CAST(SUM(IIF(amt_drcr = 1, post_amt, post_amt * -1)) / 100000 AS VARCHAR) + ' L' AS cl_bal FROM acnt_post WHERE ledg_ac = '" + grp_name + "'  AND Acnt_Date BETWEEN '04/01/" + frm_year + "' and '03/31/" + to_year + "' and Loc_Code ='" + loc_code + "'  GROUP BY LEFT(DATENAME(MONTH, Acnt_Date), 3),year(Acnt_Date), MONTH(Acnt_Date) ORDER BY year(Acnt_Date), MONTH(Acnt_Date)")

        Dim TranDt3 As DataTable
        TranDt3 = con.ReturnDtTable("SELECT YEAR(DATEADD(MONTH, -3, Acnt_Date)) + CASE WHEN MONTH(Acnt_Date) <= 3 THEN 1 ELSE 0 END AS Year, 'Q ' + CAST(DATEPART(QUARTER, DATEADD(MONTH, -3, Acnt_Date)) AS VARCHAR) AS Quarter, CAST(SUM(IIF(amt_drcr = 1, post_amt, post_amt * -1)) / 100000 AS VARCHAR) + ' L' AS cl_bal FROM  acnt_post WHERE  ledg_ac = '" + grp_name + "'  AND Acnt_Date BETWEEN '04/01/" + frm_year + "' AND '03/31/" + to_year + "' AND Loc_Code = '" + loc_code + "' GROUP BY YEAR(DATEADD(MONTH, -3, Acnt_Date)) + CASE WHEN MONTH(Acnt_Date) <= 3 THEN 1 ELSE 0 END, 'Q ' + CAST(DATEPART(QUARTER, DATEADD(MONTH, -3, Acnt_Date)) AS VARCHAR) ORDER BY Year, Quarter ")

        Dim TranDt4 As DataTable
        TranDt4 = con.ReturnDtTable("select  'Day '+ cast(day(Acnt_Date)AS VARCHAR) as day,  cast(sum(iif(amt_drcr=1,post_amt,post_amt*-1))/1000 AS VARCHAR) + ' K' AS cl_bal from acnt_post  where ledg_ac = '" + grp_name + "'  and Acnt_Date between '04/01/" + frm_year + "' and '04/30/" + frm_year + "'  and Loc_Code ='" + loc_code + "' group by day(Acnt_Date) order by day(Acnt_Date)")


        Dim prev_fromyear As String = frm_year - 1

        Dim prev_toyear As String = to_year - 1

        Dim TranDt5 As DataTable
        TranDt5 = con.ReturnDtTable("SELECT  LEFT(DATENAME(MONTH, Acnt_Date), 3) AS [Month], CAST(SUM(IIF(amt_drcr = 1, post_amt, post_amt * -1)) / 100000 AS VARCHAR) + ' L' AS cl_bal FROM acnt_post WHERE ledg_ac = '" + grp_name + "'  AND Acnt_Date BETWEEN '04/01/" + prev_fromyear + "' and '03/31/" + prev_toyear + "' and Loc_Code ='" + loc_code + "' GROUP BY LEFT(DATENAME(MONTH, Acnt_Date), 3),year(Acnt_Date), MONTH(Acnt_Date) ORDER BY year(Acnt_Date), MONTH(Acnt_Date)")




        Dim json = New With {
           .DataTable1 = TranDt,
           .DataTable2 = TranDt1,
           .DataTable3 = TranDt3,
           .DataTable4 = TranDt4,
           .DataTable5 = TranDt5
         }

        'Convert the DataTable to a JSON string
        Dim jsown As String = JsonConvert.SerializeObject(json)

        'Return the JSON string
        Return jsown
    End Function


    <WebMethod()>
    Public Shared Function GetChartData2(grp_name As String, frm_year As String, to_year As String, xValue As String) As String

        Dim loc_code = ""
        If HttpContext.Current.Session("YourKey") IsNot "" Then
            Dim value As String = HttpContext.Current.Session("YourKey").ToString()

            If value IsNot "" Then
                loc_code = "and Loc_Code ='" + value + "'"
            End If
        End If

        Dim con As New Connection
        Dim datew = ""

        If xValue = "Q 4" Then
            datew = "01/01/" + to_year + "' and '03/31/" + to_year + ""

        ElseIf xValue = "Q 1" Then
            datew = "04/01/" + frm_year + "' and '06/30/" + frm_year + ""

        ElseIf xValue = "Q 2" Then
            datew = "07/01/" + frm_year + "' and '09/30/" + frm_year + ""

        ElseIf xValue = "Q 3" Then
            datew = "10/01/" + frm_year + "' and '12/31/" + frm_year + ""

        End If

        Dim TranDt As DataTable
        TranDt = con.ReturnDtTable("select LEFT(DATENAME(MONTH, Acnt_Date), 3) AS [Month], cast(sum(iif(amt_drcr=1,post_amt,post_amt*-1))/100000 AS VARCHAR) + ' L' AS cl_bal from acnt_post  where ledg_ac = '" + grp_name + "'  and Acnt_Date between '" + datew + "' " + loc_code + "  group by LEFT(DATENAME(MONTH, Acnt_Date), 3), month(Acnt_Date) order by month(Acnt_Date)")


        Dim json = New With {
           .DataTable1 = TranDt
         }

        'Convert the DataTable to a JSON string
        Dim jsown As String = JsonConvert.SerializeObject(json)

        'Return the JSON string
        Return jsown
    End Function


    <WebMethod()>
    Public Shared Function GetChartData_day(grp_name As String, frm_year As String, to_year As String, xValue As String) As String


        Dim loc_code = ""
        If HttpContext.Current.Session("YourKey") IsNot Nothing Then
            Dim value As String = HttpContext.Current.Session("YourKey").ToString()

            If value IsNot "" Then
                loc_code = "and Loc_Code ='" + value + "'"
            End If
        End If

        Dim con As New Connection
        Dim datew = ""

        If xValue = "Jan" Then
            datew = "01/01/" + to_year + "' and '01/31/" + to_year + ""

        ElseIf xValue = "Feb" Then
            datew = "02/01/" + to_year + "' and '02/28/" + to_year + ""

        ElseIf xValue = "Mar" Then
            datew = "03/01/" + to_year + "' and '03/31/" + to_year + ""

        ElseIf xValue = "Apr" Then
            datew = "04/01/" + frm_year + "' and '04/30/" + frm_year + ""

        ElseIf xValue = "May" Then
            datew = "05/01/" + frm_year + "' and '05/31/" + frm_year + ""

        ElseIf xValue = "Jun" Then
            datew = "06/01/" + frm_year + "' and '06/30/" + frm_year + ""

        ElseIf xValue = "Jul" Then
            datew = "07/01/" + frm_year + "' and '07/31/" + frm_year + ""

        ElseIf xValue = "Aug" Then
            datew = "08/01/" + frm_year + "' and '08/31/" + frm_year + ""

        ElseIf xValue = "Sep" Then
            datew = "09/01/" + frm_year + "' and '09/30/" + frm_year + ""

        ElseIf xValue = "Oct" Then
            datew = "10/01/" + frm_year + "' and '10/31/" + frm_year + ""

        ElseIf xValue = "Nov" Then
            datew = "11/01/" + frm_year + "' and '11/30/" + frm_year + ""

        ElseIf xValue = "Dec" Then
            datew = "12/01/" + frm_year + "' and '12/31/" + frm_year + ""

        End If

        Dim TranDt As DataTable
        TranDt = con.ReturnDtTable("select  'Day '+ cast(day(Acnt_Date)AS VARCHAR) as day,  cast(sum(iif(amt_drcr=1,post_amt,post_amt*-1))/1000 AS VARCHAR) + ' K' AS cl_bal from acnt_post  where ledg_ac = '" + grp_name + "'  and Acnt_Date between '" + datew + "' " + loc_code + " group by day(Acnt_Date) order by day(Acnt_Date)")


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
            'dt = con.ReturnDtTable("select Ledg_code,Ledg_Name from cloud_ledg where export_type<3 ")
            dt = con.ReturnDtTable("select Ledg_code,Ledg_Name from Ledg_Mst where export_type<3 and ServerId in (13,14)")

            dt.Rows.Add()
            dt.Rows(dt.Rows.Count - 1)("Ledg_code") = 0
            dt.Rows(dt.Rows.Count - 1)("Ledg_Name") = "----Select----"
            dt = dt.Select("Ledg_code>=0", "Ledg_code").CopyToDataTable
            grp_name.DataSource = dt
            grp_name.DataTextField = "Ledg_Name"
            grp_name.DataValueField = "Ledg_code"
            grp_name.DataBind()

        Catch ex As Exception

        End Try
    End Sub

End Class