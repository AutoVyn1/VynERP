Public Class Finance1
    Inherits System.Web.UI.Page
    Private con As New Connection
    Public dt As New DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub view_click(ByVal sender As Object, ByVal e As System.EventArgs) Handles view.Click
        loaddata()
    End Sub
    Private Sub loaddata()
        dt = con.ReturnDtTable("select * from fin_tril where custid='" + custid.Text + "'")
        loadvalues()
        submit.Visible = False
    End Sub

    Public Sub MesgBox(ByVal sMessage As String)
        Dim sb As New System.Text.StringBuilder
        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('" & sMessage & "')", True)
    End Sub

    Private Sub loadvalues()
        If dt.Rows.Count > 0 Then

            dmsinvoice.Text = dt.Rows(0)("dmsinvoice").ToString
            fileno.Text = dt.Rows(0)("fileno").ToString
            date1.Text = Convert.ToDateTime(dt.Rows(0)("date1")).ToString("MM/dd/yyyy")
            name.Text = dt.Rows(0)("name").ToString
            financierhp.Text = dt.Rows(0)("financierhp").ToString
            findoamt.Text = dt.Rows(0)("findoamt").ToString
            finchrgs.Text = dt.Rows(0)("finchrgs").ToString
            vehgroup.Text = dt.Rows(0)("vehgroup").ToString
            vehcode.Text = dt.Rows(0)("vehocode").ToString
            vin.Text = dt.Rows(0)("vin").ToString
            dmsdse.Text = dt.Rows(0)("dmsdse").ToString
            dsetl.Text = dt.Rows(0)("dsetl").ToString
            branch.Text = dt.Rows(0)("branch").ToString
            typeloan.Text = dt.Rows(0)("typeloan").ToString
            findono.Text = dt.Rows(0)("findono").ToString
            color.Text = dt.Rows(0)("color").ToString
            chassis.Text = dt.Rows(0)("chassis").ToString
            engine.Text = dt.Rows(0)("engine").ToString
            erpdse.Text = dt.Rows(0)("erpdse").ToString
            erptl.Text = dt.Rows(0)("erptl").ToString
            payoutage.Text = dt.Rows(0)("payoutage").ToString
            finpayout.Text = dt.Rows(0)("finpayout").ToString
            interest.Text = dt.Rows(0)("interest").ToString
            loanstatus.Text = dt.Rows(0)("loanstatus").ToString
            bankname.Text = dt.Rows(0)("bankname").ToString
            received.Text = dt.Rows(0)("received").ToString
            gst.Text = dt.Rows(0)("gst").ToString
            totoalfin.Text = dt.Rows(0)("totalfin").ToString
            date2.Text = Convert.ToDateTime(dt.Rows(0)("date2")).ToString("MM/dd/yyyy")
            emi.Text = dt.Rows(0)("emi").ToString
            accountno.Text = dt.Rows(0)("accountno").ToString
            credit.Text = dt.Rows(0)("credit").ToString
            Remark.Text = dt.Rows(0)("Remark").ToString
        End If
    End Sub

    Protected Sub update_click(ByVal sender As Object, ByVal e As System.EventArgs) Handles update.Click
        Try
            con.TSql("UPDATE fin_tril SET dmsinvoice='" + dmsinvoice.Text + "',fileno='" + fileno.Text + "',date1='" + date1.Text + "',name='" + name.Text + "',financierhp='" + financierhp.Text + "',findoamt='" + findoamt.Text + "',finchrgs='" + finchrgs.Text + "',vehgroup='" + vehgroup.Text + "',vehocode='" + vehcode.Text + "',vin='" + vin.Text + "',dmsdse='" + dmsdse.Text + "',dsetl='" + dsetl.Text + "',branch='" + branch.Text + "',typeloan='" + typeloan.Text + "',findono='" + findono.Text + "',color='" + color.Text + "',chassis='" + chassis.Text + "',engine='" + engine.Text + "',erpdse='" + erpdse.Text + "',erptl='" + erptl.Text + "',payoutage='" + payoutage.Text + "',finpayout='" + finpayout.Text + "',interest='" + interest.Text + "',loanstatus='" + loanstatus.Text + "',bankname='" + bankname.Text + "',received='" + received.Text + "',gst='" + gst.Text + "',totalfin='" + totoalfin.Text + "',date2='" + date2.Text + "',emi='" + emi.Text + "',accountno='" + accountno.Text + "',credit='" + credit.Text + "',Remark='" + Remark.Text + "'  where custid='" + custid.Text + "' ")
            dmsinvoice.Text = ""
            custid.Text = ""
            fileno.Text = ""
            date1.Text = ""
            name.Text = ""
            financierhp.Text = ""
            findoamt.Text = ""
            finchrgs.Text = ""
            vehgroup.Text = ""
            vehcode.Text = ""
            vin.Text = ""
            dmsdse.Text = ""
            dsetl.Text = ""
            branch.Text = ""
            typeloan.Text = ""
            findono.Text = ""
            color.Text = ""
            chassis.Text = ""
            engine.Text = ""
            erpdse.Text = ""
            erptl.Text = ""
            payoutage.Text = ""
            finpayout.Text = ""
            interest.Text = ""
            loanstatus.Text = ""
            bankname.Text = ""
            received.Text = ""
            gst.Text = ""
            totoalfin.Text = ""
            date2.Text = ""
            emi.Text = ""
            accountno.Text = ""
            credit.Text = ""
            Remark.Text = ""
            MesgBox("Update succesful")
            submit.Visible = True

        Catch ex As Exception
            MesgBox("Invalidt")
        End Try
    End Sub

    Protected Sub submit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles submit.Click
        dt = con.ReturnDtTable("select custid from fin_tril where custid='" + custid.Text + "'")
        If (dt.Rows.Count > 0) Then
            MesgBox("data already exist")
        Else
            Try

                con.TSql("INSERT INTO fin_tril VALUES('" + dmsinvoice.Text + "','" + custid.Text + "','" + fileno.Text + "','" + date1.Text + "','" + name.Text + "','" + financierhp.Text + "','" + findoamt.Text + "'
               ,'" + finchrgs.Text + "','" + vehgroup.Text + "','" + vehcode.Text + "','" + vin.Text + "','" + dmsdse.Text + "','" + dsetl.Text + "','" + branch.Text + "','" + typeloan.Text + "'
               ,'" + findono.Text + "','" + color.Text + "','" + chassis.Text + "','" + engine.Text + "','" + erpdse.Text + "','" + erptl.Text + "','" + payoutage.Text + "','" + finpayout.Text + "','" + interest.Text + "'
               ,'" + loanstatus.Text + "','" + bankname.Text + "','" + received.Text + "','" + gst.Text + "','" + totoalfin.Text + "','" + date2.Text + "','" + emi.Text + "','" + accountno.Text + "','" + credit.Text + "'
               ,'" + Remark.Text + "')")
                dmsinvoice.Text = ""
                custid.Text = ""
                fileno.Text = ""
                date1.Text = ""
                name.Text = ""
                financierhp.Text = ""
                findoamt.Text = ""
                finchrgs.Text = ""
                vehgroup.Text = ""
                vehcode.Text = ""
                vin.Text = ""
                dmsdse.Text = ""
                dsetl.Text = ""
                branch.Text = ""
                typeloan.Text = ""
                findono.Text = ""
                color.Text = ""
                chassis.Text = ""
                engine.Text = ""
                erpdse.Text = ""
                erptl.Text = ""
                payoutage.Text = ""
                finpayout.Text = ""
                interest.Text = ""
                loanstatus.Text = ""
                bankname.Text = ""
                received.Text = ""
                gst.Text = ""
                totoalfin.Text = ""
                date2.Text = ""
                emi.Text = ""
                accountno.Text = ""
                credit.Text = ""
                Remark.Text = ""
                MesgBox("Insert")

            Catch ex As Exception
                MesgBox("Invalidt")
            End Try




        End If

    End Sub
    Protected Sub clear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles clear.Click
        dmsinvoice.Text = ""
        custid.Text = ""
        fileno.Text = ""
        date1.Text = ""
        name.Text = ""
        financierhp.Text = ""
        findoamt.Text = ""
        finchrgs.Text = ""
        vehgroup.Text = ""
        vehcode.Text = ""
        vin.Text = ""
        dmsdse.Text = ""
        dsetl.Text = ""
        branch.Text = ""
        typeloan.Text = ""
        findono.Text = ""
        color.Text = ""
        chassis.Text = ""
        engine.Text = ""
        erpdse.Text = ""
        erptl.Text = ""
        payoutage.Text = ""
        finpayout.Text = ""
        interest.Text = ""
        loanstatus.Text = ""
        bankname.Text = ""
        received.Text = ""
        gst.Text = ""
        totoalfin.Text = ""
        date2.Text = ""
        emi.Text = ""
        accountno.Text = ""
        credit.Text = ""
        Remark.Text = ""
        MesgBox("Are you sure")
        submit.Visible = True
    End Sub

End Class