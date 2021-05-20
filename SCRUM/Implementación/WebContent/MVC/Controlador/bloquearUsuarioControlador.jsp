<jsp:useBean  id="customerBean" scope="session" class="bean.CustomerBean"></jsp:useBean>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.Connection" %>
<%@ page import ="datos.*" %>
<%@ page import ="bean.*" %>
<%@ page import ="java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel = "preconnect" href = "https://fonts.gstatic.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans+Condensed:wght@300&display=swap" rel="stylesheet">
    <title>JaaMusic!</title>
    <link rel="shortcut icon" type="text/css" href="/IW/imgs/logoBlanco.PNG">
    <link rel="preload" type="text/css" href="/IW/css/normalize.css" as="style">
    <link rel="stylesheet" type="text/css" href="/IW/css/normalize.css">
    <link rel="preload" type="text/css" href="/IW/css/style.css" as="style">
    <link href="/IW/css/style.css" type="text/css" rel="stylesheet">  

	<script>
		function enviarFormularioReputacion(i){
		    document.forms["formRep_"+i].submit();
		}
		
		function mostrarFormularioReporte(i){
			document.getElementById("formReporte_"+i).style.display='inline';
		}
	</script>


<%
Connection con = DAOConexionBD.getConnection("oraclepr.uco.es","i82gamoj","grupo1","3306");
if (customerBean.getPlan().equals("Moderador")){
	%>
	</head>
	<body>
		<header class="encabezado">
        <img src="/IW/imgs/logoBlanco.PNG" >
        <h1>JaaMusic! <span>Tu Biblioteca de obras clásicas</span></h1>
           
	    </header>
	
	    <div class="navHorizontalBg">
	        <nav class="menuModerador contenidoHorizontal">	            
	            <a href="/IW/MVC/Controlador/editarPerfilControlador.jsp">Editar Perfil</a>
	            <a href="/IW/MVC/Controlador/anadirCompositorControlador.jsp">Añadir Compositor</a>
	            <a href="/IW/MVC/Controlador/bloquearUsuarioControlador.jsp">Bloquear Usuario</a>
	            <a href="/IW/indexLogueado.jsp">Reportes</a>
	            <a href="/IW/MVC/Controlador/desconectarControlador.jsp">Cerrar Sesión</a>
	        </nav>    
	    </div>
	    
	    <div class="moderador">
	        <h2>MODERADOR</h2>
	    </div> 
		
		<div id="bloquearUsuario">
		<br>
				<div class="divisionBotones contenedor sombra">
					<table style="width:100%">
						  <tr>
						    <th>NombreUsuario</th>
						    <th>Nombre</th>
						    <th>Apellidos</th>
						    <th>Correo</th>
						    <th>Fecha nacimiento</th>
						    <th>Plan</th>
						    <th>Nacionalidad</th>
						    <th>Bloqueada</th>
						    <th>Acciones</th>
						  </tr>
		<%
			ArrayList<Hashtable<String,String>> usuarios = DAOUsuario.todosLosContactos();
			for (int i=0; i<usuarios.size(); i++){
				Hashtable<String,String> usuario = usuarios.get(i);
				%>
						  <tr>
						    <td><%=usuario.get("nombreUsuario")%></td>
						    <td><%=usuario.get("nombre")%></td>
						    <td><%=usuario.get("apellidos")%></td>
						    <td><%=usuario.get("correo")%></td>
						    <td><%=usuario.get("fechaNacimiento")%></td>
						    <td><%=usuario.get("plan")%></td>
						    <td><%=usuario.get("nacionalidad")%></td>
						    <td><%=usuario.get("bloqueada")%></td>
						 	<% if (customerBean.getPlan().equals("Moderador")){ %>
							    <form method="post" action="cambiarBloqueoControlador.jsp" >
								    <input id="id" name="nombreUsuario" type="hidden" value="<%=usuario.get("nombreUsuario")%>">
								    <input id="id" name="bloqueo" type="hidden" value="<%=usuario.get("bloqueada")%>">
								    <td><% if(usuario.get("bloqueada").equals("0")){%><input class= "boton" type="submit" value="Bloquear"><% }else{ %><input class= "boton" type="submit" value="Desbloquear"><%}%></td>
							  	</form>
						  	<%} %>
						  </tr>
					
				</div>
			<%	
			}
		%>
				</table>
		</div>
	</body>
<%	
}
%>
</html>