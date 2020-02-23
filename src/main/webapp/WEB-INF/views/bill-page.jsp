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
    <link rel="stylesheet" href="/static/css/fontello.css" type="text/css" />

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
                    <div class="fundname"><h4>Fundusz celowy</h4></div>
                    <div class="fundvalue"><h4>${bills.get(embarkedFund)} pln</h4></div>
                </div>
                <div class="fundbar">
                    <div class="fundname"><h4>Fundusz remontowy</h4></div>
                    <div class="fundvalue"><h4>${bills.get(repairFund)} pln</h4></div>
                </div>
                <div class="fundbar">
                    <div class="fundname"><h4>CO i CW - Opłata stała</h4></div>
                    <div class="fundvalue"><h4>${bills.get(coAndCW)} pln</h4></div>
                </div>
                <div class="fundbar">
                    <div class="fundname"><h4>Koszty zarządu</h4></div>
                    <div class="fundvalue"><h4>${bills.get(managementCosts)} pln</h4></div>
                </div>
                <div class="fundbar">
                    <div class="fundname"><h4>Centralne ogrzewanie<h4/></div>
                    <div class="fundvalue"><h4>${bills.get(centralHeating)} pln</h4></div>
                </div>
                <div class="fundbar">
                    <div class="fundname"><h4>Wywóz nieczystości</h4></div>
                    <div class="fundvalue"><h4>${bills.get(wasteDisposal)} pln</h4></div>
                </div>
                <div class="fundbar">
                    <div class="fundname"><h4>Podgrzanie wody</h4></div>
                    <div class="fundvalue"><h4>${bills.get(waterHeating)} pln</h4></div>
                </div>
                <div class="fundbar">
                    <div class="fundname"><h4>Zimna woda i ścieki</h4></div>
                    <div class="fundvalue"><h4>${bills.get(coldWater)} pln</h4></div>
                </div>
                <div class="fundbar">
                    <div class="fundname"><h4>Prąd</h4></div>
                    <div class="fundvalue"><h4>${bills.get(energy)} pln</h4></div>
                </div>
            </div>
                <div id="rightbar">
                    <div id="topbar">
                        <div id="pieChart">
                            <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
                        </div>
                        <div id="menu">
                            <fieldset style="margin:15px; height:45%;  padding-top: 30px;">
                                <legend style="text-align:center">THE TOTAL AMOUNT TO PAY:</legend>
                                <div id="sum"> ${billsToPay} pln</div>
                            </fieldset>
                            <button type="submit" style="color: #fff;background-color: #337ab7;border-color: #2e6da4;cursor: pointer;
                                                 border-radius:8px;font-size: 22px;float: right;margin-right: 30px;">
                                <a href="/bills/pay" style="color: white">Pay</a></button>

                        </div>
                    </div>
                    <div id="stat">
                        <div id="slicer">
                            <div class="button"><a href="/bills/energy" classs="media" style="color: white"><i class="icon-flash"></i></a></div>
                            <div class="button"><a href="/bills/water" classs="media" style="color: white"><i class="icon-water"></i></a></div>
                            <div class="button"><a href="/bills/heating" classs="media" style="color: white"><i class="icon-thermometer"></i></a></div>
                        </div>
                        <div id="lineChart">
                            <%--                <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>--%>
                        </div>
                    </div>
                </div>
            </section>
        </section>
    </div>
    <footer class="site-footer">
        <jsp:include page="footer.jsp"/>
    </footer>
</section>
</body>
</html>
