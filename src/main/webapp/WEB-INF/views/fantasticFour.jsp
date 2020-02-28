<%--
  Created by IntelliJ IDEA.
  User: marta
  Date: 28.02.2020
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        #ourFour{
            color: #797979;
            background: #eaeaea;
            font-family: 'Ruda', sans-serif;
        }
        .card {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            /*max-width: 300px;*/
            width: 21.25%;
            margin-left: 3%;
            margin-top: 5%;
            margin-bottom: auto;
            text-align: center;
            color: #797979;
            font-family: 'Ruda', sans-serif;
            float: left;
            ;
        }

        .title {

            font-size: 18px;
        }

        button {
            border: none;
            outline: 0;
            display: inline-block;
            padding: 8px;
            color: white;
            background-color: #000;
            text-align: center;
            cursor: pointer;
            width: 100%;
            font-size: 18px;
        }

        a {
            text-decoration: none;
            font-size: 22px;
            color: black;
        }

        button:hover, a:hover {
            opacity: 0.7;
        }
    </style>
</head>
<body>

<h1 style="text-align:center">Our Fantastic Four</h1>

<div id="ourFour">



<div class="card">
    <img src="../../static/graphics/marta.jpg" alt="Mysia" style="width:100%">
    <h1>Marta Przybyło</h1>
    <p class="title">Junior Java Developer Candidate</p>
    <p>SDA</p>
    <div style="margin: 24px 0;">
        <a href="https://github.com/martaprzybylo"><i class="fa fa-github"></i></a>
        <a href="https://www.linkedin.com/in/marta-przyby%C5%82o-650b10137/"><i class="fa fa-linkedin"></i></a>
        <a href="https://www.facebook.com/emartea"><i class="fa fa-facebook"></i></a>
    </div>
    <p><button>Contact</button></p>
</div>
    <div class="card">
        <img src="../../static/graphics/krzychu.jpg" alt="Krzychu" style="width:100%">
        <h1>Krzysztof Sieradzki</h1>
        <p class="title">Junior Java Developer Candidate</p>
        <p>SDA</p>
        <div style="margin: 24px 0;">
            <a href="https://github.com/KrzysztofSieradzki"><i class="fa fa-github"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="https://www.linkedin.com/in/krzysztof-sieradzki-37646b10b/"><i class="fa fa-linkedin"></i></a>
            <a href="https://www.facebook.com/jacek.daniels.399"><i class="fa fa-facebook"></i></a>
        </div>
        <p><button>Contact</button></p>
    </div>
    <div class="card">
        <img src="../../static/graphics/beata.jpg" alt="Beata" style="width:100%">
        <h1>Beata Swirko</h1>
        <p class="title">Junior Java Developer Candidate</p>
        <p>SDA</p>
        <div style="margin: 24px 0;">
            <a href="https://github.com/Bea3sit23"><i class="fa fa-github"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="https://www.linkedin.com/in/beata-swirko-a3165394/"><i class="fa fa-linkedin"></i></a>
            <a href="https://www.facebook.com/beata.swirko"><i class="fa fa-facebook"></i></a>
        </div>
        <p><button>Contact</button></p>
    </div>
    <div class="card">
        <img src="../../static/graphics/paweł.jpg" alt="Paweł" style="width:100%">
        <h1>Paweł Machoś</h1>
        <p class="title">Junior Java Developer Candidate</p>
        <p>SDA</p>
        <div style="margin: 24px 0;">
            <a href="https://github.com/PawelMachos"><i class="fa fa-github"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="https://www.linkedin.com/in/pawe%C5%82-macho%C5%9B-7928a0192/"><i class="fa fa-linkedin"></i></a>
            <a href="https://www.facebook.com/PanKolega"><i class="fa fa-facebook"></i></a>
        </div>
        <p><button>Contact</button></p>
    </div>




</div>

</body>
</html>
