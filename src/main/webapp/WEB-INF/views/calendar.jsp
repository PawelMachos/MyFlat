<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        *{
            font-family: 'Ruda', sans-serif;
        }
    </style>

    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link href="/static/css/calendar-style.css" type="text/css" rel="stylesheet">
    <link href="../../static/css/calendar-style.css" type="text/css" rel="stylesheet">

</head>
<body>
<script src="/static/js/calendar-index.js"></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>


<div id="calendar">
    <div id="calendar_header"><i class="icon-chevron-left"></i>
        <h1></h1><i class="icon-chevron-right"></i>
    </div>
    <div id="calendar_weekdays"></div>
    <div id="calendar_content"></div>
</div>

</body>
</html>