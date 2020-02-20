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
        width: 40%;
        float: left;
        display: inline-block;
        }
        #menu{
        border: 1px solid black;
        height:90%;
        margin: 10px;
        width: 45%;
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
</head>
<body>
<div id="container">
    <div id="leftbar">
        <div class="fundbar">
            <div class="fundname">Fundusz celowy</div>
            <div class="fundvalue">${bills.get('EARMARKED_FUND')}</div>
        </div>
        <div class="fundbar">
            <div class="fundname">Fundusz remontowy</div>
            <div class="fundvalue">${bills.get('REPAIR_FUND')}</div>
        </div>
        <div class="fundbar">
            <div class="fundname">CO i CW - Opłata stała</div>
            <div class="fundvalue">${bills.get('CO_AND_CW_FIXED_FEE')}</div>
        </div>
        <div class="fundbar">
            <div class="fundname">Koszty zarządu</div>
            <div class="fundvalue">${bills.get('MANAGEMENT_COSTS')}</div>
        </div>
        <div class="fundbar">
            <div class="fundname">Centralne ogrzewanie</div>
            <div class="fundvalue">${bills.get('CENTRAL_HEATING')}</div>
        </div>
        <div class="fundbar">
            <div class="fundname">Wywóz nieczystości</div>
            <div class="fundvalue">${bills.get('WASTE_DISPOSAL')}</div>
        </div>
        <div class="fundbar">
            <div class="fundname">Podgrzanie wody</div>
            <div class="fundvalue">${bills.get('WATER_HEATING')}</div>
        </div>
        <div class="fundbar">
            <div class="fundname">Zimna woda i ścieki</div>
            <div class="fundvalue">${bills.get('COLD_WATER_AND_SEWAGE')}</div>
        </div>
        <div class="fundbar">
            <div class="fundname">Prąd</div>
            <div class="fundvalue">${bills.get('ENERGY')}</div>
        </div>
    </div>
    <div id="rightbar">
        <div id="topbar">
            <div id="pieChart"></div>
            <div id="menu">
                <fieldset style="margin:15px; height:45%;">
                    <legend style="text-align:center">THE TOTAL AMOUNT TO PAY:</legend>
                    <div id="sum"> ${billsToPay} zł </div>
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
