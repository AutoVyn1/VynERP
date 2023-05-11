<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AutovynModules/AUTOVYN.Master" CodeBehind="Home.aspx.vb" Inherits="AutovynERP.Home" %>
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

        .date-section {
            background-color: gainsboro;
        }

        .date {
            font-size: 20px;
            font-weight: 700;
        }

        .tabs-lbl {
            background-color: cornflowerblue;
            margin: 6px 10px;
            height: 37px;
            border-radius: 6px;
            color: #fff;
        }

        #Attence_Grid {
            font-size: 12px;
        }

        .device_grid {
            border:none;
        }


        .chart-section {
            height: 200px;
            margin: 20px 10px;
            
        }

        .status-section {
            height: 460px;
            margin: 20px 10px;
            border-radius: 10px;
            -webkit-box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
            -moz-box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
            box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
        }


        .sub-head {
            padding: 7px 0;
            -webkit-box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
            -moz-box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
            box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
            background-color: aliceblue;
        }


        .status {
            font-size: 18px;
            font-weight: 700;
        }

        #P_Cnt {
            font-size:13px;
        }
        #emp_branch {
            font-size:12px;
        }

         #Panel1 {
           
            height:410px;
        }
        #Location_Grid {
            font-size:10px;
        }
        </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid main-section">
            <%-- Calander section --%>
            <div class="row date-section">
                <div class="col-lg-12 d-flex justify-content-center">
                    <div class="row">
                        <div class="col-12 mt-2" style="text-align:center; margin-bottom:8px;">
                            <asp:TextBox ID="DateLabel" CssClass="form-control" placeholder="DD/MM/YYYY" onblur="(this.type='text')" runat="server" style="text-align: center; font-weight: 700;"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>

            <%-- tabs section --%>
            <div class="row mb-1 mt-2">
                <asp:Label ID="Label123" CssClass="col-sm-2 col-form-label" runat="server" Text="Label">Group</asp:Label>
                 <div class="col-sm-3">
                    <asp:DropDownList ID="Group" CssClass="form-control" runat="server"></asp:DropDownList>
                 </div>

                <asp:Label ID="Label6" CssClass="col-sm-2 col-form-label" runat="server" Text="Label">Location</asp:Label>
                 <div class="col-sm-5">
                     <asp:DropDownList ID="Location" runat="server" CssClass="form-control"></asp:DropDownList>
                 </div>
            </div>
            <div class="row mb-1 mt-2">

                <asp:Label ID="Label3" CssClass="col-sm-2 col-form-label" runat="server" Text="Label">Department</asp:Label>
                 <div class="col-sm-3">
                 <asp:DropDownList ID="Department" runat="server" CssClass="form-control"></asp:DropDownList>
                 </div>
                 <div class="col-sm-1">
                        <asp:Button ID="Load_Location" Text="Load" runat="server" CssClass="btn btn-primary hide" />
                 </div>

           </div>

        <%-- section --%>
        <div class="row d-flex justify-content-evenly">
            <div class="col-lg-5 status-section">
                 <div class="row sub-head">
                    <div class="col-12 mt-1">
                        <asp:Label ID="Label5" runat="server" Text="CHART" CssClass="status"></asp:Label>
                    </div>
                </div>

                <div class="row mt-2">
                    <div class="col-sm-8">
                        <asp:Panel ID="GetChart" runat="server">
                            <asp:Chart runat="server" ID="Attendance_Summary" ImageStorageMode="UseImageLocation" CssClass="chart" Width="435px" Height="400px" BackGradientStyle="LeftRight">
                                <Titles>
                                    <asp:Title ShadowOffset="10" Name="Items" />
                                </Titles>
                                <Legends>
                                    <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"
                                        LegendStyle="Row" />
                                </Legends>
                                <Series>
                                    <asp:Series Name="Series1" ChartType="Pie" XValueMember="0" YValueMembers="1" LabelForeColor="White" IsValueShownAsLabel="true"></asp:Series>
                                </Series>

                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1">
                                        <AxisX>
                                            <MajorGrid Enabled="false" />
                                        </AxisX>
                                        <AxisY>
                                            <MajorGrid Enabled="false" />
                                        </AxisY>
                                    </asp:ChartArea>
                                </ChartAreas>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea2"></asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>
                        </asp:Panel>
                    </div>


                    <div class="col-sm-4">
                        <div class="row">
                            <asp:Label ID="A_cnt" runat="server"></asp:Label>

                            <asp:Label ID="HLF_cnt" runat="server"></asp:Label>

                            <asp:Label ID="HWO_Cnt" runat="server"></asp:Label>
                            
                            <asp:Label ID="P_cnt" runat="server"></asp:Label>


                            <asp:Label ID="P1_cnt" runat="server"></asp:Label>

                            <asp:Label ID="P15_cnt" runat="server"></asp:Label>

                            <asp:Label ID="P2_cnt" runat="server"></asp:Label>

                            <asp:Label ID="Wo_cnt" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>


            <%-- Status Section --%>
            <div class="col-lg-5 status-section">
                <div class="row sub-head">
                    <div class="col-12 mt-1">
                        <asp:Label ID="Label4" runat="server" Text="STATUS" CssClass="status"></asp:Label>
                    </div>
                </div>

               <div class="row">
                        <div class="col-12">
                            <asp:Panel ID="Panel1" runat="server" ScrollBars="Vertical">
                                <div class="grid-box">
                                    <asp:GridView ID="Location_Grid" RowStyle-CssClass="device_grid" runat="server"
                                        CssClass="table table-condensed table-responsive table-hover" AutoGenerateSelectButton="false" BackColor="#336699" BorderColor="#0099ff" style="width:98%; table-layout:fixed;"
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

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/inputmask/inputmask.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/inputmask/inputmask.date.extensions.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/inputmask/inputmask.extensions.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/css/inputmask.css" />

<script>
    $(function () {
        var inputmask = new Inputmask("99/99/9999", { placeholder: 'dd/mm/yyyy' });
        inputmask.mask($('[id*=DateLabel]'));
    });
</script>

</asp:Content>
