<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>

    <link href="../../static/css/style.css" type="text/css" rel="stylesheet">

</head>
<body>
<section id="container">

    <header class="header black-bg">
        <jsp:include page="header.jsp"/>
    </header>

    <div>
    <jsp:include page="side-menu.jsp"/>
    </div>

    <div>
        HomePage po zalogowaniu
    <jsp:include page="main-section.jsp"/>
    </div>



</section>
<footer class="site-footer">
    <jsp:include page="footer.jsp"/>
</footer>
</body>
</html>
