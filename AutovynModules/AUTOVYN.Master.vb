Public Class AUTOVYN
    Inherits System.Web.UI.MasterPage
    Private con
    Private dp As New DbPath
    Private dt As New DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con = New Connection
        Try

            Brnch.Text = Session("Branch")
            'IP.Text = dp.SQLInstance
            Dim arr() = dp.SQLInstance.Split(".")
            IP.Text = arr(0).ToString + ".##.##." + arr(arr.Length - 1).ToString
            DB.Text = dp.DbName
            User.Text = Session("user_name")
            Curr_Date.Text = Now.ToString("M") + "-" + Now.ToString("yyyy")

            Dim menu_list As New List(Of String)()
            If Session("user_name") = "" Then
                nav_panel.Visible = False

            Else
                Dim det As New DataTable()
                det = con.ReturnDtTable("SELECT rights_cloud.menu_option FROM user_cloud INNER JOIN rights_cloud ON user_cloud.user_code = rights_cloud.user_code where user_cloud.user_name='" & Session("user_name") & "' and user_cloud.export_type<3 and rights_cloud.export_type<3")


                ' Assume the DataTable is populated with data

                For Each row As DataRow In det.Rows
                    menu_list.Add(row("menu_option").ToString())
                Next

#Region "Check Menus Enabled"

                If menu_list.Contains("1") Then
                    'Dim LinkLogout As HtmlAnchor
                    'LinkLogout = CType(Master.FindControl("Finance_1"), HtmlAnchor)
                    'LinkLogout.Disabled = False


                    If menu_list.Contains("1.1") Then
                        Finance_1_1.Enabled = True

                    Else
                        Finance_1_1.Enabled = False
                        Finance_1_1.Style.Add("cursor", "not-allowed")
                    End If
                    If menu_list.Contains("1.2") Then
                        Finance_1_2.Enabled = True
                    Else
                        Finance_1_2.Enabled = False
                        Finance_1_2.Style.Add("cursor", "not-allowed")
                    End If
                Else
                    Finance_1_1.Enabled = False
                    Finance_1_1.Style.Add("cursor", "not-allowed")
                    Finance_1_2.Enabled = False
                    Finance_1_2.Style.Add("cursor", "not-allowed")
                End If

                If menu_list.Contains("2") Then
                    If menu_list.Contains("2.1") Then
                        Insurance_2_1.Enabled = True
                    Else
                        Insurance_2_1.Enabled = False
                        Insurance_2_1.Style.Add("cursor", "not-allowed")
                    End If

                    If menu_list.Contains("2.2") Then
                        Insurance_2_2.Enabled = True
                    Else
                        Insurance_2_2.Enabled = False
                        Insurance_2_2.Style.Add("cursor", "not-allowed")
                    End If
                Else
                    Insurance_2_1.Enabled = False
                    Insurance_2_1.Style.Add("cursor", "not-allowed")
                    Insurance_2_2.Enabled = False
                    Insurance_2_2.Style.Add("cursor", "not-allowed")

                End If

                If menu_list.Contains("3") Then
                    If menu_list.Contains("3.1") Then
                        HyperLink12.Enabled = True
                    Else
                        HyperLink12.Enabled = False
                        HyperLink12.Style.Add("cursor", "not-allowed")
                    End If

                    If menu_list.Contains("3.2") Then
                        HyperLink13.Enabled = True
                    Else
                        HyperLink13.Enabled = False
                        HyperLink13.Style.Add("cursor", "not-allowed")
                    End If


                    If menu_list.Contains("3.3") Then
                        Sales_3_1.Enabled = True
                    Else
                        Sales_3_1.Enabled = False
                        Sales_3_1.Style.Add("cursor", "not-allowed")
                    End If


                    If menu_list.Contains("3.4") Then
                        Sales_3_2.Enabled = True
                    Else
                        Sales_3_2.Enabled = False
                        Sales_3_2.Style.Add("cursor", "not-allowed")
                    End If
                Else
                    HyperLink12.Enabled = False
                    HyperLink12.Style.Add("cursor", "not-allowed")
                    HyperLink13.Enabled = False
                    HyperLink13.Style.Add("cursor", "not-allowed")
                    Sales_3_1.Enabled = False
                    Sales_3_1.Style.Add("cursor", "not-allowed")
                    Sales_3_2.Enabled = False
                    Sales_3_2.Style.Add("cursor", "not-allowed")
                End If


                If menu_list.Contains("4") Then
                    If menu_list.Contains("4.1") Then
                        TrueValue_4_1.Enabled = True
                    Else
                        TrueValue_4_1.Enabled = False
                        TrueValue_4_1.Style.Add("cursor", "not-allowed")
                    End If
                Else
                    TrueValue_4_1.Enabled = False
                    TrueValue_4_1.Style.Add("cursor", "not-allowed")

                End If

                If menu_list.Contains("5") Then
                    If menu_list.Contains("5.1") Then
                        DSE_Checklist_10_1.Enabled = True
                    Else
                        DSE_Checklist_10_1.Enabled = False
                        DSE_Checklist_10_1.Style.Add("cursor", "not-allowed")
                    End If
                Else
                    DSE_Checklist_10_1.Enabled = False
                    DSE_Checklist_10_1.Style.Add("cursor", "not-allowed")

                End If

                If menu_list.Contains("6") Then
                    If menu_list.Contains("6.1") Then
                        HyperLink1.Enabled = True
                    Else
                        HyperLink1.Enabled = False
                        HyperLink1.Style.Add("cursor", "not-allowed")
                    End If

                    If menu_list.Contains("6.2") Then
                        HyperLink5.Enabled = True
                    Else
                        HyperLink5.Enabled = False
                        HyperLink5.Style.Add("cursor", "not-allowed")
                    End If


                    If menu_list.Contains("6.3") Then
                        HyperLink20.Enabled = True
                    Else
                        HyperLink20.Enabled = False
                        HyperLink20.Style.Add("cursor", "not-allowed")
                    End If


                    If menu_list.Contains("6.4") Then
                        HyperLink4.Enabled = True
                    Else
                        HyperLink4.Enabled = False
                        HyperLink4.Style.Add("cursor", "not-allowed")
                    End If

                    If menu_list.Contains("6.5") Then
                        HyperLink3.Enabled = True
                    Else
                        HyperLink3.Enabled = False
                        HyperLink3.Style.Add("cursor", "not-allowed")
                    End If
                Else
                    HyperLink1.Enabled = False
                    HyperLink1.Style.Add("cursor", "not-allowed")
                    HyperLink5.Enabled = False
                    HyperLink5.Style.Add("cursor", "not-allowed")
                    HyperLink20.Enabled = False
                    HyperLink20.Style.Add("cursor", "not-allowed")
                    HyperLink4.Enabled = False
                    HyperLink4.Style.Add("cursor", "not-allowed")
                    HyperLink3.Enabled = False
                    HyperLink3.Style.Add("cursor", "not-allowed")
                End If


                If menu_list.Contains("7") Then
                    If menu_list.Contains("7.1") Then
                        HyperLink11.Enabled = True
                    Else
                        HyperLink11.Enabled = False
                        HyperLink11.Style.Add("cursor", "not-allowed")
                    End If

                    If menu_list.Contains("7.2") Then
                        HyperLink6.Enabled = True
                    Else
                        HyperLink6.Enabled = False
                        HyperLink6.Style.Add("cursor", "not-allowed")
                    End If


                    If menu_list.Contains("7.3") Then
                        HyperLink7.Enabled = True
                    Else
                        HyperLink7.Enabled = False
                        HyperLink7.Style.Add("cursor", "not-allowed")
                    End If


                    If menu_list.Contains("7.4") Then
                        HyperLink8.Enabled = True
                    Else
                        HyperLink8.Enabled = False
                        HyperLink8.Style.Add("cursor", "not-allowed")
                    End If

                    If menu_list.Contains("7.5") Then
                        HyperLink10.Enabled = True
                    Else
                        HyperLink10.Enabled = False
                        HyperLink10.Style.Add("cursor", "not-allowed")
                    End If

                    If menu_list.Contains("7.6") Then
                        HyperLink9.Enabled = True
                    Else
                        HyperLink9.Enabled = False
                        HyperLink9.Style.Add("cursor", "not-allowed")
                    End If
                Else
                    HyperLink11.Enabled = False
                    HyperLink11.Style.Add("cursor", "not-allowed")
                    HyperLink6.Enabled = False
                    HyperLink6.Style.Add("cursor", "not-allowed")
                    HyperLink7.Enabled = False
                    HyperLink7.Style.Add("cursor", "not-allowed")
                    HyperLink8.Enabled = False
                    HyperLink8.Style.Add("cursor", "not-allowed")
                    HyperLink10.Enabled = False
                    HyperLink10.Style.Add("cursor", "not-allowed")
                    HyperLink9.Enabled = False
                    HyperLink9.Style.Add("cursor", "not-allowed")
                End If

                If menu_list.Contains("8") Then

                    add_user.Enabled = True
                Else
                    add_user.Enabled = False
                    add_user.Style.Add("cursor", "not-allowed")

                End If

#End Region

            End If


        Catch ex As Exception


        End Try

    End Sub

    'Protected Sub Cashier_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Cashier_8_1.Click
    '    Try
    '        Dim CashierCode = Convert.ToString(con.ExecuteScaler("select max(Post_AC) as Post_AC from user_tbl where user_name = '" + Session("user_name") + "' and export_type <3"))
    '        If (Convert.ToString(CashierCode) <> "") Then

    '            Session("cashCode") = CashierCode
    '            Response.Redirect("~/AutovynModules/Modules/Cashier/Cashier.aspx")
    '        Else
    '            MsgBox("Cash ledger selection allowed through cashier login only!")
    '        End If

    '    Catch ex As Exception

    '    End Try

    'End Sub
End Class