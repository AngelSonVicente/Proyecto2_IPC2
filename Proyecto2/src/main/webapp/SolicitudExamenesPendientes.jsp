<%@ page import="datos.SolicitudesExamenes" %>
<%@ page import="datos.Listar" %>
<%@ page import="Web.datosBD" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: angel
  Date: 10/05/2023
  Time: 08:23 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    String fechaActual = request.getParameter("fecha");
    String IDlab= (String) session.getAttribute("ID");

    if(fechaActual==null){
    fechaActual="todo";
    }

    Listar Listar = new Listar();
    datosBD dato = new datosBD();

    ArrayList<SolicitudesExamenes> ListarSolis = Listar.SolicitudesExamenes(fechaActual,"Pendiente");

%>

<table id="tabla-soli">
    <thead>
    <tr>
        <th>ID Solicitud</th>
        <th>ID Paciente</th>
        <th>Nombre Paciente</th>
        <th>porcentaje</th>
        <th>Fecha de Solicitud</th>
        <th>Precio</th>
        <th>Estado</th>
    </tr>
    </thead>
    <tbody>
    <% for (SolicitudesExamenes solicitud : ListarSolis) { %>
    <tr>
        <td><%= solicitud.getID() %></td>
        <td><%= solicitud.getIDPaciente() %></td>
        <td><%= dato.getDato("usuario_paciente","ID","nombre",String.valueOf(solicitud.getIDPaciente())) %></td>
        <td><%= solicitud.getPorcentaje() %></td>
        <td><%= solicitud.getFechaSolicitud() %></td>
        <td><%= solicitud.getPrecio() %></td>
        <td><%= solicitud.getEstado() %></td>
        <td><a href="DetallesSolicitud.jsp?id=<%= solicitud.getID() %>"> Ver Examenes</a></td>


    </tr>
    <% } %>
    </tbody>
</table>


</body>
</html>
