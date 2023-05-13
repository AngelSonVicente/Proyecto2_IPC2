<%@ page import="datos.Listar" %>
<%@ page import="Web.datosBD" %>
<%@ page import="datos.SolicitudesExamenes" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ver Resultados</title>
</head>
<body>



<%

    String IDPaciente= (String) session.getAttribute("ID");




    Listar Listar = new Listar();
    datosBD dato = new datosBD();
    //  Listar.conectar();
    ArrayList<SolicitudesExamenes> ListarSolicitudes = Listar.SolicitudesExamenesIEP(IDPaciente,"Finalizado");
%>

<div>
    <label >Listado de Solicitudes Finalizadas </label>

</div>

<table id="tabla-consultas">
    <thead>
    <tr>
        <th>ID Solicitud</th>
        <th>Laboratorio</th>
        <th>Fecha Solicitud</th>
        <th>Fecha Finalizado</th>
        <th>Precio</th>
        <th>Estado</th>
    </tr>
    </thead>
    <tbody>
    <% for (SolicitudesExamenes solicitud : ListarSolicitudes) { %>
    <tr>
        <td><%= solicitud.getID() %></td>
        <td><%= dato.getDato("usuario_laboratorio","ID","nombre",String.valueOf(solicitud.getIDLaboratorio()))%></td>
        <td><%= solicitud.getFechaSolicitud() %></td>
         <td><%= solicitud.getFechaFinalizado() %></td>
        <td><%= solicitud.getPrecio() %></td>
        <td><%= solicitud.getEstado() %></td>
        <td><a href="VerExamenesSolicitud.jsp?id=<%= solicitud.getID() %>"> Ver Examenes</a></td>



    </tr>
    <% } %>
    </tbody>
</table>


</body>
</html>
