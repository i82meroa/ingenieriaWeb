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
        <form method="post" action="../Controlador/anadirCompositorControlador.jsp" class="formulario">
            <fieldset>
                <legend>EDITAR PERFIL</legend>
               
                <div class="contenedor-campos">
                    <div class="principales-container">
                        <div class="campo">
                            <label>Nombre</label>
                            <input class= "input-text" type="text" placeholder="Tu nombre" name="nombre" ">
                        </div>  
                        <div class="campo">
                            <label>Lugar de nacimiento</label>
                            <input class= "input-text" type="text" placeholder="Lugar de nacimiento" name="lugarNacimiento" ">
                        </div>  
                    </div>
                    
                    <div class="principales-container">       
                        <div class="campo">
                            <label>Movimiento</label>
                            <input class= "input-text" type="movimiento" placeholder="movimiento" name="movimiento">
                        </div>
                    </div>
                    <div class="principales-container">       
                        <div class="campo">
                            <label>Obra representativa</label>
                            <input class= "input-text" type="obraRepresentativa" placeholder="Obra representativa" name="obraRepresentativa">
                        </div>
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