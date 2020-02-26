<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Bea
  Date: 2020-02-16
  Time: 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<html>
<head>

    <style>
        .main-tile {
            width: 50%;
            height: 50%;
            /*border-style: solid;*/
            /*border-color: black;*/
            float: left;
        }

        .hover a:hover {
            color: white;
            background: black;
        }

        div.advert {
            object-position: center;
            text-align: center;
            background-color: lightyellow;
            width: 90%;
            padding: 10px;
            margin: 10px;
        }

        div.title {
            text-transform: uppercase;
            font-size: large;
        }

        div.autorzy {
            font-size: small;
        }

        .fieldset {
            block-size: content-box;
        }

        .table {
            block-size: content-box;
        }


    </style>

    <link href="/static/css/bill.css" type="text/css" rel="stylesheet">
    <link href="../../static/css/style.css" type="text/css" rel="stylesheet">

</head>
<body>

<div id="main-sec">

    <div class="main-tile">
        <fieldset class="fieldset">
            <a href="/adverts" style="font-size: large"><h4 style="text-align: center">NAJNOWSZE OGŁOSZENIE</h4></a>

            <div class="advert">

                <table>

                    <tr>

                        <td>
                            <div class="autorzy">
                                ${newestAdvert.user.username}, dodano: ${newestAdvert.createdAt.format(DateTimeFormatter
                                    .ofPattern("dd/MM/yyyy  hh:mm a"))}
                            </div>
                        </td>

                    </tr>

                    <td>
                        <hr>
                    </td>

                    <tr>
                        <th>
                            <div class="title">${newestAdvert.title}</div>
                        </th>
                    </tr>

                    <tr>
                        <td>${newestAdvert.description}</td>
                        <br>
                    </tr>

                </table>
            </div>

        </fieldset>
    </div>

    <div class="main-tile">
        <fieldset style="margin:15px; height:45%; padding-top: 30px;">
            <legend style="text-align:center">THE TOTAL AMOUNT TO PAY:</legend>
            <div id="sum"> ${billsToPay} pln</div>
        </fieldset>
    </div>
    <div class="main-tile">

        <fieldset>
            <table class="table">
                <tr>
                    <th>No.</th>
                    <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Title&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                    <th>Description</th>
                    <th>&nbsp;&nbsp;Deadline&nbsp;&nbsp;&nbsp;&nbsp;</th>
                    <th>Status</th>
                </tr>
                <tr>
                    <td colspan="5">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                </tr>
                <c:forEach items="${allTasks}" var="task" varStatus="stat">
                    <tr>
                        <td>${stat.count}</td>
                        <td><b>${task.title}</b></td>
                        <td class="cell-breakAll">${task.description}</td>
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
                        <td colspan="5">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </fieldset>

    </div>
    <div class="main-tile">

    </div>


</div>


</body>
</html>