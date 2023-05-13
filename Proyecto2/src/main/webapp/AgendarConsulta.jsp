<%@ page import="java.util.ArrayList" %>
<%@ page import="Web.datosBD" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.time.LocalTime" %>
<%@ page import="datos.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

</head>
<body>
<%
    String IDPaciente= (String) session.getAttribute("ID");
    String saldo= (String) session.getAttribute("saldo");
    Listar Listar = new Listar();
    datosBD dato = new datosBD();
    String Especialidad="";
    Especialidad=request.getParameter("Es");
    String IDMedico=request.getParameter("Medico");
    String Fecha=request.getParameter("Fecha");
    Date fecha = new Date();
    SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
    String fechaActual = formatoFecha.format(fecha);

    ArrayList<Especialidades> ListarEspecialidad = Listar.Especialidades();
    ArrayList<EspecialidadesMedico> ListarMedicos = Listar.EspecialidadesMedico(Especialidad);
   ArrayList<HorarioMedico> ListarHorarios = Listar.HorarioMedico(IDMedico);


%>
<div style="position: absolute; top: 0; right: 3%;">
    <label>saldo: <%=saldo%></label>
</div>




<label>Listado de Especialidades</label>
<table id="tabla-consultas">
    <thead>
    <tr>
        <th>Nombre</th>
        <th>Descripcion</th>
    </tr>
    </thead>
    <tbody>
   <% for (Especialidades especialidad : ListarEspecialidad) { %>
    <tr>
        <td><%= especialidad.getNombre() %></td>
        <td><%= especialidad.getDescripcion()%></td>
        <%}%>
    </tr>

    </tbody>
</table>

<form method="post" action="ConsultaAgendada" id="formulario_especialidades" onsubmit="event.preventDefault(); validarFormulario();">
    <br/>
    <label>Seleccione La especialidad:</label><br/>
    <select id="especialidades" name="especialidad" onchange="actualizarSelect()">
        <option value="">Seleccione Una Especialidad</option>
        <% for (Especialidades especialidad : ListarEspecialidad) {
            String selected = "";
            if (Especialidad != null && Especialidad.equals(String.valueOf(especialidad.getID()))) {
                selected = "selected";
            } %>
        %>

        <option value="<%=especialidad.getID() %>" <%= selected %>>
            <%= especialidad.getNombre() %></option>
        <% } %>
    </select>

    <%if(Especialidad!=null){%>
    <select id="Medicos" name="medico" onchange="MostrarHorarios()">
        <option value="">Seleccione un Medico</option>
        <% for (EspecialidadesMedico medico : ListarMedicos) {
            String selected = "";
            if (IDMedico != null && IDMedico.equals(String.valueOf(medico.getIDMedico()))) {
                selected = "selected";
            }
        %>
        <option value="<%=medico.getIDMedico() %>" data-precio="<%=dato.getDato2("especialida_medico","ID_medico","precio",String.valueOf(medico.getIDMedico()),"ID_especialidad",Especialidad)%>" <%= selected %>>

            <%= dato.getDato("usuario_medico","ID","nombre",String.valueOf(medico.getIDMedico()))%> - Precio: <%=dato.getDato2("especialida_medico","ID_medico","precio",String.valueOf(medico.getIDMedico()),"ID_especialidad",Especialidad)%></option>

        <% } %>
    </select>

    <%}
    if(IDMedico!=null){%>


    <table id="tabla_horarios">
        <thead>
        <tr>
            <th>Horario De Atencion</th>
        </tr>
        </thead>
        <tbody>
        <% for (HorarioMedico horario : ListarHorarios) { %>
        <tr>
            <td><%= horario.getHoraInicio() %></td>
            <td><%= horario.getHoraFinal() %></td>
        </tr>
        <% } %>
        </tbody>
    </table>

    <div style="display: flex;">
        <div style="display: inline-block; width: 20%;">
            <label>Ingrese la fecha que desea agendar</label><br>
            <%if(Fecha!=null){%>
            <input type="date" id="Fecha" value="<%=Fecha%>" onblur="MostrarHorariosDisponibles()" >
        </div>
        <div style="display: inline-block; width: 25%;">
            <label>Seleccione la hora que desea agendar su consulta</label><br>
            <select name="horas">
                <option value="">Selecciona una hora</option>
                <% ArrayList<String> horasDisponibles = HorariosDisponibles.buscarHorariosDisponibles(IDMedico,Fecha);
                    for (String hora : horasDisponibles) { %>
                <option value="<%= hora.toString() %>"><%= hora.toString() %></option>
                <% } %>
            </select>
        </div>
    </div>
    <%}else{%>
    <input type="date" name ="Fechaa" id="Fecha" value="<%=fechaActual%>" onblur="MostrarHorariosDisponibles()" >
    <%}%>
<%}%>













    <input type="hidden" name="IdPaciente" value="<%=IDPaciente%>">
    <input type="hidden" name="fechaa" value="<%=Fecha%>">
    <input type="hidden" name="fechaActual" value="<%=fechaActual%>">
    <input type="hidden" name="saldoPaciente" value="<%=saldo%>">
    <input type="hidden" name="precio" id="precio" value="" />
<br>
<br>

    <input type="button" value="Agendar Consulta" onclick="validarFormulario()">

</form>



<script>

    function actualizarSelect(){
        var Especialidad = document.getElementById("especialidades").value;
        window.location.href = "AgendarConsulta.jsp?Es=" + Especialidad;
    }

    function MostrarHorarios(){
        var Especialidad = document.getElementById("especialidades").value;
        var IDMedico = document.getElementById("Medicos").value;
        window.location.href = "AgendarConsulta.jsp?Es=" + Especialidad+"&Medico="+IDMedico;
    }

    function MostrarHorariosDisponibles(){
        var Especialidad = document.getElementById("especialidades").value;
        var IDMedico = document.getElementById("Medicos").value;
        var fecha = document.getElementById("Fecha").value;
        window.location.href = "AgendarConsulta.jsp?Es=" + Especialidad+"&Medico="+IDMedico+"&Fecha="+fecha;
    }
    function validarFormulario() {


            var select = document.getElementById("Medicos");
            var precio = select.options[select.selectedIndex].text.match(/Precio: (\d+)/)[1];
            var monto = "<%=saldo%>";
            if (parseFloat(precio) < parseFloat(monto)) {
                document.getElementById("precio").value = precio;
                document.getElementById("formulario_especialidades").submit();
            } else {
                alert("Su Saldo Es Insuficinte, le invitamos a realizar una recarga");
            }

    }


</script>
</body>
</html>
