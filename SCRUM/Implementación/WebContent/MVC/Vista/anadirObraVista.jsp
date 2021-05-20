<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean  id="customerBean" scope="session" class="bean.CustomerBean"></jsp:useBean>

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
    <link rel="stylesheet" href="/IW/css/normalize.css">
    <link rel="stylesheet" href="/IW/css/formularios.css">
    <title>Añadir Obra</title>
    
    <script type="text/javascript">
    	function intercambiarCompositores(){
    		document.getElementById("tipoCompositor").value="compositorClasico";
    		document.getElementById("compositorUsuario").style.display="none";
    		document.getElementById("botonCompositores").style.display="none";
    		document.getElementById("compositorClasico").style.display="inline";
    	}
    </script>
    
</head>
<body>
<%
String nextPage = "../Controlador/loginController.jsp";
String messageNextPage = request.getParameter("message");

Connection con = DAOConexionBD.getConnection("oraclepr.uco.es","i82gamoj","grupo1","3306");

%>
	<div class="wrapper">
        <form method="post" enctype="multipart/form-data" action="../Controlador/anadirObraControlador.jsp" class="formulario">
            <fieldset>
                <legend>Añadir Obra</legend>
               
               	<input type="hidden" name="tipoCompositor" id="tipoCompositor" value="compositorUsuario">
               
                    <div class="principales-container">
                        <div class="campo">
                            <label>Titulo</label>
                            <input class= "input-text" type="text" name="titulo">
                        </div>  
                        <div class="campo">
                            <label>Propietario</label>
                            <input class= "input-text" type="text" value=<%=customerBean.getNombreUsuario()%> name="propietario" readonly>
                        </div>
                    </div>
                    
                    <div class="principales-container">
                        <div class="campo" id="compositorUsuario">
                            <label>Compositor</label>
                            <input class= "input-text" type="text" name="compositorU">
                        </div>
                        
                        <input type="button" id="botonCompositores" value="Compositor clásico" onclick="intercambiarCompositores()">
                    </div>
                        <div id="compositorClasico" style="display:none">
                            <div class="campo">
	                            <label>Compositor</label>
	                        	<select name="compositorC">
	                        		<%
	                        		ArrayList<String> compositoresClasicos = DAOCompositorClasico.listarNombresCompositores(con);
	                        		for (int i=0; i<compositoresClasicos.size(); i++){
	                        			%><option><%= compositoresClasicos.get(i) %> </option>
	                        		<%
	                        		}
	                        		%>
	                        	</select>
                        	</div>
                        </div>
                        
                        <div class="campo">
                            <label>Duracion</label>
                            <input class="input-text" type="text" name="duracion">
                        </div>
                        
                        <div class="campo">
                            <label>Instrumentos</label>
                            <input class= "input-text" type="text" name="instrumentos">
                        </div>
                        
                        <div class="campo">
                            <label>Partitura</label>
                            <input class= "input-text" size="7" type="file" name="rutaPartitura">
                        </div>
                <div class="enviar">
                    <input class= "boton" type="submit" value="Enviar">
                </div>
            </fieldset>
        </form>
    </div>

</body>
</html>