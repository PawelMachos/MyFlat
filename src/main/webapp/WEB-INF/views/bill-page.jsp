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
    <c:set var="embarkedFund" value="<%=Category.EARMARKED_FUND%>" />
    <c:set var="repairFund" value="<%=Category.REPAIR_FUND%>" />
    <c:set var="coAndCW" value="<%=Category.CO_AND_CW_FIXED_FEE%>" />
    <c:set var="managementCosts" value="<%=Category.MANAGEMENT_COSTS%>" />
    <c:set var="centralHeating" value="<%=Category.CENTRAL_HEATING%>" />
    <c:set var="wasteDisposal" value="<%=Category.WASTE_DISPOSAL%>" />
    <c:set var="waterHeating" value="<%=Category.WATER_HEATING%>" />
    <c:set var="coldWater" value="<%=Category.COLD_WATER_AND_SEWAGE%>" />
    <c:set var="energy" value="<%=Category.ENERGY%>" />
    <title>Bill section</title>
<%--    <link href="css/bill.css" type="text/css" rel="stylesheet"> nie dziala poki co--%>
    <style>
        *{
        box-sizing:border-box;
        }
        body{
        background-color:darkgrey;
        }
        #container{
        border: 3px solid black;
        height: 400px;
        width: 100%
        }
        #leftbar{
        border: 1px solid black;
        height: 100%;
        width: 30%;
        float: left;
        }
        #rightbar{
        border: 1px solid black;
        height: 100%;
        width: 70%;
        float: left;
        }
        .fundbar{
        border: 1px solid black;
        height:10%;
        margin: 4px;
        border-radius: 5px;
        }
        #topbar{
        border: 1px solid black;
        height:45%;
        margin: 10px;

        }
        #stat{
        border: 1px solid black;
        height:45%;
        margin: 10px;

        }
        #pieChart{
        border: 1px solid black;
        height:90%;
        margin: 10px;
        width: 60%;
        float: left;
        display: inline-block;
        }
        #menu{
        border: 1px solid black;
        height:90%;
        margin: 10px;
        width: 35%;
        float: right;
        }
        #slicer{
        border: 1px solid black;
        height:90%;
        margin: 10px;
        width: 15%;
        float: left;
        display: inline-block;
        }
        #lineChart{
        border: 1px solid black;
        height:90%;
        margin: 10px;
        width: 80%;
        float: left;
        display: inline-block;
        }
        #sum{
        border: 1px solid black;
        text-align: center;
        font-size: 35px;
        }

        #pay{
        float: right;
        margin-right: 30px;
        background-color: darkgrey;
        font-size:30px;
        }
        .fundname{
            border: 1px solid black;
            width:65%;
            height:100%;
            text-align:center;
            padding-top:8px;
            float: left;
        }
        .fundvalue{
            border: 1px solid black;
            width:30%;
            height:100%;
            text-align:center;
            padding-top:8px;
            float:right;
        }
    </style>
    <script>
        window.onload = function() {

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
            chart.render();

        }
    </script>

</head>
<body>
<div id="container">
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
            <div id="pieChart"><script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script></div>
            <div id="menu">
                <fieldset style="margin:15px; height:45%;">
                    <legend style="text-align:center">THE TOTAL AMOUNT TO PAY:</legend>
                    <div id="sum"> ${billsToPay} pln </div>
                </fieldset>
                <button id="pay" type="submit">Pay</button>
            </div>
        </div>
        <div id="stat">
            <div id="slicer"></div>
            <div id="lineChart"></div>
        </div>

    </div>
</div>
</body>
</html>
