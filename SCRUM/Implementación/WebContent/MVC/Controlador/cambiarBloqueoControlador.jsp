<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="datos.DAOUsuario"%>
<jsp:useBean  id="customerBean" scope="session" class="bean.CustomerBean"></jsp:useBean>
	<%
	if (customerBean.getPlan().equals("Moderador")){
		String nombreUsuario = request.getParameter("nombreUsuario");
		int bloqueada = Integer.parseInt(request.getParameter("bloqueo"));
		if(bloqueada==0){
			DAOUsuario.cambiarBloqueo(nombreUsuario, 1);
		}else{
			DAOUsuario.cambiarBloqueo(nombreUsuario, 0);
		}
	}
	String nextPage ="../Controlador/bloquearUsuarioControlador.jsp";
	String mensajeNextPage = "";
	%>
	<jsp:forward page="<%=nextPage%>">
	<jsp:param value="<%=mensajeNextPage%>" name="message"/>
	</jsp:forward>