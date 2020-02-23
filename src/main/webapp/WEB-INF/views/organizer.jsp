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

    <title>TODO List</title>


    <link href="/static/css/bill.css" type="text/css" rel="stylesheet">
    <link href="../../static/css/style.css" type="text/css" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
            font-family: 'Ruda', sans-serif;

        }
        ul {
            list-style-type: none;
        }
        body {

            background-color: lightgrey;
        }
        h1 {

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
            margin-left: 0.5%;
            margin-right: auto;
            width:56.5%;
        }
        #cal
        {
            float:left;
            margin-left: 3%;
            margin-right: auto;
            width:40%;
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
    <footer class="site-footer" style="font-size: 13px">
        <jsp:include page="footer.jsp"/>
    </footer>
</section>
</body>
</html>


</body>
</html>