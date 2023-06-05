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


    'For entire dashboard
    <WebMethod()>
    Public Shared Function GetChartData(grp_name As String, frm_year As String, to_year As String) As String
        Dim con As New Connection

        Dim prev_fromyear As String = frm_year - 1
        Dim prev_toyear As String = to_year - 1

        Dim sql As String = ("SELECT acnt_date, CAST(ROUND(IIF(amt_drcr = 1, post_amt * -1, post_amt), 0) AS INT) AS cl_bal FROM acnt_post,ledg_mst where  acnt_date BETWEEN  '04/01/" + frm_year + "' AND '03/31/" + to_year + "' and ledg_code=ledg_ac and acnt_post.Export_Type<5 and ledg_mst.ServerId in (13,14) order by Acnt_Date;

                        SELECT  LEFT(DATENAME(MONTH, Acnt_Date), 3) AS [Month], CAST(SUM(iif(amt_drcr=1,post_amt*-1,post_amt)) / 100000 AS VARCHAR) + ' L' AS cl_bal FROM acnt_post,ledg_mst where  acnt_date BETWEEN  '04/01/" + prev_fromyear + "' AND '03/31/" + prev_toyear + "' and ledg_code=ledg_ac and acnt_post.Export_Type<5 and ledg_mst.ServerId in (13,14) GROUP BY LEFT(DATENAME(MONTH, Acnt_Date), 3), year(Acnt_Date), MONTH(Acnt_Date) ORDER BY year(Acnt_Date), MONTH(Acnt_Date)
                        ")

        Dim dt1 As DataSet
        dt1 = con.ReturnDtSet(sql)
        ' Call the function and get the resultTables list
        Dim resultTables As List(Of DataTable) = graph(dt1.Tables(0))


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

        Dim TranDt7 As DataTable
        TranDt7 = dt1.Tables(1)

        Dim dt2 As DataTable
        dt2 = con.ReturnDtTable("SELECT (SELECT top 1 Godw_Name FROM Godown_Mst where Godw_Code = acnt_post.Loc_Code) as loc_name,
                        acnt_post.Loc_Code, ABS(SUM(IIF(amt_drcr = 1, post_amt, post_amt * -1))/100000) AS cl_bal FROM acnt_post,ledg_mst where  acnt_date BETWEEN  '04/01/" + frm_year + "'
                        AND '03/31/" + to_year + "'
                        and ledg_code=ledg_ac and acnt_post.Export_Type<5 and ledg_mst.ServerId in (13,14)  GROUP BY CONCAT( CAST(YEAR(DATEADD(month, -3, Acnt_Date))
                        AS VARCHAR),  '-', 
                        CAST(YEAR(DATEADD(month, 9, Acnt_Date)) AS VARCHAR) ), acnt_post.Loc_Code ORDER BY  acnt_post.Loc_Code")

        Dim json = New With {
           .DataTable1 = TranDt,
               .DataTable2 = TranDt1,
               .DataTable3 = TranDt3,
               .DataTable4 = TranDt4,
               .DataTable5 = dt2,
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

        Dim prev_fromyear As String = frm_year - 1

        Dim prev_toyear As String = to_year - 1

        Dim TranDt As DataTable

        Dim sql As String = ("SELECT acnt_date, CAST(ROUND(IIF(amt_drcr = 1, post_amt * -1, post_amt), 0) AS INT) AS cl_bal FROM acnt_post,ledg_mst where  acnt_date BETWEEN  '04/01/" + frm_year + "' AND '03/31/" + to_year + "' and ledg_code=ledg_ac and acnt_post.Export_Type<5 and ledg_mst.ServerId in (13,14) and acnt_post.loc_code=" + loc_code + " order by Acnt_Date;

                        SELECT  LEFT(DATENAME(MONTH, Acnt_Date), 3) AS [Month], CAST(SUM(iif(amt_drcr=1,post_amt*-1,post_amt)) / 100000 AS VARCHAR) + ' L' AS cl_bal FROM acnt_post,ledg_mst where  acnt_date BETWEEN  '04/01/" + prev_fromyear + "' AND '03/31/" + prev_toyear + "' and acnt_post.Loc_Code ='" + loc_code + "' and ledg_code=ledg_ac and acnt_post.Export_Type<5 and ledg_mst.ServerId in (13,14) GROUP BY LEFT(DATENAME(MONTH, Acnt_Date), 3), year(Acnt_Date), MONTH(Acnt_Date) ORDER BY year(Acnt_Date), MONTH(Acnt_Date)
                        ")

        Dim dt1 As DataSet
        dt1 = con.ReturnDtSet(sql)

        Dim resultTables As List(Of DataTable) = graph(dt1.Tables(0))

        Dim TranDt1 As DataTable
        Dim TranDt3 As DataTable
        Dim TranDt4 As DataTable

        If resultTables.Count >= 4 Then
            TranDt = resultTables(0).Copy()
            TranDt1 = resultTables(1).Copy()
            TranDt3 = resultTables(2).Copy()
            TranDt4 = resultTables(3).Copy()
        Else

            TranDt = New DataTable()
        End If

        Dim TranDt7 As DataTable
        TranDt7 = dt1.Tables(1)

        Dim json = New With {
           .DataTable1 = TranDt,
           .DataTable2 = TranDt1,
           .DataTable3 = TranDt3,
           .DataTable4 = TranDt4,
           .DataTable5 = TranDt7
         }

        Dim jsown As String = JsonConvert.SerializeObject(json)

        Return jsown
    End Function


    'For quarter ajax
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
            Case "Q4"
                datew = "01/01/" + to_year + "' and '03/31/" + to_year + ""
            Case "Q1"
                datew = "04/01/" + frm_year + "' and '06/30/" + frm_year + ""
            Case "Q2"
                datew = "07/01/" + frm_year + "' and '09/30/" + frm_year + ""
            Case "Q3"
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



    'For month ajax
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


    'Filters for arranging the data month quarter a day wise
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


    'Filter Month
    Public Shared Function monthtable(ByVal TranDt0 As DataTable, xValue As String)
        ' Filter for Day
        Dim TranDt4 As New DataTable
        TranDt4.Columns.Add("day", GetType(String))
        TranDt4.Columns.Add("cl_bal", GetType(Double))

        Dim targetMonth As Integer = xValue

        Dim filteredRows As DataRow() = TranDt0.AsEnumerable().Where(Function(row) row.Field(Of DateTime)("acnt_date").Month = targetMonth).ToArray()
        Dim groupedRows = filteredRows.GroupBy(Function(row) row.Field(Of DateTime)("acnt_date").Day)

        For Each group In groupedRows
            Dim sumBalance As Double = 0.0

            For Each row As DataRow In group
                sumBalance += CDbl(row("cl_bal"))
            Next

            TranDt4.Rows.Add(("Day" & group.Key), Math.Round(sumBalance / 1000, 2))
        Next
        Return TranDt4
    End Function


    'Filter Quarter
    Public Shared Function quartertable(ByVal TranDt0 As DataTable, xValue As String) As DataTable
        Dim TranDt1 As New DataTable
        TranDt1.Columns.Add("Month", GetType(String))
        TranDt1.Columns.Add("cl_bal", GetType(Double))

        Dim startMonth As Integer
        Dim endMonth As Integer

        Select Case xValue
            Case "Q1"
                startMonth = 4
                endMonth = 6
            Case "Q2"
                startMonth = 7
                endMonth = 9
            Case "Q3"
                startMonth = 10
                endMonth = 12
            Case "Q4"
                startMonth = 1
                endMonth = 3
            Case Else
                Return TranDt1 ' Return an empty table if the quarter is not recognized
        End Select

        Dim currentMonth As Integer = startMonth

        While currentMonth <= endMonth
            Dim monthName As String = New DateTime(2000, currentMonth, 1).ToString("MMM") ' You can set any year here since we're focusing on the month
            Dim sumBalance As Double = 0.0
            Dim rows As DataRow() = TranDt0.AsEnumerable().Where(Function(row) row.Field(Of DateTime)("acnt_date").Month = currentMonth).ToArray()

            For Each row As DataRow In rows
                sumBalance += CDbl(row("cl_bal"))
            Next

            TranDt1.Rows.Add(monthName, Math.Round(sumBalance / 100000, 2))

            currentMonth += 1
        End While

        Return TranDt1
    End Function

    'Filter Branch
    Public Shared Function branchtable(ByVal TranDt0 As DataTable) As DataTable
        ' Filter for Branch
        Dim TranDt5 As New DataTable
        TranDt5.Columns.Add("loc_code", GetType(String))
        TranDt5.Columns.Add("cl_bal", GetType(Double))

        Dim balances As New Dictionary(Of String, Double)()

        For Each row As DataRow In TranDt0.Rows
            Dim locCode As String = row("loc_code").ToString()
            Dim balance As Double = CDbl(row("cl_bal")) / 100000

            If balances.ContainsKey(locCode) Then
                balances(locCode) += balance
            Else
                balances.Add(locCode, balance)
            End If
        Next

        For Each kvp As KeyValuePair(Of String, Double) In balances
            TranDt5.Rows.Add(kvp.Key, Math.Round(kvp.Value, 2))
        Next

        Return TranDt5
    End Function


End Class