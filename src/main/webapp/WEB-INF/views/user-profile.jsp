<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
          integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
          crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
            integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
            integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
            crossorigin="anonymous"></script>

    <style>

        * {
            font-family: 'Ruda', sans-serif;
            font-size: 12px;
        }

        .col-6 {
            text-align: center;
        }

        .cell-breakAll {
            word-break: break-all;
        }

    </style>

</head>
<body style="background-color: #eaeaea">

<div class="container">

    <sec:authorize access="isAuthenticated()">
        <div class="row" style="margin-top: 40px; margin-bottom: 10px">
            <div class="col-1"></div>
            <div class="col-6"><h2 style="text-align: left; margin-left: 85px">Edit Your Profile:</h2></div>
            <div class="col-5"></div>
        </div>

        <div class="row">
            <div class="col-2"></div>
            <div class="col-8">

                <form method="post" action="/user-profile">
                    <div class="form-group">
                        <label for="username">Username:</label>
                        <input type="text" required name="username" id="username" class="form-control"
                               value="${user.username}"/>
                    </div>
                    <div class="form-group">
                        <label for="firstName">First name</label>
                        <input type="text" required name="firstName" id="firstName" class="form-control"
                               value="${user.firstName}"/>
                    </div>
                    <div class="form-group">
                        <label for="lastName" style="color: #aeb2b7;">Last name</label>
                        <input type="text" required name="lastName" id="lastName" class="form-control"
                               value="${user.lastName}"/>
                    </div>

<%--                    <div class="form-group">--%>
<%--                        <label for="password">Password</label>--%>
<%--                        <input type="password" id="password" name="password"--%>
<%--                               pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"--%>
<%--                               class="form-control" value="${user.password}"/>--%>
<%--                    </div>--%>

                    <div class="form-group">
                        <label for="email">E-mail</label>
                        <input type="email" required name="email" id="email" class="form-control"
                               value="${user.email}"/>
                    </div>

                    <button class="btn btn-info" type="submit">Edit</button>
                    <a href="/home" class="btn btn-secondary">Back</a>
                    <input type="hidden" name="id" value="${user.id}"/>
                    <input type="hidden" name="redirectTo" value="/home"/>
                    <sec:csrfInput/>
                </form>

            </div>
            <div class="col-2"></div>
        </div>
    </sec:authorize>

</div>
</body>
</html>