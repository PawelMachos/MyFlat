<%--
  Created by IntelliJ IDEA.
  User: Bea
  Date: 2020-02-21
  Time: 23:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

        #todo {
            float: left;
            margin-top: 3%;
            margin-left: 3%;
            margin-right: auto;
            width: 60%;
            border-style: solid;
            border-color: darkred;
        }

        #cal {
            float: left;
            margin-left: 5%;
            margin-right: auto;
            width: 32%;
            border-style: solid;
            border-color: darkred;
        }

        #some {
            clear: both;
            width: 100%;
            background-color: lightcoral;
        }
    </style>
    <title>Messages</title></head>
<body>
<div>
    <%--    <object width="1000" height="800" classid="clsid:8AD9C840-044E-11D1-B3E9-00805F499D93"--%>
    <%--            codebase="http://java.sun.com/products/plugin/autodl/jinstall-1_4-windows-i586.cab#Version=1,4,0,0">--%>
    <%--        <param name="class" value="ClientGui.class"/>--%>
    <%--        <param name="alt" value="Aby otworzyć komunikator, pobierz najnowsze oprogramowanie Java."/>--%>
    <%--    </object>--%>

    <%--    <object width="1000" height="800" class="placeholder" code="ClientGui.class">Komunikator</object>--%>
    <%--    <div id="place"></div>--%>
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

</div>
</section>
</div>
<footer class="site-footer">
    <jsp:include page="footer.jsp"/>
</footer>
</section>
</body>

</html>
