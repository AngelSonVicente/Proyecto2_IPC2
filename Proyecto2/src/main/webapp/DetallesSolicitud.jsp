<%@ page import="datos.Listar" %>
<%@ page import="Web.datosBD" %>
<%@ page import="datos.ListaExamenes" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Base64" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String IDlaboratorio= (String) session.getAttribute("ID");
    String saldo= (String) session.getAttribute("saldo");
    String IDsoli = request.getParameter("id");

    Listar Listar = new Listar();
   // datosBD dato = new datosBD();

    ArrayList<ListaExamenes> ListaExamenss = Listar.ListaExamenesSoli(IDsoli);
%>

<table id="tabla-examenes">
    <thead>
    <tr>
        <th>ID Solicitud</th>
        <th>Nombre Examen</th>
        <th>Precio</th>
        <th>Archivo PDF</th> <!-- Columna adicional para la carga de archivos -->
    </tr>
    </thead>
    <tbody>
    <% for (ListaExamenes examenn : ListaExamenss) {
    %>

    <tr>
        <td><%= examenn.getIDSolicitud() %></td>
        <td><%= examenn.getNombre() %></td>
        <td><%= examenn.getPrecio() %></td>
        <td>
            <%if(examenn.getEstado().equals("Examen_Completado")){%>
            PDFsubido :)
            <%}else{%>
            <form action="SubirPDFExamenSoli" method="post" enctype="multipart/form-data">
                <input type="file" name="archivoPDF">
                <input type="hidden" name="IDSolicitud" value="<%=IDsoli%>">
                <input type="hidden" name="IDExamen" value="<%=examenn.getIDExamen()%>">
                <input type="submit" value="Subir PDF">
            </form>
            <%}%>
        </td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>


</body>
</html>
