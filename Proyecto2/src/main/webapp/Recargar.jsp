<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="Web.datosBD" %><%--
  Created by IntelliJ IDEA.
  User: angel
  Date: 12/05/2023
  Time: 05:28 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String IDPaciente= (String) session.getAttribute("ID");
    String saldo= (String) session.getAttribute("saldo");

    //Obtener la fecha y hora actual
    Date fechaHoraActual = new Date();

    //Definir el formato deseado
    SimpleDateFormat formatoFechaHora = new SimpleDateFormat("yyyy-MM-dd HH:mm");

    //Formatear la fecha y hora actual al formato deseado
    String fechayHora = formatoFechaHora.format(fechaHoraActual);

%>

<h1>Recargas</h1><br><br>

<form action="Recarga" method="post">
    <label>Saldo actual</label><br>
    <input type="text" name="saldoactual" value="<%=saldo%>" readonly><br><br>

    <input type="hidden" name="IDPaciente" value="<%=IDPaciente%>">
    <input type="hidden" name="fechaYhora" value="<%=fechayHora%>">
    <label>Ingrese el monto que desea recargar</label><br>

    <input type="text" name="monto"><br><br>

    <label>Numero de tarjeta</label><br>
    <input type="text" name="numerotarjeta"><br><br>
    <div>
    <label>vigencia</label>
    <input type="text" name="Vigencia">



        <label>CVV</label>
    <input type="text" name="CVV">
    </div>
<br>
    <input type="submit" value="recargar">
</form>
<%=fechayHora%>
</body>
</html>
