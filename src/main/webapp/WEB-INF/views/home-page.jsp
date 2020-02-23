<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>myFlat</title>

    <link href="../../static/css/style.css" type="text/css" rel="stylesheet">

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

                <div style="height:100%;"><jsp:include page="main-section.jsp"/></div>

            </section>
        </section>
    </div>
    <footer class="site-footer" style="object-position: bottom">
        <jsp:include page="footer.jsp"/>
    </footer>
</section>
</body>
</html>


</body>
</html>