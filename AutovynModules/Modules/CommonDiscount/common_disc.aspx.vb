Imports System.IO
Imports System.Web.Services
Imports Newtonsoft.Json

Public Class common_disc
    Inherits System.Web.UI.Page
    Private con As New Connection
    Private dt As New DataTable
    Private link As String
    Private Dse_Mob As String
    Private Aprvl_Mob As String
    Private LinkId As Integer = 0
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'If Session("user_name") = "" Then
        '    Response.Redirect("../../Credintial/LoginPage.aspx")
        'End If
        Try
            If Not IsPostBack Then
                'datePicker.Text = Now.ToString("dd") & Now.ToString("MM") & Now.ToString("yyyy")
                Aprvl_Panel.Enabled = False
                Main_Panel.Enabled = True
                filter_panel.Enabled = True
                Update.Visible = False

                Dim Myurl As String = Request.Url.AbsoluteUri
                Dim MyArr = Myurl.Split("?")
                If MyArr.Length = 3 Then
                    LinkId = MyArr(1).ToString
                    Session("LinkId") = LinkId
                    LoginPage.clientid = MyArr(2).ToString.Replace(".", "").Trim

                    Dim Mydt As DataTable
                    Mydt = con.ReturnDtTable("Select * from WA_Link where Link_Id=" & LinkId & "")
                    If Mydt.Rows(0)("tran_type").ToString = "2" Then
                        MsgBox("Link Has been Expired")
                    Else
                        If Mydt.Rows.Count > 0 Then
                            Myurl = Mydt.Rows(0)("Link_Add").ToString
                            MyArr = Myurl.Split("?")
                            cust_mobile.Text = MyArr(1).ToString.Replace("Mobile=", "")
                            pan_no.Text = MyArr(2).ToString.Replace("Pan_Number=", "")
                            dse_list()
                            FillMob_PAN_Based_Data()
                        End If
                    End If
                End If

                If Session("user_name") = "" Then
                    Aprvl_Panel.Enabled = True
                    Main_Panel.Enabled = False
                    filter_panel.Visible = False

                    Submit.Text = "Update"

                Else
                    dse_list()
                    fill_grid()

                End If

            End If

        Catch ex As Exception

        End Try
    End Sub


    Private Sub FillMob_PAN_Based_Data()
        Try
            dt = con.ReturnDtTable("select * from DISC_WEB where CUST_MOB='" & cust_mobile.Text & "' and pan_no='" & pan_no.Text & "'")
            If dt.Rows.Count > 0 Then
                CustName.Text = dt.Rows(0)("cust_name").ToString
                cust_mobile.Text = dt.Rows(0)("CUST_MOB").ToString
                VehicleNo.Text = dt.Rows(0)("VEH_REG").ToString
                pan_no.Text = dt.Rows(0)("PAN_NO").ToString
                disc_type.Text = dt.Rows(0)("DISC_TYPE").ToString
                disc_Amt.Text = dt.Rows(0)("DISC_AMT").ToString
                remark.Text = dt.Rows(0)("REMARK").ToString
                SRM.Text = dt.Rows(0).ItemArray(7)
                Req_mobno.Text = dt.Rows(0)("REQ_NO").ToString
                Aprvl_By.Text = dt.Rows(0)("APRVL_BY").ToString
                approver_no.Text = dt.Rows(0)("APRVL_NO").ToString

            End If
        Catch ex As Exception

        End Try
    End Sub
    Private Sub MesgBox(ByVal sMessage As String)

        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: '" + sMessage + "', icon: 'warning', showConfirmButton: true})", True)
    End Sub

    Private Sub MesgBox1(ByVal sMessage As String)

        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: '" + sMessage + "', icon: 'success', showConfirmButton: true})", True)
    End Sub


    Protected Sub submit_Click(sender As Object, e As EventArgs) Handles Submit.Click

        Dim curr_date = DateTime.Now.ToString("dd/MM/yyyy")
        Try

            Dim updaid = update_id.Value
            If updaid IsNot "" Then
                dt = con.ReturnDtTable("select * from DISC_WEB where id='" & updaid & "'")
                If dt.Rows.Count > 0 Then
                    con.TSql("update DISC_WEB set CUST_NAME='" & CustName.Text & "', CUST_MOB='" & cust_mobile.Text & "',VEH_REG='" & VehicleNo.Text & "',PAN_NO='" & pan_no.Text & "',DISC_TYPE='" & disc_type.Text & "',DISC_AMT='" & disc_Amt.Text & "',REQ_BY='" & SRM.Text & "',REQ_NO='" & Req_mobno.Text & "',APRVL_BY='" & Aprvl_By.Text & "',APRVL_NO='" & approver_no.Text & "', CURR_DATE='" & curr_date & "',REMARK='" & remark.Text & "',link_status='0' where id='" + updaid + "'")

                    fill_grid()
                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: 'Link Updated successfully', text: '', icon: 'success', showConfirmButton: true}).then(function() { window.location.href='" & Request.Url.AbsoluteUri & "'; });", True)
                End If
            End If

            If Session("user_name") = "" Then
                LinkId = Val(Session("LinkId").ToString)
                If Val(disc_Amt.Text) < Val(APRVL_AMT.Text) Then
                    MesgBox("Approved amount can't be exceed then requested amount!")
                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: 'Approved amount can't be exceed then requested amount!', text: 'For this Approval Request', icon: 'warning', showConfirmButton: true}).then(function() { window.location.href='" & Request.Url.AbsoluteUri & "'; });", True)
                    Exit Sub
                End If

                Dim qry As String = "Update disc_web set APRVL_AMT='" & APRVL_AMT.Text & "',APRVL_STATUS='" & APRVL_STATUS.Text & "',APRVL_REMARK='" & APRVL_REMARK.Text & "' where CUST_MOB='" & cust_mobile.Text & "'"
                Dim qry1 As String = "Update WA_LINK set tran_type='2' where link_Id=" & LinkId & ""
                con.TSql(qry)
                con.TSql(qry1)
                dt = con.ReturnDtTable("select id from DISC_WEB where CUST_MOB='" & cust_mobile.Text & "'")
                Dim id As String = dt.Rows(0)("id").ToString
                MesgBox1("Approved Done Successfully")
                Whastapp_Linking(id)
            Else
                dt = con.ReturnDtTable("select CUST_MOB from DISC_WEB where CUST_MOB='" & cust_mobile.Text & "'")
                If dt.Rows.Count > 0 Then
                    MesgBox("This user's Mobile No. is already Exits")
                Else

                    'Dim mob As String = dt.Rows(0)("mob").ToString

                    con.TSql("INSERT INTO DISC_WEB (CUST_NAME,CUST_MOB,VEH_REG,PAN_NO,DISC_TYPE,DISC_AMT,REQ_BY,REQ_NO,APRVL_BY,APRVL_NO,CURR_DATE,REMARK,link_status) VALUES('" & CustName.Text & "','" & cust_mobile.Text & "',
                    '" & VehicleNo.Text & "','" & pan_no.Text & "','" & disc_type.Text & "',
                    '" & disc_Amt.Text & "','" & SRM.Text & "',
                    '" & Req_mobno.Text & "','" & Aprvl_By.Text & "','" & approver_no.Text & "','" & curr_date & "','" & remark.Text & "','0')")

                    fill_grid()
                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: 'Link created successfully', text: '', icon: 'success', showConfirmButton: true}).then(function() { window.location.href='" & Request.Url.AbsoluteUri & "'; });", True)


                End If


            End If


        Catch ex As Exception

        End Try
    End Sub


    Protected Sub update_Click(sender As Object, e As EventArgs) Handles Update.Click

        Dim curr_date = DateTime.Now.ToString("dd/MM/yyyy")
        Try
            Dim updaid = Session("UPDATE_ID")
            If Session("UPDATE_ID") IsNot "" Then
                'Dim updaid = update_id.Value
                ' If updaid IsNot "" Then
                dt = con.ReturnDtTable("select * from DISC_WEB where id='" + updaid + "'")
                If dt.Rows.Count > 0 Then
                    con.TSql("update DISC_WEB set CUST_NAME='" & CustName.Text & "', CUST_MOB='" & cust_mobile.Text & "',VEH_REG='" & VehicleNo.Text & "',PAN_NO='" & pan_no.Text & "',DISC_TYPE='" & disc_type.Text & "',DISC_AMT='" & disc_Amt.Text & "',REQ_BY='" & SRM.Text & "',REQ_NO='" & Req_mobno.Text & "',APRVL_BY='" & Aprvl_By.Text & "',APRVL_NO='" & approver_no.Text & "', CURR_DATE='" & curr_date & "',REMARK='" & remark.Text & "',link_status='0' where id='" + updaid + "'")

                    fill_grid()
                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: 'Link Updated successfully', text: '', icon: 'success', showConfirmButton: true}).then(function() { window.location.href='" & Request.Url.AbsoluteUri & "'; });", True)
                End If
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub dse_list()
        Try
            dt = con.ReturnDtTable("select srno,empcode+' - '+empfirstname as Emp_Name,Mobileno from EMPLOYEEMASTER where ISNULL(srno,'')<>'' and export_type<3")
            dt.Rows.Add()
            dt.Rows(dt.Rows.Count - 1)("srno") = 0
            dt.Rows(dt.Rows.Count - 1)("Emp_Name") = "----Select----"
            dt = dt.Select("srno>=0", "srno").CopyToDataTable
            SRM.DataSource = dt
            SRM.DataTextField = "Emp_Name"
            SRM.DataValueField = "srno"
            SRM.DataMember = "Mobileno"
            SRM.DataBind()

            'For Each item As ListItem In SRM.Items

            '    Dim row As DataRow = dt.Select("srno = " & item.Value)(0) ' Find the corresponding data row in the DataTable
            '    item.Attributes("data-mob") = row("Mobileno").ToString() ' Set the custom attribute to the mobile number
            'Next

            'For i As Integer = 0 To SRM.Items.Count - 1
            '    Dim row As DataRow = dt.Select("srno = " & SRM.Items(i).Value)(0)
            '    Dim listItem As New ListItem(SRM.Items(i).Text, SRM.Items(i).Value)
            '    listItem.Attributes.Add("data-mob", row("Mobileno").ToString())
            '    SRM.Items(i) = listItem
            'Next

            Dim dt3 As DataTable
            dt3 = dt.Copy
            Aprvl_By.DataSource = dt3
            Aprvl_By.DataTextField = "Emp_Name"
            Aprvl_By.DataValueField = "srno"
            Aprvl_By.DataBind()

            For Each item As ListItem In Aprvl_By.Items
                Dim row As DataRow = dt.Select("srno = " & item.Value)(0) ' Find the corresponding data row in the DataTable
                item.Attributes("data-mob") = row("Mobileno").ToString() ' Set the custom attribute to the mobile number
            Next

        Catch ex As Exception

        End Try
    End Sub


    Private Sub Whastapp_Linking(ByVal Tran_id As String)
        Try
            Dim dt1 As DataTable
            dt1 = con.ReturnDtTable("select CUST_NAME,CUST_MOB,PAN_NO,DISC_TYPE,DISC_AMT,REQ_BY,APRVL_BY,VEH_REG from DISC_WEB where id='" + Tran_id + "'")
            Dim dse_no As String = dt1.Rows(0)("REQ_BY").ToString
            Dim app_no As String = dt1.Rows(0)("APRVL_BY").ToString
            Dim custome_name As String = dt1.Rows(0)("CUST_NAME").ToString
            Dim cust_mobile As String = dt1.Rows(0)("CUST_MOB").ToString
            Dim PAN_NO As String = dt1.Rows(0)("PAN_NO").ToString
            Dim DISC_TYPE As String = dt1.Rows(0)("DISC_TYPE").ToString
            Dim Discount_Amt As String = dt1.Rows(0)("DISC_AMT").ToString
            Dim cust_veh As String = dt1.Rows(0)("VEH_REG").ToString

            Dim dt2 As DataTable
            Dim dt3 As DataTable
            dt2 = con.ReturnDtTable("select mobile_no,EMPFIRSTNAME from EMPLOYEEMASTER where srno='" & dse_no & "'")
            dt3 = con.ReturnDtTable("select mobile_no,EMPFIRSTNAME from EMPLOYEEMASTER where srno='" & app_no & "'")
            Dim Dse_Mob As String = dt2.Rows(0)("mobile_no").ToString
            Dim Dse_name As String = dt2.Rows(0)("EMPFIRSTNAME").ToString
            Dim Aprvl_Mob As String = dt3.Rows(0)("mobile_no").ToString
            Dim Aprvl_name As String = dt3.Rows(0)("EMPFIRSTNAME").ToString


            Dim Dlr_name As String = Session("Dlr_name")



            '''''''''' Approvar Message Format ''''''''''''
            If Session("user_name") IsNot "" Then
                Dim msg As String
                link = "https://cloud.autovyn.com/AutovynModules/Modules/CommonDiscount/common_disc.aspx?Mobile=" & cust_mobile & "?Pan_Number=" & PAN_NO & ""
                con.TSql("INSERT INTO WA_LINK (link_add,exp_date,tran_type) VALUES('" & link & "','" & SqlDate(Now.ToString("dd-MM-YYYY")) & "','1')")
                Dim MaXlINKiD As String = Val(con.ExecuteScaler("SELECT MAX(LINK_ID) FROM WA_LINK").ToString)
                link = "https://cloud.autovyn.com/AutovynModules/Modules/CommonDiscount/common_disc.aspx?" & MaXlINKiD & "?" & LoginPage.clientid
                msg = "Dear Sir/Ma'am," & vbNewLine & " This is to bring to your attention that Mr. " & Dse_name & " (DSE) (Mobile - " & Dse_Mob & ") requested for Discount of Rs. " & Discount_Amt & " on behalf of " & DISC_TYPE & " Customer " & custome_name & ". Please review the Customer request provided at the " & link & ". " & vbNewLine & " Regards " + vbNewLine + "" + Dlr_name + ""
                WA_MSG = msg
                WA_Mob = "91" & Aprvl_Mob
                'WA_Mob = "91" & "9785017630"
                WAMSG()
                con.TSql("update DISC_WEB set link_status='1' where id='" & Tran_id & "'")
            End If


            '''''''''''''''''''''' DSE Message Format ''''''''''''''''''''''''''''''''
            If Session("user_name") = "" Then
                Try
                    If APRVL_REMARK.Text.Trim = "" Then APRVL_REMARK.Text = APRVL_STATUS.SelectedItem.ToString

                Catch ex As Exception

                End Try

                Dim appr_msg As String
                Dim MaXlINKiD As String = Val(con.ExecuteScaler("SELECT MAX(LINK_ID) FROM WA_LINK").ToString)
                'link_msg = "https://cloud.autovyn.com/AutovynModules/Modules/CommonDiscount/common_disc.aspx?" & MaXlINKiD
                appr_msg = "Dear Mr. " & Dse_name & "," & vbNewLine & " Your discount approval request for New Car Customer " & custome_name & " (Mobile - " & cust_mobile & ") / Discount Type" & DISC_TYPE & " has been " & APRVL_STATUS.Text & " by Approver " & Aprvl_By.SelectedItem.ToString & ". Approved Amount is " & APRVL_AMT.Text & " against requested amount " & Discount_Amt & " with remark -" & APRVL_REMARK.Text & " " & vbNewLine & " Regards " + vbNewLine + vbNewLine + "" + Dlr_name + ""
                WA_MSG = appr_msg
                WA_Mob = "91" & Dse_Mob
                'WA_Mob = "91" & "6377100781"
                WAMSG()
                APRVL_AMT.Text = ""
                APRVL_STATUS.Text = ""
                APRVL_REMARK.Text = ""
            End If

        Catch ex As Exception
            MesgBox("Message not sent")
        End Try
    End Sub

    Private Sub fill_grid()
        Dim calltable As String
        calltable = "select id,CUST_NAME,VEH_REG,DISC_TYPE,DISC_AMT,REQ_BY,APRVL_BY,CURR_DATE from DISC_WEB where link_status='0'"
        dt = con.ReturnDtTable(calltable)
        gv_Employees.DataSource = dt
        gv_Employees.DataBind()

    End Sub
    Private Sub del_grid(ByVal up_id As String)
        Dim calltable As String
        calltable = "select id,CUST_NAME,VEH_REG,DISC_TYPE,DISC_AMT,REQ_BY,APRVL_BY,CURR_DATE from DISC_WEB where id !='" + up_id + "' and link_status='0'"
        dt = con.ReturnDtTable(calltable)
        gv_Employees.DataSource = dt
        gv_Employees.DataBind()

    End Sub

    Protected Sub Candidates_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_Employees.SelectedIndexChanged
        Dim tran_id As String
        tran_id = gv_Employees.SelectedRow.Cells(3).Text
        Whastapp_Linking(tran_id)
        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: 'Link Sent Successfully', text: '', icon: 'success', showConfirmButton: true}).then(function() { window.location.href='" & Request.Url.AbsoluteUri & "'; });", True)
    End Sub



    Protected Sub gv_Employees_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles gv_Employees.RowEditing
        gv_Employees.EditIndex = e.NewEditIndex

        Dim rowIndex As Integer = e.NewEditIndex
        Dim iwd As String = gv_Employees.Rows(rowIndex).Cells(3).Text

        dt = con.ReturnDtTable("select * from disc_web where id ='" + iwd + "'")

        If dt.Rows.Count > 0 Then
            CustName.Text = dt.Rows(0)("cust_name").ToString
            cust_mobile.Text = dt.Rows(0)("CUST_MOB").ToString
            VehicleNo.Text = dt.Rows(0)("VEH_REG").ToString
            pan_no.Text = dt.Rows(0)("PAN_NO").ToString
            disc_type.Text = dt.Rows(0)("DISC_TYPE").ToString
            disc_Amt.Text = dt.Rows(0)("DISC_AMT").ToString
            remark.Text = dt.Rows(0)("REMARK").ToString
            SRM.Text = dt.Rows(0).ItemArray(7)
            Req_mobno.Text = dt.Rows(0)("REQ_NO").ToString
            Aprvl_By.Text = dt.Rows(0)("APRVL_BY").ToString
            approver_no.Text = dt.Rows(0)("APRVL_NO").ToString
            'update_id.Value = iwd
            Session("UPDATE_ID") = iwd

            Submit.Visible = False
            Update.Visible = True
        End If

        'Dim up_id As String = update_id.Value
        del_grid(iwd)

    End Sub

    Protected Sub gv_Employees_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles gv_Employees.RowDeleting
        Dim rowIndex As Integer = e.RowIndex
        Dim id As String = gv_Employees.Rows(rowIndex).Cells(3).Text ' get the value of the third column (Mobile_Number)

        delete_employee(ID)
        fill_grid()
    End Sub


    Protected Sub gv_Employees_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles gv_Employees.RowCancelingEdit
        gv_Employees.EditIndex = -1
        fill_grid()
    End Sub

    Private Sub delete_employee(ByVal id As String)
        con.TSql("update DISC_WEB set link_status='3' where id='" & id & "'")
        fill_grid()
    End Sub

    'Private Sub upda_employee(ByVal ird As String)
    '    con.TSql("delete DISC_WEB  where id='" & ird & "'")
    '    fill_grid()
    'End Sub

    'Protected Sub gv_Employees_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles gv_Employees.RowUpdating

    '    'Reset the EditIndex and rebind the GridView to show the updated data

    '    fill_grid()
    'End Sub

    Protected Sub gv_Employees_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gv_Employees.RowCreated
        ' Hide column 3
        e.Row.Cells(3).Visible = False
    End Sub

    Private Sub gv_Employees_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gv_Employees.RowDataBound
        If e.Row.RowType = DataControlRowType.Header Then
            e.Row.Cells(3).Text = "Cust. Name"
            e.Row.Cells(4).Text = "Vehicle No"
            e.Row.Cells(5).Text = "Disc Type"
            e.Row.Cells(6).Text = "Disc Amt"
            e.Row.Cells(7).Text = "Dse Name"
            e.Row.Cells(8).Text = "Approver"
            e.Row.Cells(9).Text = "Date"
        End If
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Cells(6).HorizontalAlign = HorizontalAlign.Right ' Set the alignment of all data cells to left

        End If

    End Sub

    Protected Sub search_Click(ByVal sender As Object, ByVal e As EventArgs) Handles search.Click
        valueSearch(searchbox.Text)
    End Sub

    Protected Sub search_Click1(ByVal sender As Object, ByVal e As EventArgs) Handles viewall.Click
        fill_grid()
    End Sub

    Private Sub valueSearch(value As String)

        dt = con.ReturnDtTable("select id,CUST_NAME,VEH_REG,DISC_TYPE,DISC_AMT,REQ_BY,APRVL_BY,CURR_DATE from DISC_WEB where link_status='0' and concat(VEH_REG,CUST_NAME,CUST_MOB) Like '%" & value & "%' ")
        gv_Employees.DataSource = dt
        gv_Employees.DataBind()
    End Sub


    <WebMethod()>
    Public Shared Function GetChartData(va As String) As String


        Dim con As New Connection

        Dim TranDt As DataTable
        TranDt = con.ReturnDtTable("select mobile_no from EMPLOYEEMASTER where srno='" & va & "'")

        ' Convert the DataTable to a JSON string
        Dim json As String = JsonConvert.SerializeObject(TranDt)



        ' Return the JSON string
        Return json
    End Function


    <WebMethod()>
    Public Shared Function GetChartData2(va As String) As String


        Dim con As New Connection

        Dim TranDt As DataTable
        TranDt = con.ReturnDtTable("select mobile_no from EMPLOYEEMASTER where srno='" & va & "'")

        ' Convert the DataTable to a JSON string
        Dim json As String = JsonConvert.SerializeObject(TranDt)



        ' Return the JSON string
        Return json
    End Function

End Class