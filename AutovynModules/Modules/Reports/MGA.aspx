

<%@ Page Title="MGA" Language="vb" AutoEventWireup="false" MasterPageFile="~/AutovynModules/AUTOVYN.Master" CodeBehind="MGA.aspx.vb"  Inherits="AutovynERP.MGA" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../CSS/reports.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid main-section">
        <%-- Status Section --%>
        <div class="row status-section">
            <div class="col-12">
                <div class="row sub-head">
                    <div class="col-3 mt-1">
                        <asp:Label ID="Label4" runat="server" Text="GROUP LEVEL STATUS" CssClass="status"></asp:Label>
                    </div>

                    <asp:Label ID="Label2" CssClass="col-sm-1 col-form-label" runat="server" Text="Year From"></asp:Label>
                    <div class="col-sm-1">
                        <asp:TextBox ID="Year_From" CssClass="form-control" maxlength="4" placeholder="YYYY" onchange="compareDates()" runat="server"></asp:TextBox>
                    </div>

                    <asp:Label ID="Label1" CssClass="col-sm-1 col-form-label" runat="server" Text="Year To"></asp:Label>
                    <div class="col-sm-1">
                        <asp:TextBox ID="Year_To" CssClass="form-control" MaxLength="4"  placeholder="YYYY" onchange="compareDates()" runat="server"></asp:TextBox>
                    </div>

<%--                    <asp:Label ID="Label3" CssClass="col-sm-1 col-form-label" runat="server" Text="Report"></asp:Label>--%>
                    <div class="col-sm-2" style="display:none;">
                        <asp:DropDownList ID="appr_status" CssClass="form-control" runat="server">
                            <asp:ListItem>select</asp:ListItem>
                            <asp:ListItem Value="L" Selected="True">List View</asp:ListItem>
                            <asp:ListItem Value="G">Graph View</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="col-sm-2">
                        <asp:Button ID="Load_Location" Text="Load" runat="server" OnClientClick="return validateDropDown();" CssClass="btn view" />
                    </div>

                </div>

            

                <asp:Panel ID="Amount_Panel" runat="server" CssClass="report-grid">
                    <asp:Label ID="Volume_lbl" CssClass="lbl" runat="server" Text="Volume"></asp:Label>
                   
                    <asp:GridView ID="Amount_Grid" runat="server" CssClass="" Style="top: 0px; border: 1px solid #6fd472; text-align: center; border-collapse: inherit; background-color: hsla(40deg, 4%, 36%, 0.25); position: relative; width: 100%; table-layout: auto;"
                            ShowHeaderWhenEmpty="True" CellPadding="3" GridLines="both" BackColor="White" PagerStyle-CssClass="myPagerStyle" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1">
                           <Columns>
                            <asp:TemplateField HeaderText="Show Graph">
                                <ItemTemplate>
                                     <button type="button" class="btn grph_btn"><i class="fa fa-bar-chart"></i></button>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <AlternatingRowStyle BackColor="White" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="true" Font-Size="Larger" ForeColor="White" />
                            <RowStyle BackColor="#f5f5f5" />
                            <HeaderStyle BackColor="#0C4160" ForeColor="WhiteSmoke" Width="100%" />
                            <FooterStyle BackColor="#CCCCCC" />
                            <SelectedRowStyle Font-Size="Large" />
                            <HeaderStyle Font-Bold="True" ForeColor="White" Width="100%" />
                            <SelectedRowStyle BackColor="#336699" Font-Bold="True" ForeColor="White" />
                            <PagerSettings FirstPageText="1" LastPageText="last" NextPageText="next" PreviousPageText="previous" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        </asp:GridView>
                </asp:Panel>


            </div>

                 <div class='popup'>
                 <h5 align="center">MGA Graph <label class="br_name"></label></h5>
                <div id="chart" class="chart" style="margin-top: 70px">
                   
                </div>
                <button id="closePopupBtn" class="btn">Close</button>
            </div>

        </div>

    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/inputmask/inputmask.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/inputmask/inputmask.date.extensions.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/inputmask/inputmask.extensions.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.4/css/inputmask.css" />
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

    <script>
        $(function () {
            var inputmask = new Inputmask("99/99/9999", { placeholder: 'dd/mm/yyyy' });
            inputmask.mask($('[id*=DateLabel]'));
        });
</script>   

    <script type="text/javascript">
        function validateDropDown() {
            var year_from = document.getElementById("ContentPlaceHolder1_Year_From").value;
            var year_to = document.getElementById("ContentPlaceHolder1_Year_To").value;


            if (year_from == '' || year_to == '') {
                Swal.fire({
                    icon: 'warning',
                    title: 'Please Enter Year',
                });
                return false;
            }
            if (year_from.length < 4 || year_to.length < 4) {
                Swal.fire({
                    icon: 'warning',
                    title: 'Please Enter Valid Year',
                });
                return false;
            }
        }
    </script>

    <script>
        var inputElement = document.getElementById("ContentPlaceHolder1_Year_From");
        inputElement.addEventListener("keydown", restrictInput);
        inputElement.addEventListener("input", restrictInput);
        inputElement.addEventListener("touchstart", restrictInput);
        inputElement.addEventListener("touchend", restrictInput);

        var inputElement1 = document.getElementById("ContentPlaceHolder1_Year_To");
        inputElement1.addEventListener("keydown", restrictInput);
        inputElement1.addEventListener("input", restrictInput);
        inputElement1.addEventListener("touchstart", restrictInput);
        inputElement1.addEventListener("touchend", restrictInput);

        function restrictInput(event) {

            var inputElement = event.target;
            var inputValue = inputElement.value;

            // Remove non-numeric characters from the input value
            inputValue = inputValue.replace(/\D/g, "");

            // Update the input value with the cleaned numeric value
            inputElement.value = inputValue;
        }
    </script>

        <script>
            function compareDates() {
                const fromDate = new Date(document.getElementById("ContentPlaceHolder1_Year_From").value);
                const toDate = new Date(document.getElementById("ContentPlaceHolder1_Year_To").value);

                if (toDate < fromDate) {
                    alert("To date must be greater than from date.");
                    document.getElementById("ContentPlaceHolder1_Year_To").value = "";
                }
            }
        </script>

    
    <script>


           $("tr").click(function () {

               var selectedRow = $(this);
               var rowIndex = selectedRow.index();

               var cellValue = selectedRow.find("td:eq(1)").text();
               var frm_year = $('#ContentPlaceHolder1_Year_From').val();
               var to_year = $('#ContentPlaceHolder1_Year_To').val();




               $.ajax({
                   type: "POST",
                   url: "MGA.aspx/GetChartData",
                   data: "{cellValue: '" + cellValue + "',frm_year: '" + frm_year + "',to_year: '" + to_year + "'}",
                   contentType: "application/json; charset=utf-8",
                   dataType: "json",
                   success: function (response) {
                       // Parse the JSON string to a JavaScript object
                       var data = JSON.parse(response.d);
                       console.log(data)

                       const seriesData = Object.values(data[0]).filter(val => typeof val === "number");

                       console.log(seriesData)
                       // Update the options object with the series data

                       var options = {
                           chart: {
                               height: 280,
                               type: 'area',
                           },
                           dataLabels: {
                               enabled: false
                           },
                           series: [{
                               name: 'Sales',
                               data: seriesData
                           }],
                           xaxis: {
                               title: {
                                   text: 'Months'
                               },
                               categories: ['Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec', 'Jan', 'Feb', 'Mar',]
                           },
                           yaxis: {
                               title: {
                                   text: 'Sales'
                               }
                           }
                       };

                       var chart = new ApexCharts(document.querySelector("#chart"), options);


                       $('.br_name').text(data[0].branch + ': ' + frm_year + '-' + to_year);
                       chart.render();
                       chart.updateSeries([{ data: seriesData }]);

                   },
                   error: function (xhr, ajaxOptions, thrownError) {
                       // Handle the error
                       console.log(xhr.status + ': ' + thrownError);
                   }
               });

               var popup = $('.popup');
               $("body").append(popup);
               popup.show();
           });

       </script>

    <script>
        // Get the close button element
        var closePopupBtn = document.getElementById("closePopupBtn");

        // Get the popup element
        var popup = document.querySelector('.popup');

        closePopupBtn.addEventListener("click", function () {
            // Hide the popup
            popup.style.display = "none";
        });
    </script>

</asp:Content>


