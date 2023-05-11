<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AutovynModules/AUTOVYN.Master" CodeBehind="InsuranceData.aspx.vb" Inherits="AutovynERP.InsuranceData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<style>
        
		*{
            margin:0;
            padding:0;
            font-family: 'Dosis', sans-serif;
            scrollbar-width: thin;
            scrollbar-color: #397524 #DFE9EB;
        }

        body{
            font-size: 13px;
            background-image:url()
        }

        .main-section{
            margin-top:70px;
        }


        ::-webkit-scrollbar {
            display: none;
        }
	    /* Modal */
	    .modal {
	        display: none; /* Hidden by default */
	        position: fixed; /* Stay in place */
	        z-index: 1; /* Sit on top */
	        left: 0;
	        top: 0;
	        width: 100%; /* Full width */
	        height: 100%; /* Full height */
	        overflow: auto; /* Enable scroll if needed */
	        background-color: rgba(0, 0, 0, 0.6); /* Black w/ opacity */
	    }

	    /* Modal Content/Box */
	    .modal-content {
	        background-color: #fefefe;
	        margin: 15% auto; /* 15% from the top and centered */
	        padding: 20px;
	        border: 1px solid #888;
	        width: 80%; /* Could be more or less, depending on screen size */
	    }

	    /* Close Button */
	    .close {
	        color: #aaaaaa;
	        float: right;
	        font-size: 28px;
	        font-weight: bold;
	    }

	        .close:hover,
	        .close:focus {
	            color: #000;
	            text-decoration: none;
	            cursor: pointer;
	        }
		
		.my-class td{
			padding: 0 5px;
		}

		



    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="container-fluid main-section">
        <div class="row">
            <div class="row text-center text-bold ">
                    <div class="title">
                        <h5>DSE Insurance Response</h5>
                    </div>
                </div>
            <div class="container-fluid">
                    <div class="row mt-1 mb-1 amt-box">

                        <asp:Label ID="Label1" Class="col-2 col-form-label amt-box-lbl" runat="server" Text="Customer Name/Location/Number"></asp:Label>
                        <div class="col-lg-3  amt-box-total">
                            <asp:TextBox ID="searchbox" Class="col-2 form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="col-lg-1 amt-box-total-1">
                            <asp:Button ID="search" Class="btn" runat="server" Text="Filter" />
                        </div>

                        <div class="col-lg-1 amt-box-total-1">
                            <asp:Button ID="viewall" Class="btn" runat="server" Text="viewall" />
                        </div>

                    </div>
                </div>

            <div class="col-12">
                <div class="gridView">

					<div id="myModal" class="modal">
						<div class="modal-content">
							<span class="close">Receipt Image</span>
							
							<asp:Image ID="Image1" runat="server" />
						</div>
					</div>

					<asp:Panel ID="Panel1" CssClass="grid_panel" ScrollBars="Horizontal" runat="server">
                         <asp:GridView ID="Data_Grid" runat="server" Style="top: 0px; border: 1px solid #6fd472; text-align: center; border-collapse: inherit; background-color: hsla(40deg, 4%, 36%, 0.35); position: relative; width: 100%; table-layout: auto;"
                            ShowHeaderWhenEmpty="True" CellPadding="3" BackColor="White" RowStyle-CssClass="my-class" PagerStyle-CssClass="myPagerStyle" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1">
							 <Columns>
                                 <asp:CommandField ShowSelectButton="True" HeaderText="View Receipt" ButtonType="Image" SelectImageUrl="https://png.pngtree.com/png-clipart/20191027/ourmid/pngtree-view-icon-png-image_1869829.jpg" SelectText="View Receipt">
                                    <ControlStyle Width="20px" />
                                    <ItemStyle HorizontalAlign="center" CssClass="ms-3 " VerticalAlign="Middle" Width="80px" />
                                </asp:CommandField>
							 </Columns>
                             
                            <AlternatingRowStyle BackColor="White" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="true" Font-Size="Larger" ForeColor="White" />
                            <RowStyle BackColor="#f5f5f5" />
                            <HeaderStyle BackColor="#0C4160" ForeColor="WhiteSmoke" Width="100%" />
                             
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle Font-Bold="True" ForeColor="White" Width="100%" />
                            <PagerSettings FirstPageText="1" LastPageText="last" NextPageText="next" PreviousPageText="previous" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
						
                        </asp:GridView>
                    
                    </asp:Panel>
                </div>
            </div>
        </div>

         
    </div>

    <script>
		// Get the modal
		var modal = document.getElementById("ContentPLaceHolder1_myModal");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks on a row in the grid, show the modal
		function showGridModal() {
			modal.style.display = "block";
		}

		// When the user clicks on <span> (x), close the modal
		span.onclick = function () {
			modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function (event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}

	</script>

		<%-- Function for allowing only numbers and length of numbers --%>
<script>    
	
	function Onlynumber(event) {
		var charCode = (event.which) ? event.which : event.keyCode;
		if (charCode > 31 && (charCode < 48 || charCode > 57)) {
			event.preventDefault();
		}
	}

	function addSuffix(event) {
		var value = document.getElementById("ContentPlaceHolder1_InsuranceAmt").value;
		if (!value.endsWith(".00")) {
			document.getElementById("ContentPlaceHolder1_InsuranceAmt").value = value + ".00";
		}
	}

	var insuamount = document.getElementById("ContentPlaceHolder1_InsuranceAmt");

	if (custMobile.addEventListener) {
		custMobile.addEventListener("keypress", restrictInput);
	} else if (custMobile.attachEvent) {
		custMobile.attachEvent("onkeypress", restrictInput);
	}

	if (insuamount.addEventListener) {
		insuamount.addEventListener("keypress", Onlynumber);
		insuamount.addEventListener("blur", addSuffix);
	} else if (insuamount.attachEvent) {
		insuamount.attachEvent("onkeypress", Onlynumber);
		insuamount.attachEvent("onblur", addSuffix);
	}
</script>
</asp:Content>
