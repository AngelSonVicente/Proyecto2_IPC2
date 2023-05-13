<%@ page import="datos.Listar" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="datos.Especialidades" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

</head>
<body>

<%
    String IDMedico= (String) session.getAttribute("ID");
    Listar Listar = new Listar();
    //Listar.conectar();

    ArrayList<Especialidades> ListarEspecialidad = Listar.Especialidades();

%>
<form method="post" action="SubirSolocitudEspecialidad" id="formulario_especialidades">
    <br/>
    <label>Seleccione La especialidad:</label><br/>
    <select id="especialidades" name="especialidad">
        <% for (Especialidades especialidad : ListarEspecialidad) { %>
        <option value="<%=especialidad.getID() %>">
            <%= especialidad.getNombre() %></option>
        <% } %>
    </select>
    <button type="button" onclick="agregarEspecialidad()">Agregar</button>
    <table id="tabla_especialidad">
        <thead>
        <tr>
            <th>ID</th>
            <th>Especialidad</th>
            <th>Costo</th>
        </tr>
        </thead>
        <tbody>



        </tbody>
    </table>




    <input type="hidden" name="IdMedico" value="<%=IDMedico%>">



    <input type="submit" value="Solicitar" onclick="enviarEspecialidades()">

</form>

<script>
    function agregarEspecialidad() {

        var especialidad = document.getElementById("especialidades").value;
        var costo = prompt("Ingrese el costo de la especialidad " + especialidad);
        var especialidadNombre= document.getElementById("especialidades").options[document.getElementById("especialidades").selectedIndex].text;

        // crea un nuevo objeto Especialidades y agrega los datos
        var nuevaEspecialidad = {
            ID: especialidad,
            Nombre: especialidadNombre,
            Costo: costo
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

        var formulario = document.getElementById("formulario_especialidades");
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
        var formulario = document.getElementById("formulario_especialidades");
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
