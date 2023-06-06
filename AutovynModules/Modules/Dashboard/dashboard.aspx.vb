Imports System.IO
Imports System.Web.Services
Imports Newtonsoft.Json
Imports System.Data.DataSet
Public Class dashboard
    Inherits System.Web.UI.Page
    Private con
    Private dt As New DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con = New Connection
        Try
            If Not IsPostBack Then
                dse_list()
                Year_From.Text = "2022"
                Year_To.Text = "2023"
            End If
        Catch ex As Exception

        End Try

    End Sub


    'SELECT CONCAT(CAST(YEAR(DATEADD(month, -3, Acnt_Date)) AS VARCHAR),'-', CAST(YEAR(DATEADD(month, 9, Acnt_Date)) AS VARCHAR) ) AS year,  cast(SUM(IIF(amt_drcr = 1, post_amt, post_amt * -1))/100000 as varchar) + ' L' AS cl_bal FROM acnt_post WHERE  ledg_ac IN (SELECT ledg_code FROM ledg_mst WHERE group_code = '" + grp_name + "')AND Acnt_Date BETWEEN  '04/01/" + frm_year + "' AND '03/31/" + to_year + "' GROUP BY CONCAT( CAST(YEAR(DATEADD(month, -3, Acnt_Date)) AS VARCHAR),  '-',  CAST(YEAR(DATEADD(month, 9, Acnt_Date)) AS VARCHAR) )ORDER BY  year
    '    Select Case CONCAT(CAST(YEAR(DATEADD(month, -3, Acnt_Date)) As VARCHAR),'-', CAST(YEAR(DATEADD(month, 9, Acnt_Date)) AS VARCHAR) ) AS year, concat(LEFT(DATENAME(MONTH, Acnt_Date), 3),'-',right(YEAR(Acnt_Date),2)) AS [Month], CAST(SUM(IIF(amt_drcr = 1, post_amt, post_amt * -1)) / 100000 AS VARCHAR) + ' L' AS cl_bal FROM acnt_post WHERE ledg_ac IN (SELECT ledg_code FROM ledg_mst WHERE group_code = '" + grp_name + "') AND Acnt_Date BETWEEN '04/01/" + frm_year + "' and '03/31/" + to_year + "' GROUP BY CONCAT( CAST(YEAR(DATEADD(month, -3, Acnt_Date)) AS VARCHAR),  '-',  CAST(YEAR(DATEADD(month, 9, Acnt_Date)) AS VARCHAR) ), LEFT(DATENAME(MONTH, Acnt_Date), 3),year(Acnt_Date), MONTH(Acnt_Date) ORDER BY year(Acnt_Date),MONTH(Acnt_Date)        
    'SELECT YEAR(DATEADD(MONTH, -3, Acnt_Date)) + Case When MONTH(Acnt_Date) <= 3 Then 1 Else 0 End As Year, 'Q' + CAST(DATEPART(QUARTER, DATEADD(MONTH, -3, Acnt_Date)) AS VARCHAR) + '-' + right(CAST(YEAR(DATEADD(MONTH, -3, Acnt_Date)) + CASE WHEN MONTH(Acnt_Date) <= 3 THEN 1 ELSE 0 END AS VARCHAR),2) AS Quarter, CAST(SUM(IIF(amt_drcr = 1, post_amt, post_amt * -1)) / 100000 AS VARCHAR) + ' L' AS cl_bal FROM  acnt_post WHERE  ledg_ac IN (SELECT ledg_code FROM ledg_mst WHERE group_code = '" + grp_name + "') AND Acnt_Date BETWEEN  '04/01/" + frm_year + "' and '03/31/" + to_year + "' GROUP BY YEAR(DATEADD(MONTH, -3, Acnt_Date)) + CASE WHEN MONTH(Acnt_Date) <= 3 THEN 1 ELSE 0 END,'Q' + CAST(DATEPART(QUARTER, DATEADD(MONTH, -3, Acnt_Date)) AS VARCHAR) + '-' + right(CAST(YEAR(DATEADD(MONTH, -3, Acnt_Date)) + CASE WHEN MONTH(Acnt_Date) <= 3 THEN 1 ELSE 0 END AS VARCHAR),2) ORDER BY Year, Quarter      
    'Select Case'Day '+ cast(day(Acnt_Date)AS VARCHAR) as day, cast(sum(iif(amt_drcr=1,post_amt,post_amt*-1))/1000 AS VARCHAR) + ' K' as cl_bal from acnt_post  where ledg_ac in(select ledg_code from ledg_mst where group_code= '" + grp_name + "') and Acnt_Date between '04/01/" + frm_year + "' and '04/30/" + frm_year + "' group by day(Acnt_Date) order by day(Acnt_Date)
    'SELECT  LEFT(DATENAME(MONTH, Acnt_Date), 3) AS [Month], CAST(SUM(IIF(amt_drcr = 1, post_amt, post_amt * -1)) / 100000 AS VARCHAR) + ' L' AS cl_bal FROM acnt_post WHERE ledg_ac IN (SELECT ledg_code FROM ledg_mst WHERE group_code =  '" + grp_name + "') AND Acnt_Date BETWEEN '04/01/" + prev_fromyear + "' and '03/31/" + prev_toyear + "' GROUP BY LEFT(DATENAME(MONTH, Acnt_Date), 3), year(Acnt_Date), MONTH(Acnt_Date) ORDER BY year(Acnt_Date), MONTH(Acnt_Date)

    <WebMethod()>
    Public Shared Function GetChartData(grp_name As String, frm_year As String, to_year As String) As String

        Dim con As New Connection

        HttpContext.Current.Session("YourKey") = ""

        Dim prev_fromyear As String = frm_year - 1

        Dim prev_toyear As String = to_year - 1


        Dim dt As DataTable = con.ReturnDtTable("SELECT acnt_post.acnt_date,  SUM(IIF(amt_drcr = 1, post_amt, post_amt * -1)) AS cl_bal FROM acnt_post WHERE  ledg_ac IN (SELECT ledg_code FROM ledg_mst WHERE group_code =  '" + grp_name + "')AND acnt_post.Acnt_Date BETWEEN  '04/01/" + frm_year + "' AND '03/31/" + to_year + "' group BY acnt_post.acnt_date ORDER BY acnt_post.acnt_date;")

        Dim dv As DataView = New DataView(dt)
        'dv.RowFilter = "Select  concat(LEFT(DATENAME(MONTH, Acnt_Date), 3),'-',right(YEAR(Acnt_Date),2)) AS [Month], CAST(SUM(IIF(amt_drcr = 1, post_amt, post_amt * -1)) / 100000 AS VARCHAR) + ' L' AS cl_bal  GROUP BY  LEFT(DATENAME(MONTH, Acnt_Date), 3), MONTH(Acnt_Date) ORDER BY MONTH(Acnt_Date)"


        dv.RowFilter = "Select concat(LEFT(DATENAME(MONTH, Acnt_Date), 3),'-',right(YEAR(Acnt_Date),2)) AS [Month], CAST(SUM(IIF(amt_drcr = 1, post_amt, post_amt * -1)) / 100000 AS VARCHAR) + ' L' AS cl_bal  GROUP BY  LEFT(DATENAME(MONTH, Acnt_Date), 3), MONTH(Acnt_Date) ORDER BY MONTH(Acnt_Date)"

        Dim gdwn_dt As DataTable = con.ReturnDtTable("SELECT (SELECT top 1 Godw_Name FROM Godown_Mst where Godw_Code = Loc_Code) as loc_name, Loc_Code, ABS(SUM(IIF(amt_drcr = 1, post_amt, post_amt * -1))) AS cl_bal FROM acnt_post WHERE  ledg_ac IN (SELECT ledg_code FROM ledg_mst WHERE group_code =  '" + grp_name + "')AND Acnt_Date BETWEEN  '04/01/" + frm_year + "' AND '03/31/" + to_year + "'  GROUP BY  Loc_Code ORDER BY  Loc_Code;")



        'Dim json = New With {
        '   .DataTable1 = dt
        '   .DataTable2 = dt.Tables(1),
        '   .DataTable3 = dt.Tables(2),
        '   .DataTable4 = dt.Tables(3),
        '   .DataTable5 = dt.Tables(4),
        '   .DataTable7 = dt.Tables(5)
        ' }

        'Convert the DataTable to a JSON string
        Dim jsown As String

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

        Dim prev_fromyear As String = frm_year - 1

        Dim prev_toyear As String = to_year - 1

        Dim sql As String = "SELECT CONCAT(CAST(YEAR(DATEADD(month, -3, Acnt_Date)) AS VARCHAR),'-', CAST(YEAR(DATEADD(month, 9, Acnt_Date)) AS VARCHAR) ) AS year,  cast(SUM(IIF(amt_drcr = 1, post_amt, post_amt * -1))/100000 as varchar) + ' L' AS cl_bal FROM acnt_post WHERE  ledg_ac IN (SELECT ledg_code FROM ledg_mst WHERE group_code = '" + grp_name + "')AND Acnt_Date BETWEEN  '04/01/" + frm_year + "' AND '03/31/" + to_year + "' and Loc_Code ='" + loc_code + "' GROUP BY CONCAT( CAST(YEAR(DATEADD(month, -3, Acnt_Date)) AS VARCHAR),  '-',  CAST(YEAR(DATEADD(month, 9, Acnt_Date)) AS VARCHAR) )ORDER BY  year;        
SELECT  CONCAT(CAST(YEAR(DATEADD(month, -3, Acnt_Date)) AS VARCHAR),'-', CAST(YEAR(DATEADD(month, 9, Acnt_Date)) AS VARCHAR) ) AS year, concat(LEFT(DATENAME(MONTH, Acnt_Date), 3),'-',right(YEAR(Acnt_Date),2)) AS [Month], CAST(SUM(IIF(amt_drcr = 1, post_amt, post_amt * -1)) / 100000 AS VARCHAR) + ' L' AS cl_bal FROM acnt_post WHERE ledg_ac IN (SELECT ledg_code FROM ledg_mst WHERE group_code = '" + grp_name + "') AND Acnt_Date BETWEEN '04/01/" + frm_year + "' and '03/31/" + to_year + "' and Loc_Code ='" + loc_code + "' GROUP BY CONCAT( CAST(YEAR(DATEADD(month, -3, Acnt_Date)) AS VARCHAR),  '-',  CAST(YEAR(DATEADD(month, 9, Acnt_Date)) AS VARCHAR) ), LEFT(DATENAME(MONTH, Acnt_Date), 3),year(Acnt_Date), MONTH(Acnt_Date) ORDER BY year(Acnt_Date),MONTH(Acnt_Date);        
SELECT YEAR(DATEADD(MONTH, -3, Acnt_Date)) + CASE WHEN MONTH(Acnt_Date) <= 3 THEN 1 ELSE 0 END AS Year, 'Q' + CAST(DATEPART(QUARTER, DATEADD(MONTH, -3, Acnt_Date)) AS VARCHAR) + '-' + right(CAST(YEAR(DATEADD(MONTH, -3, Acnt_Date)) + CASE WHEN MONTH(Acnt_Date) <= 3 THEN 1 ELSE 0 END AS VARCHAR),2) AS Quarter, CAST(SUM(IIF(amt_drcr = 1, post_amt, post_amt * -1)) / 100000 AS VARCHAR) + ' L' AS cl_bal FROM  acnt_post WHERE  ledg_ac IN (SELECT ledg_code FROM ledg_mst WHERE group_code = '" + grp_name + "') AND Acnt_Date BETWEEN  '04/01/" + frm_year + "' and '03/31/" + to_year + "' and Loc_Code ='" + loc_code + "' GROUP BY YEAR(DATEADD(MONTH, -3, Acnt_Date)) + CASE WHEN MONTH(Acnt_Date) <= 3 THEN 1 ELSE 0 END,'Q' + CAST(DATEPART(QUARTER, DATEADD(MONTH, -3, Acnt_Date)) AS VARCHAR) + '-' + right(CAST(YEAR(DATEADD(MONTH, -3, Acnt_Date)) + CASE WHEN MONTH(Acnt_Date) <= 3 THEN 1 ELSE 0 END AS VARCHAR),2) ORDER BY Year, Quarter;      
select  'Day '+ cast(day(Acnt_Date)AS VARCHAR) as day, cast(sum(iif(amt_drcr=1,post_amt,post_amt*-1))/1000 AS VARCHAR) + ' K' as cl_bal from acnt_post  where ledg_ac in(select ledg_code from ledg_mst where group_code= '" + grp_name + "') and Acnt_Date between '04/01/" + frm_year + "' and '04/30/" + frm_year + "' and Loc_Code ='" + loc_code + "' group by day(Acnt_Date) order by day(Acnt_Date);             
SELECT  LEFT(DATENAME(MONTH, Acnt_Date), 3) AS [Month], CAST(SUM(IIF(amt_drcr = 1, post_amt, post_amt * -1)) / 100000 AS VARCHAR) + ' L' AS cl_bal FROM acnt_post WHERE ledg_ac IN (SELECT ledg_code FROM ledg_mst WHERE group_code =  '" + grp_name + "') AND Acnt_Date BETWEEN '04/01/" + prev_fromyear + "' and '03/31/" + prev_toyear + "' and Loc_Code ='" + loc_code + "' GROUP BY LEFT(DATENAME(MONTH, Acnt_Date), 3), year(Acnt_Date), MONTH(Acnt_Date) ORDER BY year(Acnt_Date), MONTH(Acnt_Date);"


        Dim dt As DataSet = con.ReturnDtSet(Sql)

        Dim json = New With {
           .DataTable1 = dt.Tables(0),
           .DataTable2 = dt.Tables(1),
           .DataTable3 = dt.Tables(2),
           .DataTable4 = dt.Tables(3),
           .DataTable5 = dt.Tables(4)
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

        Dim a = xValue.Split("-"c)
        Dim b = a(1)
        Dim c = a(0)
        Dim year = "20" + b

        'Dim to_qryear = Int(from_year) + 1

        Dim con As New Connection
        Dim datew = ""

        Select Case c
            Case "Q4"
                datew = "01/01/" + year + "' and '03/31/" + year + ""
            Case "Q1"
                datew = "04/01/" + year + "' and '06/30/" + year + ""
            Case "Q2"
                datew = "07/01/" + year + "' and '09/30/" + year + ""
            Case "Q3"
                datew = "10/01/" + year + "' and '12/31/" + year + ""
        End Select

        Dim TranDt As DataTable
        TranDt = con.ReturnDtTable("select LEFT(DATENAME(MONTH, Acnt_Date), 3) AS [Month], cast(sum(iif(amt_drcr=1,post_amt,post_amt*-1))/100000 AS VARCHAR) + ' L' AS cl_bal from acnt_post  where ledg_ac in(select ledg_code from ledg_mst where group_code= '" + grp_name + "') and Acnt_Date between '" + datew + "' " + loc_code + "  group by LEFT(DATENAME(MONTH, Acnt_Date), 3), month(Acnt_Date) order by month(Acnt_Date)")


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

        Dim a = xValue.Split("-"c)
        Dim b = a(1)
        Dim c = a(0)
        Dim year = "20" + b


        Dim con As New Connection
        Dim datew = ""

        Select Case c
            Case "Jan"
                datew = "01/01/" + year + "' and '01/31/" + year + ""
            Case "Feb"
                datew = "02/01/" + year + "' and '02/28/" + year + ""
            Case "Mar"
                datew = "03/01/" + year + "' and '03/31/" + year + ""
            Case "Apr"
                datew = "04/01/" + year + "' and '04/30/" + year + ""
            Case "May"
                datew = "05/01/" + year + "' and '05/31/" + year + ""
            Case "Jun"
                datew = "06/01/" + year + "' and '06/30/" + year + ""
            Case "Jul"
                datew = "07/01/" + year + "' and '07/31/" + year + ""
            Case "Aug"
                datew = "08/01/" + year + "' and '08/31/" + year + ""
            Case "Sep"
                datew = "09/01/" + year + "' and '09/30/" + year + ""
            Case "Oct"
                datew = "10/01/" + year + "' and '10/31/" + year + ""
            Case "Nov"
                datew = "11/01/" + year + "' and '11/30/" + year + ""
            Case "Dec"
                datew = "12/01/" + year + "' and '12/31/" + year + ""
        End Select

        Dim TranDt As DataTable
        TranDt = con.ReturnDtTable("select  'Day '+ cast(day(Acnt_Date)AS VARCHAR) as day,  cast(sum(iif(amt_drcr=1,post_amt,post_amt*-1))/1000 AS VARCHAR) + ' K' AS cl_bal from acnt_post  where ledg_ac in(select ledg_code from ledg_mst where group_code= '" + grp_name + "') and Acnt_Date between '" + datew + "' " + loc_code + " group by day(Acnt_Date) order by day(Acnt_Date)")


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
        ' Filter for Month
        Dim TranDt1 As New DataTable
        TranDt1.Columns.Add("Month", GetType(String))
        TranDt1.Columns.Add("cl_bal", GetType(Double))

        Dim currentMonth As DateTime = startDate
        Dim processedMonths As New HashSet(Of Integer)()

        While currentMonth <= endDate
            Dim month As Integer = currentMonth.Month

            ' Check if the month has already been processed
            If Not processedMonths.Contains(month) Then
                Dim sumBalance As Double = 0.0
                Dim rows As DataRow() = TranDt0.AsEnumerable().Where(Function(row) row.Field(Of DateTime)("acnt_date").Month = month).ToArray()

                For Each row As DataRow In rows
                    sumBalance += CDbl(row("cl_bal"))
                Next

                Dim monthName As String = currentMonth.ToString("MMM")
                TranDt1.Rows.Add(monthName, Math.Round(sumBalance / 100000, 2))

                ' Add the processed month to the set
                processedMonths.Add(month)
            End If

            currentMonth = currentMonth.AddMonths(1)
        End While


        ' Filter for Quarter
        Dim TranDtQuarter As New DataTable
        TranDtQuarter.Columns.Add("Quarter", GetType(String))
        TranDtQuarter.Columns.Add("cl_bal", GetType(Double))

        ' Define the start month for each quarter
        Dim startMonths As New List(Of Integer) From {4, 7, 10, 1}

        ' Define the end month for each quarter
        Dim endMonths As New List(Of Integer) From {6, 9, 12, 3}

        ' Iterate through each quarter
        For i As Integer = 0 To 3
            Dim sumBalance As Double = 0.0

            ' Filter the rows based on the quarter's start and end months
            Dim rows As DataRow() = TranDt0.AsEnumerable().Where(Function(row) row.Field(Of DateTime)("acnt_date").Month >= startMonths(i) AndAlso row.Field(Of DateTime)("acnt_date").Month <= endMonths(i)).ToArray()

            ' Calculate the sum of cl_bal for the quarter
            For Each row As DataRow In rows
                sumBalance += CDbl(row("cl_bal"))
            Next

            ' Determine the quarter label
            Dim quarterLabel As String = "Q" & (i + 1).ToString()

            ' Add the quarter data to the TranDtQuarter DataTable
            TranDtQuarter.Rows.Add(quarterLabel, Math.Round(sumBalance / 100000, 2))
        Next



        ' Filter for Day
        Dim TranDt4 As New DataTable
        TranDt4.Columns.Add("day", GetType(String))
        TranDt4.Columns.Add("cl_bal", GetType(Double))

        Dim targetMonth As Integer = 4 ' April

        Dim filteredRows As DataRow() = TranDt0.AsEnumerable().Where(Function(row) row.Field(Of DateTime)("acnt_date").Month = targetMonth).ToArray()
        Dim groupedRows = filteredRows.GroupBy(Function(row) row.Field(Of DateTime)("acnt_date").Day)

        For Each group In groupedRows
            Dim sumBalance As Double = 0.0

            For Each row As DataRow In group
                sumBalance += CDbl(row("cl_bal"))
            Next

            TranDt4.Rows.Add(("Day" & group.Key), Math.Round(sumBalance / 1000, 2))
        Next


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

        Return resultTables
    End Function



End Class