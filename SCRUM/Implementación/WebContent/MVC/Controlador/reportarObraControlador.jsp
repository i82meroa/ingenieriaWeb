<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.Connection" %>
<%@ page import ="datos.*" %>
<%@ page import ="bean.*" %>

<%
String nextPage = "../../indexLogueado.jsp";
String mensajeNextPage = "Obra reportada con éxito. ¡Gracias por tu colaboración!";

Connection con = DAOConexionBD.getConnection("oraclepr.uco.es","i82gamoj","grupo1","3306");

Reporte nuevoReporte = new Reporte();
nuevoReporte.setIdObra(Integer.parseInt(request.getParameter("idObra")));
nuevoReporte.setDenunciante(request.getParameter("denunciante"));
nuevoReporte.setMotivo(request.getParameter("motivo"));

DAOReporte.insertarReporte(con, nuevoReporte);

%>
<jsp:forward page="<%=nextPage%>">
	<jsp:param value="<%=mensajeNextPage%>" name="message"/>
</jsp:forward>
</body>
</html>