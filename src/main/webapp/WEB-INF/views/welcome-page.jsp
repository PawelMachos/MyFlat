<%--
  Created by IntelliJ IDEA.
  User: marta
  Date: 16.02.2020
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>

</head>
<body background="/static/graphics/back.jpg">


<h1>SIEMANKO LUDZISKA!!!</h1>

OGŁOSZENIE DEWELOPERA: MIESZKANIA DO KUPIENIA.
&nbsp
<a href="/login" >Login</a>
<a href="/register" >Register</a>
<a href="/home">Home</a>

<diV>
    Ilość dostępnych mieszkań.
    Spiesz się, pozostalo już tylko: ${availableFlats}


</diV>

</body>
</html>
