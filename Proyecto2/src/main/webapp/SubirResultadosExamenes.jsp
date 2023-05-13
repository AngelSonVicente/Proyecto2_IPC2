<%@ page import="datos.Listar" %>
<%@ page import="Web.datosBD" %>
<%@ page import="datos.Consultas" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="jakarta.servlet.http.Part" %>
<%@ page import="datos.ExamenConsulta" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
String IDPaciente= (String) session.getAttribute("ID");
String saldo= (String) session.getAttribute("saldo");
    String IDC = request.getParameter("C");

    Listar Listar = new Listar();
datosBD dato = new datosBD();
    ArrayList<Consultas> ListarConsultas = Listar.ConsultasPE(IDPaciente,"Examen_Pendiente");
    //ArrayList<ExamenConsulta> ListarExamen = Listar.ExamenesConsultaIE(IDC,"Examen_pendiente");
    ArrayList<ExamenConsulta> ListarExamenesaRealizar = Listar.ExamenesConsulta(IDC);




%>

<form method="post" action="SubirSolicitudExamen" id="formulario_examen" onsubmit="event.preventDefault(); validarFormulario();">

    <label>Seleccione una Consulta</label><br>
    <select id="consulta" name="consulta" onchange="actualizarTabla()">
        <option value="">  Seleccione una Consulta</option>
        <% for (Consultas consulta : ListarConsultas) {
            String selected = "";
            if (IDC != null && IDC.equals(String.valueOf(consulta.getID()))) {
                selected = "selected";
            } %>
        <option value="<%=consulta.getID() %>" <%= selected %>>
            ID Consulta: <%=consulta.getID()%> - Especialidad:  <%=consulta.getIdEspecialidad()%> - Agendada el: <%=consulta.getFechaAgendada()%></option>
        <% } %>
    </select>
</form>

<%if(IDC!=null){%>
<label>Lista De Examenes A subir</label>
<table id="tabla-examenes">
    <thead>
    <tr>
        <th>ID examen</th>
        <th>Nombre Examen</th>
        <th>Estado</th>
        <th>Archivo PDF</th> <!-- Columna adicional para la carga de archivos -->
    </tr>
    </thead>
    <tbody>
    <% for (ExamenConsulta examenn : ListarExamenesaRealizar) {
    %>

    <tr>
        <td><%= examenn.getIdExamen() %></td>
        <td><%= examenn.getNombre() %></td>
        <td><%= examenn.getEstado() %></td>
        <td>
            <%if(examenn.getEstado().equals("Examen_Completado")){%>
                    PDFsubido :)
            <%}else{%>
            <form action="SubirPDF" method="post" enctype="multipart/form-data">
                <input type="file" name="archivoPDF">
                <input type="hidden" name="IDConsulta" value="<%=IDC%>">
                <input type="hidden" name="IDExamen" value="<%=examenn.getIdExamen()%>">
                <input type="submit" value="Subir PDF">
            </form>
            <%}%>
        </td>
    </tr>
    <% }
    }
    %>
    </tbody>
</table>




<script>
    function actualizarTabla(){
        var ID = document.getElementById("consulta").value;
        window.location.href = "SubirResultadosExamenes.jsp?C="+ID;
    }



</script>
</body>
</html>
