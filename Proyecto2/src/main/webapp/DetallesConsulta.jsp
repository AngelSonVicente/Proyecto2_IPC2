<%@ page import="datos.Consultas" %>
<%@ page import="datos.Listar" %>
<%@ page import="Web.datosBD" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="datos.ExamenConsulta" %>
<%@ page import="java.util.Base64" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String IDConsulta= request.getParameter("id");
    Listar Listar = new Listar();
    datosBD dato = new datosBD();
  //  Listar.conectar();

    ArrayList<ExamenConsulta> ListarExamenes = Listar.ExamenesConsulta(IDConsulta);

%>



<table id="tabla-consultas">
    <thead>
    <tr>
        <th>ID Consulta</th>
        <th>ID Examen</th>
        <th>Nombre Examen</th>
        <th>Precio</th>
        <th>Archivo</th>
    </tr>
    </thead>
    <%if(ListarExamenes!=null){%>


    <tbody>
    <% for (ExamenConsulta examen : ListarExamenes) {
        String base64PDF = Base64.getEncoder().encodeToString(examen.getArchivo());
    %>
    <tr>
        <td><%= examen.getIdConsulta() %></td>
        <td><%=examen.getIdExamen()%></td>
        <td><%= examen.getNombre() %></td>
        <td><%=examen.getPrecio() %></td>
        <td> <object data="data:application/pdf;base64,<%= base64PDF %>" type="application/pdf" width="325%" height="360px">
            <p>Tu navegador web no puede mostrar el archivo PDF. Puedes descargarlo <a href="Examen.pdf">aquí</a>.</p>
        </object>
        </td>
    </tr>
    <% } %>
    <%}%>
    </tbody>
</table>

</body>
</html>
