Imports System.IO
Imports System.Web.Services
Imports Newtonsoft.Json
Public Class group_report
    Inherits System.Web.UI.Page
    Private con As New Connection
    Private dt As New DataTable
    Private link As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Not IsPostBack Then
                dse_list()
                branch()

            End If
        Catch ex As Exception

        End Try

    End Sub

    Protected Sub Load_Location_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Load_Location.Click

        Dim b As String

        If branch_list.SelectedValue = "0" Then
            b = ""
        Else
            b = "and Acnt_Post.Loc_Code='" + branch_list.SelectedValue + "'"

        End If

        Try
            Dim TranDt As DataTable
            TranDt = con.ReturnDtTable("select Ledg_Ac as Ledg_Code,Ledg_Name, cast(Sum(Opening) as decimal(10,2)) as Op_Bal, cast( Sum(Dr_Amt) as decimal(10,2)) as Dr_Amt, cast(Sum(Cr_Amt) as decimal(10,2)) as Cr_Amt, cast( Sum(Cl_Balance)  as decimal(10,2))
as Cl_Bal,(select top 1 Com_Name from Godown_Mst where Godw_Code=Loc_Code) as Branch from (
select Ledg_Ac,Ledg_Name,Sum(iif(Amt_Drcr=1,Post_Amt,Post_Amt*-1)) as Opening,0.00 as Dr_Amt,0.00
as Cr_Amt,0.00 as Cl_Balance,Acnt_Post.Loc_Code from Acnt_Post,Ledg_Mst where Ledg_Ac=Ledg_Code 
and Acnt_post.Export_Type<3 and Acnt_Date<'" + Year_From.Text + "' and Group_Code='" + grp_name.SelectedValue + "' " + b + "
group by Ledg_Ac,Ledg_Name,Acnt_Post.Loc_Code union all

select Ledg_Ac,Ledg_Name,0.00 as Opening,Sum(iif(Amt_Drcr=1,Post_Amt,0)) as Dr_Amt,Sum(iif(Amt_Drcr=2,Post_Amt,0)) 
as Cr_Amt,Sum(iif(Amt_Drcr=1,Post_Amt,Post_Amt*-1)) as Cl_Balance,Acnt_Post.Loc_Code from Acnt_Post,Ledg_Mst
where Ledg_Ac=Ledg_Code  and Acnt_Date between '" + Year_From.Text + "' and '" + Year_To.Text + "' 
and Acnt_post.Export_Type<3 and Group_Code='" + grp_name.SelectedValue + "' " + b + " group by Ledg_Ac,Ledg_Name,Acnt_Post.Loc_Code
) A group by Ledg_Ac,Ledg_Name,Loc_Code order by Ledg_Name")


            Amount_Grid.DataSource = TranDt
            Amount_Grid.DataBind()

        Catch ex As Exception

        End Try
    End Sub

    Private Sub gvEmployees_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles Amount_Grid.RowDataBound
        If e.Row.RowType = DataControlRowType.Header Then
            'For i = 0 To e.Row.Cells.Count - 1
            '    Dim cell2 As TableCell = e.Row.Cells(i)
            '    cell2.Width = New Unit("40px")
            'Next
            Dim cell As TableCell = e.Row.Cells(1)
            e.Row.Cells(0).Text = "Ledg Code"
            e.Row.Cells(0).Width = New Unit("6%")
            e.Row.Cells(1).Text = "Ledg Name"
            e.Row.Cells(1).Width = New Unit("18%")
            e.Row.Cells(2).Text = "OP Bal."
            e.Row.Cells(3).Text = "DR Amt."
            e.Row.Cells(4).Text = "Cr. Amt"
            e.Row.Cells(5).Text = "CI Bal."
            e.Row.Cells(6).Text = "Branch"
        End If
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Cells(1).HorizontalAlign = HorizontalAlign.Left ' Set the alignment of all data cells to left
            e.Row.Cells(2).HorizontalAlign = HorizontalAlign.Right
            e.Row.Cells(3).HorizontalAlign = HorizontalAlign.Right
            e.Row.Cells(4).HorizontalAlign = HorizontalAlign.Right
            e.Row.Cells(5).HorizontalAlign = HorizontalAlign.Right
        End If

    End Sub


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

    Private Sub branch()
        Try
            dt = con.ReturnDtTable("select godw_code,godw_name from Godown_Mst")
            dt.Rows.Add()
            dt.Rows(dt.Rows.Count - 1)("godw_code") = 0
            dt.Rows(dt.Rows.Count - 1)("godw_name") = "----Multi-Branch----"
            dt = dt.Select("godw_code>=0", "godw_code").CopyToDataTable
            branch_list.DataSource = dt
            branch_list.DataTextField = "godw_name"
            branch_list.DataValueField = "godw_code"
            branch_list.DataBind()
        Catch ex As Exception

        End Try
    End Sub

    <WebMethod()>
    Public Shared Function GetChartData(grp_name As String, frm_year As String, to_year As String, type_sts As String) As String

        Dim b As String
        If type_sts = "0" Then
            b = ""
        Else
            b = "and Acnt_Post.Loc_Code= '" + type_sts + "'"

        End If


        Dim con As New Connection

        Dim TranDt As DataTable
        TranDt = con.ReturnDtTable("select Ledg_Name,Sum(Cl_Balance) 
as Cl_Bal,(select top 1 Com_Name from Godown_Mst where Godw_Code=Loc_Code) as Branch from (
select Ledg_Ac,Ledg_Name,Sum(iif(Amt_Drcr=1,Post_Amt,Post_Amt*-1)) as Opening,0.00 as Dr_Amt,0.00
as Cr_Amt,0.00 as Cl_Balance,Acnt_Post.Loc_Code from Acnt_Post,Ledg_Mst where Ledg_Ac=Ledg_Code 
and Acnt_post.Export_Type<3 and Acnt_Date<'" + frm_year + "' and Group_Code='" + grp_name + "' " + b + "
group by Ledg_Ac,Ledg_Name,Acnt_Post.Loc_Code union all

select Ledg_Ac,Ledg_Name,0.00 as Opening,Sum(iif(Amt_Drcr=1,Post_Amt,0)) as Dr_Amt,Sum(iif(Amt_Drcr=2,Post_Amt,0)) 
as Cr_Amt,Sum(iif(Amt_Drcr=1,Post_Amt,Post_Amt*-1)) as Cl_Balance,Acnt_Post.Loc_Code from Acnt_Post,Ledg_Mst
where Ledg_Ac=Ledg_Code  and Acnt_Date between '" + frm_year + "' and '" + to_year + "' 
and Acnt_post.Export_Type<3 and Group_Code='" + grp_name + "' " + b + " group by Ledg_Ac,Ledg_Name,Acnt_Post.Loc_Code
) A group by Ledg_Ac,Ledg_Name,Loc_Code order by Ledg_Name")

        ' Convert the DataTable to a JSON string
        Dim json As String = JsonConvert.SerializeObject(TranDt)

        ' Return the JSON string
        Return json
    End Function



End Class