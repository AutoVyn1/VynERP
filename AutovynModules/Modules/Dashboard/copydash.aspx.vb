Imports Newtonsoft.Json

Public Class copydash
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

	End Sub

	Protected Sub Load_Location_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Load_Location.Click

		Try
			Dim frm_year As String = Year_From.Text
			Dim to_year As String = Year_To.Text
			Dim con As New Connection

			Dim prev_fromyear As String = frm_year - 1
			Dim prev_toyear As String = to_year - 1

			Dim sql As String = ("SELECT acnt_date, CAST(ROUND(IIF(amt_drcr = 1, post_amt * -1, post_amt), 0) AS INT) AS cl_bal FROM acnt_post,ledg_mst where  acnt_date BETWEEN  '04/01/" + frm_year + "' AND '03/31/" + to_year + "' and ledg_code=ledg_ac and acnt_post.Export_Type<5 and ledg_mst.ServerId in (13,14) order by Acnt_Date;

                        SELECT  LEFT(DATENAME(MONTH, Acnt_Date), 3) AS [Month], CAST(SUM(iif(amt_drcr=1,post_amt*-1,post_amt)) / 100000 AS VARCHAR) + ' L' AS cl_bal FROM acnt_post,ledg_mst where  acnt_date BETWEEN  '04/01/" + prev_fromyear + "' AND '03/31/" + prev_toyear + "' and ledg_code=ledg_ac and acnt_post.Export_Type<5 and ledg_mst.ServerId in (13,14) GROUP BY LEFT(DATENAME(MONTH, Acnt_Date), 3), year(Acnt_Date), MONTH(Acnt_Date) ORDER BY year(Acnt_Date), MONTH(Acnt_Date)
                        ")

			Dim dt1 As DataSet
			dt1 = con.ReturnDtSet(sql)
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
			' Call the function and get the resultTables list
			Dim amounts = (TranDt).AsEnumerable().Select(Function(row) row.Field(Of String)("year")).ToList()
			Dim labels = (TranDt).AsEnumerable().Select(Function(row) row.Field(Of Double)("cl_bal")).ToList()

			Dim amounts1 = (TranDt1).AsEnumerable().Select(Function(row) row.Field(Of Double)("cl_bal")).ToList()
			Dim labels1 = (TranDt1).AsEnumerable().Select(Function(row) row.Field(Of String)("Month")).ToList()
			' Serialize the amounts list to a JSON string
			Dim json As String = JsonConvert.SerializeObject(amounts)
			Dim label As String = JsonConvert.SerializeObject(labels)

			Dim json1 As String = JsonConvert.SerializeObject(amounts1)
			Dim label1 As String = JsonConvert.SerializeObject(labels1)

			Dim extra As String = ""
			Dim divid As String = "spark3"
			Dim charttype As String = "bar"
			Dim script As String = Apexchart(label, json, divid, charttype, extra).ToString()
			Dim script1 As String = Apexchart(json1, label1, "spark1", charttype, extra).ToString()

			Page.ClientScript.RegisterStartupScript(Me.GetType(), "chart", script1)
			Page.ClientScript.RegisterStartupScript(Me.GetType(), "chart", script)



		Catch ex As Exception

		End Try
	End Sub

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

End Class