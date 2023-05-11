Public Class Exchange1
    Inherits System.Web.UI.Page
    Private con As New Connection
    Public dt As New DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub Submit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles submit.Click
        dt = con.ReturnDtTable("select custid from exch_vehicle where custid='" + custid.Text + "'")
        If (dt.Rows.Count > 0) Then
            MsgBox("data already exist")
        Else
            Try
                con.TSql("INSERT INTO exch_vehicle VALUES('" + dmsinvoice.Text + "','" + custid.Text + "','" + fileno.Text + "','" + date1.Text + "','" + vehregno.Text + "','" + chassisno.Text + "','" + engineno.Text + "'
               ,'" + relation.Text + "','" + exchtype.Text + "','" + evalutor.Text + "','" + custname.Text + "','" + custidd.Text + "','" + pan.Text + "','" + modvariant.Text + "','" + mfyear.Text + "'
               ,'" + km.Text + "','" + puramount.Text + "','" + exchamount.Text + "','" + loanpaid.Text + "','" + thirdpartyin.Text + "','" + netamount.Text + "','" + acttvno.Text + "','" + tvrecdate.Text + "','" + amtt.Text + "'
               ,'" + refcost.Text + "','" + actrefcosst.Text + "','" + remark.Text + "')")
                dmsinvoice.Text = ""
                custid.Text = ""
                fileno.Text = ""
                date1.Text = ""
                vehregno.Text = ""
                chassisno.Text = ""
                engineno.Text = ""
                relation.Text = ""
                exchtype.Text = ""
                evalutor.Text = ""
                custname.Text = ""
                custidd.Text = ""
                pan.Text = ""
                modvariant.Text = ""
                mfyear.Text = ""
                km.Text = ""
                puramount.Text = ""
                exchamount.Text = ""
                loanpaid.Text = ""
                thirdpartyin.Text = ""
                netamount.Text = ""
                acttvno.Text = ""
                tvrecdate.Text = ""
                amtt.Text = ""
                refcost.Text = ""
                actrefcosst.Text = ""
                remark.Text = ""

                MsgBox("Insert")

            Catch ex As Exception
                MsgBox("Invalidt")
            End Try
        End If

    End Sub
    Protected Sub Update_click(ByVal sender As Object, ByVal e As System.EventArgs) Handles update.Click
        Try
            con.TSql("UPDATE exch_vehicle SET dmsinvoice='" + dmsinvoice.Text + "',fileno='" + fileno.Text + "',date1='" + date1.Text + "',vehregno='" + vehregno.Text + "',chassisno='" + chassisno.Text + "',engineno='" + engineno.Text + "',relation='" + relation.Text + "',exchtype='" + exchtype.Text + "',evalutor='" + evalutor.Text + "',custname='" + custname.Text + "',custidd='" + custidd.Text + "',pan='" + pan.Text + "',modvariant='" + modvariant.Text + "',mfyear='" + mfyear.Text + "',km='" + km.Text + "',pur_amount='" + puramount.Text + "',exch_amount='" + exchamount.Text + "',loanpaid='" + loanpaid.Text + "',thirdpartyin='" + thirdpartyin.Text + "',netamount='" + netamount.Text + "',acttvno='" + acttvno.Text + "',tvrecdate='" + tvrecdate.Text + "',amtt='" + amtt.Text + "',refcost='" + refcost.Text + "',actrefcosst='" + actrefcosst.Text + "',remark='" + remark.Text + "'  where custid='" + custid.Text + "' ")
            dmsinvoice.Text = ""
            custid.Text = ""
            fileno.Text = ""
            date1.Text = ""
            vehregno.Text = ""
            chassisno.Text = ""
            engineno.Text = ""
            relation.Text = ""
            exchtype.Text = ""
            evalutor.Text = ""
            custname.Text = ""
            custidd.Text = ""
            pan.Text = ""
            modvariant.Text = ""
            mfyear.Text = ""
            km.Text = ""
            puramount.Text = ""
            exchamount.Text = ""
            loanpaid.Text = ""
            thirdpartyin.Text = ""
            netamount.Text = ""
            acttvno.Text = ""
            tvrecdate.Text = ""
            amtt.Text = ""
            refcost.Text = ""
            actrefcosst.Text = ""
            remark.Text = ""
            MsgBox("Update succesful")
            submit.Visible = True
        Catch ex As Exception
            MsgBox("Invalidt")
        End Try
    End Sub

    Protected Sub View_click(ByVal sender As Object, ByVal e As System.EventArgs) Handles view.Click
        Loaddata()
    End Sub
    Private Sub Loaddata()
        dt = con.ReturnDtTable("select *from exch_vehicle where custid='" + custid.Text + "'")
        Loadvalues()
        submit.Visible = False

    End Sub
    Private Sub Loadvalues()
        If dt.Rows.Count > 0 Then
            dmsinvoice.Text = dt.Rows(0)("dmsinvoice").ToString
            fileno.Text = dt.Rows(0)("fileno").ToString
            date1.Text = Convert.ToDateTime(dt.Rows(0)("date1")).ToString("MM/dd/yyyy")
            vehregno.Text = dt.Rows(0)("vehregno").ToString
            chassisno.Text = dt.Rows(0)("chassisno").ToString
            engineno.Text = dt.Rows(0)("engineno").ToString
            relation.Text = dt.Rows(0)("relation").ToString
            exchtype.Text = dt.Rows(0)("exchtype").ToString
            evalutor.Text = dt.Rows(0)("evalutor").ToString
            custname.Text = dt.Rows(0)("custname").ToString
            custidd.Text = dt.Rows(0)("pan").ToString
            pan.Text = dt.Rows(0)("pan").ToString
            modvariant.Text = dt.Rows(0)("modvariant").ToString
            mfyear.Text = dt.Rows(0)("mfyear").ToString
            km.Text = dt.Rows(0)("km").ToString
            puramount.Text = dt.Rows(0)("pur_amount").ToString
            exchamount.Text = dt.Rows(0)("exch_amount").ToString
            loanpaid.Text = dt.Rows(0)("loanpaid").ToString
            thirdpartyin.Text = dt.Rows(0)("thirdpartyin").ToString
            netamount.Text = dt.Rows(0)("netamount").ToString
            acttvno.Text = dt.Rows(0)("acttvno").ToString
            tvrecdate.Text = Convert.ToDateTime(dt.Rows(0)("tvrecdate")).ToString("MM/dd/yyyy")
            amtt.Text = dt.Rows(0)("amtt").ToString
            refcost.Text = dt.Rows(0)("refcost").ToString
            actrefcosst.Text = dt.Rows(0)("actrefcosst").ToString
            remark.Text = dt.Rows(0)("remark").ToString

        End If
    End Sub
    Protected Sub Clear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Clear.Click
        dmsinvoice.Text = ""
        custid.Text = ""
        fileno.Text = ""
        date1.Text = ""
        vehregno.Text = ""
        chassisno.Text = ""
        engineno.Text = ""
        relation.Text = ""
        exchtype.Text = ""
        evalutor.Text = ""
        custname.Text = ""
        custidd.Text = ""
        pan.Text = ""
        modvariant.Text = ""
        mfyear.Text = ""
        km.Text = ""
        puramount.Text = ""
        exchamount.Text = ""
        loanpaid.Text = ""
        thirdpartyin.Text = ""
        netamount.Text = ""
        acttvno.Text = ""
        tvrecdate.Text = ""
        amtt.Text = ""
        refcost.Text = ""
        actrefcosst.Text = ""
        remark.Text = ""
        MsgBox("Are you sure")
        submit.Visible = True
    End Sub
End Class