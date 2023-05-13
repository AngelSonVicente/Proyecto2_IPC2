<%@ page import="datos.Listar" %>
<%@ page import="Web.datosBD" %>
<%@ page import="datos.Consultas" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    String fechaActual = request.getParameter("fecha");

    String IDMedico= (String) session.getAttribute("ID");




    Listar Listar = new Listar();
    datosBD dato = new datosBD();
    //  Listar.conectar();
    ArrayList<Consultas> ListarConsultas = Listar.Consultas("todo","Pendiente_revision");
%>

<div>
    <label >Listado de Consultas Pendientes de Revision:</label>

</div>

<table id="tabla-consultas">
    <thead>
    <tr>
        <th>ID Consulta</th>
        <th>ID Especialidad</th>
        <th>ID Paciente</th>
        <th>Nombre Paciente</th>
        <th>Fecha de Creacion</th>
        <th>Precio</th>
        <th>Estado</th>
    </tr>
    </thead>
    <tbody>
    <% for (Consultas consulta : ListarConsultas) { %>
    <tr>
        <td><%= consulta.getID() %></td>
        <td><%= consulta.getIdEspecialidad() %></td>
        <td><%= consulta.getIdPaciente() %></td>
        <td><%= dato.getDato("usuario_paciente","ID","nombre",String.valueOf(consulta.getIdPaciente())) %></td>
        <td><%= consulta.getFechaCreacion() %></td>
        <td><%= consulta.getPrecio() %></td>
        <td><%= consulta.getEstado() %></td>
        <td><a href="DetallesConsulta.jsp?id=<%= consulta.getID() %>"> Ver Examenes</a></td>
        <td><a href="FinalizarConsulta.jsp?id=<%= consulta.getID() %>">Finalizar Consulta</a></td>



    </tr>
    <% } %>
    </tbody>
</table>



</body>
</html>
