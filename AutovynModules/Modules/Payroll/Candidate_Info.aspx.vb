Imports System.IO

Public Class Candidate_Info
    Inherits System.Web.UI.Page
    Private con As New Connection
    Public dt As New DataTable
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            Dim url = Request.Url.AbsoluteUri
            Dim myarr = url.Split("?")
            mobile.Text = myarr(1).ToString.Replace("Mobile=", "")
        Catch ex As Exception

        End Try
    End Sub


    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles submit.Click
        If Not String.IsNullOrEmpty(Cand_code.Text) And Not String.IsNullOrEmpty(Cand_name.Text) And Not String.IsNullOrEmpty(mobile.Text) And Not String.IsNullOrEmpty(email.Text) And Not String.IsNullOrEmpty(position.Text) Then
            Try
                ' Specify the folder path where the file will be stored.
                Dim folderPath As String = Server.MapPath("~/Documents/")
                ' Get the file name.
                Dim fileName As String = Path.GetFileName(Profile_upload.FileName)
                Dim fileName1 As String = Path.GetFileName(Aadhar_Upload.FileName)
                Dim fileName2 As String = Path.GetFileName(PAN_Upload.FileName)
                Dim fileName3 As String = Path.GetFileName(Salary_Upload.FileName)
                Dim fileName4 As String = Path.GetFileName(License_Upload.FileName)
                Dim fileName5 As String = Path.GetFileName(resumeupload.FileName)



                ' If the folder doesn't exist, create it.
                If Not Directory.Exists(folderPath) Then
                    Directory.CreateDirectory(folderPath)
                End If
                ' Insert the file URL into the database.
                If Profile_upload.HasFile Then
                    Profile_upload.SaveAs(folderPath & fileName)
                    con.TSql("INSERT INTO Candidate_Doc (EMP_CODE,DOC_NAME,DOC_PATH,columndoc_type) VALUES ('" + Cand_code.Text + "','" + fileName + "','" + folderPath + "','PROFILE')")
                End If

                If Aadhar_Upload.HasFile Then
                    Aadhar_Upload.SaveAs(folderPath & fileName1)
                    con.TSql("INSERT INTO Candidate_Doc (EMP_CODE,DOC_NAME,DOC_PATH,columndoc_type) VALUES ('" + Cand_code.Text + "','" + fileName1 + "','" + folderPath + "','AADHAR')")
                End If

                If PAN_Upload.HasFile Then
                    PAN_Upload.SaveAs(folderPath & fileName2)
                    con.TSql("INSERT INTO Candidate_Doc (EMP_CODE,DOC_NAME,DOC_PATH,columndoc_type) VALUES ('" + Cand_code.Text + "','" + fileName2 + "','" + folderPath + "','PAN')")
                End If

                If Salary_Upload.HasFile Then
                    Salary_Upload.SaveAs(folderPath & fileName3)
                    con.TSql("INSERT INTO Candidate_Doc (EMP_CODE,DOC_NAME,DOC_PATH,columndoc_type) VALUES ('" + Cand_code.Text + "','" + fileName3 + "','" + folderPath + "','SALARY SLIP')")
                End If

                If License_Upload.HasFile Then
                    License_Upload.SaveAs(folderPath & fileName4)
                    con.TSql("INSERT INTO Candidate_Doc (EMP_CODE,DOC_NAME,DOC_PATH,columndoc_type) VALUES ('" + Cand_code.Text + "','" + fileName4 + "','" + folderPath + "','LICENSE')")
                End If
                If resumeupload.HasFile Then
                    resumeupload.SaveAs(folderPath & fileName5)
                    con.TSql("INSERT INTO Candidate_Doc (EMP_CODE,DOC_NAME,DOC_PATH,columndoc_type) VALUES ('" + Cand_code.Text + "','" + fileName5 + "','" + folderPath + "','RESUME')")
                End If
                'Dim fileUrl1 As String = "~/Documents/" & fileName1
                'Dim fileUrl2 As String = "~/Documents/" & fileName2
                'Dim fileUrl3 As String = "~/Documents/" & fileName3
                'Dim fileUrl4 As String = "~/Documents/" & fileName4
                Link_to_WA(mobile.Text)

            Catch ex As Exception

            End Try
            Try
                con.TSql("INSERT INTO Interview_Mst (Candidate_Code,CANDIDATE_NAME,Mobile_No,Email,Position,Location,Last_Salary,Expected_Salary,Last_Designation,Tot_Exp,Tot_Ind_Exp,Pre_Comp1,Pre_Desig1,Pre_From1,Pre_To1,Pre_Sal1,Last_Mgr_Name,Last_Mgr_Desig,Last_Mgr_Mob) 
            VALUES ('" + Cand_code.Text + "','" + Cand_name.Text + "','" + mobile.Text + "','" + email.Text + "','" + position.Text + "','" + location.Text + "','" + last_salary.Text + "','" + expected_sal.Text + "','" + last_desg.Text + "','" + total_exp.Text + "','" + industry_exp.Text + "','" + last_comp.Text + "','" + last_desgcomp.Text + "','" + last_join_date.Text + "','" + last_leav_date.Text + "','" + last_com_salary.Text + "','" + last_manager.Text + "','" + manager_desg.Text + "','" + manager_mob.Text + "')")


            Catch ex As Exception

            End Try
            MsgBox("Submit Successful")
            Response.Redirect(Request.Url.AbsoluteUri)
        Else
            Response.Write("<script>alert('Please fill the required fields');</script>")
        End If
    End Sub

    Private Sub Link_to_WA(ByVal mob As String)
        Try
            Dim candidateMSG, HRMSG As String
            candidateMSG = "Your Form Is Submitted Successfully" & vbNewLine & " Regards " & vbNewLine & " AUTOVYN"
            HRMSG = "Dear HR,
                     Candidate Name Is [" & Cand_name.Text & "] and Mobile Number is " & mobile.Text & ""
            WA_MSG = ShowMsg.Text
            WA_Mob = "91" & mobile.Text
            WAMSG()
        Catch ex As Exception

        End Try
    End Sub


    'Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
    '    Response.Redirect("candidates_list.aspx")
    'End Sub
End Class
