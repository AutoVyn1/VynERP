Imports System.Web.Services
Imports Newtonsoft.Json

Public Class fuel_management
    Inherits System.Web.UI.Page
    Private con As New Connection
    Private dt As New DataTable
    Public jsonString As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("user_name") = "" Then
                Response.Redirect("../../../Default.aspx")
            End If
            date_time_now.Text = Date.Now.ToString("dd-MM-yyyy")
            date_time_now.Enabled = False
            loc_code.Value = Session("branchcode")
        End If

    End Sub

    <WebMethod()>
    Public Shared Function GetData(searchTerm As String, loc_codes As String) As String
        Dim con As New Connection
        Dim dt As DataTable = con.ReturnDtTable("select top 10 DMS_Inv from ICM_MST where DMS_Inv LIKE '%" + searchTerm + "%' and loc_code='" + loc_codes + "'")

        ' Assuming you have already fetched the data into a DataTable called dt
        ' Create a new empty list of dictionary to store the rows of data

        Return JsonConvert.SerializeObject(dt)



    End Function

    <WebMethod()>
    Public Shared Function GetData2(searchTerm As String) As String
        Dim con As New Connection
        Dim dt1 As DataTable = con.ReturnDtTable("select max(seq) as seq from fuel_predict")
        Dim max_no As String
        If dt1.Rows.Count > 0 Then
            max_no = dt1.Rows(0)("seq").ToString
            If max_no = "" Then
                max_no = 0
            End If

        End If


        Dim dt As DataTable = con.ReturnDtTable("Select Modl_Mst.Modl_Name As modl_name,CONCAT(ICM_MST.drpTitle , ' ', ICM_MST.Ledg_Name) as cust_name,
       misc_mst.Misc_Name as dse_name,Godown_Mst.Godw_Name,CONVERT(varchar(10), icm_mst.gp_datetime, 105) as gp_datetime_formatted,CONVERT(varchar(10), icm_mst.delv_date, 105) as delv_date_formatted
        ,ICM_MST.*From ICM_MST Join Modl_Mst On ICM_MST.modl_code = Modl_Mst.item_code
        JOIN misc_mst ON ICM_MST.DMS_DSE = misc_mst.Misc_Code  JOIN Godown_Mst ON ICM_MST.Loc_Code = Godown_Mst.Godw_Code  Where misc_mst.Misc_Type='7'and ICM_MST.DMS_Inv ='" + searchTerm + "'")
        dt.Columns.Add("seq", GetType(String))
        For Each row As DataRow In dt.Rows
            row("seq") = max_no + 1
        Next


        Dim dt2 As DataTable = con.ReturnDtTable("select dms_inv_no,qty from fuel_predict where dms_inv_no='" + searchTerm + "' ")
        If dt2.Rows.Count > 0 Then
            ' Show alert message
            Return JsonConvert.SerializeObject(dt2)

        Else
            Return JsonConvert.SerializeObject(dt)
        End If



    End Function

    'Protected Sub ImageButton1_Click(sender As Object, e As EventArgs) Handles save.Click

    '    con.TSql("INSERT INTO fuel_predict (seq, branch_name, gatepass_no, del_date, cust_name, fuel_type, dse_name,dms_inv_no,form_date, gatepass_date, model_name, qty, slip_to, remark) VALUES ('" + seq_no.Text + "','" + branch_code.Value + "','" + gp_no.Text + "','" + del_date.Text + "','" + cust_name.Text + "','" + fuel_type.Text + "','" + dse_code.Value + "','" + dms_inv.Text + "','" + date_time_now.Text + "','" + gp_date_new.Text + "','" + modl_code.Value + "','" + fuel_qty.SelectedValue + "','" + slip_to.Text + "','" + remark.Text + "')")

    '    Response.Redirect(Request.Url.AbsoluteUri)

    'End Sub

    Protected Sub print_Click(sender As Object, e As EventArgs) Handles print.Click
        Dim dt As DataTable = con.ReturnDtTable("select dms_inv_no,seq from fuel_predict where dms_inv_no='" + dms_inv.Text + "' or seq='" + seq_no.Text + "' ")
        If dt.Rows.Count > 0 Then
            ' Show alert message
            If dt.Rows(0)("seq").ToString <> "" Then
                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: 'Please generate new seq', text: 'For this invoice', icon: 'warning', showConfirmButton: true}).then(function() { window.location.href='" & Request.Url.AbsoluteUri & "'; });", True)
            Else
                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: 'Voucher Already Created', text: 'For this invoice', icon: 'warning', showConfirmButton: true}).then(function() { window.location.href='" & Request.Url.AbsoluteUri & "'; });", True)
            End If

        Else
                Dim print_date As String = DateTime.Now.ToString()
            Dim user_name As String = Session("user_name")
            con.TSql("INSERT INTO fuel_predict (seq,print_date,tran_type,user_name, branch_name, gatepass_no, del_date, cust_name, fuel_type, dse_name,dms_inv_no,form_date, gatepass_date, model_name, qty, slip_to, remark) VALUES ('" + seq_no.Text + "','" + print_date + "','1','" + user_name + "','" + branch_code.Value + "','" + gp_no.Text + "','" + del_date.Text + "','" + cust_name.Text + "','" + fuel_type.Text + "','" + dse_code.Value + "','" + dms_inv.Text + "','" + date_time_now.Text + "','" + gp_date_new.Text + "','" + modl_code.Value + "','" + fuel_qty.SelectedValue + "','" + slip_to.Text + "','" + remark.Text + "')")
            Session("fuel_inv") = seq_no.Text
            Response.Redirect("Print_Slip.aspx")

        End If

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles getdetail.Click
        Dim con As New Connection
        Dim dt As DataTable = con.ReturnDtTable("select max(seq) as seq from fuel_predict")
        Dim max_no As String
        If dt.Rows.Count > 0 Then
            max_no = dt.Rows(0)("seq").ToString
            If max_no = "" Then
                max_no = 0
            End If

        End If

        Dim dt2 As DataTable = con.ReturnDtTable("select dms_inv_no from fuel_predict where dms_inv_no='" + dms_inv.Text + "' ")
        If dt2.Rows.Count > 0 Then
            ' Show alert message
            ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: 'Fuel Voucher already issued', text: 'For this invoice', icon: 'warning', showConfirmButton: true}).then(function() { window.location.href='" & Request.Url.AbsoluteUri & "'; });", True)
        End If




        Dim dt1 As DataTable = con.ReturnDtTable("Select Modl_Mst.Modl_Name As modl_name,CONCAT(ICM_MST.drpTitle , ' ', ICM_MST.Ledg_Name) as cust_name,
       misc_mst.Misc_Name as dse_name,Godown_Mst.Godw_Name,CONVERT(varchar(10), icm_mst.gp_datetime, 105) as gp_datetime_formatted,CONVERT(varchar(10), icm_mst.delv_date, 105) as delv_date_formatted
        ,ICM_MST.*From ICM_MST Join Modl_Mst On ICM_MST.modl_code = Modl_Mst.item_code
        JOIN misc_mst ON ICM_MST.DMS_DSE = misc_mst.Misc_Code  JOIN Godown_Mst ON ICM_MST.Loc_Code = Godown_Mst.Godw_Code  Where misc_mst.Misc_Type='7'and ICM_MST.DMS_Inv ='" + dms_inv.Text + "'")
        dt1.Columns.Add("seq", GetType(String))

        If dt1.Rows.Count > 0 Then
            For Each row As DataRow In dt1.Rows
                row("seq") = max_no + 1
            Next

            gp_no.Text = dt1.Rows(0)("GP_Seq").ToString
            gp_date_new.Text = dt1.Rows(0)("gp_datetime_formatted").ToString
            ' Check if the delivery date is not empty
            cust_name.Text = dt1.Rows(0)("cust_name").ToString
            modl_name.Text = dt1.Rows(0)("modl_name").ToString
            dse_name.Text = dt1.Rows(0)("dse_name").ToString
            branch_name.Text = dt1.Rows(0)("Godw_Name").ToString
            seq_no.Text = dt1.Rows(0)("seq").ToString
            fuel_type.Text = dt1.Rows(0)("FUEL_TYPE").ToString
            branch_code.Value = dt1.Rows(0)("Loc_Code").ToString
            dse_code.Value = dt1.Rows(0)("ERP_DSE").ToString
            modl_code.Value = dt1.Rows(0)("Modl_Code").ToString
            If Not String.IsNullOrEmpty(dt1.Rows(0)("delv_date_formatted").ToString()) Then
                del_date.Text = dt1.Rows(0)("delv_date_formatted").ToString()
            Else
                ' Show alert message if delivery date is empty

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: 'Vehicle not delivered delivered', text: '', icon: 'warning', showConfirmButton: true}).then(function() { window.location.href='" & Request.Url.AbsoluteUri & "'; });", True)

            End If

        Else
            ' Show alert message
            ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: 'No data for this invoice ', text: 'for this invoice', icon: 'warning', showConfirmButton: true}).then(function() { window.location.href='" & Request.Url.AbsoluteUri & "'; });", True)


        End If


    End Sub
End Class
