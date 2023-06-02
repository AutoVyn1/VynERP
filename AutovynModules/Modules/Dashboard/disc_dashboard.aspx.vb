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
                Year_From.Text = "2022"
                Year_To.Text = "2023"

            End If
        Catch ex As Exception

        End Try

    End Sub

    <WebMethod()>
    Public Shared Function GetChartData(grp_name As String, frm_year As String, to_year As String) As String

        Dim con As New Connection

        HttpContext.Current.Session("YourKey") = ""

        Dim disc As String = NewMethod(grp_name)


        Dim TranDt As DataTable = con.ReturnDtTable("WITH ordered_data AS ( SELECT DISTINCT ICM_MST.Tran_Id, INV_Date ,Exch_Disc, Corp_Disc, Cons_Disc, MGA_Pric,EW_PolicyAmt,PPC_Chrgs,MI_PolicyAmt,Nexa_Card,RTO_Pric,Adnl_Disc FROM ICM_DTL INNER JOIN ICM_MST ON ICM_MST.Tran_Id = ICM_DTL.Tran_Id WHERE Inv_Date BETWEEN  '04/01/" + frm_year + "' and '03/31/" + to_year + "' AND ICM_MST.EXPORT_TYPE < 3 AND ICM_DTL.EXPORT_TYPE < 3  ) SELECT CONCAT(CAST(YEAR(DATEADD(month, -3, Inv_Date)) AS VARCHAR),'-', CAST(YEAR(DATEADD(month, 9, Inv_Date)) AS VARCHAR) ) AS year, " + disc + " FROM ordered_data GROUP BY CONCAT( CAST(YEAR(DATEADD(month, -3, Inv_Date)) AS VARCHAR),  '-', CAST(YEAR(DATEADD(month, 9, Inv_Date)) AS VARCHAR) ) ORDER BY  year")


        Dim TranDt1 As DataTable = con.ReturnDtTable("WITH ordered_data AS ( SELECT DISTINCT ICM_MST.Tran_Id, INV_Date ,Exch_Disc, Corp_Disc, Cons_Disc, MGA_Pric,EW_PolicyAmt,PPC_Chrgs,MI_PolicyAmt,Nexa_Card,RTO_Pric,Adnl_Disc FROM ICM_DTL INNER JOIN ICM_MST ON ICM_MST.Tran_Id = ICM_DTL.Tran_Id WHERE Inv_Date BETWEEN  '04/01/" + frm_year + "' and '03/31/" + to_year + "' AND ICM_MST.EXPORT_TYPE < 3 AND ICM_DTL.EXPORT_TYPE < 3 ) SELECT  LEFT(DATENAME(MONTH, Inv_Date), 3) AS [Month],  " + disc + " FROM ordered_data  GROUP BY LEFT(DATENAME(MONTH, Inv_Date), 3),year(Inv_Date), MONTH(Inv_Date) ORDER BY year(Inv_Date),MONTH(Inv_Date)")


        Dim TranDt3 As DataTable = con.ReturnDtTable("WITH ordered_data AS ( SELECT DISTINCT ICM_MST.Tran_Id, INV_Date ,Exch_Disc, Corp_Disc, Cons_Disc, MGA_Pric,EW_PolicyAmt,PPC_Chrgs,MI_PolicyAmt,Nexa_Card,RTO_Pric,Adnl_Disc FROM ICM_DTL INNER JOIN ICM_MST ON ICM_MST.Tran_Id = ICM_DTL.Tran_Id WHERE Inv_Date BETWEEN  '04/01/" + frm_year + "' and '03/31/" + to_year + "' AND ICM_MST.EXPORT_TYPE < 3 AND ICM_DTL.EXPORT_TYPE < 3 ) SELECT YEAR(DATEADD(MONTH, -3, Inv_Date)) + CASE WHEN MONTH(Inv_Date) <= 3 THEN 1 ELSE 0 END AS Year, 'Q ' + CAST(DATEPART(QUARTER, DATEADD(MONTH, -3, Inv_Date)) AS VARCHAR) AS Quarter,  " + disc + " FROM ordered_data GROUP BY YEAR(DATEADD(MONTH, -3, Inv_Date)) + CASE WHEN MONTH(Inv_Date) <= 3 THEN 1 ELSE 0 END, 'Q ' + CAST(DATEPART(QUARTER, DATEADD(MONTH, -3, Inv_Date)) AS VARCHAR) ORDER BY Year, Quarter")


        Dim TranDt4 As DataTable = con.ReturnDtTable("WITH ordered_data AS ( SELECT DISTINCT ICM_MST.Tran_Id, INV_Date ,Exch_Disc, Corp_Disc, Cons_Disc, MGA_Pric,EW_PolicyAmt,PPC_Chrgs,MI_PolicyAmt,Nexa_Card,RTO_Pric,Adnl_Disc FROM ICM_DTL INNER JOIN ICM_MST ON ICM_MST.Tran_Id = ICM_DTL.Tran_Id WHERE Inv_Date BETWEEN '04/01/" + frm_year + "' and '04/30/" + frm_year + "' AND ICM_MST.EXPORT_TYPE < 3 AND ICM_DTL.EXPORT_TYPE < 3 ) SELECT  'Day '+ cast(day(Inv_Date)AS VARCHAR) as day, " + disc + " FROM ordered_data GROUP BY LEFT(DATENAME(MONTH, Inv_Date), 3),year(Inv_Date), MONTH(Inv_Date),day(Inv_Date) ORDER BY year(Inv_Date), MONTH(Inv_Date),day(Inv_Date)")


        Dim TranDt5 As DataTable = con.ReturnDtTable("SELECT (SELECT top 1 Godw_Name FROM Godown_Mst where Godw_Code = Loc_Code) as loc_name, Loc_Code, CONCAT(CAST(YEAR(DATEADD(month, -3, Inv_Date)) AS VARCHAR),'-', CAST(YEAR(DATEADD(month, 9, Inv_Date)) AS VARCHAR) ) AS year, " + disc + " FROM ICM_DTL,ICM_MST where ICM_MST.Tran_Id=ICM_DTL.Tran_Id and Inv_Date BETWEEN  '04/01/" + frm_year + "' and '04/30/" + frm_year + "' GROUP BY CONCAT( CAST(YEAR(DATEADD(month, -3, Inv_Date)) AS VARCHAR),'-',  CAST(YEAR(DATEADD(month, 9, Inv_Date)) AS VARCHAR) ), Loc_Code ORDER BY  year, Loc_Code")

        Dim prev_fromyear As String = frm_year - 1

        Dim prev_toyear As String = to_year - 1


        Dim TranDt7 As DataTable = con.ReturnDtTable("WITH ordered_data AS ( SELECT DISTINCT ICM_MST.Tran_Id, INV_Date ,Exch_Disc, Corp_Disc, Cons_Disc, MGA_Pric,EW_PolicyAmt,PPC_Chrgs,MI_PolicyAmt,Nexa_Card,RTO_Pric,Adnl_Disc FROM ICM_DTL INNER JOIN ICM_MST ON ICM_MST.Tran_Id = ICM_DTL.Tran_Id WHERE Inv_Date BETWEEN  '04/01/" + prev_fromyear + "' and '03/31/" + prev_toyear + "' AND ICM_MST.EXPORT_TYPE < 3 AND ICM_DTL.EXPORT_TYPE < 3 ) SELECT LEFT(DATENAME(MONTH, Inv_Date), 3) AS [Month],  " + disc + " FROM ordered_data GROUP BY LEFT(DATENAME(MONTH, Inv_Date), 3),year(Inv_Date), MONTH(Inv_Date) ORDER BY year(Inv_Date),MONTH(Inv_Date)")


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

    Private Shared Function NewMethod(grp_name As String) As String
        Dim disc = ""

        Select Case grp_name
            Case "add_disc"
                disc = "Sum(Adnl_Disc) as discount"
            Case "cons_disc"
                disc = "Sum(Cons_Disc) as discount"
            Case "Exch_disc"
                disc = "Sum(Exch_Disc) as discount"
            Case "Corp_disc"
                disc = "Sum(Corp_Disc) as discount"
        End Select

        Return disc
    End Function

    <WebMethod()>
    Public Shared Function GetChartData_branch(grp_name As String, frm_year As String, to_year As String, xValue As String) As String

        Dim con As New Connection
        Dim loccode_tab As DataTable
        loccode_tab = con.ReturnDtTable("select godw_code from Godown_Mst where godw_name='" + xValue + "'")

        Dim loc_code = loccode_tab.Rows(0)("godw_code").ToString

        HttpContext.Current.Session("YourKey") = loc_code

        Dim disc As String = NewMethod(grp_name)

        Dim TranDt As DataTable
        'TranDt = con.ReturnDtTable("SELECT CONCAT(CAST(YEAR(DATEADD(month, -3, Inv_Date)) AS VARCHAR),'-', CAST(YEAR(DATEADD(month, 9, Inv_Date)) AS VARCHAR) ) AS year, " + disc + " FROM ICM_DTL,ICM_MST where ICM_MST.Tran_Id=ICM_DTL.Tran_Id and Inv_Date BETWEEN  '04/01/" + frm_year + "' and '03/31/" + to_year + "' and  ICM_MST.EXPORT_TYPE<3 and ICM_DTL.EXPORT_TYPE<3 and Loc_Code ='" + loc_code + "' GROUP BY CONCAT( CAST(YEAR(DATEADD(month, -3, Inv_Date)) AS VARCHAR),  '-', CAST(YEAR(DATEADD(month, 9, Inv_Date)) AS VARCHAR) )ORDER BY  year")

        TranDt = con.ReturnDtTable("WITH ordered_data AS ( SELECT DISTINCT ICM_MST.Tran_Id, INV_Date ,Exch_Disc, Corp_Disc, Cons_Disc, MGA_Pric,EW_PolicyAmt,PPC_Chrgs,MI_PolicyAmt,Nexa_Card,RTO_Pric,Adnl_Disc FROM ICM_DTL INNER JOIN ICM_MST ON ICM_MST.Tran_Id = ICM_DTL.Tran_Id WHERE Inv_Date BETWEEN  '04/01/" + frm_year + "' and '03/31/" + to_year + "' AND ICM_MST.EXPORT_TYPE < 3 AND ICM_DTL.EXPORT_TYPE < 3 AND Loc_Code = '" + loc_code + "' ) SELECT CONCAT(CAST(YEAR(DATEADD(month, -3, Inv_Date)) AS VARCHAR),'-', CAST(YEAR(DATEADD(month, 9, Inv_Date)) AS VARCHAR) ) AS year, " + disc + " FROM ordered_data GROUP BY CONCAT( CAST(YEAR(DATEADD(month, -3, Inv_Date)) AS VARCHAR),  '-', CAST(YEAR(DATEADD(month, 9, Inv_Date)) AS VARCHAR) ) ORDER BY  year")

        Dim TranDt1 As DataTable
        TranDt1 = con.ReturnDtTable("WITH ordered_data AS ( SELECT DISTINCT ICM_MST.Tran_Id, INV_Date ,Exch_Disc, Corp_Disc, Cons_Disc, MGA_Pric,EW_PolicyAmt,PPC_Chrgs,MI_PolicyAmt,Nexa_Card,RTO_Pric,Adnl_Disc FROM ICM_DTL INNER JOIN ICM_MST ON ICM_MST.Tran_Id = ICM_DTL.Tran_Id WHERE Inv_Date BETWEEN  '04/01/" + frm_year + "' and '03/31/" + to_year + "' AND ICM_MST.EXPORT_TYPE < 3 AND ICM_DTL.EXPORT_TYPE < 3 AND Loc_Code = '" + loc_code + "' ) SELECT  LEFT(DATENAME(MONTH, Inv_Date), 3) AS [Month],  " + disc + " FROM ordered_data  GROUP BY LEFT(DATENAME(MONTH, Inv_Date), 3),year(Inv_Date), MONTH(Inv_Date) ORDER BY year(Inv_Date),MONTH(Inv_Date)")

        Dim TranDt3 As DataTable
        TranDt3 = con.ReturnDtTable("WITH ordered_data AS ( SELECT DISTINCT ICM_MST.Tran_Id, INV_Date ,Exch_Disc, Corp_Disc, Cons_Disc, MGA_Pric,EW_PolicyAmt,PPC_Chrgs,MI_PolicyAmt,Nexa_Card,RTO_Pric,Adnl_Disc FROM ICM_DTL INNER JOIN ICM_MST ON ICM_MST.Tran_Id = ICM_DTL.Tran_Id WHERE Inv_Date BETWEEN  '04/01/" + frm_year + "' and '03/31/" + to_year + "' AND ICM_MST.EXPORT_TYPE < 3 AND ICM_DTL.EXPORT_TYPE < 3 AND Loc_Code = '" + loc_code + "' ) SELECT YEAR(DATEADD(MONTH, -3, Inv_Date)) + CASE WHEN MONTH(Inv_Date) <= 3 THEN 1 ELSE 0 END AS Year, 'Q ' + CAST(DATEPART(QUARTER, DATEADD(MONTH, -3, Inv_Date)) AS VARCHAR) AS Quarter,  " + disc + " FROM ordered_data GROUP BY YEAR(DATEADD(MONTH, -3, Inv_Date)) + CASE WHEN MONTH(Inv_Date) <= 3 THEN 1 ELSE 0 END, 'Q ' + CAST(DATEPART(QUARTER, DATEADD(MONTH, -3, Inv_Date)) AS VARCHAR) ORDER BY Year, Quarter")


        Dim TranDt4 As DataTable
        TranDt4 = con.ReturnDtTable("WITH ordered_data AS ( SELECT DISTINCT ICM_MST.Tran_Id, INV_Date ,Exch_Disc, Corp_Disc, Cons_Disc, MGA_Pric,EW_PolicyAmt,PPC_Chrgs,MI_PolicyAmt,Nexa_Card,RTO_Pric,Adnl_Disc FROM ICM_DTL INNER JOIN ICM_MST ON ICM_MST.Tran_Id = ICM_DTL.Tran_Id WHERE Inv_Date BETWEEN '04/01/" + frm_year + "' and '04/30/" + frm_year + "' AND ICM_MST.EXPORT_TYPE < 3 AND ICM_DTL.EXPORT_TYPE < 3 AND Loc_Code = '" + loc_code + "' ) SELECT  'Day '+ cast(day(Inv_Date)AS VARCHAR) as day, " + disc + " FROM ordered_data GROUP BY LEFT(DATENAME(MONTH, Inv_Date), 3),year(Inv_Date), MONTH(Inv_Date),day(Inv_Date) ORDER BY year(Inv_Date), MONTH(Inv_Date),day(Inv_Date)")


        Dim prev_fromyear As String = frm_year - 1

        Dim prev_toyear As String = to_year - 1

        Dim TranDt5 As DataTable
        TranDt5 = con.ReturnDtTable("WITH ordered_data AS ( SELECT DISTINCT ICM_MST.Tran_Id, INV_Date ,Exch_Disc, Corp_Disc, Cons_Disc, MGA_Pric,EW_PolicyAmt,PPC_Chrgs,MI_PolicyAmt,Nexa_Card,RTO_Pric,Adnl_Disc FROM ICM_DTL INNER JOIN ICM_MST ON ICM_MST.Tran_Id = ICM_DTL.Tran_Id WHERE Inv_Date BETWEEN  '04/01/" + prev_fromyear + "' and '03/31/" + prev_toyear + "' AND ICM_MST.EXPORT_TYPE < 3 AND ICM_DTL.EXPORT_TYPE < 3 AND Loc_Code = '" + loc_code + "' ) SELECT LEFT(DATENAME(MONTH, Inv_Date), 3) AS [Month],  " + disc + " FROM ordered_data GROUP BY LEFT(DATENAME(MONTH, Inv_Date), 3),year(Inv_Date), MONTH(Inv_Date) ORDER BY year(Inv_Date),MONTH(Inv_Date)")




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

        Dim disc As String = NewMethod(grp_name)

        Dim loc_code = ""
        If HttpContext.Current.Session("YourKey") IsNot "" Then
            Dim value As String = HttpContext.Current.Session("YourKey").ToString()

            If value IsNot "" Then
                loc_code = "and Loc_Code ='" + value + "'"
            End If
        End If

        Dim con As New Connection
        Dim datew = ""

        Select Case xValue
            Case "Q 4"
                datew = "01/01/" + to_year + "' and '03/31/" + to_year + ""
            Case "Q 1"
                datew = "04/01/" + frm_year + "' and '06/30/" + frm_year + ""
            Case "Q 2"
                datew = "07/01/" + frm_year + "' and '09/30/" + frm_year + ""
            Case "Q 3"
                datew = "10/01/" + frm_year + "' and '12/31/" + frm_year + ""
        End Select

        Dim TranDt As DataTable
        TranDt = con.ReturnDtTable("WITH ordered_data AS ( SELECT DISTINCT ICM_MST.Tran_Id, INV_Date ,Exch_Disc, Corp_Disc, Cons_Disc, MGA_Pric,EW_PolicyAmt,PPC_Chrgs,MI_PolicyAmt,Nexa_Card,RTO_Pric,Adnl_Disc FROM ICM_DTL INNER JOIN ICM_MST ON ICM_MST.Tran_Id = ICM_DTL.Tran_Id WHERE Inv_Date BETWEEN '" + datew + "' " + loc_code + "  AND ICM_MST.EXPORT_TYPE < 3 AND ICM_DTL.EXPORT_TYPE < 3  ) SELECT  LEFT(DATENAME(MONTH, Inv_Date), 3) AS [Month], " + disc + " FROM ordered_data GROUP BY LEFT(DATENAME(MONTH, Inv_Date), 3),year(Inv_Date), MONTH(Inv_Date) ORDER BY year(Inv_Date),MONTH(Inv_Date)")

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

        Dim disc As String = NewMethod(grp_name)

        Dim loc_code = ""
        If HttpContext.Current.Session("YourKey") IsNot Nothing Then
            Dim value As String = HttpContext.Current.Session("YourKey").ToString()

            If value IsNot "" Then
                loc_code = "and Loc_Code ='" + value + "'"
            End If
        End If

        Dim con As New Connection
        Dim datew = ""

        Select Case xValue
            Case "Jan"
                datew = "01/01/" + to_year + "' and '01/31/" + to_year + ""
            Case "Feb"
                datew = "02/01/" + to_year + "' and '02/28/" + to_year + ""
            Case "Mar"
                datew = "03/01/" + to_year + "' and '03/31/" + to_year + ""
            Case "Apr"
                datew = "04/01/" + frm_year + "' and '04/30/" + frm_year + ""
            Case "May"
                datew = "05/01/" + frm_year + "' and '05/31/" + frm_year + ""
            Case "Jun"
                datew = "06/01/" + frm_year + "' and '06/30/" + frm_year + ""
            Case "Jul"
                datew = "07/01/" + frm_year + "' and '07/31/" + frm_year + ""
            Case "Aug"
                datew = "08/01/" + frm_year + "' and '08/31/" + frm_year + ""
            Case "Sep"
                datew = "09/01/" + frm_year + "' and '09/30/" + frm_year + ""
            Case "Oct"
                datew = "10/01/" + frm_year + "' and '10/31/" + frm_year + ""
            Case "Nov"
                datew = "11/01/" + frm_year + "' and '11/30/" + frm_year + ""
            Case "Dec"
                datew = "12/01/" + frm_year + "' and '12/31/" + frm_year + ""
        End Select

        Dim TranDt As DataTable
        TranDt = con.ReturnDtTable("WITH ordered_data AS ( SELECT DISTINCT ICM_MST.Tran_Id, INV_Date ,Exch_Disc, Corp_Disc, Cons_Disc, MGA_Pric,EW_PolicyAmt,PPC_Chrgs,MI_PolicyAmt,Nexa_Card,RTO_Pric,Adnl_Disc FROM ICM_DTL INNER JOIN ICM_MST ON ICM_MST.Tran_Id = ICM_DTL.Tran_Id WHERE Inv_Date BETWEEN '" + datew + "' " + loc_code + " AND ICM_MST.EXPORT_TYPE < 3 AND ICM_DTL.EXPORT_TYPE < 3  ) SELECT  'Day '+ cast(day(Inv_Date)AS VARCHAR) as day, " + disc + " FROM ordered_data GROUP BY LEFT(DATENAME(MONTH, Inv_Date), 3),year(Inv_Date), MONTH(Inv_Date),day(Inv_Date) ORDER BY year(Inv_Date), MONTH(Inv_Date),day(Inv_Date)")

        Dim json = New With {
           .DataTable1 = TranDt
         }

            'Convert the DataTable to a JSON string
            Dim jsown As String = JsonConvert.SerializeObject(json)

            'Return the JSON string
            Return jsown
        End Function

End Class