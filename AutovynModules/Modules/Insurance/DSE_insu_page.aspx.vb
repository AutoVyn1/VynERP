Imports System.IO

Public Class DSE_insu_page
    Inherits System.Web.UI.Page
    Private con
    Private dt As New DataTable
    Private link As String
    Private Dse_Mob As String
    Private Aprvl_Mob As String
    Private LinkId As Integer = 0
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim Myurl As String = Request.Url.AbsoluteUri
        Dim MyArr = Myurl.Split("?")
        If MyArr.Length = 3 Then
            LinkId = MyArr(1).ToString
            Session("LinkId") = LinkId
            LoginPage.clientid = MyArr(2).ToString.Replace(".", "").Trim
            HttpContext.Current.Session("client_id") = MyArr(2).ToString.Replace(".", "").Trim
        End If
        con = New Connection
        Aprvl_Panel.Enabled = True
        Main_Panel.Enabled = False
        dse_list()
        datePicker.Text = Now.ToString("dd/MM/yyyy")

        If MyArr.Length = 3 Then
            LinkId = Val(MyArr(1).ToString)
            LoginPage.clientid = MyArr(2).ToString

            Dim Mydt As DataTable
            Mydt = con.ReturnDtTable("Select * from WA_Link where Link_Id=" & LinkId & "")
            If Mydt.Rows(0)("tran_type").ToString = "2" Then
                MsgBox("Link Has been Expired")
            Else
                If Mydt.Rows.Count > 0 Then
                    Myurl = Mydt.Rows(0)("Link_Add").ToString
                    MyArr = Myurl.Split("?")
                    CustMobile.Text = MyArr(1).ToString.Replace("Mobile=", "")
                    VehicleNo.Text = MyArr(2).ToString.Replace("Pan_Number=", "")
                    FillMob_PAN_Based_Data()
                End If
            End If

        End If

    End Sub

    Private Sub FillMob_PAN_Based_Data()
        Try
            dt = con.ReturnDtTable("select * from insu_track where Mobile_Number='" & CustMobile.Text & "' and Vehicle_No='" & VehicleNo.Text & "'")
            If dt.Rows.Count > 0 Then
                CustName.Text = dt.Rows(0)("Cust_name").ToString
                CustAddress.Text = dt.Rows(0)("Cust_Address").ToString
                CustMobile.Text = dt.Rows(0)("Mobile_Number").ToString
                CustEmail.Text = dt.Rows(0)("Email").ToString
                VehicleNo.Text = dt.Rows(0)("Vehicle_No").ToString
                DSE_Name.SelectedValue = dt.Rows(0)("DSe_name").ToString
                InsuranceAmt.Text = dt.Rows(0)("Insurance_amt").ToString
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub MesgBox(ByVal sMessage As String)

        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: '" + sMessage + "', icon: 'error', showConfirmButton: true})", True)
    End Sub

    Private Sub MesgBox1(ByVal sMessage As String)

        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: '" + sMessage + "', icon: 'warning', showConfirmButton: true})", True)
    End Sub

    Private Sub Submit_Click(sender As Object, e As EventArgs) Handles Submit.Click
        Try

            dt = con.ReturnDtTable("select tran_id from insu_track where Mobile_Number='" & CustMobile.Text & "' and Vehicle_No='" & VehicleNo.Text & "'")
            Dim tra_ids As String = dt.Rows(0)("tran_id").ToString
            Dim str As String = "Cust_Name,Cust_Address, Mobile_Number, Email, Vehicle_No,DSe_name,Insurance_Amt"
            Dim qry As String = "update insu_track set recd_amt='" + recv_amt.Text + "',Date='" + SqlDate(datePicker.Text) + "',Remark='" + Remark.Text + "',Payment_Mode='" + PaymentMode.SelectedItem.Text + "',link_status='2' where mobile_number='" + CustMobile.Text + "' and Vehicle_No='" + VehicleNo.Text + "' "
            con.TSql(qry)
            Dim FileTYPE As String = Path.GetExtension(rcpt_image.FileName)
            Dim FileName As String = Path.GetFileName(rcpt_image.FileName)
            Dim new_name As String = System.Guid.NewGuid.ToString & "_" & FileTYPE
            Dim folderPath As String = Server.MapPath("~/AutovynModules/Documents/")

            If Not Directory.Exists(folderPath) Then
                Directory.CreateDirectory(folderPath)
            End If

            If rcpt_image.HasFile Then
                con.TSql("insert into DOC_UPLOAD (Doc_Type,TRAN_ID,SRNO,path,File_Name,User_Name,Upload_Date,Export_type) values('Insurance','" + tra_ids + "','1','" + FileName + "','" + new_name + "','" + DSE_Name.SelectedValue + "','" + SqlDate(datePicker.Text) + "','1')")
                rcpt_image.SaveAs(folderPath + new_name)
            End If

            ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: 'Status has been changed', text: '', icon: 'success', showConfirmButton: true}).then(function() { window.location.href='" & Request.Url.AbsoluteUri & "'; });", True)


        Catch ex As Exception
            MesgBox("Data Not  inserted")
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


End Class