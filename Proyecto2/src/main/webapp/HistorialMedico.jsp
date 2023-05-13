<%@ page import="datos.Listar" %>
<%@ page import="Web.datosBD" %>
<%@ page import="datos.Consultas" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="datos.SolicitudesExamenes" %><%--
  Created by IntelliJ IDEA.
  User: angel
  Date: 11/05/2023
  Time: 11:01 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Historial Medico</title>
</head>
<body>

<%

    String IDMedico= (String) session.getAttribute("ID");


    String IDPaciente =request.getParameter("id");

    Listar Listar = new Listar();
    datosBD dato = new datosBD();
    //  Listar.conectar();

      ArrayList<Consultas> ListarConsultas = Listar.ConsultasPE(IDPaciente,"Finalizado");
      ArrayList<SolicitudesExamenes> ListarSolis = Listar.SolicitudesExamenesIEP(IDPaciente,"Finalizado");

%>

<form method="post" action="HistorialMedico.jsp">
    <input type ="text" name="id" <%if(IDPaciente!=null){%>value="<%=IDPaciente%>"<%}%>>
    <input type="submit" value="Mostrar Historial Medico">
</form>
<%if(IDPaciente!=null){%>

<h1>Consultas</h1>
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



    </tr>
    <% } %>
    </tbody>
</table>

<br>
<br>
<br>



<h1>Solicitudes de examenes</h1>
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
        <td><a href="VerExamenesSolicitud.jsp?id=<%= solicitud.getID() %>"> Ver Examenes</a></td>


    </tr>
    <% } %>
    </tbody>
</table>



<%}%>

</body>
</html>
