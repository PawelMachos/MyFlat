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
    <a href="/we" class="logo" style="font-size: 20px"><b>my</b><span style="font-size: 24px">Flat</span></a>
    <!--logo end-->
    <div>                                                         </div>

    <div class="nav notify-row" id="top_menu"></div>
    <div class="top-menu" style="float: right">

        <ul class="nav -pull-right top-menu">

            <li><a class="logout" href="/logout">&nbsp&nbsp&nbspLogout&nbsp&nbsp&nbsp</a>
<%--                <a class="logout" href="/">&nbsp&nbsp&nbspBack&nbsp&nbsp&nbsp</a></li>--%>
                <a class="logout" href="/">Home Page</a></li>

        </ul>
    </div>
</header>
</body>
</html>
