<%@page import="datos.DAOUsuario,java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="customerBean" scope="session" class="bean.CustomerBean"></jsp:useBean>
<%

String nextPage = "../../indexLogueado.jsp";
String mensajeNextPage = "";

   

if (null != customerBean && !customerBean.getNombreUsuario().equals("")) {
	String nombreUsuario = customerBean.getNombreUsuario();
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
	if(null != nombreUsuario && null != contrasena && null != nombre && null != apellidos && null != nacionalidad && null != correo && null != fechaNacimiento ){
		if(!nombreUsuario.equals("") && !contrasena.equals("") && !nombre.equals("") && !apellidos.equals("") && !nacionalidad.equals("") && !correo.equals("")){
		int a=DAOUsuario.update(nombreUsuario, contrasena, correo, nombre, apellidos, fechaNacimiento, customerBean.getPlan(), nacionalidad, 0);

		nextPage = "../../indexLogueado.jsp";
		}else{
			mensajeNextPage="Por favor, rellene todos los campos";
			nextPage = "../Vista/editarPerfilVista.jsp";
		}
	}else{
		nextPage = "../Vista/editarPerfilVista.jsp";
	}
	%>
	Hay una sesion!!!
	
	<%
}else{
	%>
	No hay una sesion!!!
	
	<%
	nextPage = "../../indexLogueado.jsp";
}
%>
<jsp:forward page="<%=nextPage%>">
	<jsp:param value="<%=mensajeNextPage%>" name="message"/>
</jsp:forward>/html>