
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Login</title>

  <style>
    body {
      background-image: url("FondoM.jpeg");
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      height: 100vh;
      overflow: hidden;
    }    body::before {
           content: "";
           position: absolute;
           top: 0%;
           left: 0%;
           width: 500%;
           height: 500%;
           background: rgba(255, 255, 255, 0.25); /* Agrega un fondo semitransparente */
           z-index: -1;
           filter: blur(5px); /* Agrega un efecto de desenfoque al fondo */
         }
  </style>

</head>
<body>



<div style="display: flex; justify-content: center;">

<h1>    Inicio de sesion</h1>
</div>
<div style="display: flex; justify-content: center;">
  <div style="width: 15%; height: 0%; display: flex; justify-content: space-between; align-items: end;">
    <form name="SesionT" action="LoginT_Servlet" method="POST" style="width: 10%;">
      Usuario: <input type ="text" name="usuarioT"/>
      <br/>
      <br/>
      Password: <input type ="password" name="passwordT"/>
      <br/>
      <br/>
      <input type="submit" value="Acceder"/>
    </form>

    <form name="SesionT" action="CrearUsuario.jsp" method="POST">
      <input type="submit" value="Registrarse"/>
    </form>
  </div>
</div>

<c:if   test="${not empty error}">
  <p  style="color: red">${error}</p>
</c:if>




</body>
</html>
