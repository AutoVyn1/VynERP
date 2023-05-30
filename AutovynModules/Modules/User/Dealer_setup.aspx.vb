Public Class Dealer_setup
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

	End Sub

	Private Sub MesgBox(ByVal sMessage As String)

		ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: '" + sMessage + "', icon: 'success', showConfirmButton: true})", True)
	End Sub

	Private Sub MesgBox1(ByVal sMessage As String)

		ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: '" + sMessage + "', icon: 'error', showConfirmButton: true})", True)
	End Sub

	Private Sub execute_Click(sender As Object, e As EventArgs) Handles execute.Click
		LoginPage.clientid = dealer_id.Text
		HttpContext.Current.Session("client_id") = dealer_id.Text
		Dim con As New Connection
		Try
			Dim validator As DataTable
			validator = con.ReturnDtTable("Select * from user_cloud")
			If validator Is Nothing Then
				sqlqry()
				ClientScript.RegisterStartupScript(Me.GetType(), "success", "Swal.fire({title: 'Setup Created Successfully', text: '', icon: 'success', showConfirmButton: true}).then(function() { window.location.href='../../Credintial/LoginPage.aspx'; });", True)

			Else
				MesgBox1("Setup already created")
			End If
		Catch ex As Exception
			MesgBox1("Process can't be completed ")
		End Try
	End Sub

	Private Sub drop_Click(sender As Object, e As EventArgs) Handles drop.Click
		LoginPage.clientid = dealer_id.Text
		HttpContext.Current.Session("client_id") = dealer_id.Text
		Dim con As New Connection
		Try
			Dim validator As DataTable
			validator = con.ReturnDtTable("Select * from user_cloud")
			If validator Is Nothing Then
				MesgBox1("Setup not available")
			Else

				Dim valid1 As String
				valid1 = con.ExecuteScaler("select user_name from user_cloud where user_name='" + Session("user_name") + "'")
				If valid1 = "manoj" Then
					sqlqry2()
					ClientScript.RegisterStartupScript(Me.GetType(), "success", "Swal.fire({title: 'Setup Dropped Successfully', text: '', icon: 'success', showConfirmButton: true}).then(function() { window.location.href='../../Credintial/LoginPage.aspx'; });", True)
				Else
					ClientScript.RegisterStartupScript(Me.GetType(), "success", "Swal.fire({title: 'You have no rights to drop the setup', text: '', icon: 'error', showConfirmButton: true}).then(function() { window.location.href='../../Credintial/LoginPage.aspx'; });", True)
				End If

			End If
        Catch ex As Exception
			MesgBox1("Process can't be completed ")
		End Try
	End Sub

	'for creating all colud tables
	Private Sub sqlqry()
		Dim con As New Connection
		Dim qry, qry1, qry2, qry3, qry4, qry5, qry6, qry7, qry8, qry9, qry10 As String

		'For sample table
		qry1 = "CREATE TABLE cloud_setup_vyn
		(
				[Id] INT NOT NULL PRIMARY KEY, -- Primary Key column
				[database_name] NVARCHAR(50) NOT NULL,
				[Entry_by] NVARCHAR(50) NOT NULL,
				[date_time] NVARCHAR(50) NOT NULL,
				[EXPORT_TYPE] int NOT NULL)"

		'for user cloud table
		qry2 = "CREATE TABLE user_cloud(
				[id] [int] IDENTITY(1,1) NOT NULL,
				[user_code] [nvarchar](100) NULL,
				[user_name] [nvarchar](100) NULL,
				[user_pass] [nvarchar](50) NULL,
				[user_mobile] [nvarchar](20) NULL,
				[user_email] [nvarchar](50) NULL,
				[pan_no] [nvarchar](100) NULL,
				[dealer] [nvarchar](10) NULL,
				[isactive] [nvarchar](10) NULL,
				[EXPORT_TYPE] [nvarchar](10) NULL,
				[MODIFIED_DATE] [nvarchar](50) NULL,
				[MODIFIED_USER] [nvarchar](10) NULL,
				[MULTI_LOC] [nvarchar](100) NULL)"

		'for user rights cloud table
		qry3 = "CREATE TABLE rights_cloud(
				[user_code] [nvarchar](100) NULL,
				[menu_option] [nvarchar](50) NULL,
				[EXPORT_TYPE] [nvarchar](50) NULL)"

		'for insurance module table
		qry4 = "CREATE TABLE insu_track(
				[Cust_Name] [nvarchar](100) NULL,
				[Cust_Address] [nvarchar](200) NULL,
				[Mobile_Number] [nvarchar](50) NULL,
				[Email] [nvarchar](50) NULL,
				[Vehicle_No] [nvarchar](50) NULL,
				[Insurance_Amt] [nvarchar](20) NULL,
				[Remark] [nvarchar](200) NULL,
				[Payment_Mode] [nchar](10) NULL,
				[Date] [varchar](50) NULL,
				[DSE_name] [varchar](50) NULL,
				[Recd_amt] [varchar](50) NULL,
				[link_status] [int] NULL,
				[location] [varchar](50) NULL,
				[tran_id] [int] IDENTITY(1,1) NOT NULL)"

		'for whatsapp link genration module table
		qry5 = "CREATE TABLE WA_LINK(
				[Link_ID] [int] IDENTITY(1,1) NOT NULL,
				[Link_Add] [nvarchar](150) NULL,
				[Exp_date] [date] NULL,
				[tran_type] [varchar](20) NULL,
			PRIMARY KEY CLUSTERED 
			(
				[Link_ID] ASC
			)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]) "

		'for common discount module table
		qry6 = "CREATE TABLE DISC_WEB(
				[ID] [int] IDENTITY(1,1) NOT NULL,
				[CUST_NAME] [varchar](100) NULL,
				[CUST_MOB] [varchar](100) NULL,
				[VEH_REG] [varchar](100) NULL,
				[PAN_NO] [varchar](100) NULL,
				[DISC_TYPE] [varchar](100) NULL,
				[DISC_AMT] [varchar](100) NULL,
				[REQ_BY] [varchar](100) NULL,
				[REQ_NO] [varchar](100) NULL,
				[APRVL_BY] [varchar](100) NULL,
				[APRVL_NO] [varchar](100) NULL,
				[CURR_DATE] [varchar](100) NULL,
				[REMARK] [ntext] NULL,
				[APRVL_AMT] [varchar](50) NULL,
				[APRVL_STATUS] [varchar](20) NULL,
				[APRVL_REMARK] [ntext] NULL,
				[link_status] [varchar](50) NULL) "

		'for sales discount module table
		qry7 = "CREATE TABLE dise_aprvl(
				[Mob] [varchar](10) NOT NULL,
				[Pan_No] [varchar](20) NOT NULL,
				[Cust_Name] [varchar](20) NOT NULL,
				[Modl_Var] [varchar](20) NOT NULL,
				[Veh_Clr] [varchar](20) NOT NULL,
				[Delv_Date] [date] NULL,
				[Loan] [varchar](20) NOT NULL,
				[MGA_Amt] [money] NULL,
				[Insurance] [varchar](10) NOT NULL,
				[RTO_Chrg] [varchar](20) NOT NULL,
				[EW_CCP] [varchar](20) NOT NULL,
				[Loyalty_Card] [varchar](20) NOT NULL,
				[Car_Exch] [varchar](20) NOT NULL,
				[FastTeg] [varchar](20) NOT NULL,
				[SRM] [varchar](20) NOT NULL,
				[RM] [varchar](20) NOT NULL,
				[Consumer] [money] NULL,
				[Corporate] [money] NULL,
				[Exch] [money] NULL,
				[Aprvl_Offer] [money] NULL,
				[Dise_Amt] [money] NULL,
				[Aprvl_By] [varchar](20) NULL,
				[Status] [varchar](10) NULL,
				[Remark] [varchar](100) NULL,
				[Curr_Date] [date] NULL,
				[location] [varchar](50) NULL,
				[Approved_amt] [money] NULL) "

		'for true value module table
		qry8 = "CREATE TABLE TVIcm_mst(
				[DMS_Inv] [varchar](50) NULL,
				[Cust_Id] [nvarchar](10) NULL,
				[Purc_Cost] [varchar](50) NULL,
				[Tax_Val] [varchar](50) NULL,
				[Gst] [varchar](50) NULL,
				[Purc_Date] [date] NULL,
				[MGA_Exp] [varchar](50) NULL,
				[BodyShop_Exp] [varchar](50) NULL,
				[Outside_Exp] [varchar](50) NULL,
				[Cert_Exp] [varchar](50) NULL,
				[Refurb_Exp] [varchar](50) NULL,
				[Exch_Exp] [varchar](50) NULL,
				[Oth_Exp] [varchar](50) NULL,
				[Total_cost] [varchar](50) NULL,
				[Intr_Rate] [varchar](50) NULL,
				[Amt] [varchar](50) NULL,
				[Sl_Inv] [varchar](50) NULL,
				[SlTax_Val] [varchar](50) NULL,
				[Sl_Gst] [varchar](50) NULL,
				[Sl_Date] [date] NULL,
				[Rto_Chrg] [varchar](50) NULL,
				[Insu_Amt] [varchar](50) NULL,
				[Ext_Amt] [varchar](50) NULL,
				[Sl_MGA] [varchar](50) NULL,
				[Oth_Chrg] [varchar](50) NULL,
				[SlTotal_Cost] [varchar](50) NULL,
				[Discount] [varchar](50) NULL,
				[Sale] [varchar](50) NULL) "

		'for new car fuel management module
		qry9 = "CREATE TABLE fuel_predict(
				[id] [int] IDENTITY(1,1) NOT NULL,
				[seq] [int] NULL,
				[branch_name] [nvarchar](100) NULL,
				[gatepass_no] [nvarchar](100) NULL,
				[del_date] [nvarchar](100) NULL,
				[cust_name] [nvarchar](100) NULL,
				[fuel_type] [nvarchar](100) NULL,
				[phone] [nvarchar](100) NULL,
				[dse_name] [nvarchar](100) NULL,
				[dms_inv_no] [nvarchar](100) NULL,
				[form_date] [nvarchar](100) NULL,
				[gatepass_date] [nvarchar](100) NULL,
				[model_name] [nvarchar](100) NULL,
				[qty] [varchar](50) NULL,
				[slip_to] [nvarchar](100) NULL,
				[remark] [ntext] NULL,
				[print_date] [varchar](50) NULL,
				[user_name] [varchar](50) NULL,
				[chas_no] [varchar](50) NULL,
				[Engine_no] [varchar](50) NULL,
				[Tran_type] [int] NULL,
				[enq_no] [varchar](50) NULL,
				[loc_from] [varchar](50) NULL,
				[loc_to] [varchar](50) NULL,
				[Driv_name] [varchar](50) NULL,
				[reg_no] [varchar](50) NULL,
				[enq_cust_name] [varchar](50) NULL) "

		'for graph data
		qry10 = "CREATE TABLE Cloud_ledg(
				[Ledg_code] [int] NULL,
				[Ledg_Name] [varchar](100) NULL,
				[Export_type] [int] NULL) "

		'entire table in one statement
		qry = " " + qry1 + " " + qry2 + " " + qry3 + " " + qry4 + "
		" + qry5 + " " + qry6 + " " + qry7 + " " + qry8 + " " + qry9 + " " + qry10 + " "

		'execution of statement
		con.TSql("" + qry + "")

		'For creating sample table in database
		con.TSql("INSERT INTO cloud_setup_vyn ( ID,database_name, Entry_by,date_time,EXPORT_TYPE ) VALUES ('1','demo','manoj swami','30/05/23','1')")

		'For creating the first user in the database as admin
		con.TSql("insert into user_cloud  values ('1','admin','11111','1234567890','admin@autovyn.com','XXXXX1111X','OMPL','Y','1','01/01/2023','ADMIN','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30') insert into rights_cloud  values('1','8','1')")

	End Sub

	'for deleting all colud tables
	Private Sub sqlqry2()
		Dim qry As String
		Dim con As New Connection

		qry = "drop table cloud_setup_vyn
				drop table user_cloud
				drop table rights_cloud
				drop table insu_track
				drop table WA_LINK
				drop table DISC_WEB
				drop table dise_aprvl
				drop table TVIcm_mst
				drop table fuel_predict
				drop table Cloud_ledg"

			'execution of statement
			con.TSql("" + qry + "")

		ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Swal.fire({title: 'You have no Rights to do this action', text: '', icon: 'warning', showConfirmButton: true}).then(function() { window.location.href='" + Request.Url.AbsoluteUri + "'; });", True)


	End Sub


End Class