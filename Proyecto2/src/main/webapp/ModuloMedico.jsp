<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>Modulo Medico</h1>

<%
    Date fecha = new Date();
    SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
    String fechaActual = formatoFecha.format(fecha);
%>

<h2><a href="HorarioAtencion.jsp">Horario de atencion</a></h2><br/>
<h2><a href="AgregarEspecialidad.jsp">Agregar Especialidad</a></h2><br/>
<h2><a href="ConsultasPendientes.jsp?fecha=<%=fechaActual%>&F=n">Consultas pendientes</a></h2><br/>
<h2><a href="ConsultasPendientes.jsp?fecha=<%=fechaActual%>&F=s">Finalizar Consulta</a></h2><br/>
<h2><a href="AsignarExamen.jsp?fecha=<%=fechaActual%>">Asignar Examen</a></h2><br/>
<h2><a href="RevisarExamenes.jsp">Revisar Examenes de una consulta</a></h2><br/>
<h2><a href="HistorialMedico.jsp">Historial Medico de un paciente</a></h2><br/>


</body>
</html>
