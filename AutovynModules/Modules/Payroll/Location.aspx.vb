Public Class Location
    Inherits System.Web.UI.Page
    Private dt As New DataTable
    Private Loc_List As New DataTable
    Private con As New Connection

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'date
        If Not IsPostBack Then
            location_Data()
            Dim currentDate As DateTime = DateTime.Now
            DateLabel.Text = currentDate.ToShortDateString()
        End If
    End Sub

    Private Sub location_Data()
        dt = con.ReturnDtTable("select misc_name, misc_hod,(select top 1 location from employeemaster where location=misc_hod and location in (" & Convert.ToString(Session("QueryLoc")) & ")) as LOCATION from misc_mst where misc_type=85")
        dt.Rows.Add()
        Branch_List.DataSource = dt
        dt.Rows(dt.Rows.Count - 1)("misc_hod") = 0
        dt.Rows(dt.Rows.Count - 1)("misc_name") = "All Branches"
        dt = dt.Select("misc_hod>=0", "misc_hod").CopyToDataTable
        Branch_List.DataTextField = "misc_name"
        Branch_List.DataValueField = "misc_hod"
        Branch_List.DataBind()
        Session("Branch_List") = Branch_List.SelectedValue
    End Sub

    Protected Sub Load_Location_Click(sender As Object, e As EventArgs) Handles Load_Location.Click
        Try
            If Branch_List.SelectedValue = 0 Then
                Session("Branch_List") = Session("QueryLoc")
            End If

            If Branch_List.SelectedValue > 0 Then
                Session("Branch_List") = Branch_List.SelectedValue
            End If
            Dim MyDay, MyMnth As Integer
            MyDay = DateLabel.Text.Split("/")(0)
            MyMnth = DateLabel.Text.Split("/")(1)
            Loc_List = con.ReturnDtTable("select Location,MAx(P_Cnt) as P_Cnt,Max(Tot_Cnt) as Tot_Cnt from (
SELECT (SELECT MISC_NAME FROM MISC_MST WHERE MISC_TYPE=85 AND LOCATION=MISC_HOD) AS LOCATION,0 as Tot_Cnt,Count(Emp_Code) as P_Cnt FROM attendancetable,EMPLOYEEMASTER WHERE lastwor_date is null and MONTH(DATEOFFICE)=" & MyMnth & "  and day(dateoffice)=" & MyDay & " and location in (" & Session("Branch_List") & ") AND EMP_CODE=EMPCODE and presentvalue>0 GROUP BY LOCATION
union all
SELECT (SELECT MISC_NAME FROM MISC_MST WHERE MISC_TYPE=85 AND LOCATION=MISC_HOD and location in (" & Session("Branch_List") & ")) AS LOCATION,Count(EmpCode) as Tot_Cnt, 0 as P_Cnt FROM EMPLOYEEMASTER WHERE empcode<>'' and location in (" & Session("Branch_List") & ") and  lastwor_date is null GROUP BY LOCATION
) A group by Location")
            Dim locCnt As String
            locCnt = Loc_List.Rows.Count
            Panel1.Visible = False
            Panel2.Visible = False
            Panel3.Visible = False
            Panel4.Visible = False
            Panel5.Visible = False
            Panel6.Visible = False
            Panel7.Visible = False
            Panel8.Visible = False
            Panel9.Visible = False
            Panel10.Visible = False
            Panel11.Visible = False
            Panel12.Visible = False
            Panel13.Visible = False
            Panel14.Visible = False
            Panel15.Visible = False
            Panel16.Visible = False
            Panel17.Visible = False
            Panel18.Visible = False
            Panel19.Visible = False
            Panel20.Visible = False
            Panel21.Visible = False
            Panel22.Visible = False
            Panel23.Visible = False
            Panel24.Visible = False
            Panel25.Visible = False
            Panel26.Visible = False
            Panel27.Visible = False
            Panel28.Visible = False
            Panel29.Visible = False
            Panel30.Visible = False
            Panel31.Visible = False
            Panel32.Visible = False
            Panel33.Visible = False
            Panel34.Visible = False
            Panel35.Visible = False
            Panel36.Visible = False
            Panel37.Visible = False
            Panel38.Visible = False
            Panel39.Visible = False
            Panel40.Visible = False
            Panel41.Visible = False
            Panel42.Visible = False
            Panel43.Visible = False
            Panel44.Visible = False
            Panel45.Visible = False
            Panel46.Visible = False
            Panel47.Visible = False
            Panel48.Visible = False
            For i As Integer = 0 To locCnt - 1
                If i = 0 Then
                    Panel1.Visible = True
                    loc1.Text = Loc_List.Rows(i)("Location").ToString : loc1_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc1_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 1 Then
                    Panel2.Visible = True
                    loc2.Text = Loc_List.Rows(i)("Location").ToString : loc2_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc2_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If
                If i = 3 Then
                    Panel3.Visible = True
                    loc3.Text = Loc_List.Rows(i)("Location").ToString : loc3_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc3_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 4 Then
                    Panel4.Visible = True
                    loc4.Text = Loc_List.Rows(i)("Location").ToString : loc4_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc4_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If
                If i = 5 Then
                    Panel5.Visible = True
                    loc5.Text = Loc_List.Rows(i)("Location").ToString : loc5_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc5_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 6 Then
                    Panel6.Visible = True
                    loc6.Text = Loc_List.Rows(i)("Location").ToString : loc6_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc6_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 7 Then
                    Panel7.Visible = True
                    loc7.Text = Loc_List.Rows(i)("Location").ToString : loc7_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc7_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If
                If i = 8 Then
                    Panel8.Visible = True
                    loc8.Text = Loc_List.Rows(i)("Location").ToString : loc8_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc8_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 9 Then
                    Panel9.Visible = True
                    loc9.Text = Loc_List.Rows(i)("Location").ToString : loc9_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc9_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 10 Then
                    Panel10.Visible = True
                    loc10.Text = Loc_List.Rows(i)("Location").ToString : loc10_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc10_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If
                If i = 11 Then
                    Panel11.Visible = True
                    loc11.Text = Loc_List.Rows(i)("Location").ToString : loc11_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc11_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 12 Then
                    Panel12.Visible = True
                    loc12.Text = Loc_List.Rows(i)("Location").ToString : loc12_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc12_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 13 Then
                    Panel13.Visible = True
                    loc13.Text = Loc_List.Rows(i)("Location").ToString : loc13_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc13_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 14 Then
                    Panel14.Visible = True
                    loc14.Text = Loc_List.Rows(i)("Location").ToString : loc14_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc14_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 15 Then
                    Panel15.Visible = True
                    loc15.Text = Loc_List.Rows(i)("Location").ToString : loc15_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc15_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 16 Then
                    Panel16.Visible = True
                    loc16.Text = Loc_List.Rows(i)("Location").ToString : loc16_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc16_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 17 Then
                    Panel17.Visible = True
                    loc17.Text = Loc_List.Rows(i)("Location").ToString : loc17_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc17_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 18 Then
                    Panel18.Visible = True
                    loc18.Text = Loc_List.Rows(i)("Location").ToString : loc18_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc18_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 19 Then
                    Panel19.Visible = True
                    loc19.Text = Loc_List.Rows(i)("Location").ToString : loc19_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc19_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 20 Then
                    Panel20.Visible = True
                    loc20.Text = Loc_List.Rows(i)("Location").ToString : loc20_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc20_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 21 Then
                    Panel21.Visible = True
                    loc21.Text = Loc_List.Rows(i)("Location").ToString : loc21_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc21_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 22 Then
                    Panel22.Visible = True
                    loc22.Text = Loc_List.Rows(i)("Location").ToString : loc22_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc22_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 23 Then
                    Panel23.Visible = True
                    loc23.Text = Loc_List.Rows(i)("Location").ToString : loc23_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc23_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 24 Then
                    Panel24.Visible = True
                    loc24.Text = Loc_List.Rows(i)("Location").ToString : loc24_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc24_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 25 Then
                    Panel25.Visible = True
                    loc25.Text = Loc_List.Rows(i)("Location").ToString : loc25_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc25_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 26 Then
                    Panel26.Visible = True
                    loc26.Text = Loc_List.Rows(i)("Location").ToString : loc26_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc26_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 27 Then
                    Panel27.Visible = True
                    loc27.Text = Loc_List.Rows(i)("Location").ToString : loc27_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc27_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 28 Then
                    Panel28.Visible = True
                    loc28.Text = Loc_List.Rows(i)("Location").ToString : loc28_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc28_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If


                If i = 29 Then
                    Panel29.Visible = True
                    loc29.Text = Loc_List.Rows(i)("Location").ToString : loc29_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc29_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 30 Then
                    Panel30.Visible = True
                    loc30.Text = Loc_List.Rows(i)("Location").ToString : loc30_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc30_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 31 Then
                    Panel31.Visible = True
                    loc31.Text = Loc_List.Rows(i)("Location").ToString : loc31_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc31_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 32 Then
                    Panel32.Visible = True
                    loc32.Text = Loc_List.Rows(i)("Location").ToString : loc32_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc32_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 33 Then
                    Panel33.Visible = True
                    loc33.Text = Loc_List.Rows(i)("Location").ToString : loc33_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc33_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 34 Then
                    Panel34.Visible = True
                    loc34.Text = Loc_List.Rows(i)("Location").ToString : loc34_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc34_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 35 Then
                    Panel35.Visible = True
                    loc35.Text = Loc_List.Rows(i)("Location").ToString : loc35_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc35_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 36 Then
                    Panel36.Visible = True
                    loc36.Text = Loc_List.Rows(i)("Location").ToString : loc36_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc36_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 37 Then
                    Panel37.Visible = True
                    loc37.Text = Loc_List.Rows(i)("Location").ToString : loc37_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc37_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 38 Then
                    Panel38.Visible = True
                    loc38.Text = Loc_List.Rows(i)("Location").ToString : loc38_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc38_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 39 Then
                    Panel39.Visible = True
                    loc39.Text = Loc_List.Rows(i)("Location").ToString : loc39_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc39_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 40 Then
                    Panel40.Visible = True
                    loc40.Text = Loc_List.Rows(i)("Location").ToString : loc40_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc40_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If


                If i = 41 Then
                    Panel41.Visible = True
                    loc41.Text = Loc_List.Rows(i)("Location").ToString : loc41_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc41_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 42 Then
                    Panel42.Visible = True
                    loc42.Text = Loc_List.Rows(i)("Location").ToString : loc42_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc42_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 43 Then
                    Panel43.Visible = True
                    loc43.Text = Loc_List.Rows(i)("Location").ToString : loc43_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc43_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 44 Then
                    Panel44.Visible = True
                    loc44.Text = Loc_List.Rows(i)("Location").ToString : loc44_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc44_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 45 Then
                    Panel45.Visible = True
                    loc45.Text = Loc_List.Rows(i)("Location").ToString : loc45_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc45_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 46 Then
                    Panel46.Visible = True
                    loc46.Text = Loc_List.Rows(i)("Location").ToString : loc46_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc46_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 47 Then
                    Panel47.Visible = True
                    loc47.Text = Loc_List.Rows(i)("Location").ToString : loc47_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc47_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

                If i = 48 Then
                    Panel48.Visible = True
                    loc48.Text = Loc_List.Rows(i)("Location").ToString : loc48_P.Text = Loc_List.Rows(i)("P_Cnt").ToString : loc48_Tot.Text = Loc_List.Rows(i)("Tot_Cnt").ToString
                End If

            Next
        Catch ex As Exception

        End Try
    End Sub
End Class