<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.Connection" %>
<%@ page import ="datos.*" %>
<%@ page import ="bean.*" %>
<%@ page import ="java.util.*" %>

<%
String mensajeNextPage = "";
String nextPage = "../../indexLogueado.jsp";
Connection con = DAOConexionBD.getConnection("oraclepr.uco.es","i82gamoj","grupo1","3306");
DAOReporte.eliminarReporte(con, Integer.parseInt(request.getParameter("idReporte")));
%>
<jsp:forward page="<%=nextPage%>">
	<jsp:param value="<%=mensajeNextPage%>" name="message"/>
</jsp:forward>