<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.Month" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.DayOfWeek" %><%--
  Created by IntelliJ IDEA.
  User: marta
  Date: 19.02.2020
  Time: 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link href="/static/css/bill.css" type="text/css" rel="stylesheet">
    <link href="../../static/css/style.css" type="text/css" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
            color: #064579
        }

        ul {
            list-style-type: none;
        }

        body {
            font-family: Verdana, sans-serif;
            background-color: lightgray
        }

        h1 {
            font-family: Verdana, sans-serif;
            color: coral;
            text-align: center;
        }

        #main {
            width: 100%;
            height: auto;
        }

        #todo
        {
            float:left;
            margin-top: 3%;
            margin-left: 3%;
            margin-right: auto;
            width:60%;
            border-style: solid;
            border-color: darkred;
        }
        #cal
        {
            float:left;
            margin-left: 5%;
            margin-right: auto;
            width:32%;
            border-style: solid;
            border-color: darkred;
        }

        #some {
            clear: both;
            width: 100%;
            background-color: lightcoral;
        }
    </style>
</head>
<body>

<section id="container">
    <header class="header black-bg">
        <jsp:include page="header.jsp"/>
    </header>
    <div>
        <div id="leftSideOfWeb">
            <jsp:include page="side-menu.jsp"/>
        </div>
        <section id="main-content">
            <section class="wrapper">

<h1 style="color: #064579">Let's organize your flat!</h1><br/>

<div id="main">

    <div id="todo">
        <jsp:include page="user-tasks-page.jsp"/>
    </div>
    <div id="cal">
        <jsp:include page="calendar.jsp"/>
    </div>

</div>

            </section>
        </section>
    </div>
    <footer class="site-footer">
        <jsp:include page="footer.jsp"/>
    </footer>
</section>
</body>
</html>


</body>
</html>