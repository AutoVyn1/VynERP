Imports System.IO
Imports System.Web.Services
Imports Newtonsoft.Json
Public Class profit
    Inherits System.Web.UI.Page
    Private con
    Private dt As New DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con = New Connection
        Try
            If Not IsPostBack Then
                grp_name.SelectedValue = "1"
                Year_From.Text = "2022"
                Year_To.Text = "2023"
            End If
        Catch ex As Exception

        End Try

    End Sub



    '<WebMethod()>
    'Public Shared Function GetChartData(grp_name As String, frm_year As String, to_year As String) As String

    '    Dim con As New Connection

    '    HttpContext.Current.Session("YourKey") = ""

    '    Dim TranDt As DataTable
    '    TranDt = con.ReturnDtTable("SELECT CONCAT(CAST(YEAR(DATEADD(month, -3, Acnt_Date)) AS VARCHAR),'-', CAST(YEAR(DATEADD(month, 9, Acnt_Date)) AS VARCHAR) ) AS year,  CAST(SUM(iif(amt_drcr=1,post_amt*-1,post_amt)) / 100000 AS VARCHAR) + ' L' AS cl_bal FROM acnt_post,ledg_mst where  acnt_date BETWEEN  '04/01/" + frm_year + "' AND '03/31/" + to_year + "' and ledg_code=ledg_ac and acnt_post.Export_Type<5 and ledg_mst.ServerId in (13,14) GROUP BY CONCAT( CAST(YEAR(DATEADD(month, -3, Acnt_Date)) AS VARCHAR),  '-',  CAST(YEAR(DATEADD(month, 9, Acnt_Date)) AS VARCHAR) )ORDER BY  year")

    '    Dim TranDt1 As DataTable
    '    TranDt1 = con.ReturnDtTable("SELECT  LEFT(DATENAME(MONTH, Acnt_Date), 3) AS [Month], CAST(SUM(iif(amt_drcr=1,post_amt*-1,post_amt)) / 100000 AS VARCHAR) + ' L' AS cl_bal FROM acnt_post,ledg_mst where  acnt_date BETWEEN  '04/01/" + frm_year + "' AND '03/31/" + to_year + "' and ledg_code=ledg_ac and acnt_post.Export_Type<5 and ledg_mst.ServerId in (13,14) GROUP BY LEFT(DATENAME(MONTH, Acnt_Date), 3),year(Acnt_Date), MONTH(Acnt_Date) ORDER BY year(Acnt_Date),MONTH(Acnt_Date)")

    '    Dim TranDt3 As DataTable
    '    TranDt3 = con.ReturnDtTable("SELECT YEAR(DATEADD(MONTH, -3, Acnt_Date)) + CASE WHEN MONTH(Acnt_Date) <= 3 THEN 1 ELSE 0 END AS Year, 'Q ' + CAST(DATEPART(QUARTER, DATEADD(MONTH, -3, Acnt_Date)) AS VARCHAR) AS Quarter, CAST(SUM(iif(amt_drcr=1,post_amt*-1,post_amt)) / 100000 AS VARCHAR) + ' L' AS cl_bal FROM  acnt_post,ledg_mst where  acnt_date BETWEEN  '04/01/" + frm_year + "' AND '03/31/" + to_year + "' and ledg_code=ledg_ac and acnt_post.Export_Type<5 and ledg_mst.ServerId in (13,14) GROUP BY YEAR(DATEADD(MONTH, -3, Acnt_Date)) + CASE WHEN MONTH(Acnt_Date) <= 3 THEN 1 ELSE 0 END, 'Q ' + CAST(DATEPART(QUARTER, DATEADD(MONTH, -3, Acnt_Date)) AS VARCHAR) ORDER BY Year, Quarter")

    '    Dim TranDt4 As DataTable
    '    TranDt4 = con.ReturnDtTable("select  'Day '+ cast(day(Acnt_Date)AS VARCHAR) as day, cast(sum(iif(amt_drcr=1,post_amt*-1,post_amt))/1000 AS VARCHAR) + ' K' as cl_bal from acnt_post , ledg_mst where  acnt_date BETWEEN  '04/01/2022' and '03/31/2023' and ledg_code=ledg_ac and acnt_post.Export_Type<5 and ledg_mst.ServerId in (13,14) group by day(Acnt_Date) order by day(Acnt_Date)")

    '    Dim TranDt5 As DataTable
    '    TranDt5 = con.ReturnDtTable("SELECT (SELECT top 1 Godw_Name FROM Godown_Mst where Godw_Code = acnt_post.Loc_Code) as loc_name, acnt_post.Loc_Code,CONCAT(CAST(YEAR(DATEADD(month, -3, Acnt_Date)) AS VARCHAR),'-', CAST(YEAR(DATEADD(month, 9, Acnt_Date)) AS VARCHAR) ) AS year, ABS(SUM(iif(amt_drcr=1,post_amt*-1,post_amt))) AS cl_bal FROM acnt_post,ledg_mst where  acnt_date BETWEEN  '04/01/" + frm_year + "' AND '03/31/" + to_year + "' and ledg_code=ledg_ac and acnt_post.Export_Type<5 and ledg_mst.ServerId in (13,14)  GROUP BY CONCAT( CAST(YEAR(DATEADD(month, -3, Acnt_Date)) AS VARCHAR),  '-',  CAST(YEAR(DATEADD(month, 9, Acnt_Date)) AS VARCHAR) ), acnt_post.Loc_Code ORDER BY  year, Loc_Code")

    '    Dim prev_fromyear As String = frm_year - 1

    '    Dim prev_toyear As String = to_year - 1

    '    Dim TranDt7 As DataTable
    '    TranDt7 = con.ReturnDtTable("SELECT  LEFT(DATENAME(MONTH, Acnt_Date), 3) AS [Month], CAST(SUM(iif(amt_drcr=1,post_amt*-1,post_amt)) / 100000 AS VARCHAR) + ' L' AS cl_bal FROM acnt_post,ledg_mst where  acnt_date BETWEEN  '04/01/" + prev_fromyear + "' AND '03/31/" + prev_toyear + "' and ledg_code=ledg_ac and acnt_post.Export_Type<5 and ledg_mst.ServerId in (13,14) GROUP BY LEFT(DATENAME(MONTH, Acnt_Date), 3), year(Acnt_Date), MONTH(Acnt_Date) ORDER BY year(Acnt_Date), MONTH(Acnt_Date)")


    '    Dim json = New With {
    '       .DataTable1 = TranDt,
    '       .DataTable2 = TranDt1,
    '       .DataTable3 = TranDt3,
    '       .DataTable4 = TranDt4,
    '       .DataTable5 = TranDt5,
    '       .DataTable7 = TranDt7
    '     }

    '    'Convert the DataTable to a JSON string
    '    Dim jsown As String = JsonConvert.SerializeObject(json)

    '    'Return the JSON string
    '    Return jsown
    'End Function


    <WebMethod()>
    Public Shared Function GetChartData(grp_name As String, frm_year As String, to_year As String) As String

        Dim con As New Connection

        HttpContext.Current.Session("YourKey") = ""

        'TranDt0 = con.ReturnDtTable("SELECT acnt_date,(SELECT top 1 Godw_Name FROM Godown_Mst where Godw_Code = acnt_post.Loc_Code) as loc_name,acnt_post.loc_code, CAST(ROUND(IIF(amt_drcr = 1, post_amt * -1, post_amt), 0) AS INT) AS cl_bal FROM acnt_post,ledg_mst where  acnt_date BETWEEN  '04/01/" + frm_year + "' AND '03/31/" + to_year + "' and ledg_code=ledg_ac and acnt_post.Export_Type<5 and ledg_mst.ServerId in (13,14) order by Acnt_Date ")


        Dim prev_fromyear As String = frm_year - 1

        Dim prev_toyear As String = to_year - 1

        Dim sql As String = ("SELECT acnt_date, CAST(ROUND(IIF(amt_drcr = 1, post_amt * -1, post_amt), 0) AS INT) AS cl_bal FROM acnt_post,ledg_mst where  acnt_date BETWEEN  '04/01/" + frm_year + "' AND '03/31/" + to_year + "' and ledg_code=ledg_ac and acnt_post.Export_Type<5 and ledg_mst.ServerId in (13,14) order by Acnt_Date;
                   SELECT (SELECT top 1 Godw_Name FROM Godown_Mst where Godw_Code = acnt_post.Loc_Code) as loc_name,
                        acnt_post.Loc_Code, ABS(SUM(IIF(amt_drcr = 1, post_amt, post_amt * -1))/100000) AS cl_bal FROM acnt_post,ledg_mst where  acnt_date BETWEEN  '04/01/" + frm_year + "'
                        AND '03/31/" + to_year + "'
                        and ledg_code=ledg_ac and acnt_post.Export_Type<5 and ledg_mst.ServerId in (13,14)  GROUP BY CONCAT( CAST(YEAR(DATEADD(month, -3, Acnt_Date))
                        AS VARCHAR),  '-', 
                        CAST(YEAR(DATEADD(month, 9, Acnt_Date)) AS VARCHAR) ), acnt_post.Loc_Code ORDER BY  acnt_post.Loc_Code;
                        SELECT  LEFT(DATENAME(MONTH, Acnt_Date), 3) AS [Month], CAST(SUM(iif(amt_drcr=1,post_amt*-1,post_amt)) / 100000 AS VARCHAR) + ' L' AS cl_bal FROM acnt_post,ledg_mst where  acnt_date BETWEEN  '04/01/" + prev_fromyear + "' AND '03/31/" + prev_toyear + "' and ledg_code=ledg_ac and acnt_post.Export_Type<5 and ledg_mst.ServerId in (13,14) GROUP BY LEFT(DATENAME(MONTH, Acnt_Date), 3), year(Acnt_Date), MONTH(Acnt_Date) ORDER BY year(Acnt_Date), MONTH(Acnt_Date)
                        ")

        Dim dt As DataSet = con.ReturnDtSet(sql)
        ' Call the function and get the resultTables list
        Dim resultTables As List(Of DataTable) = graph(dt.Tables(0))

        ' Create a new DataTable to hold the copied table
        Dim TranDt As DataTable
        Dim TranDt1 As DataTable
        Dim TranDt3 As DataTable
        Dim TranDt4 As DataTable

        ' Check if the desired table index is within the range of the resultTables list
        If resultTables.Count >= 4 Then
            ' Copy the TranDt4 table to myTable
            TranDt = resultTables(0).Copy()
            TranDt1 = resultTables(1).Copy()
            TranDt3 = resultTables(2).Copy()
            TranDt4 = resultTables(3).Copy()
        Else
            ' Handle the case where TranDt4 is not available
            ' You can choose to create an empty DataTable or handle the scenario based on your requirements
            TranDt = New DataTable()
        End If

        Dim TranDt5 As DataTable
        TranDt5 = dt.Tables(1)


        Dim TranDt7 As DataTable
        TranDt7 = dt.Tables(2)


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
        TranDt = con.ReturnDtTable("SELECT CONCAT(CAST(YEAR(DATEADD(month, -3, Acnt_Date)) AS VARCHAR),'-', CAST(YEAR(DATEADD(month, 9, Acnt_Date)) AS VARCHAR) ) AS year,  CAST(SUM(iif(amt_drcr=1,post_amt*-1,post_amt)) / 100000 AS VARCHAR) + ' L' AS cl_bal FROM acnt_post,ledg_mst where  acnt_date BETWEEN  '04/01/" + frm_year + "' AND '03/31/" + to_year + "' and acnt_post.Loc_Code ='" + loc_code + "' and ledg_code=ledg_ac and acnt_post.Export_Type<5 and ledg_mst.ServerId in (13,14) GROUP BY CONCAT( CAST(YEAR(DATEADD(month, -3, Acnt_Date)) AS VARCHAR),  '-',  CAST(YEAR(DATEADD(month, 9, Acnt_Date)) AS VARCHAR) )ORDER BY  year")

        Dim TranDt1 As DataTable
        TranDt1 = con.ReturnDtTable("SELECT  LEFT(DATENAME(MONTH, Acnt_Date), 3) AS [Month], CAST(SUM(iif(amt_drcr=1,post_amt*-1,post_amt)) / 100000 AS VARCHAR) + ' L' AS cl_bal FROM acnt_post,ledg_mst where  acnt_date BETWEEN  '04/01/" + frm_year + "' AND '03/31/" + to_year + "' and acnt_post.Loc_Code ='" + loc_code + "' and ledg_code=ledg_ac and acnt_post.Export_Type<5 and ledg_mst.ServerId in (13,14) GROUP BY LEFT(DATENAME(MONTH, Acnt_Date), 3),year(Acnt_Date), MONTH(Acnt_Date) ORDER BY year(Acnt_Date),MONTH(Acnt_Date)")

        Dim TranDt3 As DataTable
        TranDt3 = con.ReturnDtTable("SELECT YEAR(DATEADD(MONTH, -3, Acnt_Date)) + CASE WHEN MONTH(Acnt_Date) <= 3 THEN 1 ELSE 0 END AS Year, 'Q ' + CAST(DATEPART(QUARTER, DATEADD(MONTH, -3, Acnt_Date)) AS VARCHAR) AS Quarter, CAST(SUM(iif(amt_drcr=1,post_amt*-1,post_amt)) / 100000 AS VARCHAR) + ' L' AS cl_bal FROM  acnt_post,ledg_mst where  acnt_date BETWEEN  '04/01/" + frm_year + "' AND '03/31/" + to_year + "' and acnt_post.Loc_Code ='" + loc_code + "' and ledg_code=ledg_ac and acnt_post.Export_Type<5 and ledg_mst.ServerId in (13,14) GROUP BY YEAR(DATEADD(MONTH, -3, Acnt_Date)) + CASE WHEN MONTH(Acnt_Date) <= 3 THEN 1 ELSE 0 END, 'Q ' + CAST(DATEPART(QUARTER, DATEADD(MONTH, -3, Acnt_Date)) AS VARCHAR) ORDER BY Year, Quarter")

        Dim TranDt4 As DataTable
        TranDt4 = con.ReturnDtTable("Select 'Day '+ cast(day(Acnt_Date)AS VARCHAR) as day, cast(sum(iif(amt_drcr=1,post_amt*-1,post_amt))/1000 AS VARCHAR) + ' K' as cl_bal from acnt_post , ledg_mst where  Acnt_Date between '04/01/" + frm_year + "' and '04/30/" + frm_year + "' and acnt_post.Loc_Code ='" + loc_code + "' and ledg_code=ledg_ac and acnt_post.Export_Type<5 and ledg_mst.ServerId in (13,14) group by day(Acnt_Date) order by day(Acnt_Date)")




        Dim prev_fromyear As String = frm_year - 1

        Dim prev_toyear As String = to_year - 1

        Dim TranDt5 As DataTable
        TranDt5 = con.ReturnDtTable("SELECT  LEFT(DATENAME(MONTH, Acnt_Date), 3) AS [Month], CAST(SUM(iif(amt_drcr=1,post_amt*-1,post_amt)) / 100000 AS VARCHAR) + ' L' AS cl_bal FROM acnt_post,ledg_mst where  acnt_date BETWEEN  '04/01/" + prev_fromyear + "' AND '03/31/" + prev_toyear + "' and acnt_post.Loc_Code ='" + loc_code + "' and ledg_code=ledg_ac and acnt_post.Export_Type<5 and ledg_mst.ServerId in (13,14) GROUP BY LEFT(DATENAME(MONTH, Acnt_Date), 3), year(Acnt_Date), MONTH(Acnt_Date) ORDER BY year(Acnt_Date), MONTH(Acnt_Date)")


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
                loc_code = "and Acnt_post.Loc_Code ='" + value + "'"
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

        TranDt = con.ReturnDtTable("select LEFT(DATENAME(MONTH, Acnt_Date), 3) AS [Month], cast(sum(iif(amt_drcr=1,post_amt*-1,post_amt))/100000 AS VARCHAR) + ' L' AS cl_bal from acnt_post,ledg_mst  where  Acnt_Date  between '" + datew + "' " + loc_code + " and ledg_code=ledg_ac and acnt_post.Export_Type<5 and ledg_mst.ServerId in (13,14)   group by LEFT(DATENAME(MONTH, Acnt_Date), 3), month(Acnt_Date) order by month(Acnt_Date)")

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
                loc_code = "and Acnt.post.Loc_Code ='" + value + "'"
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
        TranDt = con.ReturnDtTable("select  'Day '+ cast(day(Acnt_Date)AS VARCHAR) as day,  cast(sum(iif(amt_drcr=1,post_amt*-1,post_amt))/1000 AS VARCHAR) + ' K' AS cl_bal from acnt_post,ledg_mst  where  Acnt_Date  between '" + datew + "' " + loc_code + " and ledg_code=ledg_ac and acnt_post.Export_Type<5 and ledg_mst.ServerId in (13,14) group by day(Acnt_Date) order by day(Acnt_Date)")


        Dim json = New With {
           .DataTable1 = TranDt
         }

        'Convert the DataTable to a JSON string
        Dim jsown As String = JsonConvert.SerializeObject(json)

        'Return the JSON string
        Return jsown
    End Function


    Public Shared Function graph(ByVal TranDt0 As DataTable)

        Dim resultTables As New List(Of DataTable)
        Dim startDate As DateTime = DateTime.MaxValue
        Dim endDate As DateTime = DateTime.MinValue
        ' Determine the minimum and maximum years from the data
        Dim minYear As Integer = Integer.MaxValue
        Dim maxYear As Integer = Integer.MinValue

        For Each row As DataRow In TranDt0.Rows
            Dim acntDate As DateTime = CDate(row("acnt_date"))
            Dim year As Integer = acntDate.Year

            If acntDate < startDate Then
                startDate = acntDate
                minYear = year

            End If

            If acntDate > endDate Then
                endDate = acntDate
                maxYear = year

            End If
        Next

        Dim yearDifference As Integer = endDate.Year - startDate.Year
        Dim caseyr As Int16
        If yearDifference <= 1 Then
            caseyr = 4
        ElseIf yearDifference <= 2 Then
            caseyr = 8
        ElseIf yearDifference <= 3 Then
            caseyr = 12
        Else
            caseyr = 16
        End If

        'Filter for Year
        Dim TranDt As New DataTable
        TranDt.Columns.Add("year", GetType(String))
        TranDt.Columns.Add("cl_bal", GetType(Double))

        Dim currentYear As Integer = minYear
        While currentYear <= maxYear
            Dim yearStart As DateTime = New DateTime(currentYear, 4, 1)
            Dim yearEnd As DateTime = yearStart.AddYears(1).AddDays(-1)

            Dim sumBalance As Int32 = 0
            Dim rows As DataRow() = TranDt0.Select("acnt_date >= #" & yearStart.ToString("MM/dd/yyyy") & "# AND acnt_date <= #" & yearEnd.ToString("MM/dd/yyyy") & "#")
            If rows.Length > 0 Then
                Dim financialYear As String = currentYear.ToString() & "-" & (currentYear + 1).ToString()
                For Each row As DataRow In rows
                    sumBalance += CDbl(row("cl_bal"))
                Next
                TranDt.Rows.Add(financialYear, Math.Round(sumBalance / 100000, 2))
            End If
            currentYear += 1
        End While


        ' Filter for Month
        Dim TranDt1 As New DataTable
        TranDt1.Columns.Add("Month", GetType(String))
        TranDt1.Columns.Add("cl_bal", GetType(Double))

        Dim currentMonth As DateTime = startDate
        While currentMonth <= endDate
            Dim monthStart As DateTime = New DateTime(currentMonth.Year, currentMonth.Month, 1)
            Dim monthEnd As DateTime = monthStart.AddMonths(1).AddDays(-1)

            Dim sumBalance As Double = 0.0
            Dim rows As DataRow() = TranDt0.Select("acnt_date >= #" & monthStart.ToString("MM/dd/yyyy") & "# AND acnt_date <= #" & monthEnd.ToString("MM/dd/yyyy") & "#")

            For Each row As DataRow In rows
                sumBalance += CDbl(row("cl_bal"))
            Next

            Dim month As String = monthStart.ToString("MMM")
            TranDt1.Rows.Add(month, Math.Round(sumBalance / 100000, 2))

            currentMonth = currentMonth.AddMonths(1)
        End While





        'Filter for Quarters
        Dim TranDtQuarter As New DataTable
        TranDtQuarter.Columns.Add("Quarter", GetType(String))
        TranDtQuarter.Columns.Add("cl_bal", GetType(Double))

        Dim currentQuarter As Integer = 1
        Dim currentQuarterStart As DateTime = startDate

        While currentQuarter <= caseyr
            Dim quarterEnd As DateTime

            Select Case currentQuarter
                Case 1
                    quarterEnd = New DateTime(currentQuarterStart.Year, 6, 30)
                Case 2
                    quarterEnd = New DateTime(currentQuarterStart.Year, 9, 30)
                Case 3
                    quarterEnd = New DateTime(currentQuarterStart.Year, 12, 31)
                Case 4
                    quarterEnd = New DateTime(currentQuarterStart.Year, 3, 31)


                Case 5
                    quarterEnd = New DateTime(currentQuarterStart.Year, 6, 30)
                Case 6
                    quarterEnd = New DateTime(currentQuarterStart.Year, 9, 30)
                Case 7
                    quarterEnd = New DateTime(currentQuarterStart.Year, 12, 31)
                Case 8
                    quarterEnd = New DateTime(currentQuarterStart.Year, 3, 31)

                Case 9
                    quarterEnd = New DateTime(currentQuarterStart.Year, 6, 30)
                Case 10
                    quarterEnd = New DateTime(currentQuarterStart.Year, 9, 30)
                Case 11
                    quarterEnd = New DateTime(currentQuarterStart.Year, 12, 31)
                Case 12
                    quarterEnd = New DateTime(currentQuarterStart.Year, 3, 31)


                Case 13
                    quarterEnd = New DateTime(currentQuarterStart.Year, 6, 30)
                Case 14
                    quarterEnd = New DateTime(currentQuarterStart.Year, 9, 30)
                Case 15
                    quarterEnd = New DateTime(currentQuarterStart.Year, 12, 31)
                Case 16
                    quarterEnd = New DateTime(currentQuarterStart.Year, 3, 31)


            End Select

            Dim sumBalance As Double = 0
            Dim rows As DataRow() = TranDt0.Select("acnt_date >= #" & currentQuarterStart.ToString("MM/dd/yyyy") & "# AND acnt_date <= #" & quarterEnd.ToString("MM/dd/yyyy") & "#")

            For Each row As DataRow In rows
                sumBalance += CDbl(row("cl_bal"))
            Next

            Dim quarter As String = "Q" & currentQuarter.ToString()
            TranDtQuarter.Rows.Add(quarter, Math.Round(sumBalance / 100000, 2))

            currentQuarter += 1
            currentQuarterStart = quarterEnd.AddDays(1)
        End While





        ' Filter for Day
        Dim TranDt4 As New DataTable
        TranDt4.Columns.Add("day", GetType(String))
        TranDt4.Columns.Add("cl_bal", GetType(Double))


        Dim startDate1 As DateTime = New DateTime(minYear, 4, 1)
        Dim endDate1 As DateTime = New DateTime(minYear, 4, 30)

        Dim currentDate As DateTime = startDate1
        While currentDate <= endDate1
            Dim sumBalance As Double = 0.0
            Dim rows As DataRow() = TranDt0.Select("acnt_date = #" & currentDate.ToString("MM/dd/yyyy") & "#")

            For Each row As DataRow In rows
                sumBalance += CDbl(row("cl_bal"))
            Next

            TranDt4.Rows.Add(("Day" & currentDate.Day), Math.Round(sumBalance / 1000, 2))

            currentDate = currentDate.AddDays(1)
        End While



        'Filter for Branch
        'Dim TranDt5 As New DataTable
        'TranDt5.Columns.Add("loc_code", GetType(String))
        'TranDt5.Columns.Add("loc_name", GetType(String))
        'TranDt5.Columns.Add("cl_bal", GetType(Double))

        'Dim rows1 As DataRow() = TranDt0.Select()
        'For Each row As DataRow In rows1
        '    Dim locCode As String = row("loc_code").ToString()
        '    Dim locName As String = row("loc_name").ToString()
        '    Dim balance As Double = CDbl(row("cl_bal"))

        '    Dim existingRow As DataRow = TranDt5.Select("loc_code = '" & locCode & "'").FirstOrDefault()
        '    If existingRow IsNot Nothing Then
        '        existingRow("cl_bal") = Math.Round(CDbl(existingRow("cl_bal")) + (balance / 100000), 2)
        '    Else
        '        TranDt5.Rows.Add(locCode, locName, Math.Round(balance / 100000, 2))
        '    End If
        'Next

        resultTables.Add(TranDt)
        resultTables.Add(TranDt1)
        resultTables.Add(TranDtQuarter)
        resultTables.Add(TranDt4)
        'resultTables.Add(TranDt5)

        Return resultTables
    End Function





End Class