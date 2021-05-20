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
		if(!DAOUsuario.existeUsuario(nombreUsuario)){
		String contrasena = request.getParameter("contrasena");
		String nombre=request.getParameter("nombre");
		String apellidos=request.getParameter("apellidos");
		String nacionalidad=request.getParameter("nacionalidad");
		String correo=request.getParameter("correo");
		String fecha=request.getParameter("fechaNacimiento");
		Date fechaNacimiento=null;
		if(fecha != null){
			fechaNacimiento=Date.valueOf(fecha);
		}
		int a=DAOUsuario.save(nombreUsuario, contrasena, correo , nombre, apellidos, fechaNacimiento, "Gratis", nacionalidad, 0);
		%>
		<jsp:setProperty property="nombreUsuario" value="<%=nombreUsuario%>" name="customerBean"/>
		<jsp:setProperty property="plan" value="Gratis" name="customerBean"/>
		<%
		nextPage = "../../indexLogueado.jsp";
		}else{
			mensajeNextPage = "El nombreUsuario introducido ya existe, por favor introduzca otro distinto";
		}
	}else{
		nextPage = "../Vista/registrarUsuarioVista.jsp";
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