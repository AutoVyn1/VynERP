Imports System.IO

Public Class Truevalue
    Inherits System.Web.UI.Page
    Private con As New Connection
    Public dt As New DataTable
    Public dt2 As New DataTable
    Public post_dt As New DataTable
    Dim dt3 As DataTable
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            save_data.Enabled = False
            Update_Data.Enabled = False
            Reset_Data.Enabled = False
            Print_data.Enabled = False

            If Session("user_name") = "" Then
                save_data.Enabled = False
                Update_Data.Enabled = False
                Reset_Data.Enabled = False
                Print_data.Enabled = False
            End If

            If Not IsPostBack Then
                If Session("Branch") = "" Then
                    Response.Redirect("../../../Default.aspx")
                End If
                Purc_Date.Text = Now.ToString("dd") & "/" & Now.ToString("MM") & "/" & Now.ToString("yyyy")
                Sale_Date.Text = Now.ToString("dd") & "/" & Now.ToString("MM") & "/" & Now.ToString("yyyy")
                Branch_Data()
                Veh_group_Data()
                Model_Data()
                Loan_type_Data()
                Color_Data()
                State_Data()
                Chassis_Data()
                Erp_Dse_Data()
                finacier_data()
            End If
        Catch ex As Exception
        End Try
    End Sub

    Public Sub MesgBox(ByVal sMessage As String)
        Dim sb As New System.Text.StringBuilder
        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('" & sMessage & "')", True)
    End Sub

    Protected Sub GOBranch_click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Go_Branch.Click
        Try
            Response.Redirect("../../Credintial/BranchPage.aspx")
        Catch ex As Exception

        End Try
    End Sub
    Protected Sub Submit_click(ByVal sender As Object, ByVal e As System.EventArgs) Handles save_data.Click
        Try
            Dim Str As String = "DMS_Inv,Cust_Id,Purc_Cost,Tax_Val,Gst,purc_date,MGA_Exp,BodyShop_Exp,Outside_Exp,Cert_Exp,Refurb_Exp,Exch_Exp,Oth_Exp,Total_cost,Intr_Rate,Amt,	Sl_Inv,SlTax_Val,Sl_Gst,sl_date,Rto_Chrg,Insu_Amt,	Ext_Amt,Sl_MGA,	Oth_Chrg,SlTotal_Cost,Discount,Sale"
            Dim SqlQuery As String = "INSERT INTO TVIcm_mst (" & Str & ") VALUES(
            '" & tvinvoice.Text & "','" & custid.Text & "', '" + Pur_Cost.Text + "', '" & Tax_Val.Text & "','" & Gst_Rate.Text & "'," & SqlDate(Purc_Date.Text) & ",'" & Mga_Exp.Text & "','" & Shop_Exp.Text & "','" & OutSide_Rpr.Text & "','" & Cer_Exp.Text & "','" & Refurb_Exp.Text & "',
            '" & Exch_Exp.Text & "','" & Otr_Exp.Text & "','" & Total_Cost.Text & "','" & Intr_Rate.Text & "','" & decimalValue(Amt.Text) & "',
            '" & Sale_inv.Text & "','" & Taxable_Val.Text & "','" & Gst_Amt.Text & "'," & SqlDate(Sale_Date.Text) & ",'" & Rto_Chrg.Text & "','" & Ins_Amt.Text & "',
            '" & Ext_Amt.Text & "','" & Mga_Amt.Text & "','" & Oth_Chrg.Text & "','" & decimalValue(Total_Cust_Cost.Text) & "',
            '" & Discount.Text & "','" & Sal_price.Text & "')"
            con.TSql(SqlQuery)
            MesgBox("Updated Successfully")
            Response.Redirect("../../DefaultPage/DefaultPage.aspx")
        Catch ex As Exception
            MesgBox(ex.Message)
        End Try
    End Sub

    Protected Sub Cost_Offer_Grid_click(ByVal sender As Object, ByVal e As System.EventArgs) Handles view.Click
        Try
        Catch ex As Exception

        End Try
    End Sub

    Private Sub Rect_Grid_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles Rcpt_Grid.RowDataBound
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
                        cell.Text = value.ToString()
                    End If
                End If
            Next
        End If
    End Sub

    Protected Sub view_click(ByVal sender As Object, ByVal e As System.EventArgs) Handles DtView.Click
        Try
            If Session("Branch") = "Multi Branch" Then
                MesgBox("Pls Select Another Branch You are in Multi Branch Click Branch Icon In Side Panel")
            Else
                dt = con.ReturnDtTable("select top 1 chas_id,Tran_id, dms_inv,cust_id,convert(varchar,inv_date,103)as Inv_Date,ledg_name,Ledg_Add2,ph1 as Mobile,gst_no,do_amt,po_amt,pf_charges,pin_code,pan_no,nomi_name,chas_no,Engn_No,vin,fin_dono, email_id,dms_financier,
                (select misc_name from misc_mst where misc_type=1 and misc_mst.misc_code=teh_code) as city,teh_code,
                (select misc_name from misc_mst where misc_type=3 and misc_mst.misc_code=Stat_Code) as State,stat_code,
                (select misc_name from misc_mst where misc_type=18 and misc_mst.misc_code=Pymt_Mode) as Loan,pymt_mode,
                (select misc_name from misc_mst where misc_type=8 and misc_code=icm_mst.Fin_Code) as Financier,fin_code,
                (select misc_name from misc_mst where misc_type=14 and misc_mst.misc_code=Modl_Grp) as Vehicle_Grp,modl_grp,
                (select misc_name from misc_mst where misc_type=10 and Misc_Code=Veh_Clr) as Vehicle_Color,Veh_Clr,
                (select EMPFIRSTNAME FROM EMPLOYEEMASTER WHERE EMPLOYEEMASTER.SRNO=ERP_DSE) AS ERP_DSE_Name,ERP_DSE,
                (select EMPFIRSTNAME FROM EMPLOYEEMASTER WHERE EMPLOYEEMASTER.SRNO=ERP_TL) AS ERP_TL_Name,ERP_TL,
                (select misc_name  FROM misc_mst WHERE misc_type=7 AND misc_mst.MISC_CODE=DMS_DSE) as DMS_DSE_Name,DMS_DSE,
                (select misc_name  FROM misc_mst WHERE misc_type=7 AND misc_mst.MISC_CODE=DMS_TL) as DMS_TL_Name,DMS_TL,
                (select modl_name from modl_mst where ICM_mst.Modl_Code=Item_Code) as Veh_code,Modl_Code,
                (select top 1 OldRegno_1 from Exch_Veh where Export_Type<3) as Old_Regno,
                (select top 1 oldChasNo_1 from Exch_Veh where Export_Type<3) as Old_ChasNo,
                (select top 1 oldEngno_1 from Exch_Veh where Export_Type<3) as Old_Engnno,
                (select top 1 OldModel_1 from exch_veh where Export_Type<3) as Old_Model,
                (select top 1 OldMfgYr_1 from exch_veh where Export_Type<3) as Old_MfgYr,
                (select top 1 OldAmount_1 from exch_veh where Export_Type<3) as Old_Amt,
                (select top 1 Relation_1 from exch_veh where Export_Type<3) as RelCust
                from icm_Mst
                where dms_inv='" + tvinvoice.Text + "' and loc_code=" & Session("BranchCode") & "")
                If dt.Rows.Count > 0 Then
                    loaddata()
                    Document_Grid()
                    'Ledg Balance 
                    post_dt = con.ReturnDtTable("SELECT BILL_REF,convert(varchar,ACNT_DATE,103) as Rect_Date,POST_AMT,CHQ_NO,CHQ_DATE,ledg_ac FROM ACNT_POST WHERE ACNT_TYPE=1 and Ledg_Ac=(select ledg_code from ledg_mst where ledg_add6='" & custid.Text & "' and Group_Code=53) and Export_Type<4")

                    'Ledg balance View Session 
                    Session("post_amt") = post_dt.Rows(0)("ledg_ac").ToString

                    'Recipt Cost & Offers
                    Dim value As String
                    'value = ("SELECT BILL_REF,convert(varchar,ACNT_DATE,103),POST_AMT,CHQ_NO,convert(varchar,CHQ_DATE,103),'Receipt Voucher' as Remark FROM ACNT_POST WHERE ACNT_TYPE=1 and Ledg_Ac=(select ledg_code from ledg_mst where ledg_add6='" & custid.Text & "' and Group_Code=53) and Export_Type<4")
                    value = ("SELECT BILL_REF as Rect_No,convert(varchar,ACNT_DATE,3) as Rect_Date,POST_AMT as Amount,CHQ_NO as Instrument_No,iif(export_type<3,'Posted',iif(export_type=99,'Unposted',iif(export_type=4,'Reversed',iif(export_type=5,'Cancelled','')))) as Remark FROM ACNT_POST WHERE ACNT_TYPE=1 and Ledg_Ac=(select ledg_code from ledg_mst where ledg_add6='" & custid.Text & "' and Group_Code=53) and Export_Type<>33")
                    dt = con.ReturnDtTable(value)
                    Rcpt_Grid.DataSource = dt
                    Rcpt_Grid.DataBind()

                    'View Balance
                    dt2 = con.ReturnDtTable("select sum(iif(amt_drcr=1,post_amt,post_amt*-1)) as post_amt from acnt_post where ledg_ac=" & Convert.ToString(Session("post_amt")) & " and Export_Type<4")
                    Balance.Text = "Ledger Balance.:  " + decimalValue(dt2.Rows(0)("post_amt").ToString)
                    Delv_Branch.Text = Convert.ToString(Session("Branch"))

                    'Model Data
                    dt = con.ReturnDtTable("select * from TVIcm_mst where dms_inv='" & tvinvoice.Text & "'")
                    Cost_Offer_Grid.DataSource = dt
                    Cost_Offer_Grid.DataBind()
                Else
                    MesgBox("Invalid Invoice Number")
                End If
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub Cost_Offer_Grid_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles Cost_Offer_Grid.RowDataBound
        If e.Row.RowType = DataControlRowType.Header Then
            For i = 0 To e.Row.Cells.Count - 1
                Dim cell2 As TableCell = e.Row.Cells(i)
            Next
            Dim cell As TableCell = e.Row.Cells(1)
            e.Row.Cells(0).Text = "DMS_Inv"
            e.Row.Cells(1).Text = "Cust_Id"
            e.Row.Cells(2).Text = "Purchase_Amount"
            e.Row.Cells(3).Text = "TaxVal_Amount"
            e.Row.Cells(4).Text = "Gst_Chrg"
            e.Row.Cells(5).Text = "Purchase_Date"
            e.Row.Cells(6).Text = "MGA_EXP"
            e.Row.Cells(7).Text = "BodyShop_EXP"
            e.Row.Cells(8).Text = "OutSide_EXP"
            e.Row.Cells(9).Text = "Certification_EXP"
            e.Row.Cells(10).Text = "Refurb_Exp"
            e.Row.Cells(11).Text = "Exch_Exp"
            e.Row.Cells(12).Text = "Oth_Exp"
            e.Row.Cells(13).Text = "Total_cost"
            e.Row.Cells(14).Text = "Intr_Rate"
            e.Row.Cells(15).Text = "Amt"
            e.Row.Cells(16).Text = "Sale_Inv"
            e.Row.Cells(17).Text = "SaleTax_Val"
            e.Row.Cells(18).Text = "Sale_Gst"
            e.Row.Cells(19).Text = "Sale_Date"
            e.Row.Cells(20).Text = "Rto_Chrg"
            e.Row.Cells(21).Text = "Insurance_Amt"
            e.Row.Cells(22).Text = "Ext_Amt"
            e.Row.Cells(23).Text = "Other_Chrg"
            e.Row.Cells(24).Text = "SaleTotal_Cost"
            e.Row.Cells(25).Text = "Discount_Amt"
            e.Row.Cells(26).Text = "Sale_Amt"
        End If

        If e.Row.RowType = DataControlRowType.DataRow Then
            For i As Integer = 0 To e.Row.Cells.Count - 1
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

    Private Sub Rcpt_Grid_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles Rcpt_Grid.RowDataBound
        If e.Row.RowType = DataControlRowType.Header Then
            For i = 0 To e.Row.Cells.Count - 1
                Dim cell2 As TableCell = e.Row.Cells(i)
            Next
            Dim cell As TableCell = e.Row.Cells(1)
            e.Row.Cells(0).Text = "Receipt_No."
            e.Row.Cells(1).Text = "Receipt_Date"
            e.Row.Cells(2).Text = "Amount"
            e.Row.Cells(2).HorizontalAlign = HorizontalAlign.Right
            e.Row.Cells(3).Text = "Instrument_No"
            e.Row.Cells(4).Text = "Instrument_Date."
            e.Row.Cells(5).Text = "Remarks"
        End If

        If e.Row.RowType = DataControlRowType.DataRow Then
            For i As Integer = 0 To e.Row.Cells.Count - 1
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

    Private Sub loaddata()
        Try
            dt = con.ReturnDtTable("select top 1 chas_id,Tran_id, dms_inv,cust_id,convert(varchar,inv_date,103)as Inv_Date,ledg_name,Ledg_Add2,ph1 as Mobile,gst_no,do_amt,po_amt,pf_charges,pin_code,pan_no,nomi_name,chas_no,Engn_No,vin,fin_dono, email_id,dms_financier,
                (select misc_name from misc_mst where misc_type=1 and misc_mst.misc_code=teh_code) as city,teh_code,
                (select misc_name from misc_mst where misc_type=3 and misc_mst.misc_code=Stat_Code) as State,stat_code,
                (select misc_name from misc_mst where misc_type=18 and misc_mst.misc_code=Pymt_Mode) as Loan,pymt_mode,
                (select misc_name from misc_mst where misc_type=8 and misc_code=icm_mst.Fin_Code) as Financier,fin_code,
                (select misc_name from misc_mst where misc_type=14 and misc_mst.misc_code=Modl_Grp) as Vehicle_Grp,modl_grp,
                (select misc_name from misc_mst where misc_type=10 and Misc_Code=Veh_Clr) as Vehicle_Color,Veh_Clr,
                (select EMPFIRSTNAME FROM EMPLOYEEMASTER WHERE EMPLOYEEMASTER.SRNO=ERP_DSE) AS ERP_DSE_Name,ERP_DSE,
                (select EMPFIRSTNAME FROM EMPLOYEEMASTER WHERE EMPLOYEEMASTER.SRNO=ERP_TL) AS ERP_TL_Name,ERP_TL,
                (select misc_name  FROM misc_mst WHERE misc_type=7 AND misc_mst.MISC_CODE=DMS_DSE) as DMS_DSE_Name,DMS_DSE,
                (select misc_name  FROM misc_mst WHERE misc_type=7 AND misc_mst.MISC_CODE=DMS_TL) as DMS_TL_Name,DMS_TL,
                (select modl_name from modl_mst where ICM_mst.Modl_Code=Item_Code) as Veh_code,Modl_Code,
                (select top 1 OldRegno_1 from Exch_Veh where Export_Type<3) as Old_Regno,
                (select top 1 oldChasNo_1 from Exch_Veh where Export_Type<3) as Old_ChasNo,
                (select top 1 oldEngno_1 from Exch_Veh where Export_Type<3) as Old_Engnno,
                (select top 1 OldModel_1 from exch_veh where Export_Type<3) as Old_Model,
                (select top 1 OldMfgYr_1 from exch_veh where Export_Type<3) as Old_MfgYr,
                (select top 1 OldAmount_1 from exch_veh where Export_Type<3) as Old_Amt,
                (select top 1 Relation_1 from exch_veh where Export_Type<3) as RelCust
                from icm_Mst
                where dms_inv='" + tvinvoice.Text + "' and loc_code=" & Session("BranchCode") & "")

            dt3 = con.ReturnDtTable("select top 1 purc_Cost, Tax_Val, Gst,Purc_Date,MGA_Exp,BodyShop_Exp,Outside_Exp,Cert_Exp,Refurb_Exp,Exch_Exp,Oth_Exp,Total_cost, intr_Rate,Amt,Sl_Inv,SlTax_val,Sl_Gst,Sl_Date,Rto_Chrg,Insu_Amt,Ext_Amt,Sl_MGA,Oth_Chrg,SlTotal_Cost,Discount,Sale, * from TVIcm_mst where  dms_inv='" + tvinvoice.Text + "'")
            Loadvalues()
        Catch ex As Exception

        End Try
    End Sub

    Private Sub Loadvalues()
        Try
            If tvinvoice.Text = "" Then
                MesgBox("Enter Invoice Number First")
            ElseIf dt.Rows.Count > 0 Then
                custid.Text = dt.Rows(0)("cust_id").ToString
                    'fileno.Text = dt.Rows(0)("fileno").ToString
                    Session("tran") = dt.Rows(0)("tran_id").ToString
                    date1.Text = dt.Rows(0)("Inv_Date").ToString
                    Cust_Name.Text = dt.Rows(0)("ledg_name").ToString
                    Cust_Add.Text = dt.Rows(0)("Ledg_Add2").ToString
                    State_List.SelectedValue = dt.Rows(0)("stat_code").ToString
                    Mobile.Text = dt.Rows(0)("Mobile").ToString
                    Pin_Code.Text = dt.Rows(0)("pin_code").ToString
                    Pan_No.Text = dt.Rows(0)("pan_no").ToString
                    Gst_No.Text = dt.Rows(0)("gst_no").ToString
                    Financier_List.SelectedValue = Val(dt.Rows(0)("fin_code").ToString)
                    Loan_List.SelectedValue = dt.Rows(0)("pymt_mode").ToString
                    Do_Amt.Text = decimalValue(dt.Rows(0)("do_amt").ToString)
                    Pf_chrg.Text = decimalValue(dt.Rows(0)("pf_charges").ToString)
                    Do_No.Text = dt.Rows(0)("fin_dono").ToString
                    Veh_Reg_no.Text = dt.Rows(0)("Old_Regno").ToString
                    If Val(dt.Rows(0)("chas_Id").ToString) = 0 Then
                        dt.Rows(0)("chas_Id") = Val(Gds.Tables("CHASSIS_MST").Compute("Max(Chas_Id)", "chas_no='" & dt.Rows(0)("chas_No").ToString & "'").ToString)
                    End If
                    If Val(dt.Rows(0)("chas_Id").ToString) > 0 Then Chass_No_List2.SelectedValue = Val(dt.Rows(0)("chas_Id").ToString)
                    OldEng_No.Text = dt.Rows(0)("Old_Engnno").ToString
                    DSE_NAME.SelectedValue = dt.Rows(0)("DMS_DSE").ToString
                    veh_group_List.SelectedValue = dt.Rows(0)("modl_grp").ToString
                    Veh_Code.SelectedValue = dt.Rows(0)("Modl_Code").ToString
                    Veh_Color_List.SelectedValue = dt.Rows(0)("Veh_Clr").ToString
                    DSE_NAME2.SelectedValue = dt.Rows(0)("DMS_DSE").ToString
                    Chass_No_List.Text = dt.Rows(0)("Old_ChasNo").ToString
                    NewEng_No.Text = dt.Rows(0)("Engn_No").ToString
                    Eval_Name.Text = dt.Rows(0)("DMS_DSE").ToString
                    Modl_Var.Text = dt.Rows(0)("Old_Model").ToString
                    OldMfgYr.Text = dt.Rows(0)("Old_MfgYr").ToString
                    Rel_Cust.Text = dt.Rows(0)("RelCust").ToString
                Delv_CustID.Text = dt.Rows(0)("cust_id").ToString
                save_data.Enabled = True
                Reset_Data.Enabled = True

                city_List.Text = dt.Rows(0)("teh_code").ToString
                End If

                cost_offer()

        Catch ex As Exception

        End Try
    End Sub

    Private Sub cost_offer()
        Try
            If dt3.Rows.Count > 0 Then
                save_data.Enabled = True
                Reset_Data.Enabled = True
                Pur_Cost.Text = dt3.Rows(0)("purc_Cost").ToString
                Tax_Val.Text = dt3.Rows(0)("Tax_Val").ToString
                Gst_Rate.Text = dt3.Rows(0)("Gst").ToString
                Purc_Date.Text = dt3.Rows(0)("Purc_Date").ToString
                Mga_Exp.Text = dt3.Rows(0)("Mga_Exp").ToString
                Shop_Exp.Text = dt3.Rows(0)("BodyShop_Exp").ToString
                OutSide_Rpr.Text = dt3.Rows(0)("Outside_Exp").ToString
                Cer_Exp.Text = dt3.Rows(0)("Cert_Exp").ToString
                Refurb_Exp.Text = dt3.Rows(0)("Refurb_Exp").ToString
                Exch_Exp.Text = dt3.Rows(0)("Exch_Exp").ToString
                Otr_Exp.Text = dt3.Rows(0)("Oth_Exp").ToString
                Total_Cost.Text = dt3.Rows(0)("Total_Cost").ToString
                Intr_Rate.Text = dt3.Rows(0)("Intr_Rate").ToString
                Amt.Text = dt3.Rows(0)("Amt").ToString
                Sale_inv.Text = dt3.Rows(0)("Sl_Inv").ToString
                Taxable_Val.Text = dt3.Rows(0)("SlTax_val").ToString
                Gst_Amt.Text = dt3.Rows(0)("Sl_Gst").ToString
                Sale_Date.Text = dt3.Rows(0)("Sl_Date").ToString
                Rto_Chrg.Text = dt3.Rows(0)("Rto_Chrg").ToString
                Ins_Amt.Text = dt3.Rows(0)("Insu_Amt").ToString
                Ext_Amt.Text = dt3.Rows(0)("Ext_Amt").ToString
                Mga_Amt.Text = dt3.Rows(0)("Sl_MGA").ToString
                Oth_Chrg.Text = dt3.Rows(0)("Oth_Chrg").ToString
                Total_Cust_Cost.Text = dt3.Rows(0)("SlTotal_Cost").ToString
                Discount.Text = dt3.Rows(0)("Discount").ToString
                Sal_price.Text = dt3.Rows(0)("Sale").ToString
                Ext_Amt.Text = dt3.Rows(0)("Ext_Amt").ToString

            Else
                Pur_Cost.Text = ""
                Tax_Val.Text = ""
                Gst_Rate.Text = ""
                Purc_Date.Text = ""
                Mga_Exp.Text = ""
                Shop_Exp.Text = ""
                OutSide_Rpr.Text = ""
                Cer_Exp.Text = ""
                Refurb_Exp.Text = ""
                Exch_Exp.Text = ""
                Otr_Exp.Text = ""
                Total_Cost.Text = ""
                Intr_Rate.Text = ""
                Amt.Text = ""
                Sale_inv.Text = ""
                Taxable_Val.Text = ""
                Gst_Amt.Text = ""
                Sale_Date.Text = ""
                Rto_Chrg.Text = ""
                Ins_Amt.Text = ""
                Ext_Amt.Text = ""
                Mga_Amt.Text = ""
                Oth_Chrg.Text = ""
                Total_Cust_Cost.Text = ""
                Discount.Text = ""
                Sal_price.Text = ""
                Ext_Amt.Text = ""
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub finacier_data()
        If con Is Nothing Then con = New Connection
        'Financier Data
        dt = Gds.Tables("FINANCE_MST").Copy
        dt.Rows.Add()
        dt.Rows(dt.Rows.Count - 1)("misc_code") = 0
        dt.Rows(dt.Rows.Count - 1)("misc_name") = ""
        dt = dt.Select("misc_code>=0", "misc_code").CopyToDataTable
        Financier_List.DataSource = dt
        Financier_List.DataTextField = "misc_name"
        Financier_List.DataValueField = "misc_code"
        Financier_List.DataBind()
    End Sub

    Private Sub Branch_Data()
        If con Is Nothing Then con = New Connection
        'Branch Data
        dt = Gds.Tables("BRANCH_MST").Copy
        dt.Rows.Add()
        dt.Rows(dt.Rows.Count - 1)("Godw_code") = 0
        dt.Rows(dt.Rows.Count - 1)("Godw_name") = ""
        dt = dt.Select("Godw_code>=0", "Godw_code").CopyToDataTable
        city_List.DataSource = dt
        city_List.DataTextField = "Godw_name"
        city_List.DataValueField = "Godw_code"
        city_List.DataBind()
    End Sub

    Private Sub Color_Data()
        If con Is Nothing Then con = New Connection
        'Color
        dt = Gds.Tables("COLOR_MST").Copy
        dt.Rows(dt.Rows.Count - 1)("misc_code") = 0
        dt.Rows(dt.Rows.Count - 1)("misc_name") = ""
        dt = dt.Select("isnull(misc_code,0)>=0", "misc_code").CopyToDataTable
        Veh_Color_List.DataSource = dt
        Veh_Color_List.DataTextField = "misc_name"
        Veh_Color_List.DataValueField = "misc_code"
        Veh_Color_List.DataBind()
    End Sub

    Private Sub Loan_type_Data()
        If con Is Nothing Then con = New Connection
        'Type of Loan
        dt = Gds.Tables("LOAN_MST").Copy
        dt.Rows.Add()
        dt.Rows(dt.Rows.Count - 1)("misc_code") = 0
        dt.Rows(dt.Rows.Count - 1)("misc_name") = ""
        dt = dt.Select("misc_code>=0", "misc_code").CopyToDataTable
        Loan_List.DataSource = dt
        Loan_List.DataTextField = "misc_name"
        Loan_List.DataValueField = "misc_code"
        Loan_List.DataBind()
    End Sub

    Private Sub Veh_group_Data()
        If con Is Nothing Then con = New Connection
        'Vehicle Of Group
        dt = Gds.Tables("VEH_MST")
        dt.Rows.Add()
        dt.Rows(dt.Rows.Count - 1)("misc_code") = 0
        dt.Rows(dt.Rows.Count - 1)("misc_name") = ""
        dt = dt.Select("misc_code>=0", "misc_code").CopyToDataTable
        veh_group_List.DataSource = dt
        veh_group_List.DataTextField = "misc_name"
        veh_group_List.DataValueField = "misc_code"
        veh_group_List.DataBind()
    End Sub

    Private Sub Model_Data()
        If con Is Nothing Then con = New Connection
        'Model
        dt = Gds.Tables("MODEL_MST")
        dt.Rows.Add()
        dt.Rows(dt.Rows.Count - 1)("Item_Code") = 0
        dt.Rows(dt.Rows.Count - 1)("modl_name") = ""
        dt = dt.Select("isnull(Item_Code,0)>=0 ", "Item_Code").CopyToDataTable
        Veh_Code.DataSource = dt
        Veh_Code.DataTextField = "modl_name"
        Veh_Code.DataValueField = "Item_Code"
        Veh_Code.DataBind()
    End Sub

    Private Sub State_Data()
        If con Is Nothing Then con = New Connection
        'Model
        dt = Gds.Tables("STATE_MST")
        dt.Rows.Add()
        dt.Rows(dt.Rows.Count - 1)("misc_Code") = 0
        dt.Rows(dt.Rows.Count - 1)("misc_name") = ""
        dt = dt.Select("isnull(misc_Code,0)>=0 ", "misc_Code").CopyToDataTable
        State_List.DataSource = dt
        State_List.DataTextField = "misc_name"
        State_List.DataValueField = "misc_Code"
        State_List.DataBind()
    End Sub


    Private Sub Chassis_Data()
        Try
            If con Is Nothing Then con = New Connection
            'Chassis_No Data
            Dim chasDt As New DataTable
            dt = Gds.Tables("CHASSIS_MST").Copy
            dt.Rows.Add()
            dt.Rows(dt.Rows.Count - 1)("chas_id") = 0
            dt.Rows(dt.Rows.Count - 1)("chas_no") = ""
            dt = dt.Select("isnull(chas_id,0)>=0 ", "chas_id").CopyToDataTable
            Chass_No_List2.DataSource = dt
            Chass_No_List2.DataTextField = "chas_no"
            Chass_No_List2.DataValueField = "chas_id"
            Chass_No_List2.DataBind()
        Catch ex As Exception

        End Try
    End Sub


    Private Sub Erp_Dse_Data()
        If con Is Nothing Then con = New Connection
        'Erp_Dse
        dt = Gds.Tables("EMPLOYEEMASTER").Copy
        dt.Rows.Add()
        dt.Rows(dt.Rows.Count - 1)("srno") = 0
        dt.Rows(dt.Rows.Count - 1)("Emp_Name") = ""
        dt = dt.Select("srno>=0", "srno").CopyToDataTable
        DSE_NAME2.DataSource = dt
        DSE_NAME2.DataTextField = "Emp_Name"
        DSE_NAME2.DataValueField = "srno"
        DSE_NAME2.DataBind()

        Dim dt2 As DataTable
        dt2 = dt.Copy
        DSE_NAME.DataSource = dt2
        DSE_NAME.DataTextField = "Emp_Name"
        DSE_NAME.DataValueField = "srno"
        DSE_NAME.DataBind()

        Dim dt3 As DataTable
        dt3 = dt.Copy
        Eval_Name.DataSource = dt3
        Eval_Name.DataTextField = "Emp_Name"
        Eval_Name.DataValueField = "srno"
        Eval_Name.DataBind()
    End Sub

    Protected Sub upload_Doc_click(ByVal sender As Object, ByVal e As System.EventArgs) Handles upload_Doc.Click
        Try
            Dim RetVal As Integer
            Dim UserName As String = Session("user_name")
            Dim FileTYPE As String = Path.GetExtension(file_upload.FileName)
            Dim FileName As String = Path.GetFileName(file_upload.FileName)
            Dim folderPath As String = Server.MapPath("~/Documents/")

            If Not Directory.Exists(folderPath) Then
                Directory.CreateDirectory(folderPath)
            End If
            Dim str As String = "Doc_type, tran_id,SRNO,path, file_name, user_name, upload_date, export_type"
            Dim qry As String = ""
            If file_upload.HasFile Then
                RetVal = 1
                Dim saveTranID = Session("tran") + "_" & RetVal & FileTYPE
                file_upload.SaveAs(folderPath + saveTranID)
                qry = "INSERT INTO DOC_UPLOAD (" & str & ") VALUES ('ICM','" & Session("tran") & "','" & RetVal & "','" & FileName & "','" & saveTranID & "','" & UserName & "'," & SqlDate(DateTime.Now.ToString) & ",'1')"
                con.TSql(qry)
                Document_Grid()
            End If

        Catch ex As Exception

        End Try
    End Sub

    Private Sub Document_Grid()
        Try
            dt = con.ReturnDtTable("select Doc_Type,SRNO,path,File_Name,User_Name,Upload_Date from DOC_UPLOAD where tran_id='" & Session("tran") & "'")
            Doc_Grid.DataSource = dt
            Doc_Grid.DataBind()
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Doc_Grid_SelectedIndexChanged(sender As Object, e As EventArgs) Handles Doc_Grid.SelectedIndexChanged
        Try
            Dim srno As String = Doc_Grid.SelectedRow.Cells(2).Text
            Session("image") = Doc_Grid.SelectedRow.Cells(1).Text
            Dim qry As String = "delete from DOC_UPLOAD where srno='" & srno & "' and tran_id='" & Session("tran") & "'"
            con.TSql(qry)
            Document_Grid()
        Catch ex As Exception

        End Try
    End Sub

    Private Sub Reset_Data_click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Reset_Data.Click
        Try
            Response.Redirect(Request.Url.AbsoluteUri)
        Catch ex As Exception

        End Try
    End Sub

    Private Sub Exit_Data_click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Exit_Form.Click
        Try
            Response.Redirect("../../DefaultPage/DefaultPage.aspx")
        Catch ex As Exception

        End Try
    End Sub



    'Protected Sub UploadFile(sender As Object, e As EventArgs)
    '    Dim folderPath As String = Server.MapPath("~/Files/")

    '    'Check whether Directory (Folder) exists.
    '    If Not Directory.Exists(folderPath) Then
    '        'If Directory (Folder) does not exists Create it.
    '        Directory.CreateDirectory(folderPath)
    '    End If

    '    'Save the File to the Directory (Folder).
    '    file_upload.SaveAs(folderPath & Path.GetFileName(file_upload.FileName))

    '    'Display the Picture in Image control.
    '    doc_img.ImageUrl = "~/Files/" & Path.GetFileName(file_upload.FileName)
    'End Sub

End Class
