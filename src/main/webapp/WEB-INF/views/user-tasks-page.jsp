<%--
  Created by IntelliJ IDEA.
  User: marta
  Date: 18.01.2020
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
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
</head>
<body style="background-color: lightgray">

<div class="container">

    <sec:authorize access="isAuthenticated()">
        <div class="row" style="margin-top: 40px; margin-bottom: 10px">
            <div class="col-1"></div>
            <div class="col-6"><h2>Adding New Task</h2></div>
            <div class="col-5"></div>
        </div>

        <div class="row">
            <div class="col-2"></div>
            <div class="col-8">

                <form method="post" action="/add-task">
                    <div class="form-group">
                        <label for="title">Task Title:</label>
                        <input type="text" required name="title" id="title" class="form-control"
                               placeholder="Title"/>
                    </div>
                    <div class="form-group">
                        <label for="description">Task Description:</label>
                        <textarea name="description" id="description"
                                  class="form-control"
                                  placeholder="Description"></textarea>
                    </div>
                    <button class="btn btn-primary" type="submit">Add</button>
                    <button class="btn btn-secondary" type="reset">Clear</button>
                    <input type="hidden" name="redirectTo" value="/user-tasks"/>
                    <sec:csrfInput/>
                </form>

            </div>
            <div class="col-2"></div>
        </div>
    </sec:authorize>

    <div class="row" style="margin-top: 40px; margin-bottom: 10px">
        <div class="col-1"></div>
        <div class="col-6"><h2>Your TODO List:</h2></div>
        <div class="col-5"></div>
    </div>

    <div class="row">
        <div class="col-12" style="padding-bottom: 20px">

            <table class="table">
                <tr>
                    <th>No.</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>When</th>
                    <th>Action</th>
                </tr>
                <c:forEach items="${tasks}" var="task" varStatus="stat">
                    <tr>
                        <td>${stat.count}</td>
                        <td><b>${task.title}</b></td>
                        <td>${task.description}</td>
                        <td>${task.createdAt}</td>
                        <td>
                            <div class="btn-group">
                                <form class="form-inline" method="post" action="/delete-task">
                                    <button type="submit" class="btn btn-danger">Delete</button>
                                    <input type="hidden" name="taskId" value="${task.id}"/>
                                    <sec:csrfInput/>
                                </form>
                                <form class="form-inline" style="margin-left: 1em" method="get" action="/edit-task">
                                    <button type="submit" class="btn btn-primary">Edit</button>
                                    <input type="hidden" name="taskId" value="${task.id}"/>
                                    <sec:csrfInput/>
                                </form>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </table>

        </div>
    </div>

</div>
</body>
</html>