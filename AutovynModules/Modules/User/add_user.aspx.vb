Imports System.Web.Services
Imports Newtonsoft.Json
Public Class add_user
    Inherits System.Web.UI.Page
    Private con As New Connection
    Private dt As New DataTable
    Private link As String
    Private Dse_Mob As String
    Private Aprvl_Mob As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("user_name") = "" Then
            Response.Redirect("../../Credintial/LoginPage.aspx")
        End If
        Try
            If Not IsPostBack Then
                dt = con.ReturnDtTable("Select godw_Name,Godw_Code,DMS_HSN_Code from Godown_Mst where Export_type<3 and Godw_Code in (" & Convert.ToString(Session("QueryLoc")) & ") order by Com_Name")
                dt.Rows.Add()
                'dt.Rows(dt.Rows.Count - 1)("Godw_Code") = 0
                'dt.Rows(dt.Rows.Count - 1)("godw_Name") = "Multi Branch"

                dt = dt.Select("Godw_Code>=0", "Godw_Code").CopyToDataTable

                branch_list.DataSource = dt
                branch_list.DataTextField = "godw_Name"
                branch_list.DataValueField = "Godw_Code"
                branch_list.DataBind()

                'disc_type.DataSource = dt
                'disc_type.DataTextField = "godw_Name"
                'disc_type.DataValueField = "Godw_Code"
                'disc_type.DataBind()
            End If
        Catch ex As Exception

        End Try


    End Sub


    Private Sub MesgBox(ByVal sMessage As String)

        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: '" + sMessage + "', icon: 'warning', showConfirmButton: true})", True)
    End Sub

    Protected Sub submit_Click(sender As Object, e As EventArgs) Handles Submit.Click

        dt = con.ReturnDtTable("select * from user_cloud where user_name!='" & user_Name.Text & "' and user_mobile='" & user_mobile.Text & "' and export_type<3")

        If dt.Rows.Count > 0 Then

            ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: 'Mobile No. is Already Exist ', text: '', icon: 'warning', showConfirmButton: true}).then(function() { window.location.href='" & Request.Url.AbsoluteUri & "'; });", True)

        Else

            Dim curr_date = DateTime.Now.ToString("dd/MM/yyyy")
            Dim user_active = "N"
            If isactive.Checked Then
                user_active = "Y"
            End If

            Dim menu_list As New List(Of String)

#Region "Check Menu Checkboxes"
            If parent1.Checked Then
                menu_list.Add("1")
                If child_1_1.Checked Then
                    menu_list.Add("1.1")
                End If
                If child_1_2.Checked Then
                    menu_list.Add("1.2")
                End If

            End If

            If parent2.Checked Then
                menu_list.Add("2")
                If child_2_1.Checked Then
                    menu_list.Add("2.1")
                End If
                If child_2_2.Checked Then
                    menu_list.Add("2.2")
                End If

            End If

            If parent3.Checked Then
                menu_list.Add("3")
                If child_3_1.Checked Then
                    menu_list.Add("3.1")
                End If
                If child_3_2.Checked Then
                    menu_list.Add("3.2")
                End If
                If child_3_3.Checked Then
                    menu_list.Add("3.3")
                End If
                If child_3_4.Checked Then
                    menu_list.Add("3.4")
                End If

            End If

            If parent4.Checked Then
                menu_list.Add("4")
                If child_4_1.Checked Then
                    menu_list.Add("4.1")
                End If

            End If

            If parent5.Checked Then
                menu_list.Add("5")
                If child_5_1.Checked Then
                    menu_list.Add("5.1")
                End If

            End If

            If parent6.Checked Then
                menu_list.Add("6")
                If child_6_1.Checked Then
                    menu_list.Add("6.1")
                End If
                If child_6_2.Checked Then
                    menu_list.Add("6.2")
                End If
                If child_6_3.Checked Then
                    menu_list.Add("6.3")
                End If
                If child_6_4.Checked Then
                    menu_list.Add("6.4")
                End If
                If child_6_5.Checked Then
                    menu_list.Add("6.5")
                End If

            End If

            If parent7.Checked Then
                menu_list.Add("7")
                If child_7_1.Checked Then
                    menu_list.Add("7.1")
                End If
                If child_7_2.Checked Then
                    menu_list.Add("7.2")
                End If
                If child_7_3.Checked Then
                    menu_list.Add("7.3")
                End If
                If child_7_4.Checked Then
                    menu_list.Add("7.4")
                End If
                If child_7_5.Checked Then
                    menu_list.Add("7.5")
                End If
                If child_7_6.Checked Then
                    menu_list.Add("7.6")
                End If

            End If
            If parent8.Checked Then
                menu_list.Add("8")

            End If
#End Region

            Try

                Dim branch As String = ""
                For Each item As ListItem In branch_list.Items
                    If item.Selected Then
                        branch += item.Value + ","
                    End If
                Next
                branch = branch.TrimEnd(","c)



                dt = con.ReturnDtTable("select user_name,user_code from user_cloud where user_name='" & user_Name.Text & "' and export_type<3")

                If dt.Rows.Count > 0 Then
                    Dim user_code = dt.Rows(0)("user_code").ToString
                    con.TSql("update user_cloud set EXPORT_TYPE='3', MODIFIED_DATE='" & curr_date & "', MODIFIED_USER ='" & Session("user_name") & "' where user_code='" & user_code & "'")

                    dt = con.ReturnDtTable("select user_code from user_cloud where user_name='" & user_Name.Text & "' ")
                    If dt.Rows.Count > 0 Then
                        Dim CODE = dt.Rows(0)("user_code").ToString

                        con.TSql("update rights_cloud set EXPORT_TYPE='3' where user_code='" & CODE & "' and  EXPORT_TYPE='1'")

                    End If

                End If



                dt = con.ReturnDtTable("select id,user_name,user_code from user_cloud where user_name='" & user_Name.Text & "'")
                Dim us_code
                If dt.Rows.Count > 0 Then
                    us_code = dt.Rows(0)("user_code").ToString
                Else
                    dt = con.ReturnDtTable("select max(id) as id from user_cloud ")
                    us_code = CInt(dt.Rows(0)("id").ToString) + 1
                End If


                con.TSql("INSERT INTO user_cloud (user_code,user_name,user_pass,isactive,dealer,user_mobile,user_email,EXPORT_TYPE,MODIFIED_DATE,MODIFIED_USER,MULTI_LOC) VALUES('" + us_code.ToString + "','" & user_Name.Text & "','" & user_pass.Text & "','" & user_active & "','" & Session("CLIENTID") & "','" & user_mobile.Text & "','" & email.Text & "','1','" + curr_date + "','" & Session("user_name") & "','" + branch + "')")


                dt = con.ReturnDtTable("select user_code from user_cloud where user_name='" & user_Name.Text & "' and EXPORT_TYPE='1'")
                menu_list.Add("0")
                If dt.Rows.Count > 0 Then
                    Dim CODE = dt.Rows(0)("user_code").ToString
                    For Each i In menu_list
                        Dim menulist = i

                        con.TSql("INSERT INTO rights_cloud (user_code,menu_option,EXPORT_TYPE) VALUES('" & CODE & "','" & menulist & "','1')")
                    Next
                End If

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: 'User Updated successfully', text: '', icon: 'success', showConfirmButton: true}).then(function() { window.location.href='" & Request.Url.AbsoluteUri & "'; });", True)





            Catch ex As Exception

            End Try
        End If
    End Sub

    <WebMethod()>
    Public Shared Function GetChartData2(va As String) As String


        Dim con As New Connection

        Dim TranDt As DataTable
        TranDt = con.ReturnDtTable("SELECT * FROM user_cloud INNER JOIN rights_cloud ON user_cloud.user_code = rights_cloud.user_code where user_cloud.user_name='" + va + "' and user_cloud.export_type<3 and rights_cloud.export_type<3")




        ' Convert the DataTable to a JSON string
        Dim json As String = JsonConvert.SerializeObject(TranDt)



        ' Return the JSON string
        Return json
    End Function


End Class