Public Class TrueValue1
    Inherits System.Web.UI.Page
    Private con As New Connection
    Public dt As New DataTable
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub submit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles submit.Click
        dt = con.ReturnDtTable("select custid from tv_cost where custid='" + custid.Text + "'")
        If (dt.Rows.Count > 0) Then
            MsgBox("data already exist")
        Else
            Try

                con.TSql("INSERT tv_cost VALUES('" + tvinvoice.Text + "','" + custid.Text + "','" + fileno.Text + "','" + date1.Text + "','" + custname.Text + "','" + address.Text + "','" + city.Text + "'
               ,'" + State.Text + "','" + mobile.Text + "','" + pincode.Text + "','" + pan.Text + "','" + form60.Text + "','" + gst.Text + "','" + financier.Text + "','" + typeloan.Text + "'
               ,'" + findoamt.Text + "','" + finpf.Text + "','" + findono.Text + "','" + vehreg.Text + "','" + chassis.Text + "','" + vehengine.Text + "','" + relation.Text + "','" + exchangetp.Text + "','" + modelvt.Text + "'
               ,'" + mfg.Text + "','" + km.Text + "','" + dsename.Text + "','" + evalutor.Text + "','" + remark.Text + "','" + vehgroup.Text + "','" + vehcode.Text + "','" + color.Text + "','" + dsename1.Text + "','" + chassis1.Text + "','" + engine1.Text + "')")
                tvinvoice.Text = ""
                custid.Text = ""
                fileno.Text = ""
                date1.Text = ""
                custname.Text = ""
                address.Text = ""
                city.Text = ""
                State.Text = ""
                mobile.Text = ""
                pincode.Text = ""
                pan.Text = ""
                form60.Text = ""
                gst.Text = ""
                financier.Text = ""
                typeloan.Text = ""
                findoamt.Text = ""
                finpf.Text = ""
                findono.Text = ""
                vehreg.Text = ""
                chassis.Text = ""
                vehengine.Text = ""
                relation.Text = ""
                exchangetp.Text = ""
                modelvt.Text = ""
                mfg.Text = ""
                km.Text = ""
                dsename.Text = ""
                evalutor.Text = ""
                remark.Text = ""
                vehgroup.Text = ""
                vehcode.Text = ""
                color.Text = ""
                dsename1.Text = ""
                chassis1.Text = ""
                engine1.Text = ""

                MsgBox("Insert")

            Catch ex As Exception
                MsgBox("Invalidt")
            End Try




        End If

    End Sub
    Protected Sub update_click(ByVal sender As Object, ByVal e As System.EventArgs) Handles update.Click

        Try
            con.TSql("UPDATE tv_cost SET dmsinvoice='" + tvinvoice.Text + "',fileno='" + fileno.Text + "',date1='" + date1.Text + "',custname='" + custname.Text + "',address='" + address.Text + "',city='" + city.Text + "',state='" + State.Text + "',mobile='" + mobile.Text + "',pincode='" + pincode.Text + "',pan='" + pan.Text + "',form60='" + form60.Text + "',gst='" + gst.Text + "',financier='" + financier.Text + "',typeloan='" + typeloan.Text + "',findoamt='" + findoamt.Text + "',finpf='" + finpf.Text + "',findono='" + findono.Text + "',vehreg='" + vehreg.Text + "',chassis='" + chassis.Text + "',vehengine='" + vehengine.Text + "',relation='" + relation.Text + "',exchangetp='" + exchangetp.Text + "',modelvt='" + modelvt.Text + "',mfg='" + mfg.Text + "',km='" + km.Text + "',dsename='" + dsename.Text + "',evalutor='" + evalutor.Text + "',remark='" + remark.Text + "',vehgroup='" + vehgroup.Text + "',vehcode='" + vehcode.Text + "',color='" + color.Text + "',dsename1='" + dsename1.Text + "',chassis1='" + chassis1.Text + "',engine1='" + engine1.Text + "'  where custid='" + custid.Text + "' ")
            tvinvoice.Text = ""
            custid.Text = ""
            fileno.Text = ""
            date1.Text = ""
            custname.Text = ""
            address.Text = ""
            city.Text = ""
            State.Text = ""
            mobile.Text = ""
            pincode.Text = ""
            pan.Text = ""
            form60.Text = ""
            gst.Text = ""
            financier.Text = ""
            typeloan.Text = ""
            findoamt.Text = ""
            finpf.Text = ""
            findono.Text = ""
            vehreg.Text = ""
            chassis.Text = ""
            vehengine.Text = ""
            relation.Text = ""
            exchangetp.Text = ""
            modelvt.Text = ""
            mfg.Text = ""
            km.Text = ""
            dsename.Text = ""
            evalutor.Text = ""
            remark.Text = ""
            vehgroup.Text = ""
            vehcode.Text = ""
            color.Text = ""
            dsename1.Text = ""
            chassis1.Text = ""
            engine1.Text = ""
            MsgBox("Update succesful")
            submit.Visible = True

        Catch ex As Exception
            MsgBox("Invalidt")
        End Try
    End Sub

    Protected Sub view_click(ByVal sender As Object, ByVal e As System.EventArgs) Handles view.Click

        loaddata()
    End Sub
    Private Sub loaddata()
        dt = con.ReturnDtTable("select *from tv_cost where custid='" + custid.Text + "'")
        loadvalues()
        submit.Visible = False

    End Sub
    Private Sub loadvalues()
        If dt.Rows.Count > 0 Then

            tvinvoice.Text = dt.Rows(0)("tvinvoice").ToString
            fileno.Text = dt.Rows(0)("fileno").ToString
            date1.Text = Convert.ToDateTime(dt.Rows(0)("date1")).ToString("MM/dd/yyyy")
            custname.Text = dt.Rows(0)("custname").ToString
            address.Text = dt.Rows(0)("address").ToString
            city.Text = dt.Rows(0)("city").ToString
            State.Text = dt.Rows(0)("state").ToString
            mobile.Text = dt.Rows(0)("mobile").ToString
            pincode.Text = dt.Rows(0)("pincode").ToString
            pan.Text = dt.Rows(0)("pan").ToString
            form60.Text = dt.Rows(0)("form60").ToString
            gst.Text = dt.Rows(0)("gst").ToString
            financier.Text = dt.Rows(0)("financier").ToString
            typeloan.Text = dt.Rows(0)("typeloan").ToString
            findoamt.Text = dt.Rows(0)("findoamt").ToString
            finpf.Text = dt.Rows(0)("finpf").ToString
            findono.Text = dt.Rows(0)("findono").ToString
            vehreg.Text = dt.Rows(0)("vehreg").ToString
            chassis.Text = dt.Rows(0)("chassis").ToString
            vehengine.Text = dt.Rows(0)("vehengine").ToString
            relation.Text = dt.Rows(0)("relation").ToString
            exchangetp.Text = dt.Rows(0)("exchangetp").ToString
            modelvt.Text = dt.Rows(0)("modelvt").ToString
            mfg.Text = dt.Rows(0)("mfg").ToString
            km.Text = dt.Rows(0)("km").ToString
            dsename.Text = dt.Rows(0)("dsename").ToString
            evalutor.Text = dt.Rows(0)("evalutor").ToString
            remark.Text = dt.Rows(0)("remark").ToString
            vehgroup.Text = dt.Rows(0)("vehgroup").ToString
            vehcode.Text = dt.Rows(0)("vehcode").ToString
            color.Text = dt.Rows(0)("color").ToString
            dsename1.Text = dt.Rows(0)("dsename1").ToString
            chassis1.Text = dt.Rows(0)("chassis1").ToString
            engine1.Text = dt.Rows(0)("engine1").ToString

        End If
    End Sub
    Protected Sub clear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles clear.Click
        tvinvoice.Text = ""
        custid.Text = ""
        fileno.Text = ""
        date1.Text = ""
        custname.Text = ""
        address.Text = ""
        city.Text = ""
        State.Text = ""
        mobile.Text = ""
        pincode.Text = ""
        pan.Text = ""
        form60.Text = ""
        gst.Text = ""
        financier.Text = ""
        typeloan.Text = ""
        findoamt.Text = ""
        finpf.Text = ""
        findono.Text = ""
        vehreg.Text = ""
        chassis.Text = ""
        vehengine.Text = ""
        relation.Text = ""
        exchangetp.Text = ""
        modelvt.Text = ""
        mfg.Text = ""
        km.Text = ""
        dsename.Text = ""
        evalutor.Text = ""
        remark.Text = ""
        vehgroup.Text = ""
        vehcode.Text = ""
        color.Text = ""
        dsename1.Text = ""
        chassis1.Text = ""
        engine1.Text = ""
        MsgBox("Are you sure")
        submit.Visible = True
    End Sub

End Class


