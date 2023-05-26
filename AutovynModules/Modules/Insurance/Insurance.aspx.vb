Imports System.IO

Public Class Insurance
    Inherits System.Web.UI.Page
    Private con
    Private dt As New DataTable
    Private link As String
    Private Dse_Mob As String
    Private Aprvl_Mob As String
    Private LinkId As Integer = 0
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("user_name") = "" Then
            ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: 'Please Login first', text: '', icon: 'warning', showConfirmButton: true}).then(function() { window.location.href='../../Credintial/LoginPage.aspx'; });", True)
        Else
            con = New Connection

            Try
                If Not IsPostBack Then
                    'datePicker.Text = Now.ToString("dd") & Now.ToString("MM") & Now.ToString("yyyy")
                    'Aprvl_Panel.Enabled = False
                    Main_Panel.Enabled = True
                    dse_list()
                    fill_grid()

                    Dim Myurl As String = Request.Url.AbsoluteUri
                    Dim MyArr = Myurl.Split("?")
                    If MyArr.Length = 3 Then
                        LinkId = MyArr(1).ToString
                        Session("LinkId") = LinkId
                        LoginPage.clientid = MyArr(2).ToString.Replace(".", "").Trim



                    End If

                    If Session("user_name") = "" Then
                        'Aprvl_Panel.Enabled = True
                        Main_Panel.Enabled = False

                    End If

                End If

            Catch ex As Exception

            End Try
        End If
    End Sub



    Private Sub MesgBox(ByVal sMessage As String)

        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: '" + sMessage + "', icon: 'warning', showConfirmButton: true})", True)
    End Sub

    Private Sub MesgBox1(ByVal sMessage As String)

        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: '" + sMessage + "', icon: 'error', showConfirmButton: true})", True)
    End Sub

    Private Sub Submit_Click(sender As Object, e As EventArgs) Handles Submit.Click
        Try

            If Session("user_name") = "" Then
                MesgBox("Please login first")
            Else
                dt = con.ReturnDtTable("select * from insu_track where Mobile_Number='" & CustMobile.Text & "'")
                If dt.Rows.Count > 0 Then
                    MesgBox1("This user is already Exits")
                Else
                    Dim str As String = "Cust_Name,Cust_Address, Mobile_Number, Email, Vehicle_No,DSe_name,Insurance_Amt,link_status,location"
                    Dim qry As String = "INSERT INTO insu_track (" & str & ") VALUES ('" & CustName.Text & "','" & CustAddress.Text & "','" & CustMobile.Text & "','" & CustEmail.Text & "','" & VehicleNo.Text & "','" & DSE_Name.SelectedValue & "','" & InsuranceAmt.Text & "','0','" + location.Text + "')"
                    con.TSql(qry)
                    fill_grid()
                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: 'Link created successfully', text: '', icon: 'success', showConfirmButton: true}).then(function() { window.location.href='" & Request.Url.AbsoluteUri & "'; });", True)
                End If
            End If

        Catch ex As Exception
            MesgBox1("Data Not inserted")
        End Try

    End Sub

    Private Sub dse_list()
        Try
            dt = con.ReturnDtTable("select srno,empcode+' - '+empfirstname as Emp_Name from EMPLOYEEMASTER where ISNULL(srno,'')<>'' and export_type<3")
            dt.Rows.Add()
            dt.Rows(dt.Rows.Count - 1)("srno") = 0
            dt.Rows(dt.Rows.Count - 1)("Emp_Name") = "----Select----"
            dt = dt.Select("srno>=0", "srno").CopyToDataTable
            DSE_Name.DataSource = dt
            DSE_Name.DataTextField = "Emp_Name"
            DSE_Name.DataValueField = "srno"
            DSE_Name.DataBind()
        Catch ex As Exception

        End Try
    End Sub

    Private Sub Whastapp_Linking(ByVal Tran_id As String)
        Try
            Dim dt1 As DataTable
            dt1 = con.ReturnDtTable("select Cust_Name,Cust_Address,Mobile_Number,Insurance_Amt,dse_name,vehicle_no from insu_track where tran_id='" + Tran_id + "'")
            Dim dse_no As String = dt1.Rows(0)("dse_name").ToString
            Dim custome_name As String = dt1.Rows(0)("Cust_Name").ToString
            Dim custome_add As String = dt1.Rows(0)("Cust_Address").ToString
            Dim custome_mobi As String = dt1.Rows(0)("Mobile_Number").ToString
            Dim cust_veh As String = dt1.Rows(0)("vehicle_no").ToString

            Dim custome_insurance As String = dt1.Rows(0)("Insurance_Amt").ToString

            Dim dt2 As DataTable
            dt2 = con.ReturnDtTable("select mobile_no,CONCAT(EMPFIRSTNAME,' ', EMPLASTNAME) AS DSE_NAME from EMPLOYEEMASTER where srno='" & dse_no & "'")
            Dim DSE_NAME As String = dt2.Rows(0)("DSE_NAME").ToString
            Dim Dse_Mob As String = dt2.Rows(0)("mobile_no").ToString


            '''''''''' Approvar Message Format ''''''''''''

            Dim msg As String
            link = "https://cloud.autovyn.com/AutovynModules/Modules/Insurance/DSE_insu_page.aspx?Mobile=" & custome_mobi & "?Pan_Number=" & cust_veh & ""
            con.TSql("INSERT INTO wa_link (link_add,exp_date,tran_type) VALUES('" & link & "','" & SqlDate(Now.ToString("dd-MM-YYYY")) & "','1')")
            Dim MaXlINKiD As String = Val(con.ExecuteScaler("SELECT MAX(LINK_ID) FROM WA_LINK").ToString)
            link = "https://cloud.autovyn.com/AutovynModules/Modules/Insurance/DSE_insu_page.aspx?" & MaXlINKiD & "?" & LoginPage.clientid
            msg = "Dear MR " & DSE_NAME & "," & vbNewLine & "Please find the insurance renewed link for the customer [" & custome_name & "] vehicle reg no [" & cust_veh & "] Amount due is [" & custome_insurance & "]." & vbNewLine & "Please update the cutomer payment on the link given below" & vbNewLine & " [" & link & "]. " & vbNewLine & "Regards " + vbNewLine + " " + vbNewLine + Session("Dlr_name")
            WA_MSG = msg
            WA_Mob = "91" & Dse_Mob
            'WA_Mob = "91" & "9785017630"
            WAMSG()
            con.TSql("update insu_track set link_status='1' where tran_id='" & Tran_id & "'")


            '''''''''''''''''''''' DSE Message Format ''''''''''''''''''''''''''''''''

        Catch ex As Exception
            MesgBox("Message not sent")
        End Try
    End Sub




    Private Sub fill_grid()
        Dim calltable As String
        calltable = "select tran_id,Cust_Name,Cust_Address,Mobile_Number,vehicle_no,(select CONCAT(EMPFIRSTNAME,' ', EMPLASTNAME) AS DSE_NAME from EMPLOYEEMASTER where SRNO=dse_name) as dse_name,location,Insurance_Amt from insu_track where link_status='0'"
        dt = con.ReturnDtTable(calltable)
        gv_Employees.DataSource = dt
        gv_Employees.DataBind()

    End Sub

    Protected Sub Candidates_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_Employees.SelectedIndexChanged
        Dim tran_id As String
        tran_id = gv_Employees.SelectedRow.Cells(2).Text
        Whastapp_Linking(tran_id)
        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: 'Link Sent Successfully', text: '', icon: 'success', showConfirmButton: true}).then(function() { window.location.href='" & Request.Url.AbsoluteUri & "'; });", True)
    End Sub

    Protected Sub gv_Employees_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles gv_Employees.RowEditing
        gv_Employees.EditIndex = e.NewEditIndex

        fill_grid()
    End Sub

    Protected Sub gv_Employees_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles gv_Employees.RowDeleting
        Dim rowIndex As Integer = e.RowIndex
        Dim Mobile_Number As String = gv_Employees.Rows(rowIndex).Cells(2).Text ' get the value of the third column (Mobile_Number)

        delete_employee(Mobile_Number)
        fill_grid()
    End Sub


    Protected Sub gv_Employees_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles gv_Employees.RowCancelingEdit
        gv_Employees.EditIndex = -1
        fill_grid()
    End Sub

    Private Sub delete_employee(ByVal mobile As String)
        con.TSql("update insu_track set link_status='3' where tran_id='" & mobile & "'")
        fill_grid()
    End Sub

    Protected Sub gv_Employees_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles gv_Employees.RowUpdating
        Dim rowIndex As Integer = e.RowIndex
        'Dim id As Integer = Convert.ToInt32(gv_Employees.DataKeys(rowIndex).Value) ' get the ID from DataKeys
        Dim tran_id As String = e.NewValues(0).ToString() ' get the new value of the first column (Name)
        Dim Cust_Name As String = e.NewValues(1).ToString() ' get the new value of the first column (Name)
        Dim Cust_Address As String = e.NewValues(2).ToString() ' get the new value of the second column (Email)
        Dim Mobile_Number As String = e.NewValues(3).ToString() ' get the new value of the second column (Email)

        Dim vehicle_no As String = e.NewValues(4).ToString() ' get the new value of the first column (Name)


        Dim dse_name As String = e.NewValues(5).ToString() ' get the new value of the second column (Email)
        Dim location As String = e.NewValues(6).ToString() ' get the new value of the second column (Email)
        Dim Insurance_Amt As String = e.NewValues(7).ToString() ' get the new value of the second column (Email)

        con.TSql("update insu_track set Cust_Name='" + Cust_Name + "',Cust_Address='" + Cust_Address + "',mobile_number='" + Mobile_Number + "',vehicle_no='" + vehicle_no + "',location='" + location + "',Insurance_Amt='" + Insurance_Amt + "' where tran_id='" & tran_id & "' ")



        'Reset the EditIndex and rebind the GridView to show the updated data
        gv_Employees.EditIndex = -1
        fill_grid()
    End Sub

    Protected Sub gv_Employees_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gv_Employees.RowCreated
        ' Hide column 3
        e.Row.Cells(2).Visible = False
    End Sub

    Private Sub gv_Employees_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gv_Employees.RowDataBound
        If e.Row.RowType = DataControlRowType.Header Then
            e.Row.Cells(3).Text = "Cust. Name"
            e.Row.Cells(4).Text = "Cust. Address"
            e.Row.Cells(5).Text = "Mobile No."
            e.Row.Cells(6).Text = "Vehicle No."
            e.Row.Cells(7).Text = "Dse Name"
            e.Row.Cells(8).Text = "Location"
            e.Row.Cells(9).Text = "Insurance Amount"
        End If
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Cells(9).HorizontalAlign = HorizontalAlign.Right ' Set the alignment of all data cells to left

        End If

    End Sub

    Protected Sub search_Click(ByVal sender As Object, ByVal e As EventArgs) Handles search.Click
        valueSearch(searchbox.Text)
    End Sub

    Protected Sub search_Click1(ByVal sender As Object, ByVal e As EventArgs) Handles viewall.Click
        fill_grid()
    End Sub

    Private Sub valueSearch(value As String)

        dt = con.ReturnDtTable("select tran_id,Cust_Name,Cust_Address,Mobile_Number,vehicle_no,dse_name,location,Insurance_Amt from insu_track where link_status='0' and concat(location, Cust_Name,Mobile_Number) Like '%" & value & "%' ")
        gv_Employees.DataSource = dt
        gv_Employees.DataBind()
    End Sub


End Class