Imports System.Web.Services
Imports Newtonsoft.Json
Public Class MGA
    Inherits System.Web.UI.Page
    Private dt As New DataTable
    Private Loc_List As New DataTable
    Private con As New Connection

    Protected Sub Load_Location_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Load_Location.Click
        Try
            If appr_status.SelectedValue = "L" Then
                Amount_Panel.Visible = True
            ElseIf appr_status.SelectedValue = "G" Then
                Amount_Grid.Visible = False
            End If
            'location_Data()
            AmountView()
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("user_name") = "" Then
            Response.Redirect("../../../Default.aspx")
        End If
        Try
            If Not IsPostBack Then


            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub AmountView()
        Try
            Dim dt As New DataTable
            'dt.Columns.Add("View", GetType(String))
            dt.Columns.Add("branch", GetType(String))
            dt.Columns.Add("Apr", GetType(Integer))
            dt.Columns.Add("May", GetType(Integer))
            dt.Columns.Add("Jun", GetType(Integer))
            dt.Columns.Add("Jul", GetType(Integer))
            dt.Columns.Add("Aug", GetType(Integer))
            dt.Columns.Add("Sep", GetType(Integer))
            dt.Columns.Add("Oct", GetType(Integer))
            dt.Columns.Add("Nov", GetType(Integer))
            dt.Columns.Add("Dec", GetType(Integer))
            dt.Columns.Add("Jan", GetType(Integer))
            dt.Columns.Add("Feb", GetType(Integer))
            dt.Columns.Add("Mar", GetType(Integer))

            Dim BrDt As DataTable = con.ReturnDtTable("select loc_code,(SELECT TOP 1 GODW_NAME FROM GODOWN_MST WHERE GODW_CODE=ICM_MST.LOC_CODE) AS BRANCH from ICM_MST where EXPORT_TYPE<5 and INV_DATE BETWEEN '" & Year_From.Text & "-04-01' AND '" & Year_To.Text & "-03-31' group by Loc_Code")

            'Dim TranDt As DataTable
            'TranDt = con.ReturnDtTable("Select Loc_Code,Month(Inv_Date) as Mnth,Count(Loc_Code) as Count,(select sum(cons_dics,exch_disc,corp_disc,cons_disc1) from icm_dtl where tran_id=icm_mst.tran_id ) as Amount from  icm_mst where ICM_MST.Export_Type in (1,2) and  ICM_MST.tran_type=51 and INV_DATE between  '" & Year_From.Text & "-04-01' AND '" & Year_To.Text & "-03-31' group by loc_code,Month(Inv_Date)")

            Dim TranDt As DataTable
            TranDt = con.ReturnDtTable("SELECT month(icm_mst.inv_date)as Mnth,icm_mst.loc_code, SUM(Taxable) as Total_Taxable FROM icm_mst JOIN DMS_ROW_DATA ON icm_mst.Cust_Id = DMS_ROW_DATA.Ledger_Id  where DMS_ROW_DATA.Tran_Type = '4' and icm_mst.INV_DATE BETWEEN '" & Year_From.Text & "-04-01' AND '" & Year_To.Text & "-03-31' GROUP BY icm_mst.inv_date , icm_mst.Loc_Code,icm_mst.Cust_Id, DMS_ROW_DATA.Ledger_Id, Bill_No HAVING COUNT(*) >= 2; ")


            Dim dtrow() As DataRow
            For i As Integer = 0 To BrDt.Rows.Count - 1
                dt.Rows.Add()
                'dt.Rows(dt.Rows.Count - 1)("View") = BrDt.Rows(i)("View").ToString
                dt.Rows(dt.Rows.Count - 1)("BRANCH") = BrDt.Rows(i)("bRANCH").ToString

                dtrow = TranDt.Select("Loc_Code=" & Val(BrDt.Rows(i)("Loc_Code").ToString) & "")
                If dtrow.Length > 0 Then
                    Dim TranDt2 As DataTable
                    TranDt2 = dtrow.CopyToDataTable

                    dt.Rows(dt.Rows.Count - 1)("Apr") = Val(TranDt2.Compute("sum(total_taxable)", "Mnth=" & 4 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("May") = Val(TranDt2.Compute("sum(total_taxable)", "Mnth=" & 5 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Jun") = Val(TranDt2.Compute("sum(total_taxable)", "Mnth=" & 6 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Jul") = Val(TranDt2.Compute("sum(total_taxable)", "Mnth=" & 7 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Aug") = Val(TranDt2.Compute("sum(total_taxable)", "Mnth=" & 8 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Sep") = Val(TranDt2.Compute("sum(total_taxable)", "Mnth=" & 9 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Oct") = Val(TranDt2.Compute("sum(total_taxable)", "Mnth=" & 10 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Nov") = Val(TranDt2.Compute("sum(total_taxable)", "Mnth=" & 11 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Dec") = Val(TranDt2.Compute("sum(total_taxable)", "Mnth=" & 12 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Jan") = Val(TranDt2.Compute("sum(total_taxable)", "Mnth=" & 1 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Feb") = Val(TranDt2.Compute("sum(total_taxable)", "Mnth=" & 2 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Mar") = Val(TranDt2.Compute("sum(total_taxable)", "Mnth=" & 3 & "").ToString)
                End If
            Next
            Amount_Grid.DataSource = dt
            Amount_Grid.DataBind()

        Catch ex As Exception

        End Try
    End Sub



    <WebMethod()>
    Public Shared Function GetChartData(cellValue As String, frm_year As String, to_year As String) As String


        Dim con As New Connection

        Dim loc = con.ReturnDtTable("select godw_code from Godown_Mst where godw_name='" + cellValue + "'")

        Dim loc_co = loc.Rows(0)("godw_code").ToString
        Dim dt As New DataTable

        dt.Columns.Add("branch", GetType(String))
        dt.Columns.Add("Apr", GetType(Integer))
        dt.Columns.Add("May", GetType(Integer))
        dt.Columns.Add("Jun", GetType(Integer))
        dt.Columns.Add("Jul", GetType(Integer))
        dt.Columns.Add("Aug", GetType(Integer))
        dt.Columns.Add("Sep", GetType(Integer))
        dt.Columns.Add("Oct", GetType(Integer))
        dt.Columns.Add("Nov", GetType(Integer))
        dt.Columns.Add("Dec", GetType(Integer))
        dt.Columns.Add("Jan", GetType(Integer))
        dt.Columns.Add("Feb", GetType(Integer))
        dt.Columns.Add("Mar", GetType(Integer))



        Dim TranDt As DataTable
        TranDt = con.ReturnDtTable("SELECT month(icm_mst.inv_date)as Mnth,icm_mst.loc_code, SUM(Taxable) as Total_Taxable FROM icm_mst JOIN DMS_ROW_DATA ON icm_mst.Cust_Id = DMS_ROW_DATA.Ledger_Id  where DMS_ROW_DATA.Tran_Type = '4' and icm_mst.INV_DATE BETWEEN '" & frm_year & "-04-01' AND '" & to_year & "-03-31' GROUP BY icm_mst.inv_date , icm_mst.Loc_Code,icm_mst.Cust_Id, DMS_ROW_DATA.Ledger_Id, Bill_No HAVING COUNT(*) >= 2")

        Dim dtrow() As DataRow
        dt.Rows.Add()
        'dt.Rows(dt.Rows.Count - 1)("View") = BrDt.Rows(i)("View").ToString
        dt.Rows(dt.Rows.Count - 1)("BRANCH") = cellValue

        dtrow = TranDt.Select("Loc_Code='" + loc_co + "'")
        If dtrow.Length > 0 Then
            Dim TranDt2 As DataTable
            TranDt2 = dtrow.CopyToDataTable

            dt.Rows(dt.Rows.Count - 1)("Apr") = Val(TranDt2.Compute("sum(total_taxable)", "Mnth=" & 4 & "").ToString)
            dt.Rows(dt.Rows.Count - 1)("May") = Val(TranDt2.Compute("sum(total_taxable)", "Mnth=" & 5 & "").ToString)
            dt.Rows(dt.Rows.Count - 1)("Jun") = Val(TranDt2.Compute("sum(total_taxable)", "Mnth=" & 6 & "").ToString)
            dt.Rows(dt.Rows.Count - 1)("Jul") = Val(TranDt2.Compute("sum(total_taxable)", "Mnth=" & 7 & "").ToString)
            dt.Rows(dt.Rows.Count - 1)("Aug") = Val(TranDt2.Compute("sum(total_taxable)", "Mnth=" & 8 & "").ToString)
            dt.Rows(dt.Rows.Count - 1)("Sep") = Val(TranDt2.Compute("sum(total_taxable)", "Mnth=" & 9 & "").ToString)
            dt.Rows(dt.Rows.Count - 1)("Oct") = Val(TranDt2.Compute("sum(total_taxable)", "Mnth=" & 10 & "").ToString)
            dt.Rows(dt.Rows.Count - 1)("Nov") = Val(TranDt2.Compute("sum(total_taxable)", "Mnth=" & 11 & "").ToString)
            dt.Rows(dt.Rows.Count - 1)("Dec") = Val(TranDt2.Compute("sum(total_taxable)", "Mnth=" & 12 & "").ToString)
            dt.Rows(dt.Rows.Count - 1)("Jan") = Val(TranDt2.Compute("sum(total_taxable)", "Mnth=" & 1 & "").ToString)
            dt.Rows(dt.Rows.Count - 1)("Feb") = Val(TranDt2.Compute("sum(total_taxable)", "Mnth=" & 2 & "").ToString)
            dt.Rows(dt.Rows.Count - 1)("Mar") = Val(TranDt2.Compute("sum(total_taxable)", "Mnth=" & 3 & "").ToString)
        End If


        ' Convert the DataTable to a JSON string
        Dim json As String = JsonConvert.SerializeObject(dt)

        ' Return the JSON string
        Return json
    End Function


End Class