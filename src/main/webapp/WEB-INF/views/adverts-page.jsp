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

<%@ page import="java.time.format.DateTimeFormatter" %>

<!DOCTYPE html>
<html>
<head>
    <title>Adverts </title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

    <link href="/static/css/bill.css" type="text/css" rel="stylesheet">
    <link href="../../static/css/style.css" type="text/css" rel="stylesheet">

    <style>
        div.title {
    text-transform: uppercase;
    }
        /*body {
            background-image: url("/static/graphics/korek.jpg");
        }*/

        .active-cyan-2 input[type=text]:focus:not([readonly]) {
            border-bottom: 1px solid #4dd0e1;
            box-shadow: 0 1px 0 0 #4dd0e1;
        }
        .active-cyan input[type=text] {
            border-bottom: 1px solid #4dd0e1;
            box-shadow: 0 1px 0 0 #4dd0e1;
        }
    </style>
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

&nbsp;
<div>


    <div class="row" style="margin-top: 40px; margin-bottom: 10px" >
        <div class="col-2"><h4>OGŁOSZENIA</h4></div>
    </div>


    <div class="row">
        <div class="col-12" style="padding-bottom: 20px">


            <!-- Search form -->
            <form class="form-inline md-form form-sm active-cyan-2 mt-2">
                <input class="form-control form-control-sm mr-3 w-75" type="text" placeholder="Szukaj ogłoszenia:"
                       aria-label="Szukaj">
                <i class="fas fa-search" aria-hidden="true"></i>
            </form>


            <div>
                <table >
                    <c:forEach items="${adverts}" var="advert" varStatus="stat">
                    <td><br></td>
                        <tr>
                            <td>${advert.user.username}, dodano: ${advert.createdAt.format(DateTimeFormatter
                            .ofPattern("dd/MM/yyyy  hh:mm a"))}</td>
                        </tr>

                    <tr>
                        <th><div class="title">${advert.title}</div></th>
                    </tr>
            </div>

            <tr>
                <td>
                        ${advert.description}</td>
            </tr>

            <td>
                <div class="btn-group">
                    <form class="form-inline" method="post" action="/delete-advert">
                        <button type="submit" class="btn btn-danger">Usuń</button>
                        <input type="hidden" name="advertId" value="${advert.id}"/>
                        <sec:csrfInput/>
                    </form>
                    <form class="form-inline" style="margin-left: 1em" method="get" action="/edit-advert">
                        <button type="submit" class="btn btn-primary">Edytuj</button>
                        <input type="hidden" name="advertId" value="${advert.id}"/>
                        <sec:csrfInput/>
                    </form>
                </div>
            </td>


            </c:forEach>
            </table>
        </div>

    </div>
</div>


    <div class="row" style="margin-center: 40px; margin-bottom: 10px">
        <div class="col-1"></div>
        <div class="col-2"><h5>Dodaj ogłoszenie</h5></div>
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
                    </div> <br>

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






</section>
</section>

</div>
</section>
&nbsp;
<div>
    <footer class="site-footer">
        <jsp:include page="footer.jsp"/>
    </footer>
</div>

</body>
</html>