<%@ page import="datos.Listar" %>
<%@ page import="Web.datosBD" %>
<%@ page import="datos.Medicos" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="datos.SolicitudEspecialidad" %><%--
  Created by IntelliJ IDEA.
  User: angel
  Date: 11/05/2023
  Time: 11:45 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Solicitudes de especialidad</title>
</head>
<body>

<%

    String IDMedico= (String) session.getAttribute("ID");
String IDP=request.getParameter("id");


    Listar Listar = new Listar();
    datosBD dato = new datosBD();
    //  Listar.conectar();

    ArrayList<Medicos> ListarMedicos = Listar.Medicos();
    ArrayList<SolicitudEspecialidad> ListarSolis = Listar.SolicitudesEspecialidadEME(IDP,"Pendiente");

%>


<select id="consulta" name="consulta" onchange="actualizarTabla()">
    <option > Seleccione una Consulta</option>
    <% for (Medicos medico : ListarMedicos) {
        String selected = "";
        if (IDP != null && IDP.equals(String.valueOf(medico.getID()))) {
            selected = "selected";
        } %>
    <option value="<%=medico.getID() %>" <%= selected %>>
        Medico: <%= medico.getNombre()%> - Correo: <%=medico.getCorreo()%> - Fecha de Nacimiento: <%=medico.getFechaNacimiento()%></option>
    <% } %>
</select>



<%if(IDP!=null){%>

<h1>Consultas</h1>
<table id="tablaEspecialidades">
    <thead>
    <tr>
        <th>ID SOlicitud</th>
        <th>ID Especialidad</th>
        <th>Nombre Especialidad</th>
        <th>Precio</th>
        <th>Estado</th>
    </tr>
    </thead>
    <tbody>
    <% for (SolicitudEspecialidad solicitud : ListarSolis) { %>
    <tr>
        <td><%= solicitud.getID() %></td>
        <td><%= solicitud.getID_especialidad() %></td>
        <td><%= dato.getDato("especialidades","ID","nombre",String.valueOf(solicitud.getID_especialidad())) %></td>
        <td><%= solicitud.getPrecio() %></td>
        <td><%= solicitud.getEstado() %></td>
        <td>
            <form action="AceptarSolicitud" method="post" >
                <input type="hidden" name="IDMedico" value="<%=IDP%>">
                <input type="hidden" name="IDSoli" value="<%=solicitud.getID()%>">
                <input type="hidden" name="IDEspecialidad" value="<%=solicitud.getID_especialidad()%>">
                <input type="hidden" name="precio" value="<%=solicitud.getPrecio()%>">
                <input type="hidden" name="nombre" value="<%=dato.getDato("especialidades","ID","nombre",String.valueOf(solicitud.getID_especialidad()))%>">
                <input type="hidden" name="Tipo" value="Especialidad">
                <input type="submit" value="aceptar">
            </form>
        </td>
        <td>
            <form action="RechazarSolicitud" method="post" >
                <input type="hidden" name="IDSoli" value="<%=solicitud.getID()%>">
                <input type="hidden" name="Tipo" value="Especialidad">
                <input type="submit" value="Rechazar">
            </form>
        </td>


    </tr>
    <% } %>
    </tbody>
</table>
<%}%>

<script>

    function actualizarTabla(){
        var ID = document.getElementById("consulta").value;
        window.location.href = "SolicitudesDeEspecialidad.jsp?id=" + ID;
    }

</script>
</body>
</html>
