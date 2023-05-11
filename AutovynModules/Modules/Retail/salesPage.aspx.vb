Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Public Class salesPage
    Inherits System.Web.UI.Page
    Private userName As New LoginPage
    Private con As New Connection
    Public SqlCon As New SqlConnection
    Private com As New SqlCommand
    Private com1 As New SqlCommand
    Private comb As New SqlCommandBuilder
    Private adp As New SqlDataAdapter
    Dim dt As New DataTable
    Private sql As String
    Dim GrdIndex As Integer = 0
    Private chart As String
    Private MyDt As New DataTable
    Private allBranch As String
    Private Sub retail_Click(sender As Object, e As EventArgs) Handles retail.Click
        'ISNull(Veh_Del,0)=0 and
        Try
            ' dt = con.ReturnDtTable("select DISTINCT DMS_Inv as Invoice_Number, convert(varchar,inv_date,103) as Invoice_Date, Ledg_Name as Ledger_Name, Upper((SElect top 1 model from NewCar_Sale_Register where ICM_Id=Tran_Id)) as Models,ICM_Mst.CHAS_No as Chassis_Number ,  (SElect top 1 EMPCODE+'-'+EmpFirstName+' '+IsNull(EmpLastName,'') from EmployeeMaster where  SrNo=ERP_DSE) as DSE_Name,Cust_Id as Customer_Id,Net_Bal,IIf(Veh_Del= 1, 'Yes','No'),  (select top 1 USER_NAME from USER_TBL where USER_TBL.User_Code=ICM_MSt.User_code) as UserName, Ph1 as Phone,Month(Inv_Date) as Mth,Pymt_Mode,Tran_Id  from ICM_MST where  ICM_MST.Export_Type<3 and  ICM_MST.tran_type=51 and ICM_MST.Loc_Code=" & Val(DbPath.CompCode) & "  and INV_DATE between '" & DateFrom.Text & "' and '" & DateUpto.Text & "'  ) & " ")
            '  dt = con.ReturnDtTable("select DISTINCT row_number() over (order by ledg_name asc) as srNo, DMS_Inv as Invoice_Number, convert(varchar,inv_date,103) as invoice_date, Ledg_Name as Ledger_Name, Upper((SElect top 1 model from NewCar_Sale_Register where ICM_Id=Tran_Id)) as Models,ICM_Mst.CHAS_No as Chassis_Number ,  (SElect top 1 EMPCODE+'-'+EmpFirstName+' '+IsNull(EmpLastName,'') from EmployeeMaster where  SrNo=ERP_DSE) as DSE_Name,Cust_Id as Customer_Id,Net_Bal as Net_balance  from ICM_MST where  ICM_MST.Export_Type<3 and  ICM_MST.tran_type=51 and ICM_MST.Loc_Code=" & Val(DbPath.CompCode) & "  and INV_DATE between '" & DateFrom.Text & "' and '" & DateUpto.Text & "'  ) & " ")'
            sql = ("SET DATEFORMAT dmy select DISTINCT row_number() over (order by ledg_name asc) as srNo, DMS_Inv as Invoice_Number, convert(varchar,inv_date,103) as invoice_date, Ledg_Name as Ledger_Name, Upper((SElect top 1 model from NewCar_Sale_Register where ICM_Id=Tran_Id)) as Models,ICM_Mst.CHAS_No as Chassis_Number ,  (SElect top 1 EMPCODE+'-'+EmpFirstName+' '+IsNull(EmpLastName,'') from EmployeeMaster where  SrNo=ERP_DSE) as DSE_Name,Cust_Id as Customer_Id,Net_Bal as Net_balance  from ICM_MST where  ICM_MST.Export_Type<3 and   ICM_MST.tran_type=51 and ICM_MST.Loc_Code=" & Val(DbPath.CompCode) & "  and Cast(INV_DATE as Date) between cast('" & DateFrom.Text & "' as Date)  and  cast('" & DateUpto.Text & "' as date) ")
            dt = con.ReturnDtTable(sql)
            GrdView.DataSource = dt
            GrdView.DataBind()
            GrdView.Width = 1500
            CurrentTable = dt
        Catch ex As Exception

        End Try
    End Sub

    Private Sub DeliveryBtn_Click(sender As Object, e As EventArgs) Handles deliveryBtn.Click
        Try
            sql = ("SET DATEFORMAT dmy select DISTINCT row_number() over (order by ledg_name asc) as srNo, DMS_Inv as Invoice_Number, convert(varchar,Delv_Date,103) as Delivery_Date, Ledg_Name as Ledger_Name,  Upper((SElect top 1 model from NewCar_Sale_Register where ICM_Id=Tran_Id)) as Models,ICM_Mst.CHAS_No as Chassis_Number ,  (SElect top 1 EMPCODE+'-'+EmpFirstName+' '+IsNull(EmpLastName,'') from EmployeeMaster where  SrNo=ERP_DSE) as DSE_Name,Cust_Id as Customer_Id,Net_Bal as Net_balance from ICM_MST where ISNull(Veh_Del,0)=1 and ICM_MST.Export_Type<3 and  ICM_MST.tran_type=51 and ICM_MST.Loc_Code=" & Val(DbPath.CompCode) & "  and  cast(INV_DATE as Date) between cast('" & DateFrom.Text & "' as Date)  and  cast('" & DateUpto.Text & "' as date) ")
            dt = con.ReturnDtTable(sql)
            GrdView.DataSource = dt
            GrdView.DataBind()
            CurrentTable = dt
        Catch ex As Exception

        End Try
    End Sub

    Private Sub vb_nd_Click(sender As Object, e As EventArgs) Handles vb_nd.Click
        Try
            Dim dt As New DataTable
            sql = ("SET DATEFORMAT dmy select DISTINCT 0 as SrNo, DMS_Inv as Invoice_Number, convert(varchar,inv_date,103) as Invoice_Date, Ledg_Name as Ledger_Name, Upper((SElect top 1 model from NewCar_Sale_Register where ICM_Id=Tran_Id)) as Models,ICM_Mst.CHAS_No as Chassis_Number ,  (SElect top 1 EMPCODE+'-'+EmpFirstName+' '+IsNull(EmpLastName,'') from EmployeeMaster where  SrNo=ERP_DSE) as DSE_Name,Cust_Id as Customer_Id,Net_Bal as Net_balance from ICM_MST where ISNull(Veh_Del,0)=0 and ICM_MST.Export_Type<3 and  ICM_MST.tran_type=51 and ICM_MST.Loc_Code=" & Val(DbPath.CompCode) & "  and cast(INV_DATE as date) between cast('" & DateFrom.Text & "' as Date)  and  cast('" & DateUpto.Text & "' as date) ")
            dt = con.ReturnDtTable(sql)
            GrdView.DataSource = dt
            GrdView.Width = 1500
            For i As Integer = 0 To dt.Rows.Count - 1
                dt.Rows(i)("SrNo") = i + 1
            Next
            GrdView.DataBind()
            CurrentTable = dt
        Catch ex As Exception

        End Try
    End Sub

    Private Sub rips_support_Click(sender As Object, e As EventArgs) Handles rips_support.Click
        Try
            Dim dt As New DataTable
            'dt = con.ReturnDtTable("SELECT CONS_DISC as Consumer_Discount, Ledg_Name as Ledger_Name, convert(varchar,INV_Date,103) as Invoice_Date, Cust_Id as Customer_ID, Veh_Cost as Vehicle_Price, Upper((SElect top 1 model from NewCar_Sale_Register)) as Models,ICM_Mst.CHAS_No as Chassis_Number ,  (SElect top 1 EMPCODE+'-'+EmpFirstName+' '+IsNull(EmpLastName,'') from EmployeeMaster where  SrNo=ERP_DSE) as DSE_Name,Cust_Id as Customer_Id,Net_Bal,IIf(Veh_Del= 1, 'Yes','No'),  (select top 1 USER_NAME from USER_TBL where USER_TBL.User_Code=ICM_MSt.User_code) as UserName, Ph1 as Phone,Month(delv_Date) as Mth,Pymt_Mode FROM ICM_MSt, icm_dtl where ISNull(Veh_Del,0)=1 and icm_mst.Export_Type<3 and  icm_mst.tran_type=51 and  cons_disc>0 and Loc_Code=" & Val(DbPath.CompCode) & "  and delv_DATE between '" & DateFrom.Text & "' and '" & DateUpto.Text & "'  ) & " ")
            sql = ("SET DATEFORMAT dmy SELECT DISTINCT 0 as Srno, DMS_Inv as Invoice_Number, convert(varchar,inv_date,103) as Invoice_Date,  Ledg_Name as Ledger_Name, convert(varchar,delv_Date,103) as Veh_Delv_Date, Cust_Id as Customer_ID, Veh_Cost as Vehicle_Price,CONS_DISC as Consumer_Discount, Upper((SElect top 1 model from NewCar_Sale_Register)) as Models,ICM_Mst.CHAS_No as Chassis_Number ,  (SElect top 1 EMPCODE+'-'+EmpFirstName+' '+IsNull(EmpLastName,'') from EmployeeMaster where  SrNo=ERP_DSE) as DSE_Name,Net_Bal as Net_balance FROM ICM_MSt, icm_dtl where  ICM_MSt.tran_Id=ICM_DTL.Tran_Id and  ISNull(Veh_Del,0)=1 and icm_mst.Export_Type<3 and  icm_mst.tran_type=51 and  cons_disc>0 and Loc_Code=" & Val(DbPath.CompCode) & "  and delv_date between cast('" & DateFrom.Text & "' as date) and cast('" & DateUpto.Text & "' as date) ")
            dt = con.ReturnDtTable(sql)
            For i As Integer = 0 To dt.Rows.Count - 1
                dt.Rows(i)("SrNo") = i + 1
            Next
            GrdView.DataSource = dt
            GrdView.DataBind()
            CurrentTable = dt
        Catch ex As Exception

        End Try
    End Sub

    Private Sub corporate_1_Click(sender As Object, e As EventArgs) Handles corporate_1.Click
        Try
            Dim dt As New DataTable
            sql = ("SET DATEFORMAT dmy SELECT distinct 0 as SrNo, DMS_Inv as Invoice_Number, convert(varchar,inv_date,103) as Invoice_Date,  Ledg_Name as Ledger_Name, convert(varchar,delv_Date,103) as Veh_Delv_Date, Cust_Id as Customer_ID, Veh_Cost as Vehicle_Price,corp_disc as Corporate_Discount, Upper((SElect top 1 model from NewCar_Sale_Register)) as Models,ICM_Mst.CHAS_No as Chassis_Number ,  (SElect top 1 EMPCODE+'-'+EmpFirstName+' '+IsNull(EmpLastName,'') from EmployeeMaster where  SrNo=ERP_DSE) as DSE_Name,Net_Bal as Net_balance FROM ICM_MSt, icm_dtl where  ICM_MSt.tran_Id=ICM_DTL.Tran_Id and  ISNull(Veh_Del,0)=1 and icm_mst.Export_Type<3 and  icm_mst.tran_type=51 and  corp_disc>0 and Loc_Code=" & Val(DbPath.CompCode) & "  and delv_DATE between cast('" & DateFrom.Text & "' as date) and cast('" & DateUpto.Text & "' as date) ")
            dt = con.ReturnDtTable(sql)
            For i As Integer = 0 To dt.Rows.Count - 1
                dt.Rows(i)("SrNo") = i + 1
            Next
            GrdView.DataSource = dt
            GrdView.DataBind()
            CurrentTable = dt
        Catch ex As Exception

        End Try
    End Sub

    Private Sub exchange_offer_Click(sender As Object, e As EventArgs) Handles exchange_offer.Click
        Try
            Dim dt As New DataTable
            sql = ("SET DATEFORMAT dmy SELECT distinct 0 as SrNo, DMS_Inv as Invoice_Number, convert(varchar,inv_date,103) as Invoice_Date,  Ledg_Name as Ledger_Name, convert(varchar,delv_Date,103) as Veh_Delv_Date, Cust_Id as Customer_ID, Veh_Cost as Vehicle_Price,Exch_DISC as Exchange_Discount, Upper((SElect top 1 model from NewCar_Sale_Register)) as Models,ICM_Mst.CHAS_No as Chassis_Number ,  (SElect top 1 EMPCODE+'-'+EmpFirstName+' '+IsNull(EmpLastName,'') from EmployeeMaster where  SrNo=ERP_DSE) as DSE_Name,Net_Bal as Net_balance FROM ICM_MSt, icm_dtl where  ICM_MSt.tran_Id=ICM_DTL.Tran_Id and  ISNull(Veh_Del,0)=1 and icm_mst.Export_Type<3 and  icm_mst.tran_type=51 and  exch_disc>0 and Loc_Code=" & Val(DbPath.CompCode) & "  and  cast(delv_DATE as Date) between  cast('" & DateFrom.Text & "' as date) and  cast('" & DateUpto.Text & "' as date) ")
            dt = con.ReturnDtTable(sql)
            For i As Integer = 0 To dt.Rows.Count - 1
                dt.Rows(i)("SrNo") = i + 1
            Next
            GrdView.DataSource = dt
            GrdView.DataBind()
            CurrentTable = dt
        Catch ex As Exception

        End Try
    End Sub


    Private Sub FillSummary()
        Try
            Dim RtlCount As Integer = Val(con.ExecuteScaler("SET DATEFORMAT dmy select Count(distinct Tran_Id)  from ICM_MST where  ICM_MST.Export_Type<3 and  ICM_MST.tran_type=51 and ICM_MST.Loc_Code=" & Val(DbPath.CompCode) & "  and cast(INV_DATE as Date) between '" & DateFrom.Text & "' and '" & DateUpto.Text & "'  ").ToString)
            'Dim DelCount As Integer = Val(con.ExecuteScaler("select Count(distinct Tran_Id)  from ICM_MST where ISNull(Veh_Del,0)=1 and ICM_MST.Export_Type<3 and  ICM_MST.tran_type=51 and ICM_MST.Loc_Code=" & Val(DbPath.CompCode) & "  and DELV_DATE between '" & DateFrom.Text & "' and '" & DateUpto.Text & "'  ) & " ").ToString)
            Dim DelCount As Integer = Val(con.ExecuteScaler("SET DATEFORMAT dmy select Count(Tran_Id)  from ICM_MST where ISNull(Veh_Del,0)=1 and ICM_MST.Export_Type<3 and  ICM_MST.tran_type=51 and ICM_MST.Loc_Code=" & Val(DbPath.CompCode) & "  and cast(INV_DATE as Date) between  '" & DateFrom.Text & "' and '" & DateUpto.Text & "'   ").ToString)
            Dim VBNDCount As Integer = Val(con.ExecuteScaler("SET DATEFORMAT dmy select Count(distinct Tran_Id)  from ICM_MST where ISNull(Veh_Del,0)=0 and ICM_MST.Export_Type<3 and  ICM_MST.tran_type=51 and ICM_MST.Loc_Code=" & Val(DbPath.CompCode) & "  and INV_DATE between '" & DateFrom.Text & "' and '" & DateUpto.Text & "' ").ToString)
            Dim RipsCount As Integer = Val(con.ExecuteScaler("Set DATEFORMAT dmy Select count(distinct ICM_MST.TRAN_ID) from ICM_MST, ICM_DTL where	ICM_MSt.tran_Id=ICM_DTL.Tran_Id And  ISNull(Veh_Del, 0) = 1 And icm_mst.Export_Type < 3 And icm_mst.tran_type = 51 And cons_disc > 0 And Loc_Code = " & Val(DbPath.CompCode) & " And cast(delv_DATE As Date) between  '" & DateFrom.Text & "' and '" & DateUpto.Text & "'    ").ToString)
            Dim corporate As Integer = Val(con.ExecuteScaler("Set DATEFORMAT dmy Select count(distinct ICM_MST.TRAN_ID) from ICM_MST, ICM_DTL where	ICM_MSt.tran_Id=ICM_DTL.Tran_Id And  ISNull(Veh_Del,0)=1 And icm_mst.Export_Type<3 And  icm_mst.tran_type=51 And  corp_disc>0 And Loc_Code=" & Val(DbPath.CompCode) & "  And cast(delv_DATE As Date) between '" & DateFrom.Text & "' and '" & DateUpto.Text & "'    ").ToString)
            Dim exchange As Integer = Val(con.ExecuteScaler("Set DATEFORMAT dmy Select count(distinct ICM_MST.TRAN_ID) from ICM_MST,ICM_DTL where	ICM_MSt.tran_Id=ICM_DTL.Tran_Id And  ISNull(Veh_Del,0)=1 And icm_mst.Export_Type<3 And  icm_mst.tran_type=51 And  exch_disc>0 And Loc_Code=" & Val(DbPath.CompCode) & "  And cast(delv_DATE As Date) between   '" & DateFrom.Text & "' and '" & DateUpto.Text & "'    ").ToString)
            'Dim corporate As Integer = Val(con.ExecuteScaler("Select count(Tran_id)  from ICM_MST where	ISNull(Veh_Del,0)=1 And Export_Type<3 And tran_type=51 And tran_id In((Select tran_id from icm_dtl where corp_disc>0)) And Loc_Code=" & Val(DbPath.CompCode) & "  And INV_DATE between '" & DateFrom.Text & "' and '" & DateUpto.Text & "'  ) & " ").ToString)
            'Dim exchange As Integer = Val(con.ExecuteScaler("Select count(tran_id) from ICM_MST where	ISNull(Veh_Del,0)=1 and Export_Type<3 and tran_type=51 and tran_id in ((select tran_id from icm_dtl where exch_disc>0)) and Loc_Code=" & Val(DbPath.CompCode) & "  and INV_DATE between '" & DateFrom.Text & "' and '" & DateUpto.Text & "'  ) & " ").ToString)
            retail.Text = "RETAIL : " + RtlCount.ToString
            deliveryBtn.Text = "Delivered : " + DelCount.ToString
            vb_nd.Text = "VBND : " + VBNDCount.ToString
            rips_support.Text = "RIPS : " + RipsCount.ToString()
            corporate_1.Text = "Corporate :" + corporate.ToString
            exchange_offer.Text = "Exchange :" + exchange.ToString
        Catch ex As Exception

        End Try
    End Sub

    Private Sub SetDateRefresh()
        Try
            FillSummary()
            GrdView.DataSource = Nothing
        Catch ex As Exception

        End Try
    End Sub

    'Private Sub getDate_Click(sender As Object, e As EventArgs) Handles getDate.Click
    '    fromDate.Text = Now.ToString("dd/MM/yyyy")
    '    toDate.Text = Now.ToString("dd/MM/yyyy")
    'End Sub
    'Private Sub getweek_Click(sender As Object, e As EventArgs) Handles getWeek.Click
    '    fromDate.Text = CDate(Now.ToString("dd/MM/yyyy")).AddDays(-7)
    '    toDate.Text = Now.ToString("dd/MM/yyyy")
    'End Sub
    'Private Sub getMonth_Click(sender As Object, e As EventArgs) Handles getMonth.Click
    '    fromDate.Text = "01/" + Now.ToString("MM/yyyy")
    '    toDate.Text = Now.ToString("dd/MM/yyyy")
    'End Sub
    Private Sub DateRefresh_Click(sender As Object, e As EventArgs) Handles Date_Refresh.Click
        Try
            If DateFrom.Text.Trim = "" Then
                DateFrom.Text = DbPath.DateFrom
                DateUpto.Text = DbPath.DateUpto
            Else
                DbPath.DateFrom = DateFrom.Text
                DbPath.DateUpto = DateUpto.Text
            End If
            FillSummary()
        Catch ex As Exception

        End Try
    End Sub

    Private Property CurrentTable As DataTable
        Get
            Return TryCast(ViewState("CurrentTable"), DataTable)
        End Get
        Set(value As DataTable)
            ViewState("CurrentTable") = value
        End Set
    End Property

    Private Sub ValidateDate(sender As Object, e As ServerValidateEventArgs)
        'Dim fromdate As Date = System.DateTime.Now
        'Dim todate As New CultureInfo("en-US")
        Try
            'Dim strDate As String = Convert.ToString(fromdate)
            'fromdate = DateTime.ParseExact(strDate, "dd/MM/yyyy", todate)
            ''Dim detTime As DateTime
            e.IsValid = DateTime.ParseExact(e.Value, "dd/MM/yyyy", Nothing).ToString("dd/MM/yyyy") '   New CultureInfo("en-GB"), DateTimeStyles.None, detTime)
        Catch ex As Exception

        End Try
    End Sub

    Private Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Try
            If Not IsPostBack Then
                If Session("user_name") = "" Then
                    Response.Redirect("../../../Default.aspx")
                End If
                'user_name.Text = Convert.ToString(Session("user_name"))
                'Branch.Text = Convert.ToString(Session("Branch"))
                DateFrom.Text = "01/" & Format(Val(Now.ToString("MM")), "#00") & "/" + Now.ToString("yyyy")
                DateUpto.Text = Now.ToString("dd") + "/" + Now.ToString("MM") + "/" + Now.ToString("yyyy")
                FillSummary()
            End If
        Catch ex As Exception

        End Try

    End Sub

    Protected Sub GrdView_PageIndexChanging(ByVal sender As Object, ByVal e As GridViewPageEventArgs) Handles GrdView.PageIndexChanging
        GrdView.PageIndex = e.NewPageIndex
        ' Call the method to bind data to the GridView
        GrdView.DataSource = CurrentTable
        GrdView.DataBind()
    End Sub

End Class