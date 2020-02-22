<%--
  Created by IntelliJ IDEA.
  User: Bea
  Date: 2020-02-21
  Time: 23:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="http://java.com/js/dtjava.js"></script>
    <script>
        function deployIt() {
            dtjava.embed(
                {         id: "clientGui",
                    url: "Fish.jnlp",
                    width: 1000,
                    height: 800,
                    placeholder: "place"
                },
                { javafx: "2.1+" },
                {}
            );
        }
        dtjava.addOnloadCallback(deployIt);
    </script>
</head>
<body>
<%--<body>--%>
<%--<div >--%>
<%--    <APPLET CODE="ClientGui.class" WIDTH="1000" HEIGHT="800"></APPLET>--%>
<%--</div>--%>
<%--</body>--%>

    <div id="place"></div>
    </body>

</html>
