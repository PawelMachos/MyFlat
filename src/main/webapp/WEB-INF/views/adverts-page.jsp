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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
</head>
<body background= "lightgrey">
<div class="container">


<div>
    <jsp:include page="header.jsp"/>
</div>
&nbsp;
<div>
    <jsp:include page="navigation.jsp"/>
</div>
&nbsp;
<div>
    <jsp:include page="side-menu.jsp"/>
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
                    <input type="hidden" name="redirectTo" value="/adverts"/>
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

            <div class="wyszukiwarka">
            Szukaj ogłoszenia: <input type="search" name="search">
            <input type="submit" value="Szukaj">
                <div>
                    
            <div>
                <table >
                    <c:forEach items="${adverts}" var="advert" varStatus="stat">
                    <td><br></td>

                        <tr>
                            <th>${advert.title}</th>
                        </tr>

                        <tr>
                        <td>${advert.user.username}, dodano: ${advert.createdAt}</td>
                        </tr>

                        <tr>
                       <td>
                        ${advert.description}</td>
                    </tr>


                    </c:forEach>
                </table>
            </div>

        </div>
    </div>

    <jsp:include page="main-section.jsp"/>
</div>
&nbsp;
<div>
    <jsp:include page="footer.jsp"/>
</div>

</body>
</html>