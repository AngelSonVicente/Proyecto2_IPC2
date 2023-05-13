<%@ page import="jakarta.servlet.http.Part"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.io.*, javax.servlet.*, javax.servlet.http.*, java.util.*"%>
<%@ page import="javax.servlet.annotation.MultipartConfig"%>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%
String IDC = request.getParameter("IDConsulta");
String IDE = request.getParameter("IDExamen");

%>

<h1>consulta: <%=IDC%> <br> Examen: <%=IDE%></h1>
</body>
</html>
