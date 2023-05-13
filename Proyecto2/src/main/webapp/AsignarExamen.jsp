<%@ page import="datos.Listar" %>
<%@ page import="datos.ExamenConsulta" %>
<%@ page import="Web.datosBD" %>
<%@ page import="datos.Consultas" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="datos.TipoExamen" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>


</head>
<body>

<%
    String fechaActual = request.getParameter("fecha");
    String IDC = request.getParameter("F");
    String IDMedico= (String) session.getAttribute("ID");



    Listar Listar = new Listar();
    datosBD dato = new datosBD();
    //Listar.conectar();
    ArrayList<Consultas> ListarConsultas = Listar.Consultas(fechaActual,"Agendada");
    ArrayList<ExamenConsulta> ListarExamen = Listar.ExamenesConsulta(IDC);
    ArrayList<TipoExamen> ListarTipoExamen = Listar.TipoExamen();


%>

<div>
    <label for="fecha">Seleccione una fecha:</label>
    <input type="date" id="fecha" name="fecha" value="<%= fechaActual %>">
    <button onclick="actualizarTabla()">Actualizar</button>
</div>

<select id="consulta" name="consulta" onchange="actualizarTabla()">
    <% for (Consultas consulta : ListarConsultas) {
        String selected = "";
        if (IDC != null && IDC.equals(String.valueOf(consulta.getID()))) {
            selected = "selected";
        } %>
    <option > Seleccione una Consulta</option>
    <option value="<%=consulta.getID() %>" <%= selected %>>
        Paciente: <%= dato.getDato("usuario_paciente","ID","nombre",String.valueOf(consulta.getIdPaciente())) %> - ID Consulta: <%=consulta.getID()%> - Especialidad:  <%=consulta.getIdEspecialidad()%> </option>
    <% } %>
</select>


<table id="tabla-consultas">
    <thead>
    <tr>
        <th>ID examen</th>
        <th>Nombre Examen</th>
        <th>Precio</th>

    </tr>
    </thead>
    <tbody>
    <%if(ListarExamen!=null){%>
    <% for (ExamenConsulta examen : ListarExamen) { %>
    <tr>
        <td><%= examen.getIdExamen() %></td>
        <td><%= examen.getNombre() %></td>
        <td><%= examen.getPrecio() %></td>

        <%}%>


    </tr>
    <% } %>
    </tbody>
</table>




<form method="post" action="SubirExamenes" id="formulario_examen">
    <br/>
    <label>Seleccione El Examen:</label><br/>
    <select id="examenes" name="examen">
        <% for (TipoExamen tipoExamen : ListarTipoExamen) { %>
        <option value="<%=tipoExamen.getID() %>">
          <%= tipoExamen.getNombre() %></option>
        <% } %>
    </select>
    <button type="button" onclick="agregarEspecialidad()">Agregar</button>
    <table id="tabla_examen">
        <thead>
        <tr>
            <th>ID</th>
            <th>Nombre Examen</th>

        </tr>
        </thead>
        <tbody>



        </tbody>
    <input type="button" value="Limpiar" onclick="actualizarTabla()">
    </table>



    <input type="hidden" name="IdMedico" value="<%=IDMedico%>">
    <input type="hidden" name="IDConsulta" value="<%=IDC%>">
    <input type="submit" value="Asignar Examenes" onclick="enviarEspecialidades()">

</form>




<script>

    function actualizarTabla(){
        var fecha = document.getElementById("fecha").value;
        var ID = document.getElementById("consulta").value;
            window.location.href = "AsignarExamen.jsp?fecha=" + fecha+"&F="+ID;
    }




    function agregarEspecialidad() {

        var especialidad = document.getElementById("examenes").value;
         var especialidadNombre= document.getElementById("examenes").options[document.getElementById("examenes").selectedIndex].text;

        // crea un nuevo objeto Especialidades y agrega los datos
        var nuevaEspecialidad = {
            ID: especialidad,
            Nombre: especialidadNombre
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


        var formulario = document.getElementById("formulario_examen");
        formulario.appendChild(inputId);
        formulario.appendChild(inputNombre);

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
        document.getElementById("tabla_examen").getElementsByTagName("tbody")[0].appendChild(fila);
    }










    function enviarEspecialidades() {
        var formulario = document.getElementById("formulario_examen");
        var formData = new FormData(formulario);
        var filasTabla = document.getElementById("tabla_examen").getElementsByTagName("tbody")[0].getElementsByTagName("tr");

        for (var i = 0; i < filasTabla.length; i++) {
            var id = filasTabla[i].querySelector('[name="id[]"]').value;
            var nombre = filasTabla[i].querySelector('[name="nombre[]"]').value;

            formData.append("id_" + i, id);
            formData.append("nombre_" + i, nombre);

        }

        var xhr = new XMLHttpRequest();
        xhr.open("POST", formulario.action, true);
        xhr.send(formData);
    }

</script>



</body>
</html>
