package datos;

import java.sql.*;
import java.util.ArrayList;
import java.util.Hashtable;
import java.sql.Date;



/**
 * Clase que accede a la base de datos para regular los contactos
 * 
 *
 *
 */

public class DAOUsuario {
	
	/**
	 * Funcion que realiza la conección con la base de datos y la devuelve
	 * 
	 * @return Connection
	 */
public static Connection getConnection(){

	Connection con=null;
	try {
	  Class.forName("com.mysql.jdbc.Driver");
	  String usuarioBD = "i82gamoj";
	  String passBD = "grupo1";
	  String direccionBD = "jdbc:mysql://oraclepr.uco.es";
	  String puertoBD = "3306";
	  String nombreBD = "i82gamoj"; 
	  con= DriverManager.getConnection(direccionBD+":"+puertoBD+"/"+nombreBD,usuarioBD,passBD);

	} catch(Exception e) {
	  System.out.println(e);
	}
	return con;
  }
  

	/**
	 * Función para guardar un contacto en la base de datos
	 * 
	 * @param email
	 * @param nombre
	 * @param apellidos
	 * @param fechaNacimiento
	 * @param codInteres
	 * @return int status 
	 */
  public static int save(String nombreUsuario, String contrasena, String correo, String nombre, String apellidos,
			Date fechaNacimiento, String plan, String nacionalidad, int bloqueada){
	int status=-1;
	try{
		Connection con=getConnection();

		PreparedStatement ps=con.prepareStatement("insert into Usuario (nombreUsuario,contrasena,correo, nombre, apellidos,fechaNacimiento,plan,nacionalidad,bloqueada) values(?,?,?,?,?,?,?,?,?)");
		ps.setString(1,nombreUsuario);
		ps.setString(2,contrasena);
		ps.setString(3,correo);
		ps.setString(4,nombre);
		ps.setString(5,apellidos);
		ps.setDate(6,fechaNacimiento);
		ps.setString(7,plan);
		ps.setString(8,nacionalidad);		
		ps.setInt(9,bloqueada);
		status = ps.executeUpdate();

	}catch(Exception e){System.out.println(e);}

	return status;
}
  
/**
 * Funcion para modificar un contacto
 * 
 * @param email
 * @param nombre
 * @param apellidos
 * @param fechaNacimiento
 * @param codInteres
 * @return int status
 */
public static int update(String nombreUsuario, String contrasena, String correo, String nombre, String apellidos,
		Date fechaNacimiento, String plan, String nacionalidad, int bloqueada){
	int status=-1;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("update Usuario set contrasena=?,correo=?, nombre=?, apellidos=?,fechaNacimiento=?,plan=?,nacionalidad=?,bloqueada=? where nombreUsuario=?");		
		ps.setString(9,nombreUsuario);
		ps.setString(1,contrasena);
		ps.setString(2,correo);
		ps.setString(3,nombre);
		ps.setString(4,apellidos);
		ps.setDate(5,fechaNacimiento);
		ps.setString(6,plan);
		ps.setString(7,nacionalidad);		
		ps.setInt(8,bloqueada);
		status=ps.executeUpdate();
	}catch(Exception e){System.out.println(e);}
	return status;
}

/**
 * Función para obtener un contacto de la base de datos
 * 
 * @param email
 * @return Hashtable String,String
 */
public static Hashtable<String,String> queryById (String nombreUsuario) {
	Statement stmt = null; 
	Hashtable<String,String> resul = null;
	try {
		Connection con=getConnection();
		stmt = con.createStatement();
	    ResultSet rs = stmt.executeQuery("select contrasena,correo, nombre, apellidos,fechaNacimiento,plan,nacionalidad,bloqueada from Usuario where nombreUsuario ='"+nombreUsuario+"'");
	    while (rs.next()) {
	    	String contrasena = rs.getString("contrasena");
	    	String correo = rs.getString("correo");
	    	String nombre = rs.getString("nombre");
	        String apellidos = rs.getString("apellidos");
	        Date fechaNacimiento = rs.getDate("fechaNacimiento");
	        String plan = rs.getString("plan");
	        String nacionalidad = rs.getString("nacionalidad");
	        int bloqueada = rs.getInt("bloqueada");
	        resul = new Hashtable<String,String>();
	        resul.put("nombreUsuario",nombreUsuario);
	        resul.put("contrasena", contrasena);
	        resul.put("correo", correo);
	        resul.put("nombre", nombre);
	        resul.put("apellidos", apellidos);
	        resul.put("fechaNacimiento", fechaNacimiento.toString());
	        resul.put("plan", plan);
	        resul.put("nacionalidad", nacionalidad);
	        resul.put("bloqueada", Integer.toString(bloqueada));
	    }

	    if (stmt != null) 
	    	stmt.close(); 
	} catch (Exception e) {
		System.out.println(e);
	} 
	return resul;
} 

/**
 * Función para borrar un contacto
 * 
 * @param email
 * @return
 */
public static int delete(String nombreUsuario){
	int status=0;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("delete from Usuario where nombreUsuario=?");
		ps.setString(1,nombreUsuario);
		status=ps.executeUpdate();
	}catch(Exception e){System.out.println(e);}

	return status;
}

/**
 * Función para que nos devuelva todos los contactos de la base de datos
 * 
 * @return ArrayList Hashtable String,String
 */
public static ArrayList<Hashtable<String,String>> todosLosContactos(){
	Statement stmt = null; 
	ArrayList<Hashtable<String,String>> listaContactos=new ArrayList<Hashtable<String,String>>();
	Hashtable<String,String> resul = null;
	try {
		Connection con=getConnection();
		stmt = con.createStatement();
	    ResultSet rs = stmt.executeQuery("select * from Usuario");
	    while (rs.next()) {
	    	String nombreUsuario = rs.getString("nombreUsuario");
	    	String contrasena = rs.getString("contrasena");
	    	String correo = rs.getString("correo");
	    	String nombre = rs.getString("nombre");
	        String apellidos = rs.getString("apellidos");
	        Date fechaNacimiento = rs.getDate("fechaNacimiento");
	        String plan = rs.getString("plan");
	        String nacionalidad = rs.getString("nacionalidad");
	        int bloqueada = rs.getInt("bloqueada");
	        resul = new Hashtable<String,String>();
	        resul.put("nombreUsuario",nombreUsuario);
	        resul.put("contrasena", contrasena);
	        resul.put("correo", correo);
	        resul.put("nombre", nombre);
	        resul.put("apellidos", apellidos);
	        resul.put("fechaNacimiento", fechaNacimiento.toString());
	        resul.put("plan", plan);
	        resul.put("nacionalidad", nacionalidad);
	        resul.put("bloqueada", Integer.toString(bloqueada));
	        listaContactos.add(resul);
	    }

	    if (stmt != null) 
	    	stmt.close(); 
	} catch (Exception e) {
		System.out.println(e);
	} 
	return listaContactos;
}
/**
 * Devuelve todos los email existentes de todos los contactos en la base de datos
 * 
 * @return ArrayList listaEmail
 */
public static ArrayList<String> todosLosNombreUsuario(){
	Statement stmt = null; 
	ArrayList<String> listaNombreUsuario=new ArrayList<String>();
	try {
		Connection con=getConnection();
		stmt = con.createStatement();
	    ResultSet rs = stmt.executeQuery("select nombreUsuario from Usuario");
	    while (rs.next()) {
	        String nombreUsuario=rs.getString("nombreUsuario");
	        listaNombreUsuario.add(nombreUsuario);
	    }
	    if (stmt != null) 
	    	stmt.close(); 
	} catch (Exception e) {
		System.out.println(e);
	} 
	return listaNombreUsuario;
}

public static boolean existeUsuario(String nombreUsuario){
	Statement stmt = null; 
	boolean existe=false;
	try {
		Connection con=getConnection();
		stmt = con.createStatement();
	    ResultSet rs = stmt.executeQuery("select nombreUsuario from Usuario where nombreUsuario ='"+nombreUsuario+"'");
	    while (rs.next()) {
	        existe=true;
	    }
	    if (null != stmt) 
	    	stmt.close(); 
	} catch (Exception e) {
		System.out.println(e);
	} 
	return existe;
}

public static String iniciarSesion(String nombreUsuario){
	Statement stmt = null; 
	String contrasena="";
	try {
		Connection con=getConnection();
		stmt = con.createStatement();
	    ResultSet rs = stmt.executeQuery("select contrasena from Usuario where nombreUsuario ='"+nombreUsuario+"'");
	    while (rs.next()) {
	    	contrasena=rs.getString("contrasena");
	    }
	    if (null != stmt) 
	    	stmt.close(); 
	} catch (Exception e) {
		System.out.println(e);
	} 
	return contrasena;
}

public static String consultarPlan(String nombreUsuario){
	Statement stmt = null; 
	String plan="";
	try {
		Connection con=getConnection();
		stmt = con.createStatement();
	    ResultSet rs = stmt.executeQuery("select plan from Usuario where nombreUsuario ='"+nombreUsuario+"'");
	    while (rs.next()) {
	    	plan=rs.getString("plan");
	    }
	    if (null != stmt) 
	    	stmt.close(); 
	} catch (Exception e) {
		System.out.println(e);
	} 
	return plan;
}

public static int consultarBloqueo(String nombreUsuario){
	Statement stmt = null; 
	int bloqueada=1;
	try {
		Connection con=getConnection();
		stmt = con.createStatement();
	    ResultSet rs = stmt.executeQuery("select bloqueada from Usuario where nombreUsuario ='"+nombreUsuario+"'");
	    while (rs.next()) {
	    	bloqueada = rs.getInt("bloqueada");
	    }
	    if (null != stmt) 
	    	stmt.close(); 
	} catch (Exception e) {
		System.out.println(e);
	} 
	return bloqueada;
}

public static int cambiarPlan(String nombreUsuario, String plan){
	int status=-1;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("update Usuario set plan=? where nombreUsuario=?");		
		ps.setString(2,nombreUsuario);
		ps.setString(1,plan);
		status=ps.executeUpdate();
	}catch(Exception e){System.out.println(e);}
	return status;
}

public static int cambiarBloqueo(String nombreUsuario, int bloqueada){
	int status=-1;
	try{
		Connection con=getConnection();	
		PreparedStatement ps=con.prepareStatement("update Usuario set bloqueada=? where nombreUsuario=?");
		ps.setString(2,nombreUsuario);
		ps.setInt(1,bloqueada);
		status=ps.executeUpdate();
	}catch(Exception e){System.out.println(e);}
	return status;
}

}