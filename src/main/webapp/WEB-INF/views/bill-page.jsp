<%@ page import="pl.com.app.myflat.model.enums.Category" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Sony
  Date: 18.02.2020
  Time: 19:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <c:set var="embarkedFund" value="<%=Category.EARMARKED_FUND%>"/>
    <c:set var="repairFund" value="<%=Category.REPAIR_FUND%>"/>
    <c:set var="coAndCW" value="<%=Category.CO_AND_CW_FIXED_FEE%>"/>
    <c:set var="managementCosts" value="<%=Category.MANAGEMENT_COSTS%>"/>
    <c:set var="centralHeating" value="<%=Category.CENTRAL_HEATING%>"/>
    <c:set var="wasteDisposal" value="<%=Category.WASTE_DISPOSAL%>"/>
    <c:set var="waterHeating" value="<%=Category.WATER_HEATING%>"/>
    <c:set var="coldWater" value="<%=Category.COLD_WATER_AND_SEWAGE%>"/>
    <c:set var="energy" value="<%=Category.ENERGY%>"/>
    <title>Bill section</title>
    <link href="/static/css/bill.css" type="text/css" rel="stylesheet">
    <link href="../../static/css/style.css" type="text/css" rel="stylesheet">

    <script>
        window.onload = function () {

            var chart = new CanvasJS.Chart("pieChart", {
                animationEnabled: true,
                title: {
                    text: "Chart of generated costs"
                },
                data: [{
                    type: "pie",
                    startAngle: 240,
                    yValueFormatString: "##0.00\"%\"",
                    indexLabel: "{label} {y}",
                    dataPoints: [
                        {y: ${percentage.get(embarkedFund)}, label: "Fundusz celowy"},
                        {y: ${percentage.get(repairFund)}, label: "Fundusz remontowy"},
                        {y: ${percentage.get(coAndCW)}, label: "CO i CW - Opłata stała"},
                        {y: ${percentage.get(managementCosts)}, label: "Koszty zarządu"},
                        {y: ${percentage.get(centralHeating)}, label: "Centralne ogrzewanie"},
                        {y: ${percentage.get(wasteDisposal)}, label: "Wywóz nieczystości"},
                        {y: ${percentage.get(waterHeating)}, label: "Podgrzanie wody"},
                        {y: ${percentage.get(coldWater)}, label: "Zimna woda i ścieki"},
                        {y: ${percentage.get(energy)}, label: "Prąd"}
                    ]
                }]
            });
            var chart2 = new CanvasJS.Chart("lineChart", {
                theme: "light2", // "light1", "light2", "dark1", "dark2"
                animationEnabled: true,
                title: {
                    text: "Trend of your costs"
                },
                axisX: {
                    interval: 1,
                    intervalType: "month",
                    valueFormatString: "MMM"
                },
                axisY: {
                    title: "Price (in PLN)",
                    valueFormatString: "pln#0"
                },
                data: [{
                    type: "line",
                    markerSize: 12,
                    xValueFormatString: "MMM, YYYY",
                    yValueFormatString: "pln###.#",
                    dataPoints: [
                        <c:forEach items="${statistics}" var="stat">
                        {
                            x: new Date(${stat.invoiceDate.year}, ${stat.invoiceDate.month}, ${stat.invoiceDate.day}),
                            y: ${stat.grossAmount},
                            markerType: "triangle",
                            markerColor: "#6B8E23"
                        },
                        </c:forEach>


                    ]
                }]
            });
            chart.render();
            chart2.render();

        }
    </script>

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
            <div id="leftbar">
                <div class="fundbar">
                    <div class="fundname">Fundusz celowy</div>
                    <div class="fundvalue">${bills.get(embarkedFund)} pln</div>
                </div>
                <div class="fundbar">
                    <div class="fundname">Fundusz remontowy</div>
                    <div class="fundvalue">${bills.get(repairFund)} pln</div>
                </div>
                <div class="fundbar">
                    <div class="fundname">CO i CW - Opłata stała</div>
                    <div class="fundvalue">${bills.get(coAndCW)} pln</div>
                </div>
                <div class="fundbar">
                    <div class="fundname">Koszty zarządu</div>
                    <div class="fundvalue">${bills.get(managementCosts)} pln</div>
                </div>
                <div class="fundbar">
                    <div class="fundname">Centralne ogrzewanie</div>
                    <div class="fundvalue">${bills.get(centralHeating)} pln</div>
                </div>
                <div class="fundbar">
                    <div class="fundname">Wywóz nieczystości</div>
                    <div class="fundvalue">${bills.get(wasteDisposal)} pln</div>
                </div>
                <div class="fundbar">
                    <div class="fundname">Podgrzanie wody</div>
                    <div class="fundvalue">${bills.get(waterHeating)} pln</div>
                </div>
                <div class="fundbar">
                    <div class="fundname">Zimna woda i ścieki</div>
                    <div class="fundvalue">${bills.get(coldWater)} pln</div>
                </div>
                <div class="fundbar">
                    <div class="fundname">Prąd</div>
                    <div class="fundvalue">${bills.get(energy)} pln</div>
                </div>
            </div>
            <div id="rightbar">
                <div id="topbar">
                    <div id="pieChart">
                        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
                    </div>
                    <div id="menu">
                        <fieldset style="margin:15px; height:45%;">
                            <legend style="text-align:center">THE TOTAL AMOUNT TO PAY:</legend>
                            <div id="sum"> ${billsToPay} pln</div>
                        </fieldset>
                        <button id="pay" type="submit">Pay</button>
                    </div>
                </div>
                <div id="stat">
                    <div id="slicer">
                        <div class="button"><a href="/bills/energy" classs="media">Energy</a></div>
                        <div class="button"><a href="/bills/water" classs="media">Water</a></div>
                        <div class="button"><a href="/bills/heating" classs="media">Heating</a></div>
                    </div>
                    <div id="lineChart">
                        <%--                <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>--%>
                    </div>
                </div>

            </div>
                        </section>
        </section>
    </div>
</section>

<footer class="site-footer">
    <jsp:include page="footer.jsp"/>
</footer>

</body>
</html>
