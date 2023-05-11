
<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="LoginPage.aspx.vb" Inherits="AutovynERP.LoginPage" %>
 
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta content='yes' name='apple-mobile-web-app-capable'/>
    <meta name="mobile-web-app-capable" content="yes" /> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Expires" content="0" />
    <meta http-equiv="Cache-Control" content="no-cache" />  
    <meta http-equiv="Pragma" content="no-cache" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"/>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Dosis:wght@400;700&display=swap" rel="stylesheet" />
    <%--<link rel="stylesheet" href="CSS/Login.css"/>--%>
    <title>Autovyn Cloud - Home</title>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
* {
    margin: 0;
    padding: 0;
    font-family: 'Poppins',sans-serif;
    color: rgb(6, 10, 18);
}

body {
    font-family: sans-serif;
    color: rgb(7, 13, 40);
    background-image: url("../Media/loginbg.svg");
    background-color:azure;
    font-size:14px;
}

.container {
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
    background-color: rgb(255 255 255 / 25%);
}

h4 {
    text-align: center;
    color: rgb(7, 13, 40);
    font-size:18px;
}

input[type=text],
input[type=password] {
    width: 100%;
    margin: 10px 0;
    border-radius: 35px;
    height: 44px;
    padding: 15px 18px;
    box-sizing: border-box;
}

.button {
    background-color: #0C2D48;
    color: white;
    padding:7px 0px;
    border-radius: 40px;
    width: 100%;
    font-size: 18px;
    border: none;
}

    .button:hover {
        opacity: 0.6;
        cursor: pointer;
    }

.headingsContainer {
    text-align: center;
}

    .headingsContainer p {
        color: gray;
    }

.mainContainer {
    padding: 16px;
}


.subcontainer {
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: space-between;
    padding: 20px 0;
    color: rgb(7, 13, 40);
}

/* Media queries for the responsiveness of the page */
@media screen and (max-width: 600px) {
    .form {
        width: 25rem;
    }
}

@media screen and (max-width: 400px) {
    .form {
        width: 20rem;
    }
}


/* text animation */

/* text animation */

.updates {
    background-color: #6A679E;
    width: 33%;
    border-radius: 27px;
    padding: 5px 15px;
    margin-top: 70px;
}

.update-lbl {
    color: #fff;
}


p {
    font-size: 1rem;
    padding: 0.5rem;
    font-weight: 800;
    letter-spacing: 0.1rem;
    text-align: center;
    overflow: hidden;
}

    p span.typed-text {
        font-weight: normal;
        color: #dd7732 !important;
    }

    p span.cursor {
        display: inline-block;
        background-color: #ffffff;
        margin-left: 0.1rem;
        width: 1px;
        animation: blink 2s infinite;
    }

        p span.cursor.typing {
            animation: none;
        }

@keyframes blink {
    0% {
        background-color: #ccc;
    }

    49% {
        background-color: #ccc;
    }

    50% {
        background-color: transparent;
    }

    99% {
        background-color: transparent;
    }

    100% {
        background-color: #ccc;
    }
}


 .eyeicon{
            position:relative;
            Right: -8px;
            bottom:-5px;
        }

 .eyeicon-b{
     position:relative;
            Right: -8px;
            bottom:-5px;
 }


#urlbar[breakout][breakout-extend] > #urlbar-background {
    box-shadow: 0 1px 4px rgba(0,0,0,.05) !important;
    background-color: #fff;
    visibility: hidden;
    display: none;
}



@media screen and (max-width:480px) {
    .sec-1 {
        display: none;
    }
    .eyeicon{
            position:relative;
            Right: -8px;
            bottom:-5px;
        }


}

        .form .mainContainer .row {
            height: 45px;
            margin-bottom: 15px;
            position: relative;
        }

            .form .mainContainer .row .input {
                height: 80%;
                width: 100%;
                outline: none;
                padding-left: 60px;
                border-radius: 5px;
                border: 1px solid #0c2d4861;
                font-size: 16px;
                transition: all 0.3s ease;
            }

                .form .mainContainer .row .input:focus {
                    /* border-color: #16a085; */
                    box-shadow: inset 0px 0px 2px 2px rgba(139, 165, 205, 0.25);
                }

                .form .mainContainer .row .input::placeholder {
                    color: #999;
                }

            .form .mainContainer .row i {
                position: absolute;
                width: 47px;
                height: 100%;
                font-size: 18px;
                border-radius: 5px 0 0 5px;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-top:5px;
            }


        #error_message {
            color: orangered;
            border-radius: 20px;
            font-size: 12px;
            text-align: center;
        }

        .hide {
            width: 100%;
            height: .1vh;
            background-color: #efe8e882;
            border: none;
        }

       
    </style>

</head>
<body>
    <script>
        function myFunction() {
            var x = document.getElementById("inputPassword");
            if (x.type === "password") {
                x.type = "text";
            } else {
                x.type = "password";
            }
        }
    </script>
    <form id="form1" runat="server" onsubmit="return validate();">

        <div class="container">
            <div class="form">
                <p><span class="typed-text"></span><span class="cursor">&nbsp;</span></p>
                <div class="headingsContainer">
                    <img src="../Media/autovyn.png" alt="" width="120" />
                </div>
                <div class="mainContainer">

                    <div class="row">
                        <i class="fas fa-handshake"></i>
                        
                        <asp:TextBox ID="Dealer_ID" CssClass="login__input input" placeholder="Dealer ID" runat="server"></asp:TextBox>
                    </div>

                    <div class="row">
                        <i class="fas fa-user"></i>
                    <asp:TextBox ID="User_Name" CssClass="login__input input" placeholder="Username" runat="server"></asp:TextBox>
                    </div>

                    <div class="row">
                        <i class="fas fa-lock"></i>
                        <asp:TextBox ID="inputPassword" TextMode="Password " CssClass="login__input input" placeholder="Password" runat="server"></asp:TextBox>
                    </div>

                    <div class="subcontainer">
                        <label>
                            <input type="checkbox" onclick="myFunction()" class="checkmark" />
                            Show Password
                        </label>
                    </div>
                    <asp:Button ID="loginBtn" CssClass="input login-btn button" runat="server" Text="Login" OnClientClick="validate()" />
                    <asp:Button ID="hide" CssClass="hide" runat="server" />
                    <div class="err_box mt-4">
                        <div id="error_message"></div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

<script>
    //$(function () {
    //    $("#loginBtn").click(function () {
    //        var ddlFruits = $("#module_list");
    //        if (ddlFruits.val() == "") {
    //            erralert("Please select an option!");
    //            return false;
    //        }
    //        return true;
    //    });
    //});

    function validate() {
        var name = document.getElementById("User_Name").value;
        var password = document.getElementById("inputPassword").value;

        error_message.style.padding = "10px";
        var text;

        if (name.length < 3) {
            text = "Please Enter valid User Name";
            error_message.innerHTML = text;
            return false;
        }
        if (password.length < 5) {
            text = "Please Enter Correct Password";
            error_message.innerHTML = text;
            return false;
        }
        //if (isNaN(phone) || phone.length != 10) {
        //    text = "Please Enter valid Phone Number";
        //    error_message.innerHTML = text;
        //    return false;
        //}
        //if (email.indexOf("@") == -1 || email.length < 6) {
        //    text = "Please Enter valid Email";
        //    error_message.innerHTML = text;
        //    return false;
        //}
        //if (message.length <= 140) {
        //    text = "Please Enter More Than 140 Characters";
        //    error_message.innerHTML = text;
        //    return false;
        //}
        return true;
    }
</script>


<!-- MDB -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"></script>
    <script>

        const typedTextSpan = document.querySelector(".typed-text");
        const cursorSpan = document.querySelector(".cursor");

        const textArray = ["AUTO-VYN CLOUD", "Financier Module is there ", "True Value Module is there", "HRMS Module is there (also attendance and interview sheet)"];
        const typingDelay = 170;
        const erasingDelay = 50;
        const newTextDelay = 2000; // Delay between current and next text
        let textArrayIndex = 0;
        let charIndex = 0;

        function type() {
            if (charIndex < textArray[textArrayIndex].length) {
                if (!cursorSpan.classList.contains("typing")) cursorSpan.classList.add("typing");
                typedTextSpan.textContent += textArray[textArrayIndex].charAt(charIndex);
                charIndex++;
                setTimeout(type, typingDelay);
            }
            else {
                cursorSpan.classList.remove("typing");
                setTimeout(erase, newTextDelay);
            }
        }

        function erase() {
            if (charIndex > 0) {
                if (!cursorSpan.classList.contains("typing")) cursorSpan.classList.add("typing");
                typedTextSpan.textContent = textArray[textArrayIndex].substring(0, charIndex - 1);
                charIndex--;
                setTimeout(erase, erasingDelay);
            }
            else {
                cursorSpan.classList.remove("typing");
                textArrayIndex++;
                if (textArrayIndex >= textArray.length) textArrayIndex = 0;
                setTimeout(type, typingDelay + 1100);
            }
        }

        document.addEventListener("DOMContentLoaded", function () { // On DOM Load initiate the effect
            if (textArray.length) setTimeout(type, newTextDelay + 250);
        });
    </script>

