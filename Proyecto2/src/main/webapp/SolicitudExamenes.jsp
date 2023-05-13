<%@ page import="Web.datosBD" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="datos.*" %><%--
  Created by IntelliJ IDEA.
  User: angel
  Date: 30/04/2023
  Time: 12:06 a. m.
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

    String IDPaciente= (String) session.getAttribute("ID");
    String IDC = request.getParameter("C");
    String IDL = request.getParameter("L");
    String saldo= (String) session.getAttribute("saldo");

    Listar Listar = new Listar();
    datosBD dato = new datosBD();
    //Listar.conectar();
    ArrayList<Consultas> ListarConsultas = Listar.ConsultasPE(IDPaciente,"Examen_Pendiente");
    ArrayList<ExamenConsulta> ListarExamen = Listar.ExamenesConsultaIE(IDC,"Examen_pendiente");
    ArrayList<ExamenConsulta> ListarExamenesaRealizar = Listar.ExamenesConsulta(IDC);

    ArrayList<Laboratorios> ListarLab = Listar.ListarLaboratorios();
    ArrayList<Integer> ListaExamen = new ArrayList<Integer>();
    //ArrayList<ExamenConsulta> ListarExamen = Listar.ExamenesConsulta(IDC);
   // ArrayList<TipoExamen> ListarTipoExamen = Listar.TipoExamen();


%>
<div style="position: absolute; top: 0; right: 3%;">
    <label>saldo: <%=saldo%></label>
</div>
<%if(IDC!=null){%>
<label>Lista De Examenes A Realizar</label>
<table id="tabla-consultas">
    <thead>
    <tr>
        <th>ID examen</th>
        <th>Nombre Examen</th>
        <th>Estado</th>

    </tr>
    </thead>
    <tbody>
    <%if(ListarExamen!=null){%>
    <% for (ExamenConsulta examenn : ListarExamenesaRealizar) {

    if(IDL!=null){
   if(examenn.getEstado().equals("Examen_pendiente")){
    ListaExamen.add(examenn.getIdExamen());
   }

    }

    %>


    <tr>
        <td><%= examenn.getIdExamen() %></td>
        <td><%= examenn.getNombre() %></td>
        <td><%= examenn.getEstado() %></td>

        <%}%>


    </tr>
    <% } %>
    </tbody>
</table>

<%}%>





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
<br>
<br>
<%if(IDC!=null){%>

    <label>Seleccione El Laboratorio donde desea realizar sus examenes</label><br>
    <select id="labs" name="lab" onchange="ActualizarLab()">
        <option >Seleccione un Laboratorio</option>
        <% for (Laboratorios Lab : ListarLab) {
            String selected = "";
            if (IDL != null && IDL.equals(String.valueOf(Lab.getID()))) {
                selected = "selected";
            }%>
        <option value="<%=Lab.getID() %>" data-precio="<%=Lab.getNombre()%>"  <%= selected %>>
          Nombre: <%=Lab.getNombre()%> Fundacio: <%=Lab.getFundacion()%> Direccion: <%=Lab.getDireccion()%> Correo: <%=Lab.getCorreo()%></option>
        <% } %>
    </select>


    <%}%>

    <%if(IDL!=null){%>
<br>
<br>

    <label>Examenes que puede Realizar el Laboratorio</label><br>
    <select id="examenes" name="examen" >
        <option >Seleccione una examen</option>
        <%  ArrayList<ExamenesLaboratorio> ListarExamenesLab = dato.ExamenesDisponibles(ListaExamen, Integer.parseInt(IDL));
            for (ExamenesLaboratorio examen : ListarExamenesLab) {

            %>
        <option value="<%=examen.getIDExamen()%>" data-precio="<%=examen.getPrecio()%>" data-nombre="<%=examen.getNombre()%>">
            Nombre:  <%=examen.getNombre()%> - Precio: <%=examen.getPrecio()%> </option>
        <% } %>
    </select>



    <button type="button" onclick="agregarEspecialidad()">Agregar</button>
    <button type="button" onclick="ActualizarLab()">Limpiar</button>
    <table id="tabla_especialidad">
        <thead>
        <tr>
            <th>ID</th>
            <th>Nombre Examen</th>
            <th>Costo</th>
        </tr>
        </thead>
        <tbody>



        </tbody>
    </table>


    <%}%>



<br>
<br>
    <input type="hidden" name="precio" id="precio" value="" />
      <input type="hidden" name="IDConsulta" value="<%=IDC%>">
      <input type="hidden" name="IDLab" value="<%=IDL%>">
      <input type="hidden" name="SaldoPaciente" value="<%=saldo%>">
      <input type="hidden" name="IDPaciente" value="<%=IDPaciente%>">
      <input type="hidden" name="Fecha" value="<%=fechaActual%>">
    <input type="button" value="Agendar Examen" onclick="validarFormulario()">

</form>





<script>
    var total=0;

    function actualizarTabla(){
        var ID = document.getElementById("consulta").value;
        window.location.href = "SolicitudExamenes.jsp?C="+ID;
    }
    function ActualizarLab(){
        var ID = document.getElementById("consulta").value;
        var IDLab=document.getElementById("labs").value
        window.location.href = "SolicitudExamenes.jsp?C="+ID+"&L="+IDLab;
    }
    function validarFormulario() {


        var select = document.getElementById("exameneslab");
        var monto = "<%=saldo%>";
        if (parseFloat(total) < parseFloat(monto)) {
            document.getElementById("precio").value = total;
            document.getElementById("formulario_examen").submit();
        } else {
            alert("no le alcanza, recargue mejor pinshi pobre :3  " + total);
        }

    }


    function agregarEspecialidad() {

        var select = document.getElementById("examenes");
        var optionSeleccionada = select.options[select.selectedIndex];
        var precio = optionSeleccionada.dataset.precio;
        var nombre = optionSeleccionada.dataset.nombre;

        total =parseFloat(total)+ parseFloat(precio);

        var especialidad = document.getElementById("examenes").value;

        // crea un nuevo objeto Especialidades y agrega los datos
        var nuevaEspecialidad = {
            ID: especialidad,
            Nombre: nombre,
            Costo: precio
        };

        // crea los nuevos inputs y los agrega al formulario
        var inputId = document.createElement("input");
        inputId.setAttribute("type", "hidden");
        inputId.setAttribute("name", "id[]");
        inputId.setAttribute("value", nuevaEspecialidad.ID);

        var inputNombre = document.createElement("input");
        inputNombre.setAttribute("type", "hidden");
        inputNombre.setAttribute("name", "nombre[]");
        inputNombre.setAttribute("value", nuevaEspecialidad.Nombre);

        var inputCosto = document.createElement("input");
        inputCosto.setAttribute("type", "hidden");
        inputCosto.setAttribute("name", "costo[]");
        inputCosto.setAttribute("value", nuevaEspecialidad.Costo);

        var formulario = document.getElementById("formulario_examen");
        formulario.appendChild(inputId);
        formulario.appendChild(inputNombre);
        formulario.appendChild(inputCosto);

        // agrega la fila a la tabla
        var fila = document.createElement("tr");
        var celda1 = document.createElement("td");
        var texto1 = document.createTextNode(nuevaEspecialidad.ID);
        celda1.appendChild(texto1);
        fila.appendChild(celda1);
        var celda2 = document.createElement("td");
        var texto2 = document.createTextNode(nuevaEspecialidad.Nombre);
        celda2.appendChild(texto2);
        fila.appendChild(celda2);
        var celda3 = document.createElement("td");
        var texto3 = document.createTextNode(nuevaEspecialidad.Costo);
        celda3.appendChild(texto3);
        fila.appendChild(celda3);
        document.getElementById("tabla_especialidad").getElementsByTagName("tbody")[0].appendChild(fila);

    }

    function enviarEspecialidades() {
        var formulario = document.getElementById("formulario_examen");
        var formData = new FormData(formulario);
        var filasTabla = document.getElementById("tabla_especialidad").getElementsByTagName("tbody")[0].getElementsByTagName("tr");

        for (var i = 0; i < filasTabla.length; i++) {
            var id = filasTabla[i].querySelector('[name="id[]"]').value;
            var nombre = filasTabla[i].querySelector('[name="nombre[]"]').value;
            var costo = filasTabla[i].querySelector('[name="costo[]"]').value;

            formData.append("id_" + i, id);
            formData.append("nombre_" + i, nombre);
            formData.append("costo_" + i, costo);
        }

        var xhr = new XMLHttpRequest();
        xhr.open("POST", formulario.action, true);
        xhr.send(formData);
    }



</script>
</body>
</html>
