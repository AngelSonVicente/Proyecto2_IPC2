<%--
  Created by IntelliJ IDEA.
  User: angel
  Date: 12/05/2023
  Time: 10:30 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%

String tipoUsuario =request.getParameter("tipo");

%>
<h1>Formulario de Registro<%if(tipoUsuario!=null){%> <%=tipoUsuario%><%}%></h1>
<form action="UsuarioCreado" method="POST">

    <select id="tipoUsuario" name="tipoUsuario" onchange="actualizar()">
        <option value="">Seleccione un tipo de usuario</option>
        <option value="paciente">Paciente</option>
        <option value="medico">Medico</option>
        <option value="laboratorio">Laboratorio</option>
    </select>
    <br>
    <br>
    <%if(tipoUsuario!=null){
    if(tipoUsuario.equals("paciente")){
    %>
    Nombre: <input type="text" name="Nombre" > <br/><br/>
    Usuario: <input type="text" name="Usuario" >
    Contraseña: <input type="text" name="contra">
    Correo: <input type="text" name="correo"><br/><br/>
    Direccion: <input type="text" name="direccion"><br><br>
    CUI: <input type="text" name="CUI">
    Telefono: <input type="text" name="telefono">
    Fecha de nacimiento: <input type="date" name="nacimiento">
    <%}
    if(tipoUsuario.equals("medico")){
    %>
    Nombre: <input type="text" name="Nombre" > <br/><br/>
    Usuario: <input type="text" name="Usuario" >
    Contraseña: <input type="text" name="contra">
    Correo: <input type="text" name="correo"><br/><br/>
    Direccion: <input type="text" name="direccion">
    CUI: <input type="text" name="CUI">
    Telefono: <input type="text" name="telefono"><br><br>
    Fecha de nacimiento: <input type="date" name="nacimiento">
    Estado: <input type="text" name="estado" value="Pendiente" readonly> <br/><br/>
    <%
            }
    if(tipoUsuario.equals("laboratorio")){


    %>
    Nombre: <input type="text" name="Nombre" > <br/><br/>
    Usuario: <input type="text" name="Usuario" >
    Contraseña: <input type="text" name="contra">
    Correo: <input type="text" name="correo"><br/><br/>
    Direccion: <input type="text" name="direccion">
    CUI: <input type="text" name="CUI">
    Telefono: <input type="text" name="telefono"><br><br>
    Fecha de fundacin: <input type="date" name="nacimiento">
    Estado: <input type="text" name="estado" value="Pendiente" readonly> <br/><br/>
<%
        }
    }
%>



<input type="hidden" name="tipooo" value="<%=tipoUsuario%>">
<input type="submit" value="Crear Usuario">
</form>


<script>
    function actualizar(){
        var ID = document.getElementById("tipoUsuario").value;
        window.location.href = "CrearUsuario.jsp?tipo="+ID;
    }



</script>
</body>
</html>

