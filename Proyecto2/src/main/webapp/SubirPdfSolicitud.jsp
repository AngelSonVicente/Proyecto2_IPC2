<%@ page import="datos.Listar" %>
<%@ page import="Web.datosBD" %>
<%@ page import="datos.Actualizar" %>
<%@ page import="datos.ExamenConsulta" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="datos.ListaExamenes" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: angel
  Date: 11/05/2023
  Time: 12:28 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    Date fecha = new Date();
    SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
    String fechaActual = formatoFecha.format(fecha);
    Listar Listar = new Listar();
    datosBD dato = new datosBD();
    Actualizar actualizar = new Actualizar();
    String IDSoli =request.getParameter("ids");


    ArrayList<ListaExamenes> ListaExamenss = Listar.ListaExamenesSoli(IDSoli);



%>

<h1>El Archivo se ha subido con existo</h1>


<%
    int contG=0;
    int contER=0;

    for (ListaExamenes examenn : ListaExamenss) {
        contG++;
        if(examenn.getEstado().equals("Examen_Completado")){
            contER++;
        }
%>
<% }

%>

<%if(contG==contER){%>
<h1>Se han subido todos los resultados de los examenes, puede volver al modulo</h1>
<form method="post" action="ModuloLaboratorio.jsp">
    <input type="submit" value="Volver al Modulo">
    <%
        actualizar.SolicitudExamenn(IDSoli,"estado","Finalizado");
        actualizar.SolicitudExamenn(IDSoli,"fecha_finalizado",fechaActual);

    %>


</form>

<%}else{

%>
<h1>Aun No se han subido todos los resultados de los examenes, por favor subir los resultados restantes </h1>
<form method="post" action="DetallesSolicitud.jsp?id=<%=IDSoli%>">
    <input type="submit" value="Seguir Subiendo Archivos">
</form>

<%}%>


</body>
</html>
