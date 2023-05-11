<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AutovynModules/AUTOVYN.Master" CodeBehind="Location.aspx.vb" Inherits="AutovynERP.Location" %>
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


        .navbar {
            
        }

        .date-section{
            background-color:gainsboro;
        }

        .date{
            font-size: 20px;
            font-weight: 700;
        }

        .tabs-lbl {
            background-color: cornflowerblue;
            margin: 6px 10px;
            height: 37px;
            border-radius:6px;
            color:#fff;
        }

         .status-section{
            background-color: aliceblue;
            margin: 10px 10px;
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
        .sub-head{
            padding: 7px 0;
             -webkit-box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
            -moz-box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
            box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
        }
        
        .loc-sub-head{
            padding: 7px 0;
            display: flex;
            justify-content: space-around;
        }


        .status{
            font-size: 18px;
            font-weight: 700;

        }


        .loc-box{
            height:130px;
            width :100%;
            -webkit-box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
            -moz-box-shadow: -2px 6px 15px -11px rgba(0,0,0,0.75);
            box-shadow: -2px 6px 15px -11px rgb(0 0 0 / 75%);
            border-radius: 6px;
            text-align:center;
            margin-right: 0px;
        }

        .total {
            background-color: #00a1ff;
            height: 59px;
            border-radius: 6px 6px 40px 40px;
            padding-top: 16px;
            color:#ffffff;
            font-size:18px;
            font-weight:700;
        }

        .panel{
            width:16%;
        }

        @media screen and (max-width: 827px) {
            .panel{
            width:30%;
        }
        }
        
        @media screen and (max-width: 768px) {
            .panel{
            width:30%;
        }
        }

        @media screen and (max-width: 480px) {
        .loc-box {
            height: 130px;
            width:100%;
        }
        .panel{
            width:48%;
        }

         .hide{
                width:100%;
                margin-top:10px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid main-section">
                <%-- Status Section --%>
                <div class="row status-section">
                    <div class="col-12">
                        <div class="row sub-head">
                            <div class="col-4 mt-3">
                                <asp:Label ID="Label4" runat="server" Text="STATUS" CssClass="status"></asp:Label>
                            </div>
                        </div>
                        <div class="row sub-head">
                            <%-- Calander section --%>
                            <div class="col-sm-3" style="text-align: center; margin-bottom: 8px;">
                                <asp:TextBox ID="DateLabel" CssClass="form-control" placeholder="DD/MM/YYYY" onblur="(this.type='text')" runat="server" Style="text-align: center; font-weight: 700;"></asp:TextBox>
                            </div>

                            <asp:Label ID="Label123" CssClass="col-sm-2 col-form-label" runat="server" Text="Label">Location</asp:Label>
                            <div class="col-sm-5">
                                <asp:DropDownList ID="Branch_List" CssClass="form-control" runat="server"></asp:DropDownList>
                            </div>
                            <div class="col-sm-2">
                                <asp:Button ID="Load_Location" Text="Load" runat="server" CssClass="btn btn-primary hide" />
                            </div>
                        </div>

                       <%--  --%>
                        <asp:Panel ID="Location_head" runat="server">
                            <div class="row loc-sub-head" runat="server">
                                <asp:Panel ID="Panel1" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box" runat="server">
                                        <div class="total">
                                            <asp:Label ID="loc1_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc1_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc1" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="Panel2" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc2_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc2_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc2" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="Panel3" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc3_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc3_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc3" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>

                                <asp:Panel ID="Panel4" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc4_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc4_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc4" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>

                                <asp:Panel ID="Panel5" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc5_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc5_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc5" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>

                                <asp:Panel ID="Panel6" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc6_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc6_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc6" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>


                                <asp:Panel ID="Panel7" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box" runat="server">
                                        <div class="total">
                                            <asp:Label ID="loc7_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc7_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc7" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="Panel8" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc8_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc8_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc8" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="Panel9" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc9_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc9_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc9" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>

                                <asp:Panel ID="Panel10" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc10_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc10_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc10" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>

                                <asp:Panel ID="Panel11" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc11_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc11_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc11" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>

                                <asp:Panel ID="Panel12" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc12_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc12_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc12" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>


                            </div>
                        </asp:Panel>
                        <%--  --%>
                        <asp:Panel ID="Panel13" runat="server">
                            <div class="row loc-sub-head" runat="server">
                                <asp:Panel ID="Panel14" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box" runat="server">
                                        <div class="total">
                                            <asp:Label ID="loc13_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc13_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc13" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="Panel15" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc14_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc14_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc14" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="Panel16" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc15_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc15_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc15" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>

                                <asp:Panel ID="Panel17" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc16_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc16_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc16" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>

                                <asp:Panel ID="Panel18" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc17_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc17_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc17" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>

                                <asp:Panel ID="Panel19" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc18_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc18_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc18" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>


                                <asp:Panel ID="Panel20" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box" runat="server">
                                        <div class="total">
                                            <asp:Label ID="loc19_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc19_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc19" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="Panel21" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc20_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc20_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc20" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="Panel22" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc21_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc21_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc21" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>

                                <asp:Panel ID="Panel23" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc22_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc22_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc22" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>

                                <asp:Panel ID="Panel24" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc23_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc23_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc23" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>

                                <asp:Panel ID="Panel25" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc24_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc24_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc24" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>


                            </div>
                        </asp:Panel>
                        <%--  --%>
                        <asp:Panel ID="Panel26" runat="server">
                            <div class="row loc-sub-head" runat="server">
                                <asp:Panel ID="Panel27" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box" runat="server">
                                        <div class="total">
                                            <asp:Label ID="loc25_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc25_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc25" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="Panel28" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc26_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc26_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc26" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="Panel29" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc27_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc27_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc27" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>

                                <asp:Panel ID="Panel30" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc28_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc28_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc28" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>

                                <asp:Panel ID="Panel31" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc29_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc29_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc29" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>

                                <asp:Panel ID="Panel32" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc30_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc30_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc30" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>


                                <asp:Panel ID="Panel33" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box" runat="server">
                                        <div class="total">
                                            <asp:Label ID="loc31_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc31_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc31" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="Panel34" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc32_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc32_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc32" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="Panel35" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc33_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc33_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc33" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>

                                <asp:Panel ID="Panel36" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc34_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc34_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc34" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>

                                <asp:Panel ID="Panel37" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc35_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc35_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc35" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>

                                <asp:Panel ID="Panel38" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc36_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc36_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc36" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>


                            </div>
                        </asp:Panel>
                        <%--  --%>
                        <asp:Panel ID="Panel39" runat="server">
                            <div class="row loc-sub-head" runat="server">
                                <asp:Panel ID="Panel40" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box" runat="server">
                                        <div class="total">
                                            <asp:Label ID="loc37_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc37_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc37" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="Panel41" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc38_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc38_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc38" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="Panel42" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc39_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc39_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc39" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>

                                <asp:Panel ID="Panel43" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc40_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc40_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc40" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>

                                <asp:Panel ID="Panel44" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc41_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc41_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc41" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>

                                <asp:Panel ID="Panel45" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc42_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc42_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc42" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>


                                <asp:Panel ID="Panel46" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box" runat="server">
                                        <div class="total">
                                            <asp:Label ID="loc43_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc43_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc43" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="Panel47" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc44_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc44_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc44" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="Panel48" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc45_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc45_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc45" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>

                                <asp:Panel ID="Panel49" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc46_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc46_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc46" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>

                                <asp:Panel ID="Panel50" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc47_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc47_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc47" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>

                                <asp:Panel ID="Panel51" runat="server" CssClass="panel">
                                    <div class="col-lg-2 mt-1 loc-box">
                                        <div class="total">
                                            <asp:Label ID="loc48_Tot" runat="server" Text="STATUS" CssClass=""></asp:Label>
                                        </div>
                                        <asp:Label ID="loc48_P" runat="server" Text="P" CssClass=""></asp:Label><br />
                                        <asp:Label ID="loc48" runat="server" Text="Location" CssClass=""></asp:Label>
                                    </div>
                                </asp:Panel>


                            </div>
                        </asp:Panel>



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
