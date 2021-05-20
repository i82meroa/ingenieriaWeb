<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="customerBean" scope="session" class="bean.CustomerBean"></jsp:useBean>
<%@ page import ="java.util.ArrayList"%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/IW/css/normalize.css">
    <link rel="stylesheet" href="/IW/css/formularios.css">
    <title>Login</title>
</head>
<body>
<%
String nextPage = "../Controlador/loginController.jsp";
String messageNextPage = request.getParameter("message");
if (messageNextPage == null) messageNextPage = "";

if (customerBean != null && !customerBean.getNombreUsuario().equals("")) {
	%>
	Hay una sesion en la vista
<% 
} else {
%>
	 <div class="wrapper">
        <form method="post" action="../Controlador/iniciarSesionControlador.jsp" class="formulario">
            <fieldset>
                <legend>LOGIN</legend>
               
                <div class="contenedor-campos">
                    <div class="campo">
                        <label>Usuario</label>
                        <input class= "input-text" type="text" placeholder="Nombre de usuario" name="nombreUsuario">
                    </div>          
                    <div class="campo">
                        <label>Contraseña</label>
                        <input class= "input-text" type="password" placeholder="Contraseña" name="contrasena">
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
}
%>

</body>
</html>