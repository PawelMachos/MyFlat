<%--
  Created by IntelliJ IDEA.
  User: Bea
  Date: 2020-02-16
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Header</title>
</head>
<body>
<header class="header black-bg">
    <div class="sidebar-toggle-box">
        <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
    </div>
    <!--logo start-->
    <a href="/" class="logo" style="font-size: 24px"><b>my<span style="font-size: 24px">Flat</span></b></a>
    <!--logo end-->
    <div>                                                         </div>

    <div class="nav notify-row" id="top_menu"></div>
    <div class="top-menu" style="float: right">

        <ul class="nav -pull-right top-menu">

            <li><a class="logout" href="/logout">Logout</a></li>

        </ul>
    </div>
</header>
</body>
</html>
