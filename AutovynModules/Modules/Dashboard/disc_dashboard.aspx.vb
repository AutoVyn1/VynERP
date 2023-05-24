
Imports System.IO
    Imports System.Web.Services
    Imports Newtonsoft.Json
    Public Class disc_dashboard
        Inherits System.Web.UI.Page
        Private con
        Private dt As New DataTable

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            con = New Connection
            Try
                If Not IsPostBack Then

            End If
            Catch ex As Exception

            End Try


        End Sub



        <WebMethod()>
        Public Shared Function GetChartData(grp_name As String, frm_year As String, to_year As String) As String

            Dim con As New Connection

        HttpContext.Current.Session("YourKey") = ""

        Dim disc = ""

        If grp_name = "add_disc" Then
            disc = "Sum(Adnl_Disc) as discount"

        ElseIf grp_name = "cons_disc" Then
            disc = "Sum(Cons_Disc) as discount"

        ElseIf grp_name = "Exch_disc" Then
            disc = "Sum(Exch_Disc) as discount"

        ElseIf grp_name = "Corp_disc" Then
            disc = "Sum(Corp_Disc) as discount"

        End If

        Dim TranDt As DataTable
        TranDt = con.ReturnDtTable("SELECT CONCAT(CAST(YEAR(DATEADD(month, -3, Inv_Date)) AS VARCHAR),'-', CAST(YEAR(DATEADD(month, 9, Inv_Date)) AS VARCHAR) ) AS year, " + disc + " FROM ICM_DTL,ICM_MST where ICM_MST.Tran_Id=ICM_DTL.Tran_Id and Inv_Date BETWEEN  '04/01/" + frm_year + "' and '03/31/" + to_year + "' and  ICM_MST.EXPORT_TYPE<3 and ICM_DTL.EXPORT_TYPE<3 GROUP BY CONCAT( CAST(YEAR(DATEADD(month, -3, Inv_Date)) AS VARCHAR),  '-', CAST(YEAR(DATEADD(month, 9, Inv_Date)) AS VARCHAR) )ORDER BY  year")

        Dim TranDt1 As DataTable
        TranDt1 = con.ReturnDtTable("SELECT  LEFT(DATENAME(MONTH, Inv_Date), 3) AS [Month],  " + disc + " FROM ICM_DTL,ICM_MST where ICM_MST.Tran_Id=ICM_DTL.Tran_Id and Inv_Date BETWEEN '04/01/" + frm_year + "' and '03/31/" + to_year + "' and  ICM_MST.EXPORT_TYPE<3 and ICM_DTL.EXPORT_TYPE<3 GROUP BY LEFT(DATENAME(MONTH, Inv_Date), 3),year(Inv_Date), MONTH(Inv_Date) ORDER BY year(Inv_Date),MONTH(Inv_Date)")

        Dim TranDt3 As DataTable
        TranDt3 = con.ReturnDtTable("SELECT YEAR(DATEADD(MONTH, -3, Inv_Date)) + CASE WHEN MONTH(Inv_Date) <= 3 THEN 1 ELSE 0 END AS Year, 'Q ' + CAST(DATEPART(QUARTER, DATEADD(MONTH, -3, Inv_Date)) AS VARCHAR) AS Quarter,  " + disc + " FROM ICM_DTL,ICM_MST where ICM_MST.Tran_Id=ICM_DTL.Tran_Id and Inv_Date BETWEEN  '04/01/" + frm_year + "' and '03/31/" + to_year + "' and  ICM_MST.EXPORT_TYPE<3 and ICM_DTL.EXPORT_TYPE<3 GROUP BY YEAR(DATEADD(MONTH, -3, Inv_Date)) + CASE WHEN MONTH(Inv_Date) <= 3 THEN 1 ELSE 0 END, 'Q ' + CAST(DATEPART(QUARTER, DATEADD(MONTH, -3, Inv_Date)) AS VARCHAR) ORDER BY Year, Quarter")


        Dim TranDt4 As DataTable
        TranDt4 = con.ReturnDtTable("SELECT  'Day '+ cast(day(Inv_Date)AS VARCHAR) as day, " + disc + " FROM ICM_DTL,ICM_MST where ICM_MST.Tran_Id=ICM_DTL.Tran_Id and Inv_Date BETWEEN '04/01/" + frm_year + "' and '04/30/" + frm_year + "' and  ICM_MST.EXPORT_TYPE<3 and ICM_DTL.EXPORT_TYPE<3 GROUP BY LEFT(DATENAME(MONTH, Inv_Date), 3),year(Inv_Date), MONTH(Inv_Date),day(Inv_Date) ORDER BY year(Inv_Date), MONTH(Inv_Date),day(Inv_Date)")

        Dim TranDt5 As DataTable
        TranDt5 = con.ReturnDtTable("SELECT (SELECT top 1 Godw_Name FROM Godown_Mst where Godw_Code = Loc_Code) as loc_name, Loc_Code, CONCAT(CAST(YEAR(DATEADD(month, -3, Inv_Date)) AS VARCHAR),'-', CAST(YEAR(DATEADD(month, 9, Inv_Date)) AS VARCHAR) ) AS year, " + disc + " FROM ICM_DTL,ICM_MST where ICM_MST.Tran_Id=ICM_DTL.Tran_Id and Inv_Date BETWEEN  '04/01/" + frm_year + "' and '04/30/" + frm_year + "' GROUP BY CONCAT( CAST(YEAR(DATEADD(month, -3, Inv_Date)) AS VARCHAR),'-',  CAST(YEAR(DATEADD(month, 9, Inv_Date)) AS VARCHAR) ), Loc_Code ORDER BY  year, Loc_Code")

        Dim prev_fromyear As String = frm_year - 1

            Dim prev_toyear As String = to_year - 1

            Dim TranDt7 As DataTable
        TranDt7 = con.ReturnDtTable("SELECT LEFT(DATENAME(MONTH, Inv_Date), 3) AS [Month],  " + disc + " FROM ICM_DTL,ICM_MST where ICM_MST.Tran_Id=ICM_DTL.Tran_Id and Inv_Date BETWEEN '04/01/" + prev_fromyear + "' and '03/31/" + prev_toyear + "' and  ICM_MST.EXPORT_TYPE<3 and ICM_DTL.EXPORT_TYPE<3 GROUP BY LEFT(DATENAME(MONTH, Inv_Date), 3),year(Inv_Date), MONTH(Inv_Date) ORDER BY year(Inv_Date),MONTH(Inv_Date)")


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

        Dim disc = ""

        If grp_name = "add_disc" Then
            disc = "Sum(Adnl_Disc) as discount"

        ElseIf grp_name = "cons_disc" Then
            disc = "Sum(Cons_Disc) as discount"

        ElseIf grp_name = "Exch_disc" Then
            disc = "Sum(Exch_Disc) as discount"

        ElseIf grp_name = "Corp_disc" Then
            disc = "Sum(Corp_Disc) as discount"

        End If

        Dim TranDt As DataTable
        TranDt = con.ReturnDtTable("SELECT CONCAT(CAST(YEAR(DATEADD(month, -3, Inv_Date)) AS VARCHAR),'-', CAST(YEAR(DATEADD(month, 9, Inv_Date)) AS VARCHAR) ) AS year, " + disc + " FROM ICM_DTL,ICM_MST where ICM_MST.Tran_Id=ICM_DTL.Tran_Id and Inv_Date BETWEEN  '04/01/" + frm_year + "' and '03/31/" + to_year + "' and  ICM_MST.EXPORT_TYPE<3 and ICM_DTL.EXPORT_TYPE<3 and Loc_Code ='" + loc_code + "' GROUP BY CONCAT( CAST(YEAR(DATEADD(month, -3, Inv_Date)) AS VARCHAR),  '-', CAST(YEAR(DATEADD(month, 9, Inv_Date)) AS VARCHAR) )ORDER BY  year")

        Dim TranDt1 As DataTable
        TranDt1 = con.ReturnDtTable("SELECT  LEFT(DATENAME(MONTH, Inv_Date), 3) AS [Month],  " + disc + " FROM ICM_DTL,ICM_MST where ICM_MST.Tran_Id=ICM_DTL.Tran_Id and Inv_Date BETWEEN '04/01/" + frm_year + "' and '03/31/" + to_year + "' and  ICM_MST.EXPORT_TYPE<3 and ICM_DTL.EXPORT_TYPE<3 and Loc_Code ='" + loc_code + "' GROUP BY LEFT(DATENAME(MONTH, Inv_Date), 3),year(Inv_Date), MONTH(Inv_Date) ORDER BY year(Inv_Date),MONTH(Inv_Date)")

        Dim TranDt3 As DataTable
        TranDt3 = con.ReturnDtTable("SELECT YEAR(DATEADD(MONTH, -3, Inv_Date)) + CASE WHEN MONTH(Inv_Date) <= 3 THEN 1 ELSE 0 END AS Year, 'Q ' + CAST(DATEPART(QUARTER, DATEADD(MONTH, -3, Inv_Date)) AS VARCHAR) AS Quarter,  " + disc + " FROM ICM_DTL,ICM_MST where ICM_MST.Tran_Id=ICM_DTL.Tran_Id and Inv_Date BETWEEN  '04/01/" + frm_year + "' and '03/31/" + to_year + "' and  ICM_MST.EXPORT_TYPE<3 and ICM_DTL.EXPORT_TYPE<3 and Loc_Code ='" + loc_code + "' GROUP BY YEAR(DATEADD(MONTH, -3, Inv_Date)) + CASE WHEN MONTH(Inv_Date) <= 3 THEN 1 ELSE 0 END, 'Q ' + CAST(DATEPART(QUARTER, DATEADD(MONTH, -3, Inv_Date)) AS VARCHAR) ORDER BY Year, Quarter")


        Dim TranDt4 As DataTable
        TranDt4 = con.ReturnDtTable("SELECT  'Day '+ cast(day(Inv_Date)AS VARCHAR) as day, " + disc + " FROM ICM_DTL,ICM_MST where ICM_MST.Tran_Id=ICM_DTL.Tran_Id and Inv_Date BETWEEN '04/01/" + frm_year + "' and '04/30/" + frm_year + "' and  ICM_MST.EXPORT_TYPE<3 and ICM_DTL.EXPORT_TYPE<3 and Loc_Code ='" + loc_code + "' GROUP BY LEFT(DATENAME(MONTH, Inv_Date), 3),year(Inv_Date), MONTH(Inv_Date),day(Inv_Date) ORDER BY year(Inv_Date), MONTH(Inv_Date),day(Inv_Date)")


        Dim prev_fromyear As String = frm_year - 1

            Dim prev_toyear As String = to_year - 1

            Dim TranDt5 As DataTable
        TranDt5 = con.ReturnDtTable("SELECT LEFT(DATENAME(MONTH, Inv_Date), 3) AS [Month],  " + disc + " FROM ICM_DTL,ICM_MST where ICM_MST.Tran_Id=ICM_DTL.Tran_Id and Inv_Date BETWEEN '04/01/" + prev_fromyear + "' and '03/31/" + prev_toyear + "' and  ICM_MST.EXPORT_TYPE<3 and ICM_DTL.EXPORT_TYPE<3 and Loc_Code ='" + loc_code + "' GROUP BY LEFT(DATENAME(MONTH, Inv_Date), 3),year(Inv_Date), MONTH(Inv_Date) ORDER BY year(Inv_Date),MONTH(Inv_Date)")




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

        Dim disc = ""

        If grp_name = "add_disc" Then
            disc = "Sum(Adnl_Disc) as discount"

        ElseIf grp_name = "cons_disc" Then
            disc = "Sum(Cons_Disc) as discount"

        ElseIf grp_name = "Exch_disc" Then
            disc = "Sum(Exch_Disc) as discount"

        ElseIf grp_name = "Corp_disc" Then
            disc = "Sum(Corp_Disc) as discount"

        End If

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
        TranDt = con.ReturnDtTable("SELECT  LEFT(DATENAME(MONTH, Inv_Date), 3) AS [Month],  " + disc + " FROM ICM_DTL,ICM_MST where ICM_MST.Tran_Id=ICM_DTL.Tran_Id and Inv_Date BETWEEN '" + datew + "' " + loc_code + " and  ICM_MST.EXPORT_TYPE<3 and ICM_DTL.EXPORT_TYPE<3  GROUP BY LEFT(DATENAME(MONTH, Inv_Date), 3),year(Inv_Date), MONTH(Inv_Date) ORDER BY year(Inv_Date),MONTH(Inv_Date)")

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

        Dim disc = ""

        If grp_name = "add_disc" Then
            disc = "Sum(Adnl_Disc) as discount"

        ElseIf grp_name = "cons_disc" Then
            disc = "Sum(Cons_Disc) as discount"

        ElseIf grp_name = "Exch_disc" Then
            disc = "Sum(Exch_Disc) as discount"

        ElseIf grp_name = "Corp_disc" Then
            disc = "Sum(Corp_Disc) as discount"

        End If

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
        TranDt = con.ReturnDtTable("SELECT  'Day '+ cast(day(Inv_Date)AS VARCHAR) as day, " + disc + " FROM ICM_DTL,ICM_MST where ICM_MST.Tran_Id=ICM_DTL.Tran_Id and Inv_Date BETWEEN '" + datew + "' " + loc_code + " and  ICM_MST.EXPORT_TYPE<3 and ICM_DTL.EXPORT_TYPE<3 GROUP BY LEFT(DATENAME(MONTH, Inv_Date), 3),year(Inv_Date), MONTH(Inv_Date),day(Inv_Date) ORDER BY year(Inv_Date), MONTH(Inv_Date),day(Inv_Date)")

        Dim json = New With {
           .DataTable1 = TranDt
         }

            'Convert the DataTable to a JSON string
            Dim jsown As String = JsonConvert.SerializeObject(json)

            'Return the JSON string
            Return jsown
        End Function









End Class