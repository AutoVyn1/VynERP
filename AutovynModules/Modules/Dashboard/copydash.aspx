<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AutovynModules/AUTOVYN.Master" CodeBehind="copydash.aspx.vb"  Inherits="AutovynERP.copydash" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <%-- Local style --%>
	<link rel="stylesheet" href="../../CSS/Dashboard.css" />
	<%-- Local style --%>

	<%-- Jquery and bootstrap Alert --%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<%-- Jquery and bootstrap Alert --%>

	<%-- Sweet Alert --%>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<%-- Sweet Alert --%>

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

	<%-- Apex charts --%>
	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
	<%-- Apex charts --%>

    <%-- virtual select link --%>
	<script type="text/javascript" src="../../JS/ListSelect/virtual-select.min.js"></script>
	<link rel="stylesheet" href="../../JS/ListSelect/virtual-select.min.css" />
	<%-- virtual select link --%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid main-section">
        <%-- Status Section --%>
        <div class="row status-section">
            <div class="col-12">
         <div class="row sub-head">
                  
                    <%--  <asp:Label ID="Label5" CssClass="col-sm-1 col-form-label" runat="server" Text="Branch"></asp:Label>
                  <div class="col-sm-2">
                        <asp:DropDownList ID="branch_list" CssClass="form-control" runat="server">
                        </asp:DropDownList>
                    </div>--%>

                    <asp:Label ID="Label2" CssClass="col-sm-1 col-form-label" runat="server" Text="Date From"></asp:Label>
                    <div class="col-sm-1">
                        <asp:TextBox ID="Year_From" CssClass="form-control" runat="server" MaxLength="4" onchange="compareDates()" placeholder="YYYY"></asp:TextBox>
                    </div>

                    <asp:Label ID="Label1" CssClass="col-sm-1 col-form-label" runat="server" Text="Date To"></asp:Label>
                    <div class="col-sm-1">
                        <asp:TextBox ID="Year_To" CssClass="form-control" runat="server" MaxLength="4" onchange="compareDates()" placeholder="YYYY"></asp:TextBox>
                    </div>

                   <asp:Label ID="Label3" CssClass="col-sm-1 col-form-label" runat="server" Text="Group"></asp:Label>
                    <div class="col-sm-2">
                       <asp:DropDownList ID="grp_name" CssClass="form-control" runat="server">
                           <asp:ListItem Value="1">Profit Chart</asp:ListItem>
                           
                        </asp:DropDownList>
                    </div>

                    <div class="col-sm-2">
                        <asp:Button ID="Load_Location" Text="Load" runat="server" CssClass="btn view" />
                    </div>

                </div>
                    <div id="wrapper" class="blur_effect" >
      <div class="content-area">
        <div class="container-fluid">
        
          <div class="main">
            <div class="row sparkboxes mt-4 mb-4">
                 <div class="col-md-4">
                <div class="box box3">
                  <div id="spark3"></div>
                </div>
              </div>
              <div class="col-md-4">
                <div class="box box1">
                  <div id="spark1"></div>
                </div>
              </div>
              <div class="col-md-4">
                <div class="box box2">
                  <div id="spark2"></div>
                </div>
              </div>
             
            </div>

            <div class="row mt-5 mb-4">
                <div class="col-md-7">
                <div class="box">
                  <div id="area"></div>
                </div>
              </div>
             
              <div class="col-md-5">
                <div class="box">
                  <div id="donut"></div>
                </div>
              </div>
            </div>

            <div class="row mt-4 mb-4">
                 <div class="col-md-12">
                <div class="box">
                  <div id="bar"></div>
                </div>
              </div>
              <%--<div class="col-md-4">
                <div class="box">
                  <div id="line"></div>
                </div>
              </div>--%>
            </div>
          </div>
        </div>
     
         
        
            </div>

        </div>

     </div>
            </div>
        </div>
    



</asp:Content>



