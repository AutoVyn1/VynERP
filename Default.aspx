<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="AutovynERP._Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
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
    width: 53%;
    border-radius: 27px;
    padding: 5px 15px;
    margin-top: 70px;
}

.update-lbl {
    color: #fff;
}


p {
    font-size: 1.5rem;
    padding: 0.5rem;
    font-weight: 800;
    letter-spacing: 0.1rem;
    text-align: center;
    overflow: hidden;
}

    p span.typed-text {
        font-weight:600;
        color:#ed9c2c !important;
        font-size:40px;
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

    .img-size{
        width:200px;
    }
}

        .form .mainContainer .row {
            height: 45px;
            margin-bottom: 15px;
            position: relative;
        }

            
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="form">
               
                <div class="mainContainer">
                    <div class="row">
                        <p><span class="typed-text"></span><span class="cursor">&nbsp;</span></p>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
<script>
    window.addEventListener('load', function () {
        const loader = document.querySelector('.page-loader');
        loader.classList.add('hidden');
        // Redirect to a different page after 3 seconds
        setTimeout(function () {
            window.location.href = 'AutovynModules/Credintial/LoginPage.aspx';
        }, 7000);
    });
</script>
<script>
    const preloader = document.querySelector('.preloader');

    const fadeEffect = setInterval(() => {
        // if we don't set opacity 1 in CSS, then   //it will be equaled to "", that's why we   // check it
        if (!preloader.style.opacity) {
            preloader.style.opacity = 1;
        }
        if (preloader.style.opacity > 0) {
            preloader.style.opacity -= 0.1;
        } else {
            clearInterval(fadeEffect);
        }
    }, 2000);
    setTimeout(function () {
        window.location.href = 'AutovynModules/Credintial/LoginPage.aspx';
    }, 7000);

    window.addEventListener('load', fadeEffect);
</script>



  <script>

      const typedTextSpan = document.querySelector(".typed-text");
      const cursorSpan = document.querySelector(".cursor");

      const textArray = ["WELCOME TO AUTO-VYN CLOUD"];
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

