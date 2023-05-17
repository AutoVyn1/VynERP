Public Class InsuranceData
    Inherits System.Web.UI.Page
    Private con
    Private dt As New DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        con = New Connection
        dt = con.ReturnDtTable("select (select FILE_NAME from DOC_UPLOAD where DOC_type='insurance'and tran_id=insu_track.tran_id) as Receipt_img ,Cust_Name,Mobile_Number,Insurance_Amt,(select CONCAT(EMPFIRSTNAME,' ', EMPLASTNAME) AS DSE_NAME from EMPLOYEEMASTER where SRNO=dse_name) as dse_name,location,Recd_amt,Remark from insu_track  where link_status='2'")

        Data_Grid.DataSource = dt

    End Sub

    Protected Sub Candidates_SelectedIndexChanged(sender As Object, e As EventArgs) Handles Data_Grid.SelectedIndexChanged
        Dim image_url As String
        image_url = Data_Grid.SelectedRow.Cells(1).Text
        Dim folderPath As String = "~/AutovynModules/Documents/"
        Dim url As String
        Dim Filename As String
        Filename = image_url
        url = folderPath & "" & Filename
        Image1.ImageUrl = url
        ' Add this code to show the modal
        Dim script As String = "<script> var modal = document.getElementById('myModal'); modal.style.display = 'block'; </script>"
        ClientScript.RegisterStartupScript(Me.GetType(), "ShowModalScript", script)
    End Sub

    Protected Sub gv_Employees_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles Data_Grid.RowCreated
        ' Hide column 2
        e.Row.Cells(1).Visible = False
    End Sub

    Protected Sub search_Click(ByVal sender As Object, ByVal e As EventArgs) Handles search.Click
        valueSearch(searchbox.Text)
    End Sub

    Protected Sub search_Click1(ByVal sender As Object, ByVal e As EventArgs) Handles viewall.Click
        valueSearch1()
    End Sub

    Private Sub valueSearch(value As String)

        dt = con.ReturnDtTable("select (select FILE_NAME from DOC_UPLOAD where DOC_type='insurance'and tran_id=insu_track.tran_id) as Receipt_img ,Cust_Name,Mobile_Number,Insurance_Amt,(select CONCAT(EMPFIRSTNAME,' ', EMPLASTNAME) AS DSE_NAME from EMPLOYEEMASTER where SRNO=dse_name) as dse_name,location,Recd_amt,Remark from insu_track  where link_status='2' and concat(location, Cust_Name,Mobile_Number) Like '%" & value & "%' ")
        Data_Grid.DataSource = dt
        Data_Grid.DataBind()
    End Sub

    Private Sub valueSearch1()
        dt = con.ReturnDtTable("select (select FILE_NAME from DOC_UPLOAD where DOC_type='insurance'and tran_id=insu_track.tran_id) as Receipt_img ,Cust_Name,Mobile_Number,Insurance_Amt,(select CONCAT(EMPFIRSTNAME,' ', EMPLASTNAME) AS DSE_NAME from EMPLOYEEMASTER where SRNO=dse_name) as dse_name,location,Recd_amt,Remark from insu_track  where link_status='2'")
        Data_Grid.DataSource = dt
        Data_Grid.DataBind()
    End Sub

    Private Sub gvEmployees_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles Data_Grid.RowDataBound
        If e.Row.RowType = DataControlRowType.Header Then
            e.Row.Cells(2).Text = "Cust. Name"
            e.Row.Cells(3).Text = "Mobile No."
            e.Row.Cells(4).Text = "Insurance Amount"
            e.Row.Cells(5).Text = "Dse Name"
            e.Row.Cells(6).Text = "Location"
            e.Row.Cells(7).Text = "Received Amt"
        End If
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Cells(4).HorizontalAlign = HorizontalAlign.Right ' Set the alignment of all data cells to left
            e.Row.Cells(7).HorizontalAlign = HorizontalAlign.Right
            e.Row.Cells(8).HorizontalAlign = HorizontalAlign.Left
        End If

    End Sub
End Class