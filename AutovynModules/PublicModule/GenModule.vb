Module GenModule
    Public Gds As New DataSet
    Private GenCon As Connection

    Public Sub QueryInit(Optional ByVal str As String = "Misc_Mst")
        Try
            If GenCon Is Nothing Then GenCon = New Connection
            If Gds Is Nothing Then
                Gds = New DataSet
                QueryInit()
            End If
            str = str.ToUpper
            Dim index As Integer : Dim dt1 As DataTable
            Select Case str
                Case "COMP_MST"
                    If Gds.Tables.Contains(str) Then
                        index = Gds.Tables.IndexOf(str)
                        Gds.Tables.RemoveAt(index)
                    End If

                    Gds = GenCon.Fillds("Select Com_Name as Comp_Name,Godw_Code as Comp_Code from Godown_Mst where Export_type<3 order by Com_Name", str)

                Case "ITEM_TRAN"
                    If Gds.Tables.Contains(str) Then
                        index = Gds.Tables.IndexOf(str)
                        Gds.Tables.RemoveAt(index)
                    End If

                    Gds = GenCon.Fillds("Select * from Item_Tran", str)

                Case "MISC_MST"
                    If Gds.Tables.Contains(str) Then
                        index = Gds.Tables.IndexOf(str)
                        Gds.Tables.RemoveAt(index)
                    End If

                    Gds = GenCon.Fillds("Select DISTINCT Misc_Code,Misc_Name,28,Misc_Num1,5,Misc_Abbr,10,Misc_Mob,25,Misc_Type,5,Misc_HOD,5,Loc_Code,5,Misc_Dtl3,200,Server_Id,5,Misc_Add1,100,Misc_Add2,100 from Misc_Mst where Export_type<3", str)
                Case "LEDG_MST"
                    If Gds.Tables.Contains(str) Then
                        index = Gds.Tables.IndexOf(str)
                        Gds.Tables.RemoveAt(index)
                    End If
                    Gds = GenCon.Fillds("Select Ledg_Code,ledg_name as Ledg_name,28,Cl_Bal,19,'' as Spc,25,Ledg_Add1,70,Ledg_Add2,70,Ledg_Add3,70,Ledg_Add4,70,Ledg_Ph1,15,Ledg_Ph3,15,Teh_Code,5,Dist_Code,6,Ledg_Limit,13,Group_Code,6,(Select Group_Name from Grup_Mst where Ledg_MST.Group_Code=Group_Code and Export_type<3) as Group_Name,50,(select Misc_Name from Misc_Mst where Misc_type=1 and Export_Type<3 and Misc_Code=Teh_Code) as Teh_Name,30,  (select Misc_Name from Misc_Mst where Misc_type=2 and Export_Type<3 and Misc_Code=Dist_Code) as Dist_Name,30,(select Misc_Name from Misc_Mst where Misc_type=3 and Export_Type<3 and Misc_Code=State_Code) as State_Name,30,Op_Bal,11,Ledg_Abbr,12,Exc_Type,5,Ledg_Tin,20,Ledg_Class,5,Item_Post,5,Intr_Days,5,GSTTYPE,5,State_Code,5,GST_No,30,Ledg_Pan,30,(Select RATE from GSTRATE where GST_CODE=GST) as GSTRATE,10,IEC_No,5  FROM Ledg_MST WHERE Export_type<3", str)

                Case "BOOK_MST"
                    If Gds.Tables.Contains(str) Then
                        index = Gds.Tables.IndexOf(str)
                        Gds.Tables.RemoveAt(index)
                    End If
                    Gds = GenCon.Fillds("Select Book_Code,Book_Name,70,Book_Type,5,Book_Bal,13,Ledg_Code,5  FROM Book_MST WHERE Export_type<3", str)

                Case "GRUP_MST"
                    If Gds.Tables.Contains(str) Then
                        index = Gds.Tables.IndexOf(str)
                        Gds.Tables.RemoveAt(index)
                    End If

                    Gds = GenCon.Fillds("select Grup_Bal.*,(Op_Dr-Op_Cr) as Pre_Op,Group_Code,Group_Name,Sub_Group from Grup_Mst,Grup_Bal where Grup_Mst.Group_Code=Grup_Bal.Grup_Code and IsNull(Grup_Mst.Export_Type,0)<3 ", str)

                Case "MODL_MST"
                    If Gds.Tables.Contains(str) Then
                        index = Gds.Tables.IndexOf(str)
                        Gds.Tables.RemoveAt(index)
                    End If
                    Gds = GenCon.Fillds("Select  Item_Code,Modl_Code,15,Clr_type,1,Modl_Name,32,Cl_Stk,4, (select top 1 Misc_Name from Misc_Mst where Misc_type=14 and Export_Type<3  and Misc_Code=Modl_Grp) as Grp_Name,14,Cust_Price,13,Modl_Catg,5,Sale_Ac,5,MRP_Price,11,Dlr_Price,11,SDlr_Price,11,Corp_Price,11,CSD_Price,11,BSF_Price,11,CPC_Price,11,SDlr_Tax as GST,11,CSD_Tax as Cess,11,Cust_Tax,11,Purc_Ac,5,Sale_Ac,5,Trf_Ac,5,Prod_Type,5,Modl_Grp,5,Modl_Abbr,10,Adnl_Pric1,11,Adnl_Pric2,11,Adnl_Pric3,11,Adnl_Pric4,11,Adnl_Pric5,11,Adnl_Pric6,11,Adnl_Pric7,11, Adnl_Pric8,11,Adnl_Pric9,11,Adnl_Pric10,11,Adnl_Pric11,11,Adnl_Pric12,11,Adnl_Pric13,11,Adnl_Pric14,11,Adnl_Pric15,11,Chas_Prefix,20,CSD_Pric1,11,CSD_Pric2,11,CSD_Pric3,11,CSD_Pric4,11,CSD_Pric5,11,CSD_Pric6,11,CSD_Pric7,11, CSD_Pric8,11,CSD_Pric9,11,CSD_Pric15,11,CPC_Pric1,11,CPC_Pric2,11,CPC_Pric3,11,CPC_Pric4,11,CPC_Pric5,11,CPC_Pric6,11,CPC_Pric7,11, CPC_Pric8,11,CPC_Pric9,11,CPC_Pric15,11  from Modl_Mst WHERE Export_type<3   and Loc_Code= " & DbPath.CompCode & "", str)

                Case "KEY_DATA"
                    If Gds.Tables.Contains(str) Then
                        index = Gds.Tables.IndexOf(str)
                        Gds.Tables.RemoveAt(index)
                    End If
                    Gds = GenCon.Fillds("Select  * from KeyData where Export_Type<3 and Comp_Code=" & DbPath.CompCode, str)

                Case "USER_TBL"
                    If Gds.Tables.Contains(str) Then
                        index = Gds.Tables.IndexOf(str)
                        Gds.Tables.RemoveAt(index)
                    End If
                    Gds = GenCon.Fillds("Select  * from User_Tbl where Export_Type<3 and User_Code=" & DbPath.Log_code & " and Comp_Code=" & DbPath.CompCode, str)
                Case "CORP_MST"
                    If Gds.Tables.Contains(str) Then
                        index = Gds.Tables.IndexOf(str)
                        Gds.Tables.RemoveAt(index)
                    End If

                    Gds = GenCon.Fillds("Select Corp_Id,Corp_Code,15,Corp_Name,45,Sub_Grp,15,Grup_Id,5,Ext2,10,Misc_Name as Grup_Name,80 from Corp_Mst,Misc_Mst where Misc_Type=12 and Misc_Code=Grup_Id and Corp_Mst.Export_type<3", str)

                Case "CORP_DISC"
                    If Gds.Tables.Contains(str) Then
                        index = Gds.Tables.IndexOf(str)
                        Gds.Tables.RemoveAt(index)
                    End If
                    Gds = GenCon.Fillds("Select * from CORP_DISC where Export_type<3 and lOC_Code=" & DbPath.CompCode, str)
                Case "CONS_DISC"
                    If Gds.Tables.Contains(str) Then
                        index = Gds.Tables.IndexOf(str)
                        Gds.Tables.RemoveAt(index)
                    End If

                    Gds = GenCon.Fillds("Select CONS_DISC.*,Modl_Code from CONS_DISC,Modl_Mst where Modl_Mst.Item_Code=CONS_DISC.Modl_id and CONS_DISC.Export_type<3 AND CONS_DISC.lOC_Code=mODL_mST.lOC_Code and CONS_DISC.lOC_Code=" & DbPath.CompCode, str)

                Case "EXCH_DISC"
                    If Gds.Tables.Contains(str) Then
                        index = Gds.Tables.IndexOf(str)
                        Gds.Tables.RemoveAt(index)
                    End If

                    Gds = GenCon.Fillds("Select EXCH_DISC.*,Modl_Code from EXCH_DISC,Modl_Mst where Modl_Mst.Item_Code=EXCH_DISC.Modl_id and EXCH_DISC.Export_type<3  AND EXCH_DISC.lOC_Code=mODL_mST.lOC_Code and EXCH_DISC.lOC_Code=" & DbPath.CompCode, str)

                Case "CHAS_MST"
                    If Gds.Tables.Contains(str) Then
                        index = Gds.Tables.IndexOf(str)
                        Gds.Tables.RemoveAt(index)
                    End If

                    Gds = GenCon.Fillds("Select Chas_Id,Chas_No,15,Eng_No,15,Clr_Abbr,10,Ageing,8,Year(PInv_Date) as PurcMnth,8,Key_No,10,Clr_No,40,Modl_Code,5,Sale_Id,5,TrfOut_Id,5,CrNote_id,5,Cust_Code,30,Loc_Code,5,VIN,20 from CHAS_MST where Export_type<3  and Loc_Code=" & DbPath.CompCode, str)

                Case "BRANCH_MST"
                    If Gds.Tables.Contains(str) Then
                        index = Gds.Tables.IndexOf(str)
                        Gds.Tables.RemoveAt(index)
                    End If

                    Gds = GenCon.Fillds("Select godw_Name,Godw_Code from Godown_Mst where Export_type<3", str)

                Case "FINANCE_MST"
                    If Gds.Tables.Contains(str) Then
                        index = Gds.Tables.IndexOf(str)
                        Gds.Tables.RemoveAt(index)
                    End If

                    Gds = GenCon.Fillds("select misc_name, misc_code from Misc_Mst where Misc_Type=8", str)

                Case "CHASSIS_MST"
                    If Gds.Tables.Contains(str) Then
                        index = Gds.Tables.IndexOf(str)
                        Gds.Tables.RemoveAt(index)
                    End If

                    'dt1.Select("chas_no")
                    Gds = GenCon.Fillds("select cast(chas_no as nvarchar) as Chas_No,chas_id from chas_mst", str)
                   ' Gds = GenCon.Fillds("select misc_name as chas_no, misc_code as chas_id from Misc_Mst where Misc_Type=8", str)

                Case "COLOR_MST"
                    If Gds.Tables.Contains(str) Then
                        index = Gds.Tables.IndexOf(str)
                        Gds.Tables.RemoveAt(index)
                    End If

                    Gds = GenCon.Fillds("select misc_name, misc_code from misc_mst where Misc_Type=10", str)


                Case "LOAN_MST"
                    If Gds.Tables.Contains(str) Then
                        index = Gds.Tables.IndexOf(str)
                        Gds.Tables.RemoveAt(index)
                    End If

                    Gds = GenCon.Fillds("select misc_name, misc_code from misc_mst where Misc_Type=18", str)

                Case "VEH_MST"
                    If Gds.Tables.Contains(str) Then
                        index = Gds.Tables.IndexOf(str)
                        Gds.Tables.RemoveAt(index)
                    End If

                    Gds = GenCon.Fillds("select misc_name, misc_code from misc_mst where Misc_Type=14", str)

                Case "EMPLOYEEMASTER"
                    If Gds.Tables.Contains(str) Then
                        index = Gds.Tables.IndexOf(str)
                        Gds.Tables.RemoveAt(index)
                    End If

                    Gds = GenCon.Fillds("select srno,empcode+' - '+empfirstname as Emp_Name from EMPLOYEEMASTER where ISNULL(srno,'')<>'' and export_type<3", str)

                Case "MODEL_MST"
                    If Gds.Tables.Contains(str) Then
                        index = Gds.Tables.IndexOf(str)
                        Gds.Tables.RemoveAt(index)
                    End If

                    Gds = GenCon.Fillds("select modl_name, Item_Code from modl_mst", str)

                Case "STATE_MST"
                    If Gds.Tables.Contains(str) Then
                        index = Gds.Tables.IndexOf(str)
                        Gds.Tables.RemoveAt(index)
                    End If

                    Gds = GenCon.Fillds("SELECT MISC_NAME,misc_code FROM MISC_MST WHERE MISC_TYPE=3", str)

                Case "OLDCHASS_NO"
                    If Gds.Tables.Contains(str) Then
                        index = Gds.Tables.IndexOf(str)
                        Gds.Tables.RemoveAt(index)
                    End If

                    Gds = GenCon.Fillds("select OldChasNo_1 from Exch_Veh where OldChasNo_1<>''", str)
            End Select

        Catch ex As Exception
            MsgBox("GDS Error!!")
        End Try
    End Sub
End Module
