﻿
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.UI.DataVisualization.Charting
Imports System.Web.Services
Imports Newtonsoft.Json

Public Class discount_report
    Inherits System.Web.UI.Page
    Private dt As New DataTable
    Private Loc_List As New DataTable
    Private con As New Connection

    Protected Sub Load_Location_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Load_Location.Click
        Try
            If appr_status.SelectedValue = "C" Then
                location_Data_cons()
                AmountView_cons()

            ElseIf appr_status.SelectedValue = "Co" Then

                location_Data_corp()
                AmountView_corp()

            ElseIf appr_status.SelectedValue = "E" Then

                location_Data_exch()
                AmountView_exch()
            End If

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


    Private Sub location_Data_cons()
        Try
            Dim dt As New DataTable
            'dt.Columns.Add("View", GetType(String))
            dt.Columns.Add("Branch", GetType(String))
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
            'dt.Columns.Add("Total", GetType(Integer))

            Dim TotDt As DataTable = con.ReturnDtTable("Select Loc_Code,Count(Loc_Code) as Count from  icm_mst where ISNull(Veh_Del,0)=1 and ICM_MST.Export_Type in (1,2) and  ICM_MST.tran_type=51 and INV_DATE between  '" & Year_From.Text & "-04-01' AND '" & Year_To.Text & "-03-31' group by loc_code")

            Dim BrDt As DataTable = con.ReturnDtTable("select loc_code,(SELECT TOP 1 GODW_NAME FROM GODOWN_MST WHERE GODW_CODE=ICM_MST.LOC_CODE) AS BRANCH from icm_mst where EXPORT_TYPE<5 and inv_date BETWEEN '" & Year_From.Text & "-04-01' AND '" & Year_To.Text & "-03-31' group by Loc_Code")


            Dim TranDt As DataTable
            TranDt = con.ReturnDtTable("SELECT month(icm_mst.inv_date)as Mnth,icm_mst.loc_code, cons_disc FROM icm_mst JOIN icm_dtl ON icm_mst.tran_id = icm_dtl.tran_id  where icm_mst.INV_DATE BETWEEN '" & Year_From.Text & "-04-01' AND '" & Year_To.Text & "-03-31' GROUP BY icm_mst.inv_date , icm_mst.Loc_Code,icm_dtl.cons_disc")

            Dim dtrow() As DataRow
            For i As Integer = 0 To BrDt.Rows.Count - 1
                dt.Rows.Add()
                dt.Rows(dt.Rows.Count - 1)("BRANCH") = BrDt.Rows(i)("BRANCH").ToString

                dtrow = TranDt.Select("Loc_Code=" & Val(BrDt.Rows(i)("Loc_Code").ToString) & "")
                If dtrow.Length > 0 Then
                    Dim TranDt2 As DataTable
                    TranDt2 = dtrow.CopyToDataTable


                    dt.Rows(dt.Rows.Count - 1)("Apr") = Val(TranDt2.Compute("count(cons_disc)", "Mnth=" & 4 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("May") = Val(TranDt2.Compute("count(cons_disc)", "Mnth=" & 5 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Jun") = Val(TranDt2.Compute("count(cons_disc)", "Mnth=" & 6 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Jul") = Val(TranDt2.Compute("count(cons_disc)", "Mnth=" & 7 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Aug") = Val(TranDt2.Compute("count(cons_disc)", "Mnth=" & 8 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Sep") = Val(TranDt2.Compute("count(cons_disc)", "Mnth=" & 9 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Oct") = Val(TranDt2.Compute("count(cons_disc)", "Mnth=" & 10 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Nov") = Val(TranDt2.Compute("count(cons_disc)", "Mnth=" & 11 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Dec") = Val(TranDt2.Compute("count(cons_disc)", "Mnth=" & 12 & "").ToString)

                    dt.Rows(dt.Rows.Count - 1)("Jan") = Val(TranDt2.Compute("count(cons_disc)", "Mnth=" & 1 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Feb") = Val(TranDt2.Compute("count(cons_disc)", "Mnth=" & 2 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Mar") = Val(TranDt2.Compute("count(cons_disc)", "Mnth=" & 3 & "").ToString)
                    'dt.Rows(dt.Rows.Count - 1)("Total") = Val(TotDt.Compute("count(cons_disc)", "count=" & TotDt.Rows(i)("Count") & "").ToString)

                End If
            Next
            Report_Grid.DataSource = dt
            Report_Grid.DataBind()

        Catch ex As Exception

        End Try
    End Sub

    Private Sub AmountView_cons()
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


            Dim TranDt As DataTable
            TranDt = con.ReturnDtTable("SELECT month(icm_mst.inv_date)as Mnth,icm_mst.loc_code, cons_disc FROM icm_mst JOIN icm_dtl ON icm_mst.tran_id = icm_dtl.tran_id  where icm_mst.INV_DATE BETWEEN '" & Year_From.Text & "-04-01' AND '" & Year_To.Text & "-03-31' GROUP BY icm_mst.inv_date , icm_mst.Loc_Code,icm_dtl.cons_disc")



            Dim dtrow() As DataRow
            For i As Integer = 0 To BrDt.Rows.Count - 1
                dt.Rows.Add()
                'dt.Rows(dt.Rows.Count - 1)("View") = BrDt.Rows(i)("View").ToString
                dt.Rows(dt.Rows.Count - 1)("BRANCH") = BrDt.Rows(i)("bRANCH").ToString

                dtrow = TranDt.Select("Loc_Code=" & Val(BrDt.Rows(i)("Loc_Code").ToString) & "")
                If dtrow.Length > 0 Then
                    Dim TranDt2 As DataTable
                    TranDt2 = dtrow.CopyToDataTable

                    dt.Rows(dt.Rows.Count - 1)("Apr") = Val(TranDt2.Compute("sum(cons_disc)", "Mnth=" & 4 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("May") = Val(TranDt2.Compute("sum(cons_disc)", "Mnth=" & 5 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Jun") = Val(TranDt2.Compute("sum(cons_disc)", "Mnth=" & 6 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Jul") = Val(TranDt2.Compute("sum(cons_disc)", "Mnth=" & 7 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Aug") = Val(TranDt2.Compute("sum(cons_disc)", "Mnth=" & 8 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Sep") = Val(TranDt2.Compute("sum(cons_disc)", "Mnth=" & 9 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Oct") = Val(TranDt2.Compute("sum(cons_disc)", "Mnth=" & 10 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Nov") = Val(TranDt2.Compute("sum(cons_disc)", "Mnth=" & 11 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Dec") = Val(TranDt2.Compute("sum(cons_disc)", "Mnth=" & 12 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Jan") = Val(TranDt2.Compute("sum(cons_disc)", "Mnth=" & 1 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Feb") = Val(TranDt2.Compute("sum(cons_disc)", "Mnth=" & 2 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Mar") = Val(TranDt2.Compute("sum(cons_disc)", "Mnth=" & 3 & "").ToString)
                End If
            Next
            Amount_Grid.DataSource = dt
            Amount_Grid.DataBind()

        Catch ex As Exception

        End Try
    End Sub



    Private Sub location_Data_corp()
        Try
            Dim dt As New DataTable
            'dt.Columns.Add("View", GetType(String))
            dt.Columns.Add("Branch", GetType(String))
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
            'dt.Columns.Add("Total", GetType(Integer))

            Dim TotDt As DataTable = con.ReturnDtTable("Select Loc_Code,Count(Loc_Code) as Count from  icm_mst where ISNull(Veh_Del,0)=1 and ICM_MST.Export_Type in (1,2) and  ICM_MST.tran_type=51 and INV_DATE between  '" & Year_From.Text & "-04-01' AND '" & Year_To.Text & "-03-31' group by loc_code")

            Dim BrDt As DataTable = con.ReturnDtTable("select loc_code,(SELECT TOP 1 GODW_NAME FROM GODOWN_MST WHERE GODW_CODE=ICM_MST.LOC_CODE) AS BRANCH from icm_mst where EXPORT_TYPE<5 and inv_date BETWEEN '" & Year_From.Text & "-04-01' AND '" & Year_To.Text & "-03-31' group by Loc_Code")


            Dim TranDt As DataTable
            TranDt = con.ReturnDtTable("SELECT month(icm_mst.inv_date)as Mnth,icm_mst.loc_code, corp_disc FROM icm_mst JOIN icm_dtl ON icm_mst.tran_id = icm_dtl.tran_id  where icm_mst.INV_DATE BETWEEN '" & Year_From.Text & "-04-01' AND '" & Year_To.Text & "-03-31' GROUP BY icm_mst.inv_date , icm_mst.Loc_Code,icm_dtl.corp_disc")

            Dim dtrow() As DataRow
            For i As Integer = 0 To BrDt.Rows.Count - 1
                dt.Rows.Add()
                dt.Rows(dt.Rows.Count - 1)("BRANCH") = BrDt.Rows(i)("BRANCH").ToString

                dtrow = TranDt.Select("Loc_Code=" & Val(BrDt.Rows(i)("Loc_Code").ToString) & "")
                If dtrow.Length > 0 Then
                    Dim TranDt2 As DataTable
                    TranDt2 = dtrow.CopyToDataTable


                    dt.Rows(dt.Rows.Count - 1)("Apr") = Val(TranDt2.Compute("count(corp_disc)", "Mnth=" & 4 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("May") = Val(TranDt2.Compute("count(corp_disc)", "Mnth=" & 5 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Jun") = Val(TranDt2.Compute("count(corp_disc)", "Mnth=" & 6 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Jul") = Val(TranDt2.Compute("count(corp_disc)", "Mnth=" & 7 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Aug") = Val(TranDt2.Compute("count(corp_disc)", "Mnth=" & 8 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Sep") = Val(TranDt2.Compute("count(corp_disc)", "Mnth=" & 9 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Oct") = Val(TranDt2.Compute("count(corp_disc)", "Mnth=" & 10 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Nov") = Val(TranDt2.Compute("count(corp_disc)", "Mnth=" & 11 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Dec") = Val(TranDt2.Compute("count(corp_disc)", "Mnth=" & 12 & "").ToString)

                    dt.Rows(dt.Rows.Count - 1)("Jan") = Val(TranDt2.Compute("count(corp_disc)", "Mnth=" & 1 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Feb") = Val(TranDt2.Compute("count(corp_disc)", "Mnth=" & 2 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Mar") = Val(TranDt2.Compute("count(corp_disc)", "Mnth=" & 3 & "").ToString)
                    'dt.Rows(dt.Rows.Count - 1)("Total") = Val(TotDt.Compute("count(cons_disc)", "count=" & TotDt.Rows(i)("Count") & "").ToString)

                End If
            Next
            Report_Grid.DataSource = dt
            Report_Grid.DataBind()

        Catch ex As Exception

        End Try
    End Sub

    Private Sub AmountView_corp()
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


            Dim TranDt As DataTable
            TranDt = con.ReturnDtTable("SELECT month(icm_mst.inv_date)as Mnth,icm_mst.loc_code, corp_disc FROM icm_mst JOIN icm_dtl ON icm_mst.tran_id = icm_dtl.tran_id  where icm_mst.INV_DATE BETWEEN '" & Year_From.Text & "-04-01' AND '" & Year_To.Text & "-03-31' GROUP BY icm_mst.inv_date , icm_mst.Loc_Code,icm_dtl.corp_disc")

            Dim dtrow() As DataRow
            For i As Integer = 0 To BrDt.Rows.Count - 1
                dt.Rows.Add()
                'dt.Rows(dt.Rows.Count - 1)("View") = BrDt.Rows(i)("View").ToString
                dt.Rows(dt.Rows.Count - 1)("BRANCH") = BrDt.Rows(i)("bRANCH").ToString

                dtrow = TranDt.Select("Loc_Code=" & Val(BrDt.Rows(i)("Loc_Code").ToString) & "")
                If dtrow.Length > 0 Then
                    Dim TranDt2 As DataTable
                    TranDt2 = dtrow.CopyToDataTable

                    dt.Rows(dt.Rows.Count - 1)("Apr") = Val(TranDt2.Compute("sum(corp_disc)", "Mnth=" & 4 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("May") = Val(TranDt2.Compute("sum(corp_disc)", "Mnth=" & 5 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Jun") = Val(TranDt2.Compute("sum(corp_disc)", "Mnth=" & 6 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Jul") = Val(TranDt2.Compute("sum(corp_disc)", "Mnth=" & 7 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Aug") = Val(TranDt2.Compute("sum(corp_disc)", "Mnth=" & 8 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Sep") = Val(TranDt2.Compute("sum(corp_disc)", "Mnth=" & 9 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Oct") = Val(TranDt2.Compute("sum(corp_disc)", "Mnth=" & 10 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Nov") = Val(TranDt2.Compute("sum(corp_disc)", "Mnth=" & 11 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Dec") = Val(TranDt2.Compute("sum(corp_disc)", "Mnth=" & 12 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Jan") = Val(TranDt2.Compute("sum(corp_disc)", "Mnth=" & 1 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Feb") = Val(TranDt2.Compute("sum(corp_disc)", "Mnth=" & 2 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Mar") = Val(TranDt2.Compute("sum(corp_disc)", "Mnth=" & 3 & "").ToString)
                End If
            Next
            Amount_Grid.DataSource = dt
            Amount_Grid.DataBind()
        Catch ex As Exception

        End Try
    End Sub



    Private Sub location_Data_exch()
        Try
            Dim dt As New DataTable
            'dt.Columns.Add("View", GetType(String))
            dt.Columns.Add("Branch", GetType(String))
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
            'dt.Columns.Add("Total", GetType(Integer))

            Dim TotDt As DataTable = con.ReturnDtTable("Select Loc_Code,Count(Loc_Code) as Count from  icm_mst where ISNull(Veh_Del,0)=1 and ICM_MST.Export_Type in (1,2) and  ICM_MST.tran_type=51 and INV_DATE between  '" & Year_From.Text & "-04-01' AND '" & Year_To.Text & "-03-31' group by loc_code")

            Dim BrDt As DataTable = con.ReturnDtTable("select loc_code,(SELECT TOP 1 GODW_NAME FROM GODOWN_MST WHERE GODW_CODE=ICM_MST.LOC_CODE) AS BRANCH from icm_mst where EXPORT_TYPE<5 and inv_date BETWEEN '" & Year_From.Text & "-04-01' AND '" & Year_To.Text & "-03-31' group by Loc_Code")


            Dim TranDt As DataTable
            TranDt = con.ReturnDtTable("SELECT month(icm_mst.inv_date)as Mnth,icm_mst.loc_code, exch_disc FROM icm_mst JOIN icm_dtl ON icm_mst.tran_id = icm_dtl.tran_id  where icm_mst.INV_DATE BETWEEN '" & Year_From.Text & "-04-01' AND '" & Year_To.Text & "-03-31' GROUP BY icm_mst.inv_date , icm_mst.Loc_Code,icm_dtl.exch_disc")

            Dim dtrow() As DataRow
            For i As Integer = 0 To BrDt.Rows.Count - 1
                dt.Rows.Add()
                dt.Rows(dt.Rows.Count - 1)("BRANCH") = BrDt.Rows(i)("BRANCH").ToString

                dtrow = TranDt.Select("Loc_Code=" & Val(BrDt.Rows(i)("Loc_Code").ToString) & "")
                If dtrow.Length > 0 Then
                    Dim TranDt2 As DataTable
                    TranDt2 = dtrow.CopyToDataTable


                    dt.Rows(dt.Rows.Count - 1)("Apr") = Val(TranDt2.Compute("count(exch_disc)", "Mnth=" & 4 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("May") = Val(TranDt2.Compute("count(exch_disc)", "Mnth=" & 5 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Jun") = Val(TranDt2.Compute("count(exch_disc)", "Mnth=" & 6 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Jul") = Val(TranDt2.Compute("count(exch_disc)", "Mnth=" & 7 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Aug") = Val(TranDt2.Compute("count(exch_disc)", "Mnth=" & 8 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Sep") = Val(TranDt2.Compute("count(exch_disc)", "Mnth=" & 9 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Oct") = Val(TranDt2.Compute("count(exch_disc)", "Mnth=" & 10 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Nov") = Val(TranDt2.Compute("count(exch_disc)", "Mnth=" & 11 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Dec") = Val(TranDt2.Compute("count(exch_disc)", "Mnth=" & 12 & "").ToString)

                    dt.Rows(dt.Rows.Count - 1)("Jan") = Val(TranDt2.Compute("count(exch_disc)", "Mnth=" & 1 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Feb") = Val(TranDt2.Compute("count(exch_disc)", "Mnth=" & 2 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Mar") = Val(TranDt2.Compute("count(exch_disc)", "Mnth=" & 3 & "").ToString)
                    'dt.Rows(dt.Rows.Count - 1)("Total") = Val(TotDt.Compute("count(cons_disc)", "count=" & TotDt.Rows(i)("Count") & "").ToString)

                End If
            Next
            Report_Grid.DataSource = dt
            Report_Grid.DataBind()

        Catch ex As Exception

        End Try
    End Sub

    Private Sub AmountView_exch()
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



            Dim TranDt As DataTable
            TranDt = con.ReturnDtTable("SELECT month(icm_mst.inv_date)as Mnth,icm_mst.loc_code, exch_disc FROM icm_mst JOIN icm_dtl ON icm_mst.tran_id = icm_dtl.tran_id  where icm_mst.INV_DATE BETWEEN '" & Year_From.Text & "-04-01' AND '" & Year_To.Text & "-03-31' GROUP BY icm_mst.inv_date , icm_mst.Loc_Code,icm_dtl.exch_disc")


            Dim dtrow() As DataRow
            For i As Integer = 0 To BrDt.Rows.Count - 1
                dt.Rows.Add()
                'dt.Rows(dt.Rows.Count - 1)("View") = BrDt.Rows(i)("View").ToString
                dt.Rows(dt.Rows.Count - 1)("BRANCH") = BrDt.Rows(i)("bRANCH").ToString

                dtrow = TranDt.Select("Loc_Code=" & Val(BrDt.Rows(i)("Loc_Code").ToString) & "")
                If dtrow.Length > 0 Then
                    Dim TranDt2 As DataTable
                    TranDt2 = dtrow.CopyToDataTable

                    dt.Rows(dt.Rows.Count - 1)("Apr") = Val(TranDt2.Compute("sum(exch_disc)", "Mnth=" & 4 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("May") = Val(TranDt2.Compute("sum(exch_disc)", "Mnth=" & 5 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Jun") = Val(TranDt2.Compute("sum(exch_disc)", "Mnth=" & 6 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Jul") = Val(TranDt2.Compute("sum(exch_disc)", "Mnth=" & 7 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Aug") = Val(TranDt2.Compute("sum(exch_disc)", "Mnth=" & 8 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Sep") = Val(TranDt2.Compute("sum(exch_disc)", "Mnth=" & 9 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Oct") = Val(TranDt2.Compute("sum(exch_disc)", "Mnth=" & 10 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Nov") = Val(TranDt2.Compute("sum(exch_disc)", "Mnth=" & 11 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Dec") = Val(TranDt2.Compute("sum(exch_disc)", "Mnth=" & 12 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Jan") = Val(TranDt2.Compute("sum(exch_disc)", "Mnth=" & 1 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Feb") = Val(TranDt2.Compute("sum(exch_disc)", "Mnth=" & 2 & "").ToString)
                    dt.Rows(dt.Rows.Count - 1)("Mar") = Val(TranDt2.Compute("sum(exch_disc)", "Mnth=" & 3 & "").ToString)
                End If
            Next
            Amount_Grid.DataSource = dt
            Amount_Grid.DataBind()

        Catch ex As Exception

        End Try
    End Sub


    <WebMethod()>
    Public Shared Function GetChartData(cellValue As String, frm_year As String, to_year As String, type_sts As String) As String


        Dim con As New Connection

        Dim loc = con.ReturnDtTable("select godw_code from Godown_Mst where godw_name='" + cellValue + "'")

        Dim loc_co = loc.Rows(0)("godw_code").ToString

        Dim TranDt As DataTable
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


        If type_sts = "C" Then
            TranDt = con.ReturnDtTable("SELECT month(icm_mst.inv_date)as Mnth,icm_mst.loc_code, (cons_disc) as amount FROM icm_mst JOIN icm_dtl ON icm_mst.tran_id = icm_dtl.tran_id  where icm_mst.INV_DATE BETWEEN '" & frm_year & "-04-01' AND '" & to_year & "-03-31' GROUP BY icm_mst.inv_date , icm_mst.Loc_Code,icm_dtl.cons_disc")

        ElseIf type_sts = "Co" Then
            TranDt = con.ReturnDtTable("SELECT month(icm_mst.inv_date)as Mnth,icm_mst.loc_code, (corp_disc) as amount FROM icm_mst JOIN icm_dtl ON icm_mst.tran_id = icm_dtl.tran_id  where icm_mst.INV_DATE BETWEEN '" & frm_year & "-04-01' AND '" & to_year & "-03-31' GROUP BY icm_mst.inv_date , icm_mst.Loc_Code,icm_dtl.corp_disc")

        ElseIf type_sts = "E" Then
            TranDt = con.ReturnDtTable("SELECT month(icm_mst.inv_date)as Mnth,icm_mst.loc_code, (exch_disc) as amount FROM icm_mst JOIN icm_dtl ON icm_mst.tran_id = icm_dtl.tran_id  where icm_mst.INV_DATE BETWEEN '" & frm_year & "-04-01' AND '" & to_year & "-03-31' GROUP BY icm_mst.inv_date , icm_mst.Loc_Code,icm_dtl.exch_disc")
        End If


        Dim dtrow() As DataRow
        dt.Rows.Add()
        'dt.Rows(dt.Rows.Count - 1)("View") = BrDt.Rows(i)("View").ToString
        dt.Rows(dt.Rows.Count - 1)("BRANCH") = cellValue

        dtrow = TranDt.Select("Loc_Code='" + loc_co + "'")

        If dtrow.Length > 0 Then
            Dim TranDt2 As DataTable
            TranDt2 = dtrow.CopyToDataTable

            dt.Rows(dt.Rows.Count - 1)("Apr") = Val(TranDt2.Compute("sum(amount)", "Mnth=" & 4 & "").ToString)
            dt.Rows(dt.Rows.Count - 1)("May") = Val(TranDt2.Compute("sum(amount)", "Mnth=" & 5 & "").ToString)
            dt.Rows(dt.Rows.Count - 1)("Jun") = Val(TranDt2.Compute("sum(amount)", "Mnth=" & 6 & "").ToString)
            dt.Rows(dt.Rows.Count - 1)("Jul") = Val(TranDt2.Compute("sum(amount)", "Mnth=" & 7 & "").ToString)
            dt.Rows(dt.Rows.Count - 1)("Aug") = Val(TranDt2.Compute("sum(amount)", "Mnth=" & 8 & "").ToString)
            dt.Rows(dt.Rows.Count - 1)("Sep") = Val(TranDt2.Compute("sum(amount)", "Mnth=" & 9 & "").ToString)
            dt.Rows(dt.Rows.Count - 1)("Oct") = Val(TranDt2.Compute("sum(amount)", "Mnth=" & 10 & "").ToString)
            dt.Rows(dt.Rows.Count - 1)("Nov") = Val(TranDt2.Compute("sum(amount)", "Mnth=" & 11 & "").ToString)
            dt.Rows(dt.Rows.Count - 1)("Dec") = Val(TranDt2.Compute("sum(amount)", "Mnth=" & 12 & "").ToString)
            dt.Rows(dt.Rows.Count - 1)("Jan") = Val(TranDt2.Compute("sum(amount)", "Mnth=" & 1 & "").ToString)
            dt.Rows(dt.Rows.Count - 1)("Feb") = Val(TranDt2.Compute("sum(amount)", "Mnth=" & 2 & "").ToString)
            dt.Rows(dt.Rows.Count - 1)("Mar") = Val(TranDt2.Compute("sum(amount)", "Mnth=" & 3 & "").ToString)
        End If


        ' Convert the DataTable to a JSON string
        Dim json As String = JsonConvert.SerializeObject(dt)

        ' Return the JSON string
        Return json
    End Function



End Class