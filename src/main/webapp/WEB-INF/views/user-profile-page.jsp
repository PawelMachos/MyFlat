<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: marta
  Date: 28.02.2020
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Profile</title>

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

    </style>
</head>
<body>
<div class="row">
    <div class="col-12" style="padding-bottom: 20px">

        <div class="ex1">
            <table class="table">

                    <tr>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Username&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</tr><br/>
                <tr><b>${user.username}</b></tr><br/>
                <tr>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</tr><br/>
                <tr><b>********</b></tr><br/>
                    <tr>First name</tr><br/>
                <tr>${user.firstName}</tr><br/>
                    <tr>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Last name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</tr><br/>
                <tr>${user.lastName}</tr><br/>
                    <tr>&nbsp;&nbsp;E-mail&nbsp;&nbsp;&nbsp;&nbsp;</tr><br/>
                <tr>${user.email}</tr><br/>

                <tr>
                    <td colspan="6">

                        <div class="btn-group" style="float: right; margin-right: 0px">
                            <form class="form-inline" style="margin-left: 1em" method="get" action="/profile/edit">
                                <button type="submit" class="btn btn-info">&nbsp;&nbsp;Edit&nbsp;&nbsp;</button>
                                <input type="hidden" name="taskId" value="${task.id}"/>
                                <sec:csrfInput/>
                            </form>
                            <form class="form-inline" style="margin-left: 1em" >
                                <a href="/home" class="btn btn-secondary">Back</a>
                                <input type="hidden" name="id" value="${user.id}"/>
                                <input type="hidden" name="redirectTo" value="/home"/>
                                <sec:csrfInput/>
                            </form>
                        </div>
                        </form>
        </td>
        </tr>
        </table>
    </div>

</div>
</div>
</body>
</html>
