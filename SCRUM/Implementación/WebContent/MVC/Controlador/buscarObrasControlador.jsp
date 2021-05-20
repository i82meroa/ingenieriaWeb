<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.Connection" %>
<%@ page import ="datos.*" %>
<%@ page import ="bean.*" %>

<%
String nextPage = "../../indexLogueado.jsp";
String tipoBusqueda = null;
String valorBusqueda = null;

%>
<%= request.getParameter("tipoBusqueda") %>
<%

String tipoElegido = request.getParameter("tipoBusqueda");
String valorElegido = request.getParameter("valorBusqueda");

if (tipoElegido.equals("none")){
	tipoBusqueda = "none";
}
else if (tipoElegido.equals("compositor")){
	tipoBusqueda = "compositor";
}
else if (tipoElegido.equals("duracion")){
	tipoBusqueda = "duracion";
}
else if (tipoElegido.equals("titulo")){
	tipoBusqueda = "titulo";
}
else if (tipoElegido.equals("reputacion")){
	tipoBusqueda = "reputacion";
}

%>
<jsp:forward page="<%=nextPage%>">
	<jsp:param value="<%=tipoBusqueda%>" name="tipoBusqueda"/>
	<jsp:param value="<%=valorElegido%>" name="valorBusqueda"/>
</jsp:forward>
</body>
</html>