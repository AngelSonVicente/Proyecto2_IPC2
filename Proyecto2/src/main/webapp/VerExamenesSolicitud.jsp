<%@ page import="datos.Listar" %>
<%@ page import="Web.datosBD" %>
<%@ page import="datos.ListaExamenes" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Base64" %><%--
  Created by IntelliJ IDEA.
  User: angel
  Date: 11/05/2023
  Time: 10:17 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    String IDsoli= request.getParameter("id");
    Listar Listar = new Listar();
    datosBD dato = new datosBD();
    //  Listar.conectar();

    ArrayList<ListaExamenes> ListarExamenes = Listar.ListaExamenesSoli(IDsoli);

%>



<table>
    <thead>
    <tr>
        <th>ID Solicitud</th>
        <th>ID Examen</th>
        <th>Nombre Examen</th>
        <th>Precio</th>
        <th>Resultado</th>
    </tr>
    </thead>
    <%if(ListarExamenes!=null){%>


    <tbody>
    <% for (ListaExamenes examen : ListarExamenes) {
        String base64PDF = Base64.getEncoder().encodeToString(examen.getArchivo());
    %>
    <tr>
        <td><%= examen.getIDSolicitud() %></td>
        <td><%=examen.getIDExamen()%></td>
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
