<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="datos.DAOUsuario,java.sql.Date,java.util.Hashtable"%>
<jsp:useBean id="customerBean" scope="session" class="bean.CustomerBean"></jsp:useBean>
<%@ page import ="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/IW/css/normalize.css">
    <link rel="stylesheet" href="/IW/css/formularios.css">
    <title>Document</title>
</head>
<body>
<%
String nextPage = "../Controlador/loginController.jsp";
String messageNextPage = request.getParameter("message");
if (messageNextPage == null) messageNextPage = "";

if (customerBean != null && !customerBean.getNombreUsuario().equals("")) {
	Hashtable<String,String> usuarioEnSesion=DAOUsuario.queryById(customerBean.getNombreUsuario());
	
	%>
	<div class="wrapper">
        <form method="post" action="../Controlador/editarPerfilControlador.jsp" class="formulario">
            <fieldset>
                <legend>EDITAR PERFIL</legend>
               
                <div class="contenedor-campos">
                    <div class="principales-container">
                        <div class="campo">
                            <label>Nombre</label>
                            <input class= "input-text" type="text" placeholder="Tu nombre" name="nombre" value="<%= usuarioEnSesion.get("nombre") %>">
                        </div>  
                        <div class="campo">
                            <label>Apellidos</label>
                            <input class= "input-text" type="text" placeholder="apellidos" name="apellidos" value="<%= usuarioEnSesion.get("apellidos") %>">
                        </div>  
                    </div>
                    
                    <div class="principales-container">       
                        <div class="campo">
                            <label>Contraseña</label>
                            <input class= "input-text" type="password" placeholder="Contraseña" name="contrasena">
                        </div>
                    </div>
                    <div class="principales-container">
                        <div class="campo">
                            <label>Fecha de Nacimiento</label>
                            <input class= "input-text" type="date" placeholder="Tu fecha de nacimiento" name="fechaNacimiento" value="<%= usuarioEnSesion.get("fechaNacimiento") %>">
                        </div>
                        <div class="campo">
                            <label>Nacionalidad</label>
                            <input class= "input-text" type="text" placeholder="Tu nacionalidad" name="nacionalidad" value="<%= usuarioEnSesion.get("nacionalidad") %>">
                        </div>
                    </div>
                    
                    <div class="campo">
                        <label>Email</label>
                        <input class= "input-text" type="email" placeholder="Tu email" name="correo" value="<%= usuarioEnSesion.get("correo") %>">
                    </div>
                </div>
        		<font color="red"><%= messageNextPage %></font>
                <div class="enviar">
                    <input class= "boton" type="submit" value="Enviar">
                </div>
                
            </fieldset>
        </form>
    </div>
<% 
} else {
%>
	No hay una sesion
<%
}
%>

</body>
</html>