Public Class BranchPage
    Inherits System.Web.UI.Page
    Private Con As New Connection
    Private MyDt As New DataTable
    Private EnqDt As DataTable
    Private DbPath As New DbPath

    Private Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Try
                MyDt = Con.ReturnDtTable("Select godw_Name,Godw_Code,DMS_HSN_Code from Godown_Mst where Export_type<3 and Godw_Code in (" & Convert.ToString(Session("QueryLoc")) & ") order by Com_Name")
                MyDt.Rows.Add()
                MyDt.Rows(MyDt.Rows.Count - 1)("Godw_Code") = 0
                MyDt.Rows(MyDt.Rows.Count - 1)("godw_Name") = "Multi Branch"

                MyDt = MyDt.Select("Godw_Code>=0", "Godw_Code").CopyToDataTable
                DropDownList1.DataSource = MyDt
                DropDownList1.DataTextField = "godw_name"
                DropDownList1.DataValueField = "Godw_Code"
                DropDownList1.DataBind()
            Catch ex As Exception

            End Try
        End If
        If Session("user_name") = "" Then
            Response.Redirect("../../Default.aspx")
        End If
    End Sub

    Private Sub ShowProfile_Click(sender As Object, e As EventArgs) Handles ShowProfile.Click
        Try
            MyDt = Con.ReturnDtTable("Select godw_Name,Godw_Code,DMS_HSN_Code from Godown_Mst where Export_type<3  order by godw_code")
            'EnqDt = MyDt.Copy
            If DropDownList1.SelectedValue >= 0 Then
                Session("Branch") = DropDownList1.SelectedItem.ToString
                Session("BranchCode") = DropDownList1.SelectedValue
                Session("hsn_code") = DropDownList1.SelectedValue
                DbPath.CompCode = DropDownList1.SelectedValue
                DbPath.CompName = DropDownList1.Text

                If DbPath.CompCode = 0 Then
                    Dim LocStr As String = ""
                    For i As Integer = 0 To MyDt.Rows.Count - 1
                        If LocStr <> "" Then LocStr += "," + MyDt.Rows(i)("Godw_Code").ToString
                        If LocStr = "" Then LocStr = MyDt.Rows(i)("Godw_Code").ToString
                    Next
                    Session("BranchCode") = LocStr
                End If

                If DbPath.CompCode > 0 Then
                    Dim LocStr As String = ""
                    For i As Integer = 0 To MyDt.Rows.Count - 1
                        If Val(MyDt.Rows(i)("Godw_Code").ToString) = DbPath.CompCode Then
                            If LocStr <> "" Then LocStr += "," + MyDt.Rows(i)("Godw_Code").ToString
                            If LocStr = "" Then LocStr = MyDt.Rows(i)("Godw_Code").ToString
                        End If
                    Next
                    Session("BranchCode") = LocStr
                End If

                If DbPath.CompCode = 0 Then
                    Dim LocStr As String = ""
                    For i As Integer = 0 To MyDt.Rows.Count - 1
                        If LocStr <> "" Then LocStr += ", [" + MyDt.Rows(i)("Godw_Code").ToString + "]"
                        If LocStr = "" Then LocStr = "[" + MyDt.Rows(i)("Godw_Code").ToString + "]"
                    Next
                    Session("ChartTable") = LocStr
                End If

                If DbPath.CompCode > 0 Then
                    Dim LocStr As String = ""
                    For i As Integer = 0 To MyDt.Rows.Count - 1
                        If Val(MyDt.Rows(i)("Godw_Code").ToString) = DbPath.CompCode Then
                            If LocStr <> "" Then LocStr += ", [" + MyDt.Rows(i)("Godw_Code").ToString + "]"
                            If LocStr = "" Then LocStr = "[" + MyDt.Rows(i)("Godw_Code").ToString + "]"
                        End If
                    Next
                    Session("ChartTable") = LocStr
                End If
                Response.Redirect("../DefaultPage/Loader.aspx")
            End If

            'If Convert.ToString(Session("EmpPos")) = 4 Then
            '    Response.Redirect("../AutoModule/DefaultPage/Loader.aspx")
            'ElseIf Convert.ToString(Session("EmpPos")) = 5 Then
            '    Response.Redirect("../AutoModule/DefaultPage/Loader.aspx")
            'ElseIf Convert.ToString(Session("EmpPos")) = 6 Then
            '    Response.Redirect("../AutoModule/DefaultPage/Loader.aspx")
            'ElseIf Convert.ToString(Session("EmpPos")) = 9 Then
            '    Response.Redirect("../AutoModule/DefaultPage/Loader.aspx")
            'ElseIf Convert.ToString(Session("EmpPos")) = 10 Then
            '    Response.Redirect("../AutoModule/DefaultPage/Loader.aspx")
            'ElseIf Convert.ToString(Session("EmpPos")) = 11 Then
            '    Response.Redirect("../AutoModule/DefaultPage/Loader.aspx")
            'Else
            '    Response.Redirect("../AutoModule/DefaultPage/Loader.aspx")
            'End If

        Catch ex As Exception

        End Try
    End Sub
End Class