<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AutovynModules/AUTOVYN.Master" CodeBehind="BankAPI.aspx.vb" Inherits="AutovynERP.BankAPI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Dosis', sans-serif;
        }

         body {
            font-family: sans-serif;
            background-image: url("../../Media/loginbg.svg");
        }


        #ViewStatement {
            position: relative;
            top: 6px;
        }

        #Bank_Narr {
            font-weight: bold;
            color: #000;
            text-align: left;
        }

        #PrintBtn {
            width: 10%;
        }

        #CancelBtn {
            width: 10%;
        }

        .new-container {
            background-color: hsla(40deg, 4%, 36%, 0.3);
            padding: 2rem 3rem;
            border: none;
            width: 60%;
        }

        @media screen and (max-width:480px) {
            #Bank_Narr {
                font-weight: bold;
                color: #000;
                text-align: left;
                font-size: 12px;
            }

            #PrintBtn {
                width: 40%;
            }

            #CancelBtn {
                width: 40%;
            }

            .new-container {
                width: 100%;
            }

            body {
                max-width: 100%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row text-center mt-3">
            <h2>Bank Statement View</h2>
        </div>
        <div class="row d-flex justify-content-center">
            <div class="mt-4 aos-init aos-animate new-container" style="border-radius: 10px;">
                <div class="hide d-flex justify-content-center" id="showhide" runat="server">
                    <div class="col-sm-11 " style="color: #fff;">
                        <div class="row" style="border-radius: 7px 7px 0px 0;">
                            <div class="col mt-2">
                                <asp:Label ID="Label10" CssClass="justify-content-lg-start" Style="color: #000;" runat="server" Text="Search By"></asp:Label>
                                <asp:DropDownList ID="SearchBy" CssClass="col-8 justify-content-lg-start border-0 form-control" runat="server">
                                    <asp:ListItem>NEFT</asp:ListItem>
                                    <asp:ListItem>RTGS</asp:ListItem>
                                    <asp:ListItem>IMPS</asp:ListItem>
                                    <asp:ListItem>CMS</asp:ListItem>
                                    <asp:ListItem>Other</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col mt-2 ">
                                <asp:Label ID="Label12" CssClass="justify-content-lg-start " Style="color: #000;" runat="server" Text="Parameter"></asp:Label>
                                <asp:TextBox ID="UTRNo" CssClass=" border-0 form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col mt-2 justify-content-lg-start">
                                <asp:Label ID="Label14" CssClass="" Style="color: #000;" runat="server" Text="Amount"></asp:Label>
                                <asp:TextBox ID="Amt" CssClass=" border-0 form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col mt-4 justify-content-lg-start">
                                <asp:ImageButton ID="ViewStatement" class=" justify-content-lg-start mt-3" ImageUrl="~/AutovynModules/Media/icons8-search-64.png" runat="server" Width="23" />
                            </div>

                        </div>
                        <div class="row mt-2 " style="background-color: midnightblue; border-radius: 7px 7px 0px 0;">
                            <div class="col-3 d-flex justify-content-lg-start ">
                                <asp:Label ID="Label7" CssClass="" Style="color: #fff;" runat="server" Text="BANK NAME "></asp:Label>
                            </div>
                            <div class="col-2 d-flex justify-content-lg-end">
                                <asp:Label ID="Label1" Style="font-weight: bold; color: white;" runat="server" Text=":"></asp:Label>
                            </div>
                            <asp:Label ID="BnkName" CssClass="col-7 d-flex justify-content-lg-start" Style="font-weight: bold; color: #fff;" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="row text-center ">
                            <asp:Label ID="StmtView" Style="color: #000;" runat="server"></asp:Label>
                        </div>
                        <div class="row mt-2 ">
                            <div class="col-3 d-flex justify-content-lg-start ">
                                <asp:Label ID="Label2" CssClass=" d-flex justify-content-lg-start" runat="server" Style="color: #000;" Text="TRANSACTION ID"></asp:Label>
                            </div>
                            <div class="col-2 d-flex justify-content-lg-end">
                                <asp:Label ID="Label11" Style="font-weight: bold; color: black;" runat="server" Text=":"></asp:Label>
                            </div>
                            <asp:Label ID="Trans_ID" CssClass="col-7" Style="font-weight: bold; color: black; text-align: left;" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="row mt-2 ">
                            <div class="col-3 d-flex justify-content-lg-start ">
                                <asp:Label ID="Label3" runat="server" Style="color: #000; text-align: left;" Text="TRANSACTION DATE"></asp:Label>
                            </div>
                            <div class="col-2 d-flex justify-content-lg-end">
                                <asp:Label ID="Label13" Style="font-weight: bold; color: black;" runat="server" Text=":"></asp:Label>
                            </div>
                            <asp:Label ID="Trans_Date" CssClass="col-7" Style="font-weight: bold; color: #000; text-align: left;" Text="" runat="server"></asp:Label>
                        </div>
                        <div class="row mt-2 ">
                            <div class="col-3 d-flex justify-content-lg-start ">
                                <asp:Label ID="Label4" runat="server" Style="color: #000; text-align: left;" Text="CHEQUE NO."></asp:Label>
                            </div>
                            <div class="col-2 d-flex justify-content-lg-end">
                                <asp:Label ID="Label16" Style="font-weight: bold; color: black;" runat="server" Text=":"></asp:Label>
                            </div>
                            <asp:Label ID="Chq_No" CssClass="col-7" Style="font-weight: bold; color: #000; text-align: left;" Text="" runat="server"></asp:Label>
                        </div>
                        <div class="row mt-2 ">
                            <div class="col-3 d-flex justify-content-lg-start ">
                                <asp:Label ID="Label5" runat="server" Style="color: #000; text-align: left;" Text="AMOUNT"></asp:Label>
                            </div>
                            <div class="col-2 d-flex justify-content-lg-end">
                                <asp:Label ID="Label15" Style="font-weight: bold; color: black;" runat="server" Text=":"></asp:Label>
                            </div>
                            <asp:Label ID="Dbt_Amt" CssClass="col-7" Style="font-weight: bold; color: #000; text-align: left;" Text="" runat="server"></asp:Label>
                        </div>
                        <div class="row mt-2 ">
                            <div class="col-3 d-flex justify-content-lg-start ">
                                <asp:Label ID="Label6" CssClass="col-5" runat="server" Style="color: #000; text-align: left;" Text="NARRATION"></asp:Label>
                            </div>
                            <div class="col-2 d-flex justify-content-lg-end">
                                <asp:Label ID="Label17" Style="font-weight: bold; color: black;" runat="server" Text=":"></asp:Label>
                            </div>
                            <asp:Label ID="Bank_Narr" CssClass="col-7" Style="font-weight: bold; color: #000; text-align: left;" Text="" runat="server"></asp:Label>
                        </div>
                        <div class="row mt-2 " style="background-color: midnightblue; border-radius: 0px 0 7px 7px;">
                            <div class="col-3 d-flex justify-content-lg-start ">
                                <asp:Label ID="Label8" runat="server" Style="color: #fff;" Text="User Remark -"></asp:Label>
                            </div>
                            <div class="col-2 d-flex justify-content-lg-end">
                                <asp:Label ID="Label18" Style="font-weight: bold; color: black;" runat="server" Text=":"></asp:Label>
                            </div>
                            <asp:Label ID="Label9" CssClass="col-7" ValidateRequestMode="Enabled" Text="(Remark Length Should be between 20 to 200 Char)" Style="font-size: 14px;" runat="server"></asp:Label>
                        </div>
                        <div class="row mt-2">
                            <asp:TextBox ID="Remark" CssClass="col-12 form-control" Style="height: 50px;" runat="server" Text="" AutoPostBack="True"></asp:TextBox>
                            <asp:Label ID="RemarksMSG" Style="color: #000;" runat="server"></asp:Label>
                        </div>
                        <div class="row mt-2" style="display: flex; justify-content: space-between;">
                            <asp:Button ID="PrintBtn" CssClass="btn btn-primary" runat="server" OnClientClick="PrintPage()" Text="Print" />
                            <asp:Button ID="CancelBtn" CssClass="btn btn-danger" data-bs-dismiss="modal" runat="server" Text="Cancel" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
