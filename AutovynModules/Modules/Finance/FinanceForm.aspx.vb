Public Class FinanceForm
    Inherits System.Web.UI.Page
    Private con As New Connection
    Public dt As New DataTable
    Private mydt As New DataTable

    Private Sub MesgBox(ByVal sMessage As String)
        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('" & sMessage & "')", True)
    End Sub

    Private Sub loaddata()
        Try
            dt = con.ReturnDtTable("select top 1 DMS_Inv,cust_id,ph1 as Mobile,Chas_Id,convert(varchar,inv_date,103) as inv_date,ledg_name,file_no,chas_no,do_amt,Engn_No,num_of_emi,rect_amt,intr_rate,
            (SELECT EMPFIRSTNAME FROM EMPLOYEEMASTER WHERE SRNO=ICM_MST.ERP_DSE) AS ERP_DSE_Name,ERP_DSE,
            (SELECT EMPFIRSTNAME FROM EMPLOYEEMASTER WHERE SRNO=ICM_MST.ERP_TL) AS ERP_TL_Name,ERP_TL,
            VIN,(SELECT MISC_NAME  FROM MISC_MST WHERE MISC_TYPE=7 AND MISC_CODE=ICM_MST.DMS_DSE) as DMS_DSE_Name,DMS_DSE,
            (SELECT MISC_NAME  FROM MISC_MST WHERE MISC_TYPE=7 AND MISC_CODE=ICM_MST.DMS_TL) as DMS_TL_Name,DMS_TL,
            (select top 1 misc_name from misc_mst where misc_type=10 and Misc_Code=icm_mst.Veh_Clr) as Vehicle_Color,Veh_Clr,
            (select Misc_Name from misc_mst where misc_type=8 and misc_code=icm_mst.Fin_Code) as Financier,Fin_Code,
            (select Misc_Name from misc_mst where Misc_Type=1 and Misc_Mst.misc_code=Teh_Code) as Branch,Teh_Code,
            (select Misc_Name from misc_mst where misc_type=18 and Misc_Mst.misc_code=Pymt_Mode) as Loan_type,Pymt_Mode,
            (select modl_name from modl_mst where ICM_mst.Modl_Code=Item_Code) as Veh_code,Modl_Code,
            (select Misc_Name from misc_mst where misc_type=14 and misc_mst.misc_code=Modl_Grp) as Vehicle_Grp,Modl_Grp,
            fin_dono,pf_charges,payout_rate,
            payout_gst,net_payout,floan_status,floan_date,fbank_name,FAccount_no,FRecd_Amt,FCredit_Ref,FRemark
            from icm_mst
             where dms_inv='" & dmsinvoice.Text & "' and loc_code=" & Session("BranchCode") & "")
            loadvalues()
        Catch ex As Exception

        End Try
    End Sub

    Private Sub loadvalues()
        Try
            If dmsinvoice.Text = "" Then
                MesgBox("Enter Invoice Number First")
            ElseIf dt.Rows.Count > 0 Then
                Dim a As String
                    a = dt.Rows(0)("Vehicle_Color").ToString
                    dmsinvoice.Text = dt.Rows(0)("DMS_Inv").ToString
                    custid.Text = dt.Rows(0)("cust_id").ToString
                    fileno.Text = dt.Rows(0)("file_no").ToString
                    date1.Text = dt.Rows(0)("INV_Date").ToString
                    name.Text = dt.Rows(0)("Ledg_Name").ToString
                    Mobile.Text = dt.Rows(0)("mobile").ToString
                    chas_no.Text = Val(dt.Rows(0)("chas_no").ToString)
                    engine.Text = dt.Rows(0)("engn_no").ToString
                    vin.Text = dt.Rows(0)("vin").ToString
                    colors.Text = a
                    veh_grp.Text = dt.Rows(0)("Vehicle_Grp").ToString
                    veh_Modl.Text = dt.Rows(0)("Veh_code").ToString
                    dmsdse.Text = dt.Rows(0)("DMS_DSE_Name").ToString
                    dsetl.Text = dt.Rows(0)("DMS_TL_Name").ToString
                    erp_dse.Text = dt.Rows(0)("ERP_DSE_Name").ToString
                    erp_tl.Text = dt.Rows(0)("ERP_TL_Name").ToString
                    financie.Text = dt.Rows(0)("Financier").ToString
                    Loan_Type.Text = dt.Rows(0)("Loan_type").ToString
                    findono.Text = dt.Rows(0)("fin_dono").ToString
                    findoamt.Text = decimalValue(dt.Rows(0)("do_amt").ToString)
                    finchrgs.Text = decimalValue(dt.Rows(0)("pf_charges").ToString)
                    payoutage.Text = dt.Rows(0)("payout_rate").ToString
                    finpayout.Text = dt.Rows(0)("Net_Payout").ToString
                    gst.Text = dt.Rows(0)("Payout_gst").ToString
                    totoalfin.Text = dt.Rows(0)("FRecd_Amt").ToString
                    loan_status.Text = dt.Rows(0)("FLoan_Status").ToString
                    date2.Text = dt.Rows(0)("INV_Date").ToString
                    bankname.Text = dt.Rows(0)("FBank_Name").ToString
                    interest.Text = dt.Rows(0)("Intr_Rate").ToString
                    emi.Text = dt.Rows(0)("Num_of_emi").ToString
                    received.Text = dt.Rows(0)("Rect_Amt").ToString
                    accountno.Text = dt.Rows(0)("FAccount_no").ToString
                    credit.Text = dt.Rows(0)("FCredit_Ref").ToString
                    Remark.Text = dt.Rows(0)("FRemark").ToString
                    save_data.Enabled = True
                    Reset_Data.Enabled = True
                    branches.Text = dt.Rows(0)("Teh_code").ToString
                End If

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

    Private Sub view_click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Dt_View.Click
        Try
            If Session("Branch") = "Multi Branch" Then
                MesgBox("Pls Select Another Branch You are in Multi Branch Click Branch Icon In Side Panel")
            Else
                dt = con.ReturnDtTable("select top 1 DMS_Inv,cust_id,ph1 as Mobile,Chas_Id,convert(varchar,inv_date,103) as inv_date,ledg_name,file_no,chas_no,do_amt,Engn_No,num_of_emi,rect_amt,intr_rate,
            (SELECT EMPFIRSTNAME FROM EMPLOYEEMASTER WHERE SRNO=ICM_MST.ERP_DSE) AS ERP_DSE_Name,ERP_DSE,
            (SELECT EMPFIRSTNAME FROM EMPLOYEEMASTER WHERE SRNO=ICM_MST.ERP_TL) AS ERP_TL_Name,ERP_TL,
            VIN,(SELECT MISC_NAME  FROM MISC_MST WHERE MISC_TYPE=7 AND MISC_CODE=ICM_MST.DMS_DSE) as DMS_DSE_Name,DMS_DSE,
            (SELECT MISC_NAME  FROM MISC_MST WHERE MISC_TYPE=7 AND MISC_CODE=ICM_MST.DMS_TL) as DMS_TL_Name,DMS_TL,
            (select top 1 misc_name from misc_mst where misc_type=10 and Misc_Code=icm_mst.Veh_Clr) as Vehicle_Color,Veh_Clr,
            (select Misc_Name from misc_mst where misc_type=8 and misc_code=icm_mst.Fin_Code) as Financier,Fin_Code,
            (select Misc_Name from misc_mst where Misc_Type=1 and Misc_Mst.misc_code=Teh_Code) as Branch,Teh_Code,
            (select Misc_Name from misc_mst where misc_type=18 and Misc_Mst.misc_code=Pymt_Mode) as Loan_type,Pymt_Mode,
            (select modl_name from modl_mst where ICM_mst.Modl_Code=Item_Code) as Veh_code,Modl_Code,
            (select Misc_Name from misc_mst where misc_type=14 and misc_mst.misc_code=Modl_Grp) as Vehicle_Grp,Modl_Grp,
            fin_dono,pf_charges,payout_rate,
            payout_gst,net_payout,floan_status,floan_date,fbank_name,FAccount_no,FRecd_Amt,FCredit_Ref,FRemark
            from icm_mst
             where dms_inv='" & dmsinvoice.Text & "' and loc_code=" & Session("BranchCode") & "")
                If dt.Rows.Count > 0 Then
                    loaddata()
                Else
                    MesgBox("Invalid Invoice Number")
                End If
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub Go_Branch_click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Go_Branch.Click
        Try
            Response.Redirect("../../Credintial/BranchPage.aspx")
        Catch ex As Exception

        End Try
    End Sub
    Private Sub Save_Data_click(ByVal sender As Object, ByVal e As System.EventArgs) Handles save_data.Click
        Try
            con.TSql("UPDATE icm_mst SET
        file_no='" & fileno.Text & "',
        Payout_Amt='" & findoamt.Text & "',
        Payout_Rate='" & decimalValue(payoutage.Text) & "',
        Payout_gst='" & decimalValue(gst.Text) & "',
        Net_Payout='" & decimalValue(finpayout.Text) & "',
        FLoan_Status ='" & loan_status.Text & "',
        FLoan_Date=" & SqlDate(date2.Text) & ",
        FBank_Name='" & bankname.Text & "',
        FAccount_no='" & accountno.Text & "',
        FRecd_Amt='" & decimalValue(totoalfin.Text) & "',
        FCredit_Ref='" & credit.Text & "',
        FRemark='" & Remark.Text & "',
        Num_Of_emi='" & emi.Text & "',
        Rect_Amt='" & received.Text & "',
        Intr_Rate='" & interest.Text & "'
        where DMS_Inv='" & dmsinvoice.Text & "' and cust_id='" & custid.Text & "' ")
            MesgBox("Data Is Saved Successfully")
            Response.Redirect("../../DefaultPage/DefaultPage.aspx")
        Catch ex As Exception

        End Try
    End Sub

    Private Sub Branch_Data()
        If con Is Nothing Then con = New Connection
        'Branch Data
        dt = Gds.Tables("BRANCH_MST").Copy
        dt.Rows.Add()
        dt.Rows(dt.Rows.Count - 1)("godw_code") = 0
        dt.Rows(dt.Rows.Count - 1)("godw_name") = "----Select----"
        dt = dt.Select("godw_code>=0", "godw_code").CopyToDataTable
        branches.DataSource = dt
        branches.DataTextField = "godw_name"
        branches.DataValueField = "godw_code"
        branches.DataBind()
    End Sub

    Private Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("user_name") = "" Then
                Response.Redirect("../../../Default.aspx")
            End If
            Data_Update.Enabled = False
            save_data.Enabled = False
            Reset_Data.Enabled = False
            Print_Data.Enabled = False
            Try
                Branch_Data()
                If Convert.ToString(Session("InvNo")) <> "" Then
                    dmsinvoice.Text = Convert.ToString(Session("InvNo"))
                    loaddata()
                End If
            Catch ex As Exception

            End Try
        End If
    End Sub

        Protected Sub payoutage_TextChanged(sender As Object, e As EventArgs) Handles payoutage.TextChanged
            Try
                Dim do_amt, finpay, totalfin, dotValue, pf_chrg As Decimal
                Dim payAge As Double
                '' do_amt = Convert.ToInt32(findoamt.Text)
                pf_chrg = finchrgs.Text
                do_amt = Format(Val(findoamt.Text) - pf_chrg)
                payAge = Convert.ToDouble(payoutage.Text)
                dotValue = Format(Val(do_amt), "#0.00") * Val(payoutage.Text) / 100
                finpayout.Text = dotValue
                finpay = Convert.ToString(finpayout.Text) * 0.18
                gst.Text = finpay
                totalfin = dotValue + finpay
                totoalfin.Text = totalfin.ToString
                gst.Text = decimalValue(gst.Text)
                finpayout.Text = decimalValue(finpayout.Text)
            Catch ex As Exception

            End Try
        End Sub

        Protected Sub view_click(sender As Object, e As ImageClickEventArgs)

        End Sub

    End Class