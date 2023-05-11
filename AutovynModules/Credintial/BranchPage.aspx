<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="BranchPage.aspx.vb" Inherits="AutovynERP.BranchPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Dosis:wght@400;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="CSS/Login.css" />
    <title>Autovyn Cloud - Branch</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
      
        .select-branch-sec{
            width: 60%;
             height: 36px;
             margin:auto;
        }

         .select-branch {
             width: 100%;
             height: 36px;
             border: none;
             border-radius: 5px;
             padding: 0 10px;
             font-size: 12px;
             border: 1px solid;
         }

         .btn-sec{
             margin:20px 0;
         }


         .container{
            height: 100vh;
            display: flex;
            justify-content: center;
            flex-direction: column;
            align-items: center;
        }

        .form {
            width: 29rem;
            margin: auto;
            color: whitesmoke;
            border-radius: 12px;
            border: 1px solid rgba(255, 255, 255, 0.125);
            padding: 20px 25px;
            background-color: rgba(255, 255, 255, 0.58);
        }


        element.style {
        }

        .btn-sec {
            margin: 20px auto;
            width: 70%;
        }

        .button {
            background-color: #0C2D48;
            color: white;
            padding: 7px 0px;
            border-radius: 40px;
            width: 100%;
            font-size: 18px;
            border: none;
        }

            .button:hover {
                opacity: 0.6;
                cursor: pointer;
            }


    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="headingsContainer">
                <img src="autovyn.png" alt="" width="140" />
            </div>
            <div class="form">
                <h4>SELECT BRANCH</h4>
                <div class="mainContainer">
                    <div class="select-branch-sec">
                        <asp:DropDownList ID="DropDownList1" CssClass="select-branch" runat="server"></asp:DropDownList>

                    </div>
                    <div class="btn-sec">
                        <asp:Button ID="ShowProfile" CssClass="input login-btn button" runat="server" Text="Enter Branch" />
                    </div>

                    <div class="row">
                        <a href="LoginPage.aspx"><i class="fas fa-arrow-left" style="width: 70px; font-size: 13px;" aria-hidden="true"><span>Go Back </span></i></a>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
