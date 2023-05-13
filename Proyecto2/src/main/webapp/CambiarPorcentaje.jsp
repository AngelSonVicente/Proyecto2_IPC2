<%@ page import="Web.datosBD" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
datosBD dato= new datosBD();
String PorcentajeActual= dato.getPorcentaje();
String IDPorcentaje = String.valueOf(dato.getIDUltimoPorcentaje());


Date fecha = new Date();
    SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
    String fechaActual = formatoFecha.format(fecha);

%>


<form action="CambiarPorcentaje" method="post">

    <input type="text" name="PorcenntajeActual" value="<%=PorcentajeActual%>" readonly>
    <label>Ingrese el nuevo porcentaje (decimal)</label>
    <input type="text" name="PorcentajeNuevo">
    <input type="hidden" name="FechaActual" value="<%=fechaActual%>" >
    <input type="hidden" name="IDporcentaje" value="<%=IDPorcentaje%>" >

    <input type="submit" value="Cambiar">
</form>


</body>
</html>
