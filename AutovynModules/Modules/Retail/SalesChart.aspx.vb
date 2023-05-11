Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Public Class salesChart
    Inherits System.Web.UI.Page
    Private userName As New LoginPage
    Private con As New Connection
    Public SqlCon As New SqlConnection
    Private com As New SqlCommand
    Private com1 As New SqlCommand
    Private comb As New SqlCommandBuilder
    Private adp As New SqlDataAdapter
    Dim dt As New DataTable
    Private sql As String
    Dim GrdIndex As Integer = 0
    Private chart As String
    Private MyDt As New DataTable
    Private allBranch As String

    Private Sub dshrtl_Click(sender As Object, e As EventArgs) Handles dshrtl.Click
    End Sub

    Private Sub DateRefresh_Click(sender As Object, e As EventArgs) Handles Date_Refresh.Click
        Try
            If DateFrom.Text.Trim = "" Then
                DateFrom.Text = DbPath.DateFrom
                DateUpto.Text = DbPath.DateUpto
            Else
                DbPath.DateFrom = DateFrom.Text
                DbPath.DateUpto = DateUpto.Text
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub ValidateDate(sender As Object, e As ServerValidateEventArgs)
        'Dim fromdate As Date = System.DateTime.Now
        'Dim todate As New CultureInfo("en-US")
        Try
            'Dim strDate As String = Convert.ToString(fromdate)
            'fromdate = DateTime.ParseExact(strDate, "dd/MM/yyyy", todate)
            ''Dim detTime As DateTime
            e.IsValid = DateTime.ParseExact(e.Value, "dd/MM/yyyy", Nothing).ToString("dd/MM/yyyy") '   New CultureInfo("en-GB"), DateTimeStyles.None, detTime)
        Catch ex As Exception

        End Try
    End Sub

    Private Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Try
            If Session("user_name") = "" Then
                Response.Redirect("../../../Default.aspx")
            End If
            If Not IsPostBack Then
                'user_name.Text = Convert.ToString(Session("user_name"))
                'Branch.Text = Convert.ToString(Session("Branch"))
                DateFrom.Text = "01/" & Format(Val(Now.ToString("MM")), "#00") & "/" + Now.ToString("yyyy")
                DateUpto.Text = Now.ToString("dd") + "/" + Now.ToString("MM") + "/" + Now.ToString("yyyy")
            End If
            Dim BranchCode = Convert.ToString(Session("BranchCode"))
            Dim ChartTable = Convert.ToString(Session("ChartTable"))
            chart = "select * from (select (select top 1 Godw_Name from godown_mst where godw_code=loc_code) as Branch_name ,Sum(RTL_CNT) as RTL_CNT,Sum(CRN_CNT) as CRN_CNT,sum(rtl_cnt)-sum(crn_cnt) as NET_RTL_CNT from (
                                    select 'RETAIL, CRN, NET_RTL_CNT' as TYPE, Loc_Code,Count(Tran_Id) as RTL_CNT,0 as CRN_CNT from DMS_ROW_DATA where export_type in (1,2) and tran_type=1 and Bill_Date between " & SqlDate(DateFrom.Text) & " and " & SqlDate(DateUpto.Text) & " and loc_code in  (" & BranchCode & ")  group by Loc_Code 
                                    union all
                                    select 'CRN' as TYPE,Loc_Code,0 as RTL_CNT,Count(Tran_Id) as CRN_CNT from DMS_ROW_DATA where CANCEL_No is not null and export_type in (1,2) and tran_type=1   and Bill_Date between " & SqlDate(DateFrom.Text) & " and " & SqlDate(DateUpto.Text) & " and loc_code in  (" & BranchCode & ")  group by Loc_Code
    					) as A group by Loc_Code
                                    ) as result"
            dt = con.ReturnDtTable(chart)
            chart1.DataSource = dt

            MyDt = con.ReturnDtTable("select Com_Name,Godw_Code from Godown_Mst where export_type<3")
            Active_branches.DataSource = MyDt
            Active_branches.DataBind()
            'Active Branches
            dt = con.ReturnDtTable("select 'RETIAL' as Branches,* from (
                    select LOC_Code,Sum(RTL_CNT) as RTL_CNT from (
                    select 'RETAIL' as TYPE, Loc_Code,Count(Tran_Id) as RTL_CNT,0 as CRN_CNT from DMS_ROW_DATA where export_type in (1,2) and tran_type=1 and Bill_Date between " & SqlDate(DateFrom.Text) & " and " & SqlDate(DateUpto.Text) & " and loc_code in  (" & BranchCode & ")  group by Loc_Code 
                    union all
                    select 'CRN' as TYPE,Loc_Code,0 as RTL_CNT,Count(Tran_Id) as CRN_CNT from DMS_ROW_DATA where CANCEL_No is not null and export_type in (1,2) and tran_type=1   and Bill_Date between '" & DateFrom.Text & "' and " & SqlDate(DateUpto.Text) & " and loc_code in  (" & BranchCode & ")  group by Loc_Code
                    ) as A group by Loc_Code
                    ) as result
                    PIVOT(
                    sum(RTL_CNT) for LOC_Code in (" & ChartTable & ")) as PV
                    union ALL 
                    select 'CRN' as TYPE,* from (
                    select LOC_Code,Sum(CRN_CNT) as CRN_CNT from (
                    select 'RETAIL' as TYPE, Loc_Code,Count(Tran_Id) as RTL_CNT,0 as CRN_CNT from DMS_ROW_DATA where export_type in (1,2) and tran_type=1 and Bill_Date between " & SqlDate(DateFrom.Text) & " and " & SqlDate(DateUpto.Text) & " and loc_code in  (" & BranchCode & ")  group by Loc_Code 
                    union all
                    select 'CRN' as TYPE,Loc_Code,0 as RTL_CNT,Count(Tran_Id) as CRN_CNT from DMS_ROW_DATA where CANCEL_No is not null and export_type in (1,2) and tran_type=1   and Bill_Date between " & SqlDate(DateFrom.Text) & " and " & SqlDate(DateUpto.Text) & " and loc_code in  (" & BranchCode & ")  group by Loc_Code
                    ) as A group by Loc_Code
                    ) as result
                    PIVOT(
                    sum(CRN_CNT) for LOC_Code in (" & ChartTable & ")) as PV
                    union ALL 
                    select 'NET_RTL_CNT' as TYPE,* from (
                    select LOC_Code,Sum(RTL_CNT)-Sum(CRN_CNT) as NET_RTL_CNT from (
                    select 'RETAIL' as TYPE, Loc_Code,Count(Tran_Id) as RTL_CNT,0 as CRN_CNT from DMS_ROW_DATA where export_type in (1,2) and tran_type=1 and Bill_Date between " & SqlDate(DateFrom.Text) & " and " & SqlDate(DateUpto.Text) & " and loc_code in  (" & BranchCode & ")  group by Loc_Code 
                    union all
                    select 'CRN' as TYPE,Loc_Code,0 as RTL_CNT,Count(Tran_Id) as CRN_CNT from DMS_ROW_DATA where CANCEL_No is not null and export_type in (1,2) and tran_type=1   and Bill_Date between " & SqlDate(DateFrom.Text) & " and " & SqlDate(DateUpto.Text) & " and loc_code in  (" & BranchCode & ")  group by Loc_Code
                    ) as A group by Loc_Code
                    ) as result
                    PIVOT(
                    sum(NET_RTL_CNT) for LOC_Code in (" & ChartTable & ")) as PV")
            Active_branches.DataSource = dt
            Active_branches.DataBind()
            Active_branches.Width = 1200

        Catch ex As Exception

        End Try

    End Sub
    Private Sub GrdView_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles Active_branches.RowDataBound
        Try
            If (e.Row.RowType = DataControlRowType.Header) Then
                For i As Integer = 1 To dt.Columns.Count - 1
                    If (dt.Columns(i).ColumnName = e.Row.Cells(i).Text) Then
                        e.Row.Cells(i).Text = MyDt.Compute("Max(Com_Name)", "Godw_Code=" & dt.Columns(i).ColumnName & "")
                    End If
                Next
            End If
        Catch ex As Exception

        End Try
    End Sub

End Class