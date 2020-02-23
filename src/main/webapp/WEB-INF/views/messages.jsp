<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Messages</title></head>
<link href="../../static/css/style.css" type="text/css" rel="stylesheet">

</head>
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

                <div>Messages section</div>

            </section>
        </section>
    </div>

    <footer class="site-footer">
        <jsp:include page="footer.jsp"/>
    </footer>
</section>
</body>

</html>