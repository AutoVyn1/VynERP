Imports System.IO
Public Class Pending_List
    Inherits System.Web.UI.Page
    Private con As New Connection
        Private dt As DataTable
        Private tran As String
        Dim rcpt_Dt As DataTable

        Public Sub MesgBox(ByVal sMessage As String)
            Dim sb As New System.Text.StringBuilder
            ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('" & sMessage & "')", True)
        End Sub

        Private Sub Go_Branch_click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Go_Branch.Click
            Try
                Response.Redirect("../Credintial/BranchPage.aspx")
            Catch ex As Exception

            End Try
        End Sub

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            Try
                If Not IsPostBack Then
                    If Session("user_name") = "" Then
                        Response.Redirect("../../Default.aspx")
                    End If
                    Session("tran_id") = Val(con.ExecuteScaler("SELECT MAX(tran_id) FROM icm_mst").ToString)
                    Session("MaxTran_ID") = Val(con.ExecuteScaler("SELECT MAX(tran_id) FROM icm_mst").ToString) + 1
                    'MaxTran_ID = Session("tran")
                    Dim hsnCode As String = Session("hsn_code")
                    inv.Text = hsnCode & "/VSL/"
                    Update_data.Enabled = False
                    Print_data.Enabled = False
                    Loan_List()
                    Dse_TL_List()
                End If
            Catch ex As Exception

            End Try
        End Sub

        Protected Sub Exit_Form_Click(sender As Object, e As EventArgs) Handles Exit_Form.Click
            Try
                Response.Redirect("../DefaultPage/DefaultPage.aspx")
            Catch ex As Exception

            End Try
        End Sub

        Protected Sub Reset_Data_Click(sender As Object, e As EventArgs) Handles Reset_Data.Click
            Try
                Response.Redirect(Request.Url.AbsoluteUri)
            Catch ex As Exception

            End Try
        End Sub

        Protected Sub DtView_Click(sender As Object, e As EventArgs) Handles DtView.Click
            Try
                If Session("Branch") = "Multi Branch" Then
                    MesgBox("Pls Select Another Branch You are in Multi Branch Click Branch Icon In Side Panel")
                Else
                    Dim inv_Dt As DataTable
                    inv_Dt = con.ReturnDtTable("select 
    icm_id,Customer_id,Customer_Name,convert(varchar,Inv_dt,3) as Inv_dt,add1,Mobile2,E_mail_Id,PAN_No,vin,CUST_GST_NUMBER,
    chassis,engine,city,pincode,team_lead,dse,model as Veh_Grp,place_of_supply,Variant_cd,
    (select godw_name from Godown_Mst where godw_code=loc_code) as Location,Loc_Code,
    (select  top 1 misc_name from misc_mst where Misc_Abbr=Clr_cd and misc_type=10) as Veh_Clr,Clr_cd
    from NEWCAR_Sale_Register where Inv_No='" & inv.Text & "" & dmsinvoice.Text & "'")
                    If inv_Dt.Rows.Count > 0 Then
                        LoadData()
                        Document_Grid()
                        Receipt_Grid()
                        Dim dt1 As DataTable
                        Dim dt2 As DataTable
                        Dim cust_Id As String = inv_Dt.Rows(0)("Customer_id").ToString
                        Dim ledg_qry As String = "select * from acnt_post where ledg_ac=(select top 1 ledg_code from ledg_mst where ledg_add6='" & cust_Id & "' and export_type<4 and group_code=53)"
                        dt1 = con.ReturnDtTable(ledg_qry)
                        If dt1.Rows.Count = 0 Then

                        Else
                            Dim ledg_code As String = dt1.Rows(0)("ledg_ac").ToString
                            Dim ledg_Bal As String = "select sum(iif(amt_drcr=1,post_amt,post_amt*-1)) as Post_amt from ACNT_POST where ledg_ac='" & ledg_code & "' and Export_Type<5"
                            dt2 = con.ReturnDtTable(ledg_Bal)
                            If dt2.Rows.Count = 0 Then

                            Else
                                Balance.Text = "Ledger Balance :" & decimalValue(dt2.Rows(0)("post_amt").ToString)
                            End If
                        End If
                    Else
                        MesgBox("Invalid Invoice Number")
                    End If
                End If
            Catch ex As Exception

            End Try
        End Sub

        Private Sub Pending_List()
            Try
                Dim dt As DataTable
                dt = con.ReturnDtTable("select loc_Code,
    icm_id,Customer_id,Customer_Name,Inv_dt,add1,Mobile2,E_mail_Id,PAN_No,vin,CUST_GST_NUMBER,
    chassis,engine,pincode,team_lead,dse,Variant_cd,place_of_supply,
	(select top 1 misc_code from misc_mst where misc_type=3) as Stat_Code,
	(select top 1 misc_code from misc_mst where misc_type=1) as Teh_code,city,
    (select godw_name from Godown_Mst where godw_code=loc_code) as Location,Loc_Code,
    (select  top 1 misc_name from misc_mst where Misc_Abbr=Clr_cd and misc_type=10) as Veh_Clr,
	(select  top 1 Misc_Code from misc_mst where Misc_Abbr=Clr_cd and misc_type=10) as Color_Code,
	(select top 1 misc_code from misc_mst where Misc_Type=14 and misc_name=Model) as Veh_grp,Model
    from NEWCAR_Sale_Register where Inv_No='" & inv.Text & "" & dmsinvoice.Text & "'")
                Dim city As String = dt.Rows(0)("Teh_code").ToString
                Dim stat As String = dt.Rows(0)("Stat_Code").ToString
                Dim clr As String = dt.Rows(0)("Color_Code").ToString
                Dim veh_grp As String = dt.Rows(0)("Veh_grp").ToString
                Dim dse As String = Erp_Dse.SelectedValue
                Dim tl As String = Erp_TL.SelectedValue
                Dim pymt As String = Loan_type.SelectedValue
                Dim STR As String = "Tran_id,Tran_type,inv_date,Dms_inv,ledg_name,email_id,cust_id,ledg_add2,teh_code,chas_no,pin_code,gst_no,veh_clr,dms_dse,dms_tl,Pymt_Mode,VIN,Modl_Grp,stat_code,Ph1,loc_code"
                Dim Qry As String = "insert into icm_mst (" & STR & ") values('" & Session("MaxTran_ID") & "','51'," & SqlDate(Inv_date.Text) & ",'" & dmsinvoice.Text & "','" & Cust_name.Text & "','" & Email.Text & "',
            '" & custid.Text & "','" & Add.Text & "','" & city & "','" & Chas_no.Text & "','" & Pin_Code.Text & "','" & Gst_no.Text & "',
            '" & clr & "','" & dse & "','" & tl & "','" & pymt & "','" & Vin.Text & "','" & veh_grp & "','" & stat & "','" & Mob_no.Text & "','" & Session("BranchCode") & "')"
                con.TSql(Qry)

                'ICM DTL
                Dim str2 As String = "tran_id,tran_type,MRP_Price,MI_Date,PPC_Chrgs,FasTag,Ins_Pric,MGA_Pric, EW_Pric,RTO_Pric,Cons_Disc,Exch_Disc,Corp_Disc,Oth_chrgs,Adnl_Disc"
                Dim Qry2 As String = "insert into icm_dtl (" & str2 & ") values ('" & Session("MaxTran_ID") & "','51','" & Ex_Pric.Text & "'," & SqlDate(Mi_Date.Text) & ",'" & CCp_Chrg.Text & "',
            '" & FastTag_Chrg.Text & "','" & Insu_amt.Text & "','" & Mga_Amt.Text & "','" & Ew_Amt.Text & "','" & Rto_Chrg.Text & "','" & Cons_Disc.Text & "',
            '" & Exch_Disc.Text & "','" & Corp_Disc.Text & "','" & CCp_Chrg.Text & "','" & Oth_Chrg.Text & "','" & Post_Disc.Text & "')"
                con.TSql(Qry2)

                'ICM RCPT
                'Dim str3 As String = "tran_id, tran_type, BILL_REF, ACNT_DATE, POST_AMT, CHQ_NO"
                'Dim Qry3 As String = "insert into icm_rcpt (" & str3 & ") values ('" & MaxTran_ID & "','51','" & rcpt_Dt.Rows(0)("Rect_No") & "','" & rcpt_Dt.Rows(1)("ACNT_DATE") & "',
                ''" & rcpt_Dt.Rows(2)("POST_AMT") & "','" & rcpt_Dt.Rows(3)("CHQ_NO") & "')"
            Catch ex As Exception

            End Try
        End Sub

        Private Sub LoadData()
            Try
                dt = con.ReturnDtTable("select
    icm_id,Customer_id,Customer_Name,convert(varchar,Inv_dt,3) as Inv_dt,add1,Mobile2,E_mail_Id,PAN_No,vin,CUST_GST_NUMBER,
    chassis,engine,city,pincode,team_lead,dse,model as Veh_Grp,place_of_supply,Variant_cd,
    (select godw_name from Godown_Mst where godw_code=loc_code) as Location,Loc_Code,
    (select  top 1 misc_name from misc_mst where Misc_Abbr=Clr_cd and misc_type=10) as Veh_Clr,Clr_cd
    from NEWCAR_Sale_Register where Inv_No='" & inv.Text & "" & dmsinvoice.Text & "'")

                Dim TranID_DT As DataTable
                TranID_DT = con.ReturnDtTable("select delv_date from icm_mst where tran_id='" & Session("tran_id") & "'")

                Dim icmID_DT As DataTable
                icmID_DT = con.ReturnDtTable("select icm_id from NEWCAR_Sale_Register where inv_no='" & inv.Text & "" & dmsinvoice.Text & "'")
                Dim ICM_ID As String = icmID_DT.Rows(0)("icm_id").ToString
                Dim delv_Date As String = TranID_DT.Rows(0)("delv_date").ToString


                If ICM_ID = "" Then
                    Save_data.Enabled = True
                    Erp_Dse.Enabled = True
                    Erp_TL.Enabled = True
                    Inv_no.Text = dmsinvoice.Text
                    veh_sts.Text = "Vehicle Not Delivered"
                    Loan_type.Enabled = True
                    Cust_type.Enabled = True
                    Pan_No.Enabled = True
                    Gst_no.Enabled = True
                    Email.Enabled = True
                    Insu_type.Enabled = True
                    CCp_Chrg.Enabled = True
                    Mga_Amt.Enabled = True
                    Mga.Enabled = True
                    EW_type.Enabled = True
                    Nexa_Card.Enabled = True
                    Rto_Type.Enabled = True
                    Pan_upload.Enabled = True
                    Aadh_upload.Enabled = True
                    Corp_1.Enabled = True
                    Corp_2.Enabled = True
                    Fin_upload.Enabled = True
                    save_Doc.Enabled = True
                    Sal_upload.Enabled = True
                    Exch_1.Enabled = True
                    Exch_2.Enabled = True
                    Doc_Grid.Enabled = True
                Else
                    Save_data.Enabled = False
                    veh_sts.Text = "Vehicle Is Pending"
                    Open_only.Text = "Invoice : Open Only for Accounts"
                    Erp_Dse.Enabled = False
                    Erp_TL.Enabled = False
                    Loan_type.Enabled = False
                    Cust_type.Enabled = False
                    Pan_No.Enabled = False
                    Gst_no.Enabled = False
                    Email.Enabled = False
                    Insu_type.Enabled = False
                    CCp_Chrg.Enabled = False
                    Mga_Amt.Enabled = False
                    Mga.Enabled = False
                    EW_type.Enabled = False
                    Nexa_Card.Enabled = False
                    Rto_Type.Enabled = False
                    Pan_upload.Enabled = False
                    Aadh_upload.Enabled = False
                    Corp_1.Enabled = False
                    Corp_2.Enabled = False
                    Fin_upload.Enabled = False
                    save_Doc.Enabled = False
                    Sal_upload.Enabled = False
                    Exch_1.Enabled = False
                    Exch_2.Enabled = False
                    Doc_Grid.Enabled = False
                End If

                If delv_Date = "" Then
                    Inv_no.Text = dmsinvoice.Text
                Else
                    Erp_Dse.Enabled = False
                    Erp_TL.Enabled = False
                    Loan_type.Enabled = False
                    Cust_type.Enabled = False
                    Pan_No.Enabled = False
                    Gst_no.Enabled = False
                    Email.Enabled = False
                    Insu_type.Enabled = False
                    CCp_Chrg.Enabled = False
                    Mga_Amt.Enabled = False
                    Mga.Enabled = False
                    EW_type.Enabled = False
                    Nexa_Card.Enabled = False
                    Rto_Type.Enabled = False
                    Pan_upload.Enabled = False
                    Aadh_upload.Enabled = False
                    Corp_1.Enabled = False
                    Corp_2.Enabled = False
                    Fin_upload.Enabled = False
                    save_Doc.Enabled = False
                    Sal_upload.Enabled = False
                    Exch_1.Enabled = False
                    Exch_2.Enabled = False
                    Doc_Grid.Enabled = False
                    Inv_no.Text = dmsinvoice.Text
                    veh_sts.Text = "Vehicle Delivered"
                End If

                If dmsinvoice.Text = "" Then
                    MesgBox("Please Enter Invoice Number")
                ElseIf dt.Rows.Count > 0 Then
                    custid.Text = dt.Rows(0)("Customer_id").ToString
                    Email.Text = dt.Rows(0)("E_mail_Id").ToString
                    Inv_date.Text = dt.Rows(0)("Inv_dt").ToString
                    Cust_name.Text = dt.Rows(0)("Customer_Name").ToString
                    Add.Text = dt.Rows(0)("add1").ToString
                    City.Text = dt.Rows(0)("city").ToString
                    State.Text = dt.Rows(0)("place_of_supply").ToString
                    Mob_no.Text = dt.Rows(0)("Mobile2").ToString
                    Pin_Code.Text = dt.Rows(0)("pincode").ToString
                    Pan_No.Text = dt.Rows(0)("PAN_No").ToString
                    Gst_no.Text = dt.Rows(0)("CUST_GST_NUMBER").ToString
                    Chas_no.Text = dt.Rows(0)("chassis").ToString
                    Color.Text = dt.Rows(0)("Veh_Clr").ToString
                    Veh_Grp.Text = dt.Rows(0)("Veh_Grp").ToString
                    Veh_Code.Text = dt.Rows(0)("Variant_cd").ToString
                    Dms_Dse.Text = dt.Rows(0)("DSE").ToString
                    Dse_TL.Text = dt.Rows(0)("team_lead").ToString
                    Engn_no.Text = dt.Rows(0)("engine").ToString
                    Vin.Text = dt.Rows(0)("vin").ToString

                    Ex_Price()
                    Dim dt2 As DataTable
                    dt2 = con.ReturnDtTable("select pan_no,Gst_No,Email_Id,file_no,pymt_mode,ERP_DSE,ERP_TL from ICM_MST
            where dms_inv='" & dmsinvoice.Text & "'
            ")
                    If dt2.Rows.Count > 0 Then
                        fileno.Text = dt2.Rows(0)("file_no").ToString
                        Pan_No.Text = dt2.Rows(0)("pan_no").ToString
                        Gst_no.Text = dt2.Rows(0)("Gst_No").ToString
                        Email.Text = dt2.Rows(0)("Email_Id").ToString
                        Loan_type.Text = dt2.Rows(0)("pymt_mode").ToString
                        Erp_Dse.Text = dt2.Rows(0)("ERP_DSE").ToString
                        Erp_TL.Text = dt2.Rows(0)("ERP_TL").ToString
                    Else
                        fileno.Text = ""
                        Pan_No.Text = ""
                        Gst_no.Text = ""
                        Email.Text = ""
                        Loan_type.Text = ""
                        Erp_Dse.Text = ""
                        Erp_TL.Text = ""
                    End If
                End If
            Catch ex As Exception

            End Try
        End Sub

        Private Sub Ex_Price()
            Try
                Dim qry As String = "select Inv_Amt,* from NEWCAR_Sale_Register where Inv_No='" & inv.Text & "" & dmsinvoice.Text & "'"
                dt = con.ReturnDtTable(qry)
                If dt.Rows.Count > 0 Then
                    Ex_Pric.Text = decimalValue(dt.Rows(0)("Inv_Amt").ToString)
                Else
                    Ex_Pric.Text = ""
                End If

                Dim Amt_DT As DataTable
                Amt_DT = con.ReturnDtTable("select MRP_Price,MI_Date,PPC_Chrgs,FasTag,Ins_Pric,MGA_Pric, EW_Pric,RTO_Pric,Cons_Disc,Exch_Disc,Corp_Disc,Oth_chrgs,Adnl_Disc from icm_dtl where tran_id='" & Session("MaxTran_ID") & "'")
                If Amt_DT.Rows.Count > 0 Then
                    'Ex_Pric.Text = decimalValue(Amt_DT.Rows(0)("Inv_Amt").ToString)
                    Mi_Date.Text = Amt_DT.Rows(0)("MI_Date").ToString
                    FastTag_Chrg.Text = decimalValue(Amt_DT.Rows(0)("FasTag").ToString)
                    Insu_amt.Text = decimalValue(Amt_DT.Rows(0)("Ins_Pric").ToString)
                    Mga_Amt.Text = decimalValue(Amt_DT.Rows(0)("MGA_Pric").ToString)
                    Ew_Amt.Text = decimalValue(Amt_DT.Rows(0)("EW_Pric").ToString)
                    Rto_Chrg.Text = decimalValue(Amt_DT.Rows(0)("RTO_Pric").ToString)
                    Cons_Disc.Text = decimalValue(Amt_DT.Rows(0)("Cons_Disc").ToString)
                    Exch_Disc.Text = decimalValue(Amt_DT.Rows(0)("Exch_Disc").ToString)
                    Corp_Disc.Text = decimalValue(Amt_DT.Rows(0)("Corp_Disc").ToString)
                    CCp_Chrg.Text = Amt_DT.Rows(0)("PPC_Chrgs").ToString
                    Oth_Chrg.Text = decimalValue(Amt_DT.Rows(0)("Oth_chrgs").ToString)
                    Post_Disc.Text = decimalValue(Amt_DT.Rows(0)("Adnl_Disc").ToString)
                    'CCp_Chrg.Text = dt.Rows(0)("")
                Else
                    Ex_Pric.Text = ""
                    Mi_Date.Text = ""
                    FastTag_Chrg.Text = ""
                    Insu_amt.Text = ""
                    Mga_Amt.Text = ""
                    Ew_Amt.Text = ""
                    Rto_Chrg.Text = ""
                    Cons_Disc.Text = ""
                    Exch_Disc.Text = ""
                    Corp_Disc.Text = ""
                    CCp_Chrg.Text = ""
                    Oth_Chrg.Text = ""
                    Post_Disc.Text = ""
                End If
            Catch ex As Exception

            End Try
        End Sub

        Private Sub Loan_List()
            Try
                dt = con.ReturnDtTable("select misc_name,misc_code from misc_mst where misc_type=18")
                dt.Rows.Add()
                dt.Rows(dt.Rows.Count - 1)("misc_code") = 0
                dt.Rows(dt.Rows.Count - 1)("misc_name") = ""
                dt = dt.Select("misc_code>=0", "misc_code").CopyToDataTable
                Loan_type.DataSource = dt
                Loan_type.DataTextField = "misc_name"
                Loan_type.DataValueField = "misc_code"
                Loan_type.DataBind()
            Catch ex As Exception

            End Try
        End Sub

        Private Sub Dse_TL_List()
            Try
                dt = con.ReturnDtTable("select empfirstname, srno from employeemaster")
                dt.Rows.Add()
                dt.Rows(dt.Rows.Count - 1)("srno") = 0
                dt.Rows(dt.Rows.Count - 1)("empfirstname") = ""
                dt = dt.Select("srno>=0", "srno").CopyToDataTable
                Erp_Dse.DataSource = dt
                Erp_Dse.DataTextField = "empfirstname"
                Erp_Dse.DataValueField = "srno"
                Erp_Dse.DataBind()

                Dim dt2 As DataTable
                dt2 = dt.Copy()
                dt.Rows.Add()
                dt.Rows(dt.Rows.Count - 1)("srno") = 0
                dt.Rows(dt.Rows.Count - 1)("empfirstname") = ""
                dt = dt.Select("srno>=0", "srno").CopyToDataTable
                Erp_TL.DataSource = dt2
                Erp_TL.DataTextField = "empfirstname"
                Erp_TL.DataValueField = "srno"
                Erp_TL.DataBind()
            Catch ex As Exception

            End Try
        End Sub

        Private Sub Document_Grid()
            Try
                dt = con.ReturnDtTable("select Doc_Type,SRNO,path,File_Name,User_Name,Upload_Date from DOC_UPLOAD where tran_id='" & Session("MaxTran_ID") & "'")
                Doc_Grid.DataSource = dt
                Doc_Grid.DataBind()
            Catch ex As Exception

            End Try
        End Sub

        Private Sub Rect_Grid_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles Rect_Grid.RowDataBound
            If e.Row.RowType = DataControlRowType.Header Then
                For i = 0 To e.Row.Cells.Count - 1
                    Dim cell2 As TableCell = e.Row.Cells(i)
                Next
                Dim cell As TableCell = e.Row.Cells(1)
                e.Row.Cells(0).Text = "Rect No"
                e.Row.Cells(1).Text = "Rect Date"
                e.Row.Cells(2).Text = "Amount"
                e.Row.Cells(3).Text = "Instrument No"
                e.Row.Cells(4).Text = "Remarks"
            End If

            If e.Row.RowType = DataControlRowType.DataRow Then
                For i As Integer = 0 To e.Row.Cells.Count - 1
                    e.Row.Cells(2).HorizontalAlign = HorizontalAlign.Right
                    If i <> 3 Then
                        Dim cell As TableCell = e.Row.Cells(i)
                        Dim value As Double
                        If Double.TryParse(cell.Text, value) Then
                            cell.Text = value.ToString("F2")
                        End If
                    End If
                Next
            End If
        End Sub

        Private Sub Receipt_Grid()
            Try
                rcpt_Dt = con.ReturnDtTable("SELECT BILL_REF as Rect_No,convert(varchar,ACNT_DATE,3) as Rect_Date,POST_AMT as Amount,CHQ_NO as Instrument_No,iif(export_type<3,'Posted',iif(export_type=99,'Unposted',iif(export_type=4,'Reversed',iif(export_type=5,'Cancelled','')))) as Remark FROM ACNT_POST WHERE ACNT_TYPE=1 and Ledg_Ac=(select top 1 ledg_code from ledg_mst where ledg_add6='" & custid.Text & "' and Group_Code=53) and Export_Type<>33")
                For i As Integer = 0 To rcpt_Dt.Rows.Count - 1
                    rcpt_Dt.Rows(i)("Amount") = decimalValue(rcpt_Dt.Rows(i)("Amount").ToString)
                Next
                Rect_Grid.DataSource = rcpt_Dt
                Rect_Grid.DataBind()
            Catch ex As Exception

            End Try
        End Sub


        Protected Sub Save_Doc_Click(sender As Object, e As EventArgs) Handles save_Doc.Click
            Try
                Dim RetVal As Integer
                Dim UserName As String = Session("user_name")
                Dim PanTYPE As String = Path.GetExtension(Pan_upload.FileName)
                Dim AadhTYPE As String = Path.GetExtension(Aadh_upload.FileName)
                Dim Corp_1TYPE As String = Path.GetExtension(Corp_1.FileName)
                Dim Corp_2TYPE As String = Path.GetExtension(Corp_2.FileName)
                Dim FinTYPE As String = Path.GetExtension(Fin_upload.FileName)
                Dim SalTYPE As String = Path.GetExtension(Sal_upload.FileName)
                Dim Exch_1TYPE As String = Path.GetExtension(Exch_1.FileName)
                Dim Exch_2TYPE As String = Path.GetExtension(Exch_2.FileName)

                Dim PanName As String = Path.GetFileName(Pan_upload.FileName)
                Dim AadhName As String = Path.GetFileName(Aadh_upload.FileName)
                Dim Corp_1Name As String = Path.GetFileName(Corp_1.FileName)
                Dim Corp_2Name As String = Path.GetFileName(Corp_2.FileName)
                Dim FinName As String = Path.GetFileName(Fin_upload.FileName)
                Dim SalName As String = Path.GetFileName(Sal_upload.FileName)
                Dim Exch_1Name As String = Path.GetFileName(Exch_1.FileName)
                Dim Exch_2Name As String = Path.GetFileName(Exch_2.FileName)
                Dim folderPath As String = Server.MapPath("~/Documents/")

                If Not Directory.Exists(folderPath) Then
                    Directory.CreateDirectory(folderPath)
                End If
                Dim str As String = "Doc_type, tran_id,SRNO,path, file_name, user_name, upload_date, export_type"
                Dim qry As String = ""
                If Pan_upload.HasFile Then
                    RetVal = 1
                    Dim saveTranID = Session("MaxTran_ID") + "_" & RetVal & PanTYPE
                    Pan_upload.SaveAs(folderPath + saveTranID)
                    qry = "INSERT INTO DOC_UPLOAD (" & str & ") VALUES ('ICM','" & Session("MaxTran_ID") & "','" & RetVal & "','" & PanName & "','" & saveTranID & "','" & UserName & "'," & SqlDate(DateTime.Now.ToString) & ",'1')"
                    con.TSql(qry)
                End If

                If Aadh_upload.HasFile Then
                    RetVal = 2
                    Dim saveTranID = Session("MaxTran_ID") + "_" & RetVal & AadhTYPE
                    Aadh_upload.SaveAs(folderPath + saveTranID)
                    qry = "INSERT INTO DOC_UPLOAD (" & str & ") VALUES ('ICM','" & Session("MaxTran_ID") & "','" & RetVal & "','" & AadhName & "','" & saveTranID & "','" & UserName & "'," & SqlDate(DateTime.Now.ToString) & ",'1')"
                    con.TSql(qry)
                End If

                If Corp_1.HasFile Then
                    RetVal = 3
                    Dim saveTranID = Session("MaxTran_ID") + "_" & RetVal & Corp_1TYPE
                    Pan_upload.SaveAs(folderPath + saveTranID)
                    qry = "INSERT INTO DOC_UPLOAD (" & str & ") VALUES ('ICM','" & Session("MaxTran_ID") & "','" & RetVal & "','" & Corp_1Name & "','" & saveTranID & "','" & UserName & "'," & SqlDate(DateTime.Now.ToString) & ",'1')"
                    con.TSql(qry)
                End If

                If Corp_2.HasFile Then
                    RetVal = 4
                    Dim saveTranID = Session("MaxTran_ID") + "_" & RetVal & Corp_2TYPE
                    Aadh_upload.SaveAs(folderPath + saveTranID)
                    qry = "INSERT INTO DOC_UPLOAD (" & str & ") VALUES ('ICM','" & Session("MaxTran_ID") & "','" & RetVal & "','" & Corp_2Name & "','" & saveTranID & "','" & UserName & "'," & SqlDate(DateTime.Now.ToString) & ",'1')"
                    con.TSql(qry)
                End If

                If Fin_upload.HasFile Then
                    RetVal = 5
                    Dim saveTranID = Session("MaxTran_ID") + "_" & RetVal & FinTYPE
                    Pan_upload.SaveAs(folderPath + saveTranID)
                    qry = "INSERT INTO DOC_UPLOAD (" & str & ") VALUES ('ICM','" & Session("MaxTran_ID") & "','" & RetVal & "','" & FinName & "','" & saveTranID & "','" & UserName & "'," & SqlDate(DateTime.Now.ToString) & ",'1')"
                    con.TSql(qry)
                End If

                If Sal_upload.HasFile Then
                    RetVal = 6
                    Dim saveTranID = Session("MaxTran_ID") + "_" & RetVal & SalTYPE
                    Aadh_upload.SaveAs(folderPath + saveTranID)
                    qry = "INSERT INTO DOC_UPLOAD (" & str & ") VALUES ('ICM','" & Session("MaxTran_ID") & "','" & RetVal & "','" & SalName & "','" & saveTranID & "','" & UserName & "'," & SqlDate(DateTime.Now.ToString) & ",'1')"
                    con.TSql(qry)
                End If

                If Exch_1.HasFile Then
                    RetVal = 7
                    Dim saveTranID = Session("MaxTran_ID") + "_" & RetVal & Exch_1TYPE
                    Pan_upload.SaveAs(folderPath + saveTranID)
                    qry = "INSERT INTO DOC_UPLOAD (" & str & ") VALUES ('ICM','" & Session("MaxTran_ID") & "','" & RetVal & "','" & Exch_1Name & "','" & saveTranID & "','" & UserName & "'," & SqlDate(DateTime.Now.ToString) & ",'1')"
                    con.TSql(qry)
                End If

                If Exch_2.HasFile Then
                    RetVal = 8
                    Dim saveTranID = Session("MaxTran_ID") + "_" & RetVal & Exch_2TYPE
                    Aadh_upload.SaveAs(folderPath + saveTranID)
                    qry = "INSERT INTO DOC_UPLOAD (" & str & ") VALUES ('ICM','" & Session("MaxTran_ID") & "','" & RetVal & "','" & Exch_2Name & "','" & saveTranID & "','" & UserName & "'," & SqlDate(DateTime.Now.ToString) & ",'1')"
                    con.TSql(qry)
                End If
                Document_Grid()
            Catch ex As Exception

            End Try
        End Sub

        Protected Sub Doc_Grid_SelectedIndexChanged(sender As Object, e As EventArgs) Handles Doc_Grid.SelectedIndexChanged
            Try
                Dim srno As String = Doc_Grid.SelectedRow.Cells(3).Text
                Session("image") = Doc_Grid.SelectedRow.Cells(1).Text
                Dim qry As String = "delete from DOC_UPLOAD where srno='" & srno & "' and tran_id='" & Session("MaxTran_ID") & "'"
                con.TSql(qry)
                Document_Grid()
            Catch ex As Exception

            End Try
        End Sub

        Protected Sub save_data_Click(sender As Object, e As EventArgs) Handles Save_data.Click
            Try
                Pending_List()
                Dim pymt As String = Loan_type.SelectedValue
                Dim dse As String = Erp_Dse.SelectedValue
                Dim tl As String = Erp_TL.SelectedValue
                con.TSql("UPDATE icm_mst SET
            Pan_No='" + Pan_No.Text + "',
            Gst_No='" + Gst_no.Text + "',
            Email_Id='" + Email.Text + "',
            file_no='" + fileno.Text + "',
            pymt_mode='" + pymt + "',
            ERP_DSE='" + dse + "',
            ERP_TL='" + tl + "'
            where Dms_inv='" & inv.Text & "" & dmsinvoice.Text & "'")

                con.TSql("update icm_dtl set 
            MGA_Pric='" & Mga_Amt.Text & "',
            ppc_chrgs='" & CCp_Chrg.Text & "',
            Adnl_Disc='" & Post_Disc.Text & "'
            where TRAN_ID='" & Session("MaxTran_ID") & "' ")

                con.TSql("update NEWCAR_Sale_Register set
            icm_id='" & Session("MaxTran_ID") & "',
            loc_code='" & Session("BranchCode") & "'
            where Inv_No='" & inv.Text & "" & dmsinvoice.Text & "'")
                Response.Redirect("../DefaultPage/DefaultPage.aspx")
            Catch ex As Exception

            End Try
        End Sub


        'Protected Sub Rect_Grid_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles Rect_Grid.RowDataBound
        '    Try
        '        Rect_Grid.HorizontalAlign = HorizontalAlign.Right
        '    Catch ex As Exception

        '    End Try
        'End Sub
    End Class