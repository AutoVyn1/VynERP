<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Loader.aspx.vb" Inherits="AutovynERP.Loader1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
         .page-loader {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: #fff;
            z-index: 9999;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .loader-icon {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background-color: #e00303;
            animation: loader-animation 1s linear infinite;
        }

        @keyframes loader-animation {
            0% {
                transform: scale(0);
                opacity: 0;
            }

            50% {
                opacity: 1;
            }

            100% {
                transform: scale(1);
                opacity: 0;
            }
        }
        *, *::after, *::before {
  box-sizing: border-box;
}

body {
  font-family: 'Playfair Display', serif;
  background: rgb(23, 22, 22);
  color: #fff;
}

.preloader {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  width: 100%;
  background: rgb(23, 22, 22);
  position: fixed;
  top: 0;
  left: 0;
  z-index: 9999;
  transition: opacity 0.3s linear;
}

body, html {

  background-color: #f8f4d5;
}

.container {
  width: 200px;
  height: 200px;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  margin: auto;
  filter: url('#goo');
  animation: rotate-move 2s ease-in-out infinite;
}

.dot { 
  width: 70px;
  height: 70px;
  border-radius: 50%;
  background-color: #000;
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  margin: auto;
}

.dot-3 {
  background-color: #f74d75;
  animation: dot-3-move 2s ease infinite, index 6s ease infinite;
}

.dot-2 {
  background-color: #10beae;
  animation: dot-2-move 2s ease infinite, index 6s -4s ease infinite;
}

.dot-1 {
  background-color: #ffe386;
  animation: dot-1-move 2s ease infinite, index 6s -2s ease infinite;
}

@keyframes dot-3-move {
  20% {transform: scale(1)}
  45% {transform: translateY(-18px) scale(.45)}
  60% {transform: translateY(-90px) scale(.45)}
  80% {transform: translateY(-90px) scale(.45)}
  100% {transform: translateY(0px) scale(1)}
}

@keyframes dot-2-move {
  20% {transform: scale(1)}
  45% {transform: translate(-16px, 12px) scale(.45)}
  60% {transform: translate(-80px, 60px) scale(.45)}
  80% {transform: translate(-80px, 60px) scale(.45)}
  100% {transform: translateY(0px) scale(1)}
}

@keyframes dot-1-move {
  20% {transform: scale(1)}
  45% {transform: translate(16px, 12px) scale(.45)}
  60% {transform: translate(80px, 60px) scale(.45)}
  80% {transform: translate(80px, 60px) scale(.45)}
  100% {transform: translateY(0px) scale(1)}
}

@keyframes rotate-move {
  55% {transform: translate(-50%, -50%) rotate(0deg)}
  80% {transform: translate(-50%, -50%) rotate(360deg)}
  100% {transform: translate(-50%, -50%) rotate(360deg)}
}

@keyframes index {
  0%, 100% {z-index: 3}
  33.3% {z-index: 2}
  66.6% {z-index: 1}
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="preloader">
            <div class="container">
                <div class="dot dot-1"></div>
                <div class="dot dot-2"></div>
                <div class="dot dot-3"></div>
            </div>
            <svg xmlns="http://www.w3.org/2000/svg" version="1.1">
                <defs>
                    <filter id="goo">
                        <feGaussianBlur in="SourceGraphic" stdDeviation="10" result="blur" />
                        <feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 21 -7" />
                    </filter>
                </defs>
            </svg>

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
      window.location.href = 'BranchPage.aspx';
  }, 3000);
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
        window.location.href = 'BranchPage.aspx';
    }, 3000);

    window.addEventListener('load', fadeEffect);
</script>
