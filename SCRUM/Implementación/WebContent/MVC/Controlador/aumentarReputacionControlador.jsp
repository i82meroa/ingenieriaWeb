<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.Connection" %>
<%@ page import ="datos.*" %>
<%@ page import ="bean.*" %>
<%@ page import ="java.util.*" %>

<%
String nextPage = "../../indexLogueado.jsp";
String mensajeNextPage = "";

int idObra = Integer.parseInt(request.getParameter("idObra"));
int antiguaReputacion = Integer.parseInt(request.getParameter("reputacion"));

Connection con = DAOConexionBD.getConnection("oraclepr.uco.es","i82gamoj","grupo1","3306");
DAOObra.aumentarReputacion(con, antiguaReputacion+1, idObra);

%>
<jsp:forward page="<%=nextPage%>">
	<jsp:param value="<%=mensajeNextPage%>" name="message"/>
</jsp:forward>