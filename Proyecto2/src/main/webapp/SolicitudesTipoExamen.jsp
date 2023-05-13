<%@ page import="datos.Listar" %>
<%@ page import="Web.datosBD" %>
<%@ page import="datos.Laboratorios" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="datos.SolicitudTipoExamen" %><%--
  Created by IntelliJ IDEA.
  User: angel
  Date: 12/05/2023
  Time: 01:40 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Solicitudes Tipo Examen</title>
</head>
<body>

<%

    String IDMedico= (String) session.getAttribute("ID");
    String IDP=request.getParameter("id");


    Listar Listar = new Listar();
    datosBD dato = new datosBD();
    //  Listar.conectar();

    ArrayList<Laboratorios> ListarLabs = Listar.ListarLaboratorios();
    ArrayList<SolicitudTipoExamen> ListarSolis = Listar.SolicitudesTipoExamenIE(IDP,"Pendiente");

%>


<select id="consulta" name="consulta" onchange="actualizarTabla()">
    <option > Seleccione una Consulta</option>
    <% for (Laboratorios lab : ListarLabs) {
        String selected = "";
        if (IDP != null && IDP.equals(String.valueOf(lab.getID()))) {
            selected = "selected";
        } %>
    <option value="<%=lab.getID() %>" <%= selected %>>
        Laboratorio: <%= lab.getNombre()%> - Correo: <%=lab.getCorreo()%> - Fecha de Fundacion: <%=lab.getFundacion()%></option>
    <% } %>
</select>



<%if(IDP!=null){%>

<h1>Consultas</h1>
<table id="tablaEspecialidades">
    <thead>
    <tr>
        <th>ID Solicitud</th>
        <th>ID Examen</th>
        <th>Nombre Examen</th>
        <th>Precio</th>
        <th>Estado</th>
    </tr>
    </thead>
    <tbody>
    <% for (SolicitudTipoExamen solicitud : ListarSolis) { %>
    <tr>
        <td><%= solicitud.getID() %></td>
        <td><%= solicitud.getIDExamen() %></td>
        <td><%= solicitud.getNombre()%></td>
        <td><%= solicitud.getPrecio() %></td>
        <td><%= solicitud.getEstado() %></td>
        <td>
            <form action="AceptarSolicitud" method="post" >
                <input type="hidden" name="IDlab" value="<%=IDP%>">
                <input type="hidden" name="IDSoli" value="<%=solicitud.getID()%>">
                <input type="hidden" name="IDExamen" value="<%=solicitud.getIDExamen()%>">
                <input type="hidden" name="precio" value="<%=solicitud.getPrecio()%>">
                <input type="hidden" name="nombre" value="<%=solicitud.getNombre()%>">
                <input type="hidden" name="Tipo" value="Examen">
                <input type="submit" value="aceptar">
            </form>
        </td>
        <td>
            <form action="RechazarSolicitud" method="post" >
                <input type="hidden" name="IDSoli" value="<%=solicitud.getID()%>">
                <input type="hidden" name="Tipo" value="Examen">
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
        window.location.href = "SolicitudesTipoExamen.jsp?id=" + ID;
    }

</script>
</body>
</html>
