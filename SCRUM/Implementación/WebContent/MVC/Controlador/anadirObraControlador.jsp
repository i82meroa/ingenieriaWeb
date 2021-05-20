<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.Connection" %>
<%@ page import ="datos.*" %>
<%@ page import ="bean.*" %>
<%@ page import="java.io.*"%>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>
<%@ page import ="java.util.*" %>

<%
String nextPage = "../../indexLogueado.jsp";
String mensajeNextPage = "Obra subida con éxito.";

Connection con = DAOConexionBD.getConnection("oraclepr.uco.es","i82gamoj","grupo1","3306");
Obra obra = new Obra();

String propietario = "";
String duracion = "";
String tipoCompositor = "";
String compositorU = "";
String compositorC = "";
String titulo = "";
String instrumentos = "";

File viejoNombre = null;
File fichero = null;

FileItemFactory factory = new DiskFileItemFactory();
ServletFileUpload upload = new ServletFileUpload(factory);
List items = upload.parseRequest(request);
for (Object item : items) {
   FileItem uploaded = (FileItem) item;
   if (!uploaded.isFormField()) {
	  
	  File anteriorPartitura = new File("/home/juanfran/workspace/IW/WebContent/partituras/"+uploaded.getName());
	  anteriorPartitura.delete();
	  
      fichero = new File("/home/juanfran/workspace/IW/WebContent/partituras/", uploaded.getName());
      viejoNombre = new File("/home/juanfran/workspace/IW/WebContent/partituras/"+uploaded.getName());
      uploaded.write(fichero);
      
   } else {
      String key = uploaded.getFieldName();
      String valor = uploaded.getString();
      
      		if (key.equals("propietario")){
      			propietario = valor;
      		}
      		else if (key.equals("duracion")){
      			duracion = valor;
      		}
      		else if (key.equals("tipoCompositor")){
      			tipoCompositor = valor;
      		}
      		else if (key.equals("compositorU")){
      			compositorU = valor;
      		}
      		else if (key.equals("compositorC")){
      			compositorC = valor;
      		}
      		else if (key.equals("titulo")){
      			titulo = valor;
      		}
      		else if (key.equals("instrumentos")){
      			instrumentos = valor;
      		}
   }
}

obra.setPropietario(propietario);
obra.setDuracion(duracion);
obra.setNombre(titulo);
obra.setInstrumentos(instrumentos);

if (tipoCompositor.equals("compositorUsuario")){
	obra.setCompositor(compositorU);
}
else if (tipoCompositor.equals("compositorClasico")){
	obra.setCompositor(compositorC);
}

DAOObra.insertarObra(con, obra);

int idObra = DAOObra.getUltimoId(con);
File nuevoNombre = new File("/home/juanfran/workspace/IW/WebContent/partituras/"+idObra+".pdf");
viejoNombre.renameTo(nuevoNombre);

DAOObra.modificarPartitura(con,idObra);

%>
<jsp:forward page="<%=nextPage%>">
	<jsp:param value="<%=mensajeNextPage%>" name="message"/>
</jsp:forward>
</body>
</html>