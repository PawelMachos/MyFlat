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
&nbsp;
    &nbsp;
    <div>
    <jsp:include page="side-menu.jsp"/>
    </div>
    &nbsp;
    <div>
        HomePage po zalogowaniu
    <jsp:include page="main-section.jsp"/>
    </div>
    &nbsp;
    <div>
    <jsp:include page="footer.jsp"/>
    </div>

</section>
</body>
</html>
