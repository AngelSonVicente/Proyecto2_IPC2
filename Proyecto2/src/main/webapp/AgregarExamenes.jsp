<%@ page import="datos.Listar" %>
<%@ page import="datos.TipoExamen" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: angel
  Date: 11/05/2023
  Time: 04:42 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Agregar Examen</title>
</head>
<body>
<%
    String IDLab= (String) session.getAttribute("ID");
    Listar Listar = new Listar();
    //Listar.conectar();

    ArrayList<TipoExamen> ListarEspecialidad = Listar.TipoExamen();

%>
<form method="post" action="SubirSolicitudExamenLab" id="formulario_examen">
    <br/>
    <label>Seleccione Un Examen:</label><br/>
    <select id="examenes" name="examen">
        <% for (TipoExamen examenn : ListarEspecialidad) { %>
        <option value="<%=examenn.getID() %>">
            <%= examenn.getNombre() %></option>
        <% } %>
    </select>
    <button type="button" onclick="agregarExamen()">Agregar</button>
    <table id="tabla_examen">
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




    <input type="hidden" name="IdLab" value="<%=IDLab%>">



    <input type="submit" value="Solicitar" onclick="enviarExamen()">

</form>

<script>
    function agregarExamen() {

        var especialidad = document.getElementById("examenes").value;
        var costo = prompt("Ingrese el costo del examen " + especialidad);
        var especialidadNombre= document.getElementById("examenes").options[document.getElementById("examenes").selectedIndex].text;

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
        document.getElementById("tabla_examen").getElementsByTagName("tbody")[0].appendChild(fila);
    }

    function enviarExamen() {
        var formulario = document.getElementById("formulario_examen");
        var formData = new FormData(formulario);
        var filasTabla = document.getElementById("tabla_examen").getElementsByTagName("tbody")[0].getElementsByTagName("tr");

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
