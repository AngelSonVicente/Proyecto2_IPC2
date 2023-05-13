<%--
  Created by IntelliJ IDEA.
  User: angel
  Date: 23/04/2023
  Time: 12:58 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
String IDConsulta= request.getParameter("id");

%>
<h4>Ingrese su informe</h4>
<form action="ConsultaFinalizada" method="post">
    <textarea name="informe" rows="10" cols="50"></textarea></br></br>

    <input type="hidden" name="IDConsulta" value="<%=IDConsulta%>">
  <input type="submit" value="Finalizar">
</form>
</body>
</html>
