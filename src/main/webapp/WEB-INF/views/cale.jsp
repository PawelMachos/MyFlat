<%--
  Created by IntelliJ IDEA.
  User: marta
  Date: 25.02.2020
  Time: 19:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <style>
        @import url(https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css);
        @import url(https://fonts.googleapis.com/css?family=Roboto+Condensed:400,300,700);
        * {
            -moz-box-sizing: border-box;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }




        .clearfix, .container, .calendar {
            zoom: 1;
        }
        .clearfix:before, .container:before, .calendar:before, .clearfix:after, .container:after, .calendar:after {
            content: "\0020";
            display: block;
            height: 0;
            overflow: hidden;
        }
        .clearfix:after, .container:after, .calendar:after {
            clear: both;
        }

        body {
            background: #249991;
            font-family: 'Roboto Condensed', sans-serif;
            font-weight: 100;
            line-height: 1;
            font-size: 20px;
            color: #222;
            text-transform: uppercase;
            text-align: center;
        }


        .today {
            background: #4ecdc4;
            color: white;
            padding: 1em 0;
            float: left;
            width: 15em;
            min-height: 17.2em;
        }
        .today .day-week {
            color: rgba(255, 255, 255, 0.8);
            margin: 1em 0 2em;
        }
        .today .day-num {
            font-size: 8em;
        }

        .calendar {
            float: left;
            width: 15em;
            min-height: 17em;
            background: #f5f5f5;
            padding: 1.25em 1em 2em;
        }
        .calendar .month {
            color: #249991;
            font-weight: 700;
            margin: 0.75em 0 1em;
        }
        .calendar .weekday {
            color: #e42355;
            font-weight: 700;
            font-size: 0.8em;
        }
        .calendar .day {
            font-size: 0.8em;
            font-weight: 700;
            color: #555555;
        }
        .calendar .weekday, .calendar .day {
            float: left;
            width: 12%;
            margin: 0.25em 1%;
            line-height: 1.5em;
            vertical-align: middle;
        }
        .calendar .weekday.now, .calendar .day.now {
            position: relative;
            color: #e42355;
        }
        .calendar .weekday.now:before, .calendar .day.now:before {
            content: "";
            width: 1.75em;
            height: 1.75em;
            border: 0.2em solid #e42355;
            position: absolute;
            border-radius: 100%;
            left: -0.125em;
            top: -0.25em;
        }

        .mute {
            color: rgba(0, 0, 0, 0.25);
        }

        @media (max-width: 38em) {
            .container {
                max-width: 100%;
            }

            .today, .calendar {
                width: 75%;
                float: none;
                margin: 0 auto;
                min-height: 0;
            }

            .calendar .weekday, .calendar .day {
                display: none;
            }
        }

    </style>

</head>
<body>

<!-- / ------------- Try a custom date: -->
<!-- /- year = 2014 -->
<!-- /- month = 1 -->
<!-- /- day = 31 -->
<div class='container'>
    <div class='today'>
        <div class='date'></div>
        <div class='day-week'>Tuesday</div><div class='day-num'>25</div>
    </div>
    <div class='calendar'>
        <div class='month'>
            February
            2020
        </div>
        <ul class='weekdays'>
            <li class='weekday'>
                S
            </li>
            <li class='weekday'>
                M
            </li>
            <li class='weekday'>
                T
            </li>
            <li class='weekday'>
                W
            </li>
            <li class='weekday'>
                T
            </li>
            <li class='weekday'>
                F
            </li>
            <li class='weekday'>
                S
            </li>
        </ul>
        <ul class='week'>
            <li class='day'>
            </li>
            <li class='day'>
            </li>
            <li class='day'>
            </li>
            <li class='day'>
            </li>
            <li class='day'>
            </li>
            <li class='day'>
            </li>
            <li class='day'>
        <span class='mute'>
          1
        </span>
            </li>
            <li class='day'>
        <span class='mute'>
          2
        </span>
            </li>
            <li class='day'>
        <span class='mute'>
          3
        </span>
            </li>
            <li class='day'>
        <span class='mute'>
          4
        </span>
            </li>
            <li class='day'>
        <span class='mute'>
          5
        </span>
            </li>
            <li class='day'>
        <span class='mute'>
          6
        </span>
            </li>
            <li class='day'>
        <span class='mute'>
          7
        </span>
            </li>
            <li class='day'>
        <span class='mute'>
          8
        </span>
            </li>
            <li class='day'>
        <span class='mute'>
          9
        </span>
            </li>
            <li class='day'>
        <span class='mute'>
          10
        </span>
            </li>
            <li class='day'>
        <span class='mute'>
          11
        </span>
            </li>
            <li class='day'>
        <span class='mute'>
          12
        </span>
            </li>
            <li class='day'>
        <span class='mute'>
          13
        </span>
            </li>
            <li class='day'>
        <span class='mute'>
          14
        </span>
            </li>
            <li class='day'>
        <span class='mute'>
          15
        </span>
            </li>
            <li class='day'>
        <span class='mute'>
          16
        </span>
            </li>
            <li class='day'>
        <span class='mute'>
          17
        </span>
            </li>
            <li class='day'>
        <span class='mute'>
          18
        </span>
            </li>
            <li class='day'>
        <span class='mute'>
          19
        </span>
            </li>
            <li class='day'>
        <span class='mute'>
          20
        </span>
            </li>
            <li class='day'>
        <span class='mute'>
          21
        </span>
            </li>
            <li class='day'>
        <span class='mute'>
          22
        </span>
            </li>
            <li class='day'>
        <span class='mute'>
          23
        </span>
            </li>
            <li class='day'>
        <span class='mute'>
          24
        </span>
            </li>
            <li class='day now'>
                25
            </li>
            <li class='day'>
                26
            </li>
            <li class='day'>
                27
            </li>
            <li class='day'>
                28
            </li>
            <li class='day'>
                29
            </li>
        </ul>
    </div>
</div>


</body>
</html>
