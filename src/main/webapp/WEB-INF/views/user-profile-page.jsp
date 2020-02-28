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
    <title>Title</title>
</head>
<body>
<div class="row">
    <div class="col-12" style="padding-bottom: 20px">

        <div class="ex1">
            <table class="table">
                <tr>
                    <th>No.</th>
                    <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Title&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                    <th>Description</th>
                    <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;When&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                    <th>&nbsp;&nbsp;Deadline&nbsp;&nbsp;&nbsp;&nbsp;</th>
                    <th>Status</th>
                </tr>
                <c:forEach items="${tasks}" var="task" varStatus="stat">
                <tr>
                    <td>${stat.count}</td>
                    <td><b>${task.title}</b></td>
                    <td class="cell-breakAll">${task.description}</td>
                    <td>${task.startDate}</td>
                    <td>${task.deadline}</td>
                    <td>
                        <c:if test="${task.active==true}">
                            ${task.status}
                        </c:if>
                        <c:if test="${task.active==false}">
                            ${inactive}
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <c:if test="${task.active==true}">

                        <div class="btn-group" style="float: right; margin-right: 0px">
                            <form class="form-inline" style="margin-left: 1em" method="get" action="/profile/edit">
                                <button type="submit" class="btn btn-info">&nbsp;&nbsp;Edit&nbsp;&nbsp;</button>
                                <input type="hidden" name="taskId" value="${task.id}"/>
                                <sec:csrfInput/>
                            </form>
                            <form class="form-inline" style="margin-left: 1em" method="post" action="/delete-task">
                                <button type="submit" class="btn btn-danger" onclick="return confirmDelete();">
                                    Delete
                                </button>
                                <input type="hidden" name="taskId" value="${task.id}"/>
                                <sec:csrfInput/>
                            </form>
                        </div>
                        </c:if>
                        <c:if test="${task.active!=true}">
                        <form class="form-inline" style="float: right; margin-right: 1em" method="post"
                              action="/delete-task">
                            <button type="submit" class="btn btn-danger" onclick="return confirmDelete();">Delete
                            </button>
                            <input type="hidden" name="taskId" value="${task.id}"/>
                            <sec:csrfInput/>
                        </form>
        </div>
        </c:if>
        </td>
        </tr>
        </c:forEach>
        </table>
    </div>

</div>
</body>
</html>
