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
	            <a href="/IW/MVC/Controlador/desconectarControlador.jsp">Cerrar Sesión</a>
	            <a href="/IW/MVC/Controlador/editarPerfilControlador.jsp">Editar Perfil</a>
	            <a href="/IW/MVC/Controlador/anadirCompositorControlador.jsp">Añadir Compositor</a>
	            <a href="/IW/MVC/Controlador/bloquearUsuarioControlador.jsp">Bloquear Usuario</a>
	            <a href="/IW/indexLogueado.jsp">Reportes</a>
	        </nav>    
	    </div>
	    
	    <div class="moderador">
	        <h2>MODERADOR</h2>
	    </div> 
		
		<div id="reportes">
		<%
			ArrayList<Reporte> reportes = DAOReporte.listarReportes(con);
			for (int i=0; i<reportes.size(); i++){
				%>
				<br>
				<div class="divisionBotones contenedor sombra">
					<div>
						<b>· URL obra:</b> <a href="/IW/MVC/Vista/modificarObraVista.jsp?idObra=<%=reportes.get(i).getIdObra()%>">/IW/MVC/Vista/modificarObraVista.jsp?idObra=<%=reportes.get(i).getIdObra()%></a><br>
						<b>· Denunciante:</b> <%= reportes.get(i).getDenunciante() %><br>
						<b>· Motivo:</b> <%= reportes.get(i).getMotivo() %>
					</div>
					<div>
						<nav>
					    	<div class="botonesObra">
					        	<a class="botonObra" href="/IW/MVC/Controlador/eliminarReporteControlador.jsp?idReporte=<%= reportes.get(i).getIdReporte() %>">¡Atendido!</a>                   
					        </div>
					   	</nav>
					</div>
				</div>
			<%	
			}
		%>
		</div>
	</body>
<%	
}
else{
%>
</head>
<body>
    <header class="encabezado">
        <img src="/IW/imgs/logoBlanco.PNG" >
        <h1>JaaMusic! <span>Tu Biblioteca de obras clásicas</span></h1>
           
    </header>
        <div class="contenedorPrincipal contenedor sombra">
            <div class="navPrincipalBg">
                <nav class="menuGratuito contenido">
                    <a href="/IW/index.jsp">Inicio</a>
                    <a href="/IW/MVC/Controlador/editarPerfilControlador.jsp">Editar Perfil</a>
                    <a href="/IW/MVC/Vista/anadirObraVista.jsp">Añadir Obra</a>
                    <% if( !customerBean.getPlan().equals("Premium")){ %> <a href="/IW/MVC/Controlador/activarSuscripcionControlador.jsp">Activar Premium</a><% }else{%>
                    <a href="/IW/MVC/Controlador/desactivarSuscripcionControlador.jsp">Desactivar Premium</a><% }%>
                    <a href="/IW/MVC/Controlador/desconectarControlador.jsp">Cerrar Sesion</a>
                    <a href="/IW/MVC/Controlador/eliminarCuentaControlador.jsp">Eliminar Cuenta</a>
                </nav>    
            </div>
            <div class="restoContenido">
                <div>
                	<%
                	String messageNextPage = request.getParameter("message");
					//Si el mensaje es nulo (al acceder por primera vez a la aplicación) no lo muestra.
					if (messageNextPage == null ){
						messageNextPage = "";
					}%>
	                <form class="formulario" method=post action="/IW/MVC/Controlador/buscarObrasControlador.jsp">
	                    <fieldset>
	                        <legend>Busque la obra que desee</legend>
	                        <div class="busqueda">
	                            <div>
	                                <select name="tipoBusqueda">
	                                	<option value="none">Criterio</option>
	                                    <option value="compositor">Por compositor</option>
	                                    <option value="titulo">Por titulo</option>
	                                    <option value="duracion">Por duracion</option>
	                                    <option value="reputacion">Ordenar por reputacion</option>
	                                </select>
	                            </div>
	                            
	                            <div>
	                            	<input class= "input-text" type="text" name="valorBusqueda">
	                            </div>
	
	                            <div class="enviar">
	                                <input type="submit" value="Enviar">
	                            </div>
	                        </div> 
	                    </fieldset>
	                </form>
	            </div>
	  
	            <b style="color:red"><%= messageNextPage %></b>
                <div class="contenedorObras">
	                	<br>
	                	<%
						ArrayList<Obra> obras = new ArrayList<Obra>();
	                	obras = DAOObra.listarObras(con);
						
	                	String tipoBusquedaObtenido = request.getParameter("tipoBusqueda");
	                	String valorBusquedaObtenido = request.getParameter("valorBusqueda");
	                	
	                	if (tipoBusquedaObtenido != null && valorBusquedaObtenido != null){
		                	if (tipoBusquedaObtenido.equals("compositor")){
		                		obras=DAOObra.buscarObraPorCompositor(con,valorBusquedaObtenido);
		                	}
		                	else if (tipoBusquedaObtenido.equals("titulo")){
		                		obras=DAOObra.buscarObraPorTitulo(con,valorBusquedaObtenido);
		                	}
		                	else if (tipoBusquedaObtenido.equals("duracion")){
		                		obras=DAOObra.buscarObraPorDuracion(con,valorBusquedaObtenido);
		                	}
		                	else if (tipoBusquedaObtenido.equals("reputacion")){
		                		obras=DAOObra.ordenarObrasPorReputacion(con);
		                	}
	                	}
	                	
						for (int i=0; i<obras.size(); i++){
						%>
	                	        <br>	
								<div class="divisionBotones contenedor sombra">
					                <div>
										<% if( customerBean.getPlan().equals("Premium")){ %> <b>· Subido por:</b> <%= obras.get(i).getPropietario() %><br> <% }%>
										<% if( customerBean.getPlan().equals("Premium")){ %> <b>· Subido el dia:</b> <%= obras.get(i).getFechaSubida() %><br>	<% }%>					                
										<b>· Titulo:</b> <%= obras.get(i).getNombre() %><br>
										<b>· Compositor:</b> <%= obras.get(i).getCompositor() %><br>	
										<% if( customerBean.getPlan().equals("Premium")){ %> <b>· Duracion:</b> <%= obras.get(i).getDuracion() %> minutes<br>	<% }%>	                	
										<% if( customerBean.getPlan().equals("Premium")){ %> <b>· Instrumentos:</b> <%= obras.get(i).getInstrumentos() %><br>	<% }%>	                	
										<% if( customerBean.getPlan().equals("Premium")){ %> <b>· Likes:</b> <%= obras.get(i).getReputacion() %><br>	<% }%>	                	
									</div>
					                <div>
					                    <nav>
					                        <div class="botonesObra">
					                           <% if( customerBean.getPlan().equals("Premium")){ %> <a class="botonObra" href="javascript:enviarFormularioReputacion(<%=i%>)">¡Me gusta!</a> <% }%>
					                           <% if( customerBean.getPlan().equals("Premium")){ %><a class="botonObra" href="../../<%=obras.get(i).getRutaPartitura()%>" download="partitura.pdf">Descargar partitura</a>	<% }%>			                            
					                           <% if( customerBean.getPlan().equals("Premium")){ %> <a class="botonObra" href="javascript:mostrarFormularioReporte(<%=i%>)">Reportar obra</a> <% }%>
					                            <%
					                            if (obras.get(i).getPropietario().equals(customerBean.getNombreUsuario())){
					                            	%>
					                            	<a class="botonObra" href="/IW/MVC/Vista/modificarObraVista.jsp?idObra=<%=obras.get(i).getIdObra()%>">Modificar obra</a>
					                            	<%
					                            }
					                            %>
					                        </div>
					                    </nav>
					                </div>
				            	</div>
				            		<% String formRep_i="formRep_"+String.valueOf(i); %>
				            		<form name=<%=formRep_i%> method=post action="/IW/MVC/Controlador/aumentarReputacionControlador.jsp">
						            	<input type="hidden" name="idObra" value= "<%= obras.get(i).getIdObra() %>">
						          		<input type="hidden" name="reputacion" value="<%= obras.get(i).getReputacion() %>">
					            	</form>
					            	<% String formReporte_i="formReporte_"+String.valueOf(i); %>
				            		<div id=<%=formReporte_i%> style="display:none">
					            		<form method=post action="/IW/MVC/Controlador/reportarObraControlador.jsp">
					            			<input type="hidden" name="idObra" value="<%= obras.get(i).getIdObra() %>">
					            			<input type="hidden" name="denunciante" value="<%= customerBean.getNombreUsuario() %>">
							            	<input type="text" name="motivo" size="50" placeholder="Escribe el motivo de tu reporte...">
							            	<input type="submit" value="Enviar" class="botonObra">
						            	</form>
						            </div>
				        <%
						}
						%>
					</div>
				</div>
            </div>
    <footer class="footer">
        <p>Todos los derechos reservados.</p>
    </footer>
</body>
<%
}%>
</html>