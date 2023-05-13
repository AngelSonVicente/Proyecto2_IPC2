<%@ page import="datos.Listar" %>
<%@ page import="Web.datosBD" %>
<%@ page import="datos.Actualizar" %>
<%@ page import="datos.ExamenConsulta" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.util.Map" %>
<%@ page import="jakarta.servlet.http.Part" %>
<%@ page import="java.util.Arrays" %><%--
  Created by IntelliJ IDEA.
  User: angel
  Date: 09/05/2023
  Time: 12:38 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    Listar Listar = new Listar();
    datosBD dato = new datosBD();
    Actualizar actualizar = new Actualizar();
    String IDConsulta =request.getParameter("IDConsulta");


    ArrayList<ExamenConsulta> ListarExamenesaRealizar = Listar.ExamenesConsulta(IDConsulta);
    int contG=0;
    int contER=0;


%>
<h1>El Archivo se ha subido con existo</h1>


    <%
        for (ExamenConsulta examenn : ListarExamenesaRealizar) {
            contG++;
        if(examenn.getEstado().equals("Examen_Completado")){
            contER++;
        }
    %>
<% }

%>

<%if(contG==contER){%>
<h1>Se han subido todos los resultados de los examenes, puede volver al modulo</h1>
<form method="post" action="ModuloPaciente.jsp">
    <input type="submit" value="Volver al Modulo">
    <%
    actualizar.Consulta(IDConsulta,"estado","Pendiente_revision");

    %>


</form>

<%}else{

%>
<h1>Aun No se han subido todos los resultados de los examenes, por favor subir los resultados restantes </h1>
<form method="post" action="SubirResultadosExamenes.jsp?C=<%=IDConsulta%>">
    <input type="submit" value="Seguir Subiendo Archivos">
</form>

<%}%>



</body>
</html>
