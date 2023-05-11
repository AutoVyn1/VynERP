Public Class Admin
    Inherits System.Web.UI.Page
    Private con As New Connection
    Public dt As New DataTable

    Protected Sub View_Usr_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles View_Usr.Click
        Try
            load_data()
            'ModulesSetting()
        Catch ex As Exception

        End Try
    End Sub

    Private Sub MesgBox(ByVal sMessage As String)
        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('" & sMessage & "')", True)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Not IsPostBack Then
                Existing_Usrs()
                dt = con.ReturnDtTable("Select godw_Name,Godw_Code from Godown_Mst where Export_type<5 order by Godw_Name")
                Select_Branch.DataSource = dt
                Select_Branch.DataTextField = "godw_Name"
                Select_Branch.DataValueField = "godw_code"
                Select_Branch.DataBind()
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub Existing_Usrs()
        Try
            dt = con.ReturnDtTable("select user_code,user_name,* from user_tbl where Export_Type<3 and Module_Code<>0")
            dt.Rows.Add()
            dt.Rows(dt.Rows.Count - 1)("user_code") = 0
            dt.Rows(dt.Rows.Count - 1)("user_name") = "Select"
            dt = dt.Select("user_code>=0", "user_code").CopyToDataTable
            Exits_Users.DataSource = dt
            Exits_Users.DataTextField = "user_name"
            Exits_Users.DataValueField = "user_code"
            Exits_Users.DataBind()
        Catch ex As Exception

        End Try
    End Sub

    Private Sub load_data()
        Try
            Dim usr As String = Exits_Users.SelectedItem.ToString
            dt = con.ReturnDtTable("select User_Code,user_name,user_pwd,Approver_Mob,* from user_tbl where user_name='" & usr & "' and Export_Type<3 and Module_Code<>0")
            If dt.Rows.Count > 0 Then
                Usr_name.Text = dt.Rows(0)("user_name").ToString
                Usr_mob.Text = dt.Rows(0)("Approver_Mob").ToString
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub ModulesSetting()
        Try
            'Dim nodes As List(Of String)

            'For Each childNodeLevel1 As TreeNode In TreeView1.Nodes
            '    For Each childNodeLevel2 As TreeNode In childNodeLevel1.Nodes
            '        For Each childNodeLevel3 As TreeNode In childNodeLevel2.Nodes
            '            nodes.Add(childNodeLevel3.Text)
            '        Next
            '    Next
            'Next


            Dim OptnName As String = ""
            Dim value As Integer
            If TreeView1.CheckedNodes.ToString Then
                OptnName = "Accounts_0"
                value = 1
            End If
            'TreeView1.DataSource = TreeModuleBind("Text", "Value")
            Dim usr As String = Exits_Users.SelectedItem.ToString
            dt = con.ReturnDtTable("select user_code from user_tbl where user_name='" & usr & "' and module_code<>0 and export_type<3")
            Dim usr_code As String = dt.Rows(0)("User_Code").ToString
            Dim str As String = "comp_code, user_code, optn_name, optn_valu, module_code, loc_code, usr_code, serverID"
            Dim SqlQry As String = "Insert into web_rights (" & str & ") Values ('1', '" & usr_code & "', '" & OptnName & "', '1', '', '', '', '1')"
            con.TSql(SqlQry)
            MesgBox("Done")
        Catch ex As Exception
            MesgBox("Try Again")
        End Try
    End Sub












    'Private Function TreeModuleBind() As Object
    '    Dim dt As DataTable
    '    Dim row As DataRow
    '    Dim ds As DataSet
    '    Dim usr As String = Exits_Users.SelectedItem.ToString
    '    dt = con.ReturnDtTable("select User_Code,user_name,user_pwd,Approver_Mob,* from user_tbl where user_name='" & usr & "' and Export_Type<3 and Module_Code<>0")
    '    row = ds.Tables(0).NewRow
    '    row("Text") = 1
    '    row("Value") = "Accounts_0"

    '    row = ds.Tables(0).NewRow
    '    row("Text") = 2
    '    row("Value") = "Finance_1"

    '    row = ds.Tables(0).NewRow
    '    row("Text") = 3
    '    row("Value") = "Insurance_2"

    '    row = ds.Tables(0).NewRow
    '    row("Text") = 4
    '    row("Value") = "Sales_3"

    '    row = ds.Tables(0).NewRow
    '    row("Text") = 5
    '    row("Value") = "TrueValue_4"

    '    row = ds.Tables(0).NewRow
    '    row("Text") = 6
    '    row("Value") = "HRMS_5"

    '    row = ds.Tables(0).NewRow
    '    row("Text") = 7
    '    row("Value") = "Retail_6"

    '    row = ds.Tables(0).NewRow
    '    row("Text") = 8
    '    row("Value") = "DSE_7"

    '    row = ds.Tables(0).NewRow
    '    row("Text") = 9
    '    row("Value") = "Cashier_8"

    '    row = ds.Tables(0).NewRow
    '    row("Text") = 10
    '    row("Value") = "MIS_9"

    '    row = ds.Tables(0).NewRow
    '    row("Text") = 11
    '    row("Value") = "ICM_10"

    '    row = ds.Tables(0).NewRow
    '    row("Text") = 12
    '    row("Value") = "Auditor_11"

    '    row = ds.Tables(0).NewRow
    '    row("Text") = 13
    '    row("Value") = "Reminder_12"

    'End Function
End Class