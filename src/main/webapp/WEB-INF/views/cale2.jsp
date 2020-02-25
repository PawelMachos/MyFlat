<%--
  Created by IntelliJ IDEA.
  User: marta
  Date: 25.02.2020
  Time: 21:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="../../static/css/zabuto_calendar.css" type="text/css" rel="stylesheet">
    <link href="../../static/css/style.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../static/js/zabuto_calendar.js"></script>

</head>
<body>

<div id="calendar" class="mb">
    <div class="panel green-panel no-margin">
        <div class="panel-body">
            <div id="date-popover" class="popover top" style="cursor: pointer; disadding: block; margin-left: 33%; margin-top: -50px; width: 175px;">
                <div class="arrow"></div>
                <h3 class="popover-title" style="disadding: none;"></h3>
                <div id="date-popover-content" class="popover-content"></div>
            </div>
            <div id="my-calendar"></div>
        </div>
    </div>
</div>

</body>
</html>
