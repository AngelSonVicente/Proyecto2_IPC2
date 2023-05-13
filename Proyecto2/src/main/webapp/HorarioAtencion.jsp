<%@ page import="java.util.ArrayList" %>
<%@ page import="datos.Listar" %>
<%@ page import="datos.HorarioMedico" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Horarios de médico</title>
</head>
<body>

<%
    String IDMedico= (String) session.getAttribute("ID");
    Listar Listar = new Listar();
    //Listar.conectar();
    ArrayList<HorarioMedico> ListarHorarios = Listar.HorarioMedico(IDMedico);
%>
<h1>Horarios del médico</h1>

<form action="SubirHorarios" method="post" id="formulario_hora">
    <label for="horario1">Horario de la mañana:</label>
    <select name="horario_manana" id="horario1">
        <option value="8:00">8:00</option>
        <option value="9:00">9:00</option>
        <option value="10:00">10:00</option>
        <option value="11:00">11:00</option>
        <option value="13:00">13:00</option>
        <option value="14:00">14:00</option>
        <option value="15:00">15:00</option>
    </select>
    <select name="horario_manana" id="horario2">
        <option value="9:00">9:00</option>
        <option value="10:00">10:00</option>
        <option value="11:00">11:00</option>
        <option value="12:00">12:00</option>
        <option value="14:00">14:00</option>
        <option value="15:00">15:00</option>
        <option value="16:00">16:00</option>
    </select>

    <button type="button" onclick="agregarHorario()">Agregar</button>
    <button type="button" onclick="actualizar()">Limpiar</button>

    <table id="tabla_horarios">
        <thead>
        <tr>
            <th>Horario</th>
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
    <input type="hidden" name="IdMedico" value="<%=IDMedico%>">
    <input type="submit" value="Asignar Horarios" onclick="enviarHorarios()">

</form>

<script>
    function agregarHorario() {

        var especialidad = document.getElementById("horario1").value;
        var especialidadNombre= document.getElementById("horario2").value;

        // crea un nuevo objeto Especialidades y agrega los datos
        var nuevoHorario = {
            Hora1: especialidad,
            Hora2: especialidadNombre
        };

        // Verificar si se traslapa con horarios ya existentes
        var tablaHorarios = document.getElementById("tabla_horarios");
        var filasTabla = tablaHorarios.getElementsByTagName("tbody")[0].getElementsByTagName("tr");
        var traslapa = false;
        for (var i = 0; i < filasTabla.length; i++) {
            var horaInicio = filasTabla[i].getElementsByTagName("td")[0].innerText;
            var horaFin = filasTabla[i].getElementsByTagName("td")[1].innerText;
            if ((nuevoHorario.Hora1 >= horaInicio && nuevoHorario.Hora1 < horaFin) ||
                (nuevoHorario.Hora2 > horaInicio && nuevoHorario.Hora2 <= horaFin)) {
                traslapa = true;
                break;
            }
        }

        // Si no se traslapa, agrega el horario a la tabla y al formulario
        if (!traslapa) {
            // crea los nuevos inputs y los agrega al formulario
            var inputId = document.createElement("input");
            inputId.setAttribute("type", "hidden");
            inputId.setAttribute("name", "Hora1[]");
            inputId.setAttribute("value", nuevoHorario.Hora1);

            var inputNombre = document.createElement("input");
            inputNombre.setAttribute("type", "hidden");
            inputNombre.setAttribute("name", "Hora2[]");
            inputNombre.setAttribute("value", nuevoHorario.Hora2);

            var formulario = document.getElementById("formulario_hora");
            formulario.appendChild(inputId);
            formulario.appendChild(inputNombre);

            // agrega la fila a la tabla
            var fila = document.createElement("tr");
            var celda1 = document.createElement("td");
            var texto1 = document.createTextNode(nuevoHorario.Hora1);
            celda1.appendChild(texto1);
            fila.appendChild(celda1);
            var celda2 = document.createElement("td");
            var texto2 = document.createTextNode(nuevoHorario.Hora2);
            celda2.appendChild(texto2);
            fila.appendChild(celda2);
            tablaHorarios.getElementsByTagName("tbody")[0].appendChild(fila);
        }else{

            alert("El horario que intenta agregar se traslapa con otro horario");
        }
    }

    function actualizar(){

        window.location.href = "HorarioAtencion.jsp";
    }

    function enviarHorarios() {
        var formulario = document.getElementById("formulario_hora");
        var formData = new FormData(formulario);
        var filasTabla = document.getElementById("tabla_horarios").getElementsByTagName("tbody")[0].getElementsByTagName("tr");

        for (var i = 0; i < filasTabla.length; i++) {
            var hora1 = filasTabla[i].querySelector('[name="Hora1[]"]').value;
            var hora2 = filasTabla[i].querySelector('[name="Hora2[]"]').value;

            formData.append("hora1_" + i, id);
            formData.append("hora2_" + i, nombre);
        }
        var xhr = new XMLHttpRequest();
        xhr.open("POST", formulario.action, true);
        xhr.send(formData);
    }
</script>
</body>
</html>
