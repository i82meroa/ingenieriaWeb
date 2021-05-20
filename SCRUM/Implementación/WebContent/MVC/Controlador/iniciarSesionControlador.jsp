<%@page import="datos.DAOUsuario,java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean  id="customerBean" scope="session" class="bean.CustomerBean"></jsp:useBean>
<%

String nextPage = "../../index.jsp";
String mensajeNextPage = "";

   

if (null == customerBean || customerBean.getNombreUsuario().equals("")) {
	String nombreUsuario = request.getParameter("nombreUsuario");
	
	if(null != nombreUsuario){
		if(DAOUsuario.consultarBloqueo(nombreUsuario) == 0){
			if(DAOUsuario.existeUsuario(nombreUsuario)){
			String contrasena = request.getParameter("contrasena");
			String contrasenaBD=DAOUsuario.iniciarSesion(nombreUsuario);
			String plan=DAOUsuario.consultarPlan(nombreUsuario);
			if(contrasena.equals(contrasenaBD)){
				%>
				<jsp:setProperty property="nombreUsuario" value="<%=nombreUsuario%>" name="customerBean"/>
				<jsp:setProperty property="plan" value="<%=plan%>" name="customerBean"/>
				<%
				nextPage = "../../indexLogueado.jsp";
			}else{
				mensajeNextPage = "La contraseña es incorrecta";
			}
			}else{
				nextPage = "../Vista/iniciarSesionVista.jsp";
				mensajeNextPage = "El nombreUsuario introducido no existe";
			}
		}else{
			nextPage = "../Vista/iniciarSesionVista.jsp";
			mensajeNextPage = "La cuenta que intentas iniciar se encuentra bloqueada";
		}
	}else{
		nextPage = "../Vista/iniciarSesionVista.jsp";
	}

	%>
	No hay una sesion!!!
	
	<%
}else{
	%>
	Hay una sesion!!!
	
	<%
	nextPage = "../../index.jsp";
}
%>
<jsp:forward page="<%=nextPage%>">
	<jsp:param value="<%=mensajeNextPage%>" name="message"/>
</jsp:forward>/html>