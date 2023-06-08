Public Class SalesDiscount1
    Inherits System.Web.UI.Page
    Private con
    Private dt As New DataTable
    Private link As String
    Private Dse_Mob As String
    Private Aprvl_Mob As String
    Private LinkId As Integer = 0
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con = New Connection
        Try
            If Not IsPostBack Then
                Dim Myurl As String = Request.Url.AbsoluteUri
                Dim MyArr = Myurl.Split("?")
                If MyArr.Length = 3 Then
                    LinkId = MyArr(1).ToString
                    Session("LinkId") = LinkId
                    LoginPage.clientid = MyArr(2).ToString.Replace(".", "").Trim
                    HttpContext.Current.Session("client_id") = MyArr(2).ToString.Replace(".", "").Trim
                End If

                If Session("user_name") = "" Then
                    Update_Data.Enabled = False
                    Reset_Data.Enabled = False
                    Delete_Data.Enabled = False
                    Exit_Data.Enabled = True
                    Print_data.Enabled = False
                    Submit_data.Enabled = False
                End If

                Update_Data.Enabled = False
                Submit_data.Enabled = True
                Reset_Data.Enabled = True
                Delete_Data.Enabled = False
                Exit_Data.Enabled = True
                Print_data.Enabled = False

                veh_color_list()
                loan_list()
                Modl_Var_list()
                pageSetting()
                dse_list()
                Branch_list()
                Curr_Date.Text = Now.ToString("dd") & "/" & Now.ToString("MM") & "/" & Now.ToString("yyyy")
                Delv_Date.Text = Now.ToString("dd") & "/" & Now.ToString("MM") & "/" & Now.ToString("yyyy")
                Try
                    'Dim Myurl As String = Request.Url.AbsoluteUri
                    'Dim MyArr = Myurl.Split("?")
                    If MyArr.Length = 3 Then
                        LinkId = Val(MyArr(1).ToString)
                        LoginPage.clientid = MyArr(2).ToString

                        Dim Mydt As DataTable
                        Mydt = con.ReturnDtTable("Select * from WA_Link where Link_Id=" & LinkId & "")
                        If Mydt.Rows(0)("tran_type").ToString = "3" Then
                            MsgBox("Link Has been Expired")
                        Else
                            If Mydt.Rows.Count > 0 Then
                                Myurl = Mydt.Rows(0)("Link_Add").ToString
                                MyArr = Myurl.Split("?")
                                Mob_No.Text = MyArr(1).ToString.Replace("Mobile=", "")
                                Pan_No.Text = MyArr(2).ToString.Replace("Pan_Number=", "")
                                FillMob_PAN_Based_Data()
                            End If
                        End If

                    End If
                Catch ex As Exception

                End Try

            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub FillMob_PAN_Based_Data()
        Try
            dt = con.ReturnDtTable("select * from dise_aprvl where mob='" & Mob_No.Text & "' and pan_no='" & Pan_No.Text & "'")
            If dt.Rows.Count > 0 Then
                Cust_Name.Text = dt.Rows(0)("cust_name").ToString
                modl_var.Text = dt.Rows(0)("modl_var").ToString
                veh_color.Text = dt.Rows(0)("veh_clr").ToString
                Delv_Date.Text = Convert.ToDateTime(dt.Rows(0)("Delv_Date")).ToString("dd-MM-yyyy")
                Loan_type.Text = dt.Rows(0)("loan").ToString
                MGA_Amt.Text = Decimal.Parse(dt.Rows(0)("MGA_Amt").ToString()).ToString("0.00")
                Insurance.Text = dt.Rows(0)("Insurance").ToString
                RTO_Chrg.Text = dt.Rows(0)("RTO_Chrg").ToString
                EW_CCP.Text = dt.Rows(0)("EW_CCP").ToString
                Loyalty_Card.Text = dt.Rows(0)("Loyalty_Card").ToString
                Car_Exch.Text = dt.Rows(0)("Car_Exch").ToString
                FastTeg.Text = dt.Rows(0)("FastTeg").ToString
                SRM.Text = dt.Rows(0)("srm").ToString
                RM.Text = dt.Rows(0)("rm").ToString
                Consumer.Text = Decimal.Parse(dt.Rows(0)("Consumer").ToString()).ToString("0.00")
                Corporate.Text = Decimal.Parse(dt.Rows(0)("Corporate").ToString()).ToString("0.00")
                Exch.Text = Decimal.Parse(dt.Rows(0)("Exch").ToString()).ToString("0.00")
                Appr_Amt.Text = Decimal.Parse(dt.Rows(0)("Approved_amt").ToString()).ToString("0.00")
                Discount_Amt.Text = Decimal.Parse(dt.Rows(0)("dise_amt").ToString()).ToString("0.00")
                Aprvl_By.Text = dt.Rows(0)("Aprvl_By").ToString
                Aprvl_By2.Text = dt.Rows(0)("Aprvl_By2").ToString
                Status.Text = dt.Rows(0)("Status").ToString
                Remark.Text = dt.Rows(0)("Remark").ToString
                Curr_Date.Text = Convert.ToDateTime(dt.Rows(0)("Curr_Date")).ToString("dd-MM-yyyy")
                branch.Text = dt.Rows(0)("location").ToString
                If dt.Rows(0)("dual_apr").ToString() = "Y" Then
                    advance.Checked = True
                    Label9.Text = "Approver 1"
                Else
                    advance.Checked = False
                End If

            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub pageSetting()
        Try
            MainPanel.Enabled = False
            VehDtl_Panel.Enabled = False
            MSIL_Panel.Enabled = False
            Aprvl_Panel.Enabled = False
            Dim det As DataTable
            det = con.ReturnDtTable("SELECT rights_cloud.menu_option FROM user_cloud INNER JOIN rights_cloud ON user_cloud.user_code = rights_cloud.user_code where user_cloud.user_name='" & Session("user_name") & "' and user_cloud.export_type<3 and rights_cloud.export_type<3")
            Dim menu_list As New List(Of String)()
            For Each row As DataRow In det.Rows
                menu_list.Add(row("menu_option").ToString())
            Next

            If Session("user_name") IsNot Nothing AndAlso Session("user_name").ToString() <> "" Then
                If menu_list.Contains("3.3.ck") Then
                    advance.Checked = True
                End If
                MainPanel.Enabled = True
                VehDtl_Panel.Enabled = True
                MSIL_Panel.Enabled = True
                Aprvl_Panel.Enabled = False
            Else
                Aprvl_Panel.Enabled = True
            End If



        Catch ex As Exception

        End Try
    End Sub

    Private Sub veh_color_list()
        Try
            dt = con.ReturnDtTable("select misc_name,misc_code from misc_mst where misc_type=10 AND MISC_NAME<>''")
            dt.Rows(dt.Rows.Count - 1)("misc_code") = 0
            dt.Rows(dt.Rows.Count - 1)("misc_name") = "----Select----"
            dt = dt.Select("isnull(misc_code,0)>=0", "misc_code").CopyToDataTable
            veh_color.DataSource = dt
            veh_color.DataTextField = "misc_name"
            veh_color.DataValueField = "misc_code"
            veh_color.DataBind()
        Catch ex As Exception

        End Try
    End Sub

    Private Sub Modl_Var_list()
        Try
            dt = con.ReturnDtTable("select misc_name, misc_code from misc_mst where misc_type=14")
            dt.Rows(dt.Rows.Count - 1)("misc_code") = 0
            dt.Rows(dt.Rows.Count - 1)("misc_name") = "----Select----"
            dt = dt.Select("isnull(misc_code,0)>=0", "misc_code").CopyToDataTable
            modl_var.DataSource = dt
            modl_var.DataTextField = "misc_name"
            modl_var.DataValueField = "misc_code"
            modl_var.DataBind()
        Catch ex As Exception

        End Try
    End Sub

    Private Sub loan_list()
        Try
            dt = con.ReturnDtTable("select misc_name,misc_code from misc_mst where misc_type=18")
            dt.Rows(dt.Rows.Count - 1)("misc_code") = 0
            dt.Rows(dt.Rows.Count - 1)("misc_name") = "----Select----"
            dt = dt.Select("isnull(misc_code,0)>=0", "misc_code").CopyToDataTable
            Loan_type.DataSource = dt
            Loan_type.DataTextField = "misc_name"
            Loan_type.DataValueField = "misc_code"
            Loan_type.DataBind()
        Catch ex As Exception

        End Try
    End Sub

    Private Sub dse_list()
        Try
            dt = con.ReturnDtTable("select srno,empcode+' - '+empfirstname as Emp_Name from EMPLOYEEMASTER where ISNULL(srno,'')<>'' and export_type<3")
            dt.Rows.Add()
            dt.Rows(dt.Rows.Count - 1)("srno") = 0
            dt.Rows(dt.Rows.Count - 1)("Emp_Name") = "----Select----"
            dt = dt.Select("srno>=0", "srno").CopyToDataTable
            RM.DataSource = dt
            RM.DataTextField = "Emp_Name"
            RM.DataValueField = "srno"
            RM.DataBind()
            Dim dt2 As DataTable
            dt2 = dt.Copy
            SRM.DataSource = dt2
            SRM.DataTextField = "Emp_Name"
            SRM.DataValueField = "srno"
            SRM.DataBind()

            Dim dt3 As DataTable
            dt3 = dt.Copy
            Aprvl_By.DataSource = dt3
            Aprvl_By.DataTextField = "Emp_Name"
            Aprvl_By.DataValueField = "srno"
            Aprvl_By.DataBind()

            Aprvl_By2.DataSource = dt3
            Aprvl_By2.DataTextField = "Emp_Name"
            Aprvl_By2.DataValueField = "srno"
            Aprvl_By2.DataBind()

        Catch ex As Exception

        End Try
    End Sub

    Private Sub Branch_list()
        Try
            dt = con.ReturnDtTable("Select godw_Name,Godw_Code from Godown_Mst where Export_type<3  order by godw_code")
            dt.Rows.Add()
            dt.Rows(dt.Rows.Count - 1)("Godw_Code") = 0
            dt.Rows(dt.Rows.Count - 1)("godw_Name") = "----Select----"
            dt = dt.Select("Godw_Code>=0", "Godw_Code").CopyToDataTable
            branch.DataSource = dt
            branch.DataTextField = "godw_Name"
            branch.DataValueField = "Godw_Code"
            branch.DataBind()
        Catch ex As Exception

        End Try
    End Sub

    Public Sub MesgBox(ByVal sMessage As String)
        Dim sb As New System.Text.StringBuilder
        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: '" + sMessage + "', icon: 'warning', showConfirmButton: true})", True)
    End Sub

    Public Sub MesgBox1(ByVal sMessage As String)
        Dim sb As New System.Text.StringBuilder
        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: '" + sMessage + "', icon: 'success', showConfirmButton: true})", True)
    End Sub



    Protected Sub Exit_Data_Click(sender As Object, e As EventArgs) Handles Exit_Data.Click
        Try
            Response.Redirect("../../DefaultPage/DefaultPage.aspx")
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub submit_Click(sender As Object, e As EventArgs) Handles Submit_data.Click
        Try
            Dim dt3 As String
            dt3 = con.ExecuteScaler("select concat(EMPFIRSTNAME,EMPLASTNAME) as name from EMPLOYEEMASTER where srno='" & Aprvl_By.Text & "'")
            If Session("user_name") = "" Then
                LinkId = Val(Session("LinkId").ToString)

                If advance.Checked Then
                    Dim validatestring As String = con.ExecuteScaler("select tran_type from WA_LINK where link_Id=" & LinkId & " ")
                    If validatestring = "1" Then
                        dt3 = con.ExecuteScaler("select concat(EMPFIRSTNAME,EMPLASTNAME) as name from EMPLOYEEMASTER where srno='" & Aprvl_By2.Text & "'")
                        Dim qry As String = "Update dise_aprvl set Approved_amt='" & Appr_Amt.Text & "',status='" & Status.Text & "',remark='" & Remark.Text & "' where mob='" & Mob_No.Text & "'"
                        con.TSql(qry)

                        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: 'Your Request has successfully sent Mr. " & dt3 & "', text: '', icon: 'success', showConfirmButton: true}).then(function() { window.location.href='" & Request.Url.AbsoluteUri & "'; });", True)
                        Whastapp_Linking(Mob_No.Text, Pan_No.Text, Aprvl_By.SelectedItem.ToString, modl_var.SelectedItem.ToString, branch.SelectedItem.ToString)
                    Else
                        Dim qry As String = "Update dise_aprvl set Approved_amt='" & Appr_Amt.Text & "',status='" & Status.Text & "',remark='" & Remark.Text & "' where mob='" & Mob_No.Text & "'"
                        Dim qry1 As String = "Update WA_LINK set tran_type='3' where link_Id=" & LinkId & ""
                        con.TSql(qry)
                        con.TSql(qry1)

                        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: 'Status has been changed successfully', text: '', icon: 'success', showConfirmButton: true}).then(function() { window.location.href='" & Request.Url.AbsoluteUri & "'; });", True)
                        Whastapp_Linking(Mob_No.Text, Pan_No.Text, RM.SelectedItem.ToString, modl_var.SelectedItem.ToString, branch.SelectedItem.ToString)
                    End If


                Else
                    Dim qry As String = "Update dise_aprvl set Approved_amt='" & Appr_Amt.Text & "',status='" & Status.Text & "',remark='" & Remark.Text & "' where mob='" & Mob_No.Text & "'"
                    Dim qry1 As String = "Update WA_LINK set tran_type='3' where link_Id=" & LinkId & ""
                    con.TSql(qry)
                    con.TSql(qry1)

                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: 'Status has been changed successfully', text: '', icon: 'success', showConfirmButton: true}).then(function() { window.location.href='" & Request.Url.AbsoluteUri & "'; });", True)
                    Whastapp_Linking(Mob_No.Text, Pan_No.Text, RM.SelectedItem.ToString, modl_var.SelectedItem.ToString, branch.SelectedItem.ToString)
                End If


            Else
                dt = con.ReturnDtTable("select mob from dise_aprvl where mob='" & Mob_No.Text & "'")
                If dt.Rows.Count > 0 Then
                    MesgBox("This user is already Exits")
                Else

                    'Dim mob As String = dt.Rows(0)("mob").ToString
                    If Mob_No.Text = "" Then
                        MesgBox("This user is already Exits")
                    Else

                        Dim checker As String
                        If advance.Checked Then
                            checker = "Y"
                        Else
                            checker = "N"
                        End If
                        If Session("user_name") IsNot Nothing AndAlso Session("user_name").ToString() <> "" Then
                            con.TSql("INSERT INTO dise_aprvl VALUES('" & Mob_No.Text & "','" & Pan_No.Text & "',
                    '" & Cust_Name.Text & "','" & modl_var.Text & "','" & veh_color.Text & "',
                    '" & SqlDate(Delv_Date.Text) & "','" & Loan_type.Text & "','" & MGA_Amt.Text & "',
                    '" & Insurance.Text & "','" & RTO_Chrg.Text & "','" & EW_CCP.Text & "',
                    '" & Loyalty_Card.Text & "','" & Car_Exch.Text & "','" & FastTeg.Text & "',
                    '" & SRM.Text & "','" & RM.Text & "','" & Consumer.Text & "',
                    '" & Corporate.Text & "','" & Exch.Text & "','0',
                    '" & Discount_Amt.Text & "','" & Aprvl_By.SelectedValue & "','" & Status.Text & "','" & Remark.Text & "',
                    '" & SqlDate(Curr_Date.Text) & "','" & branch.Text & "','" & Appr_Amt.Text & "','" & Aprvl_By2.SelectedValue & "','" + checker + "')")
                            Dim dt2 As String

                            Dim dt5 As String

                            dt5 = con.ExecuteScaler("select mobile_no from EMPLOYEEMASTER where srno='" & Aprvl_By.Text & "'")
                            dt2 = con.ExecuteScaler("select mobile_no from EMPLOYEEMASTER where srno='" & RM.Text & "'")

                            Dse_Mob = dt2
                            Aprvl_Mob = dt5
                            Dim dt4 As DataTable
                            dt4 = con.ReturnDtTable("select mob from dise_aprvl where mob='" + Mob_No.Text + "' and pan_no='" + Pan_No.Text + "'")

                            'For checking the data is submitted or not
                            If dt4.Rows.Count > 0 Then
                                Whastapp_Linking(Mob_No.Text, Pan_No.Text, RM.SelectedItem.ToString, modl_var.SelectedItem.ToString, branch.SelectedItem.ToString)
                                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: 'Your Request has successfully sent to Mr. " & dt3 & "', text: '', icon: 'success', showConfirmButton: true}).then(function() { window.location.href='" & Request.Url.AbsoluteUri & "'; });", True)
                            Else
                                MesgBox("Data not submitted please try again")
                            End If

                        Else
                        End If

                    End If
                End If
            End If


        Catch ex As Exception

        End Try
    End Sub

    Private Sub Whastapp_Linking(ByVal mobile As String, ByVal pan_number As String, ByVal dse As String, modl As String, location As String)
        Try
            Dim dt2 As String
            Dim dt3 As String
            Dim dt4 As String
            Dim Aprvl_Mob2 As String

            dt2 = con.ExecuteScaler("select mobile_no from EMPLOYEEMASTER where srno='" & RM.Text & "'")
            dt3 = con.ExecuteScaler("select mobile_no from EMPLOYEEMASTER where srno='" & Aprvl_By.Text & "'")
            If advance.Checked Then
                dt4 = con.ExecuteScaler("select mobile_no from EMPLOYEEMASTER where srno='" & Aprvl_By2.Text & "'")
                Aprvl_Mob2 = dt4

            End If
            Dim Dse_Mob As String = dt2
            Dim Aprvl_Mob As String = dt3



            If Session("user_name") IsNot Nothing AndAlso Session("user_name").ToString() <> "" Then

                '''''''''''Approver 1-----------
                Dim msg As String
                    link = "https://cloud.autovyn.com/AutovynModules/Modules/Sales/SalesDiscount.aspx?Mobile=" & mobile & "?Pan_Number=" & pan_number & ""
                    con.TSql("INSERT INTO WA_LINK (link_add,exp_date,tran_type) VALUES('" & link & "','" & SqlDate(Curr_Date.Text) & "','1')")
                    Dim MaXlINKiD As String = Val(con.ExecuteScaler("SELECT MAX(LINK_ID) FROM WA_LINK").ToString)
                    link = "https://cloud.autovyn.com/AutovynModules/Modules/Sales/SalesDiscount.aspx?" & MaXlINKiD & "?" & LoginPage.clientid
                    msg = "Dear Sir/Ma'am," & vbNewLine & " This is to bring to your attention that Mr. " & dse & " (DSE) (Mobile - " & Dse_Mob & ") requested for Discount of Rs. " & Discount_Amt.Text & " on behalf of New Car Customer " & Cust_Name.Text & " and Car Model " & modl & " from Branch  " & location & ". Please review the Customer request provided at the " & link & ". " & vbNewLine & " Regards " + vbNewLine + Session("Dlr_name")
                    WA_MSG = msg
                    WA_Mob = "91" & Aprvl_Mob
                'WA_Mob = "91" & "9785017630"
                WAMSG()
            Else

            End If



            '''''''''''''''''''''' DSE Message Format ''''''''''''''''''''''''''''''''
            If Session("user_name") = "" Then
                If advance.Checked Then
                    Dim validatestring As String = con.ExecuteScaler("select tran_type from WA_LINK where link_Id=" & LinkId & " ")
                    If validatestring = "1" Then
                        '''''''''''Approver 1 that will send link to the approvaaer 2-----------
                        Dim msg As String
                        link = "https://cloud.autovyn.com/AutovynModules/Modules/Sales/SalesDiscount.aspx?Mobile=" & mobile & "?Pan_Number=" & pan_number & ""
                        con.TSql("Update WA_LINK set tran_type='2' where link_Id=" & LinkId & "")
                        Dim MaXlINKiD As String = Val(con.ExecuteScaler("Select LINK_ID from WA_Link where Link_Id=" & LinkId & " ").ToString)
                        link = "https://cloud.autovyn.com/AutovynModules/Modules/Sales/SalesDiscount.aspx?" & MaXlINKiD & "?" & LoginPage.clientid

                        msg = "Dear Sir/Ma'am " & vbNewLine & " This is to bring to your attention that Mr. " & dse & " (DSE) (Mobile - " & Dse_Mob & ") requested for Discount of Rs. " & Discount_Amt.Text & " on behalf of New Car Customer " & Cust_Name.Text & " and Car Model " & modl & " from Branch  " & location & ". Please review the Customer request provided at the " & link & ". " & vbNewLine & " Regards " + vbNewLine + Session("Dlr_name")
                        WA_MSG = msg
                        WA_Mob = "91" & Aprvl_Mob2
                        'WA_Mob = "91" & "9785017630"
                        WAMSG()
                    Else
                        '''''''''''DSE Message-----------
                        Dim appr_msg As String

                        appr_msg = "Dear Mr. " & dse & "," & vbNewLine & " Your discount approval request for New Car Customer " & Cust_Name.Text & " (Mobile - " & Mob_No.Text & ") / Car Model " & modl & " has been " & Status.Text & " by Approver " & Aprvl_By.SelectedItem.ToString & ". Approved Amount is " & Appr_Amt.Text & " against requested amount " & Discount_Amt.Text & " with remark -" & Remark.Text & " " & vbNewLine & " Regards " + vbNewLine + vbNewLine + Session("Dlr_name")
                        WA_MSG = appr_msg
                        WA_Mob = "91" & Dse_Mob
                        'WA_Mob = "91" & "6377100781"
                        WAMSG()
                        Appr_Amt.Text = ""
                        Status.Text = ""
                    End If


                Else
                        '''''''''''DSE Message-----------
                        Dim appr_msg As String

                    appr_msg = "Dear Mr. " & dse & "," & vbNewLine & " Your discount approval request for New Car Customer " & Cust_Name.Text & " (Mobile - " & Mob_No.Text & ") / Car Model " & modl & " has been " & Status.Text & " by Approver " & Aprvl_By.SelectedItem.ToString & ". Approved Amount is " & Appr_Amt.Text & " against requested amount " & Discount_Amt.Text & " with remark -" & Remark.Text & " " & vbNewLine & " Regards " + vbNewLine + vbNewLine + Session("Dlr_name")
                    WA_MSG = appr_msg
                    WA_Mob = "91" & Dse_Mob
                    'WA_Mob = "91" & "6377100781"
                    WAMSG()
                    Appr_Amt.Text = ""
                    Status.Text = ""
                    Remark.Text = ""
                End If

            End If
        Catch ex As Exception

        End Try
    End Sub


End Class