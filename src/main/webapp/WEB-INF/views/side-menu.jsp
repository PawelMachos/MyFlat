<%--
  Created by IntelliJ IDEA.
  User: Bea
  Date: 2020-02-16
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            font-family: "Lato", sans-serif;
        }

        .side-menu {
            width: 200px;
           object-position: left ;
            z-index: 1;
            top: 20px;
            left: 10px;
            background: #eee;
            overflow-x: hidden;
            padding: 8px 0;
            border: darkcyan;
            border-bottom-style: solid;
            border-width: thin;
        }

        .side-menu a {
            padding: 6px 8px 6px 16px;
            text-decoration: none;
            font-size: 25px;
            color: #2196F3;
            display: block;
        }

        .side-menu a:hover {
            color: #064579;
        }

        @media screen and (max-height: 450px) {
            .side-menu {padding-top: 15px;}
            .side-menu a {font-size: 18px;}
        }
    </style>
</head>
<body>


<div class="side-menu">

    <a href="/home">Homepage</a>
    <a href="/bills">Bills</a>
    <a href="/messages">Messages</a>
    <a href="/adverts">Adverts</a>
    <a href="/user-tasks">Organizer</a>

</div>


</body>
</html>
