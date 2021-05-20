<%@page import="datos.DAOCompositorClasico,java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean  id="customerBean" scope="session" class="bean.CustomerBean"></jsp:useBean>
<%

String nextPage = "../../index.jsp";
String mensajeNextPage = "";

   

if (null != customerBean && !customerBean.getNombreUsuario().equals("")) {
	String nombreUsuario = customerBean.getNombreUsuario();
	String nombre=request.getParameter("nombre");
	String lugarNacimiento=request.getParameter("lugarNacimiento");
	String movimiento=request.getParameter("movimiento");
	String obraRepresentativa=request.getParameter("obraRepresentativa");
	if(null != nombreUsuario && null != nombre && null != lugarNacimiento && null != movimiento && null != obraRepresentativa){
		if(!nombreUsuario.equals("") && !nombre.equals("") && !lugarNacimiento.equals("") && !movimiento.equals("") && !obraRepresentativa.equals("")){
		int a=DAOCompositorClasico.save(nombre, lugarNacimiento, movimiento, obraRepresentativa);
		nextPage = "../../indexLogueado.jsp";
		}else{
			mensajeNextPage="Por favor, rellene todos los campos";
			nextPage = "../Vista/anadirCompositorVista.jsp";
		}
	}else{
		nextPage = "../Vista/anadirCompositorVista.jsp";
	}
	%>
	Hay una sesion!!!
	
	<%
}else{
	%>
	No hay una sesion!!!
	
	<%
	nextPage = "../../index.jsp";
}
%>
<jsp:forward page="<%=nextPage%>">
	<jsp:param value="<%=mensajeNextPage%>" name="message"/>
</jsp:forward>/html>