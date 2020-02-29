<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>

    <link href="../../static/css/style.css" type="text/css" rel="stylesheet">

</head>
<body >

<section id="container">
    <header class="header black-bg">
        <jsp:include page="header.jsp"/>
    </header>
    <div>
        <div id="leftSideOfWeb">
            <jsp:include page="side-menu.jsp"/>
        </div>
        <section id="main-content"  style="min-height: 500px;">
            <section class="wrapper">

                <div><img src="/static/graphics/under-construction-1000x500.jpg"></div>

            </section>
        </section>
    </div>
    <footer class="site-footer">
        <jsp:include page="footer.jsp"/>
    </footer>
</section>
</body>
</html>


</body>
</html>