<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Paweł
  Date: 20.02.2020
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Adverts </title>
</head>
<body background= "lightgrey">
<div class="container">


<div>
    <jsp:include page="homePage/header.jsp"/>
</div>
&nbsp;
<div>
    <jsp:include page="homePage/navigation.jsp"/>
</div>
&nbsp;
<div>
    <jsp:include page="homePage/side-menu.jsp"/>
</div>
&nbsp;
<div>
    <div class="row" style="margin-top: 40px; margin-bottom: 10px">
        <div class="col-1"></div>
        <div class="col-6"><h2>Dodaj ogłoszenie</h2></div>
        <div class="col-5"></div>
    </div>

    <div class="row">
        <div class="col-2"></div>
        <div class="col-8">

            <sec:authorize access="isAuthenticated()">
                <form method="post" action="/add-advert">
                    <div class="form-group">
                    <label for="title">Tytuł:</label> <br>
                <input type="text" required name="title" id="title">
                    </div> <br><br>

                    <div class="form-group">
                    <label for="description">Ogłoszenie:</label><br>
                    <textarea name="description" id="description"
                              class="form-control" > </textarea>
                    </div> <br>

                <input type="file" value="Załącz plik"> <br><br>

                    <button class="btn btn-outline-primary" type="reset">Wyczyść dane</button>
                    <button class="btn btn-primary" type="submit">Umieść ogłoszenie</button>
            </form>


            </sec:authorize>


        </div>
        <div class="col-2"></div>
    </div>

    <div class="row" style="margin-top: 40px; margin-bottom: 10px">
        <div class="col-1"></div>
        <div class="col-6"><h2>Lista ogłoszeń</h2></div>
        <div class="col-5"></div>
    </div>

    <div class="row">
        <div class="col-12" style="padding-bottom: 20px">

            Szukaj ogłoszenia: <input type="search" name="search">
            <input type="submit" value="Szukaj">

            <div>
                <table>
                    <tr>
                        <th></th>

                    </tr>
                    <c:forEach items="${adverts}" var="advert" varStatus="stat">
                        <tr>
                            <td><b>${advert.title}</b></td>
                            <td>${advert.description}</td>
                            <td>${advert.owner.username}</td>
                            <td>${advert.createdAt}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>

        </div>
    </div>

    <jsp:include page="homePage/main-section.jsp"/>
</div>
&nbsp;
<div>
    <jsp:include page="homePage/footer.jsp"/>
</div>

</body>
</html>