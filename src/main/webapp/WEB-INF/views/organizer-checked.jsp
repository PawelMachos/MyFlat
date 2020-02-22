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
    <style>

        * {box-sizing: border-box;}
        ul {list-style-type: none;}
        body {font-family: Verdana, sans-serif;
            background-color: lightgray}
        h1 {font-family: Verdana, sans-serif;
            color: #064579;
            text-align: center;
        }
        #main
        {
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
            width:20%;
            border-style: solid;
            border-color: darkred;
        }
        #some
        {
            clear: both;
            width: 100%;
            background-color: lightcoral;
        }

    </style>
</head>
<body>

        <h1>Let's organize your flat!</h1><br/>

       <div id="main">

           <div id="todo"><jsp:include page="checked-task-page.jsp"/></div>
           <div id="cal"><jsp:include page="calendar.jsp"/></div>



       </div>

</body>
</html>