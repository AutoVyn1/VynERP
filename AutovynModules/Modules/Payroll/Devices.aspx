<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AutovynModules/AUTOVYN.Master" CodeBehind="Devices.aspx.vb" Inherits="AutovynERP.Devices" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
        }

        body{
            font-size:13px;
        }

 

        .main-section{
            margin-top:60px;
        }

        .Chart-section{
            background-color: aliceblue;
            margin: 20px 10px;
            border-radius:10px;
            -webkit-box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
            -moz-box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
            box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);

            display:flex;
            justify-content:space-between;
        }


        .devstatusconn {
            background-color: antiquewhite;
            margin: 20px 10px;
            border-radius: 10px;
            -webkit-box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
            -moz-box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
            box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
            height: 130px;
            display: flex;
            justify-content: space-around;
            align-items: center;
        }

        .bg-color {
            border-radius:10px;
        }
        #Attence_Grid {
            font-size:12px;
        }
        .device_grid {
            border-bottom:1px solid #000;
        }

        .status-section{
            height:360px;
            background-color: aliceblue;
            margin: 20px 10px;
            border-radius:10px;
            -webkit-box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
            -moz-box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
            box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
        }

       

        .sub-head{
            padding: 7px 0;
             -webkit-box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
            -moz-box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
            box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
        }


        .status{
            font-size: 18px;
            font-weight: 700;
        }
        #Panel1 {
           
            height:300px;
        }

        .grid-box{
            margin:auto;
             width:500px;
        }


        @media screen and (max-width:480px) {
            .status-section {
                height: 260px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid main-section">
            <div class="row date-section">
                <div class="col-lg-12 d-flex justify-content-center">
                    <div class="row">
                        <div class="col-10 mt-2" style="text-align:center; margin-bottom:8px;">
                            <asp:TextBox ID="DateLabel" CssClass="form-control" placeholder="DD/MM/YYYY" onblur="(this.type='text')" runat="server" style="text-align: center; font-weight: 700;"></asp:TextBox>
                        </div>
                        <div class="col-2 mt-2">
                            <asp:Button ID="Load_Location" Text="Load" runat="server" CssClass="btn btn-primary hide" />
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="container-fluid">

             <div class="container-fluid">
           <div class="row d-flex justify-content-evenly">
                <div class="col-lg-5 status-section">
                    <div class="row sub-head">
                         <div class="col-12 mt-1">
                            <asp:Label ID="Label2" runat="server" Text="Status" CssClass="status"></asp:Label>
                        </div>
                    </div>
                    <div class="row Chart-section">
                        <div class="col-5 devstatusconn" >
                            <asp:Label ID="Connect" runat="server"></asp:Label>
                        </div>

                        <div class="col-5 devstatusconn">
                            <asp:Label ID="Disconnct" runat="server"></asp:Label>
                        </div>
                   </div>

                </div>

                <div class="col-lg-5 status-section">
                    <div class="row sub-head">
                        <div class="col-12 mt-1">
                            <asp:Label ID="Label4" runat="server" Text="Details" CssClass="status"></asp:Label>
                        </div>
                    </div>

                     <div class="row">
                        <div class="col-12">
                            <asp:Panel ID="Panel1" runat="server" ScrollBars="Vertical">
                                <div class="grid-box">
                                    <asp:GridView ID="Attence_Grid" RowStyle-CssClass="device_grid" runat="server"
                                        CssClass="table table-bordered table-condensed table-responsive table-hover" AutoGenerateSelectButton="false" BackColor="#336699" BorderColor="#0099ff" style="width:98%; table-layout:fixed;"
                                        BorderStyle="Solid" BorderWidth="1px">
                                        <AlternatingRowStyle BackColor="White" />
                                        <HeaderStyle BackColor="#6495ed" Font-Bold="true" Font-Size="Larger" ForeColor="White" />
                                        <RowStyle BackColor="#f5f5f5" />
                                        <HeaderStyle BackColor="#6495ed" ForeColor="WhiteSmoke" Width="100%" />
                                        <FooterStyle BackColor="#CCCCCC" />
                                        <SelectedRowStyle Font-Size="Large" />
                                        <HeaderStyle Font-Bold="True" ForeColor="White" Width="100%" />
                                        <SelectedRowStyle BackColor="#336699" Font-Bold="True" ForeColor="White" />
                                    </asp:GridView>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
     </div>
</asp:Content>
