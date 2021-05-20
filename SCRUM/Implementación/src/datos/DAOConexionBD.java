package datos;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DAOConexionBD {
	public static Connection getConnection(String servidor,String usuario,String contrasena,String puerto){
		Connection con=null;
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();			
			String parametros_servidor="jdbc:mysql://"+servidor+":"+puerto+"/"+usuario;
			con=DriverManager.getConnection(parametros_servidor,usuario,contrasena);
		}
		catch (Exception e){System.out.println(e);}
		return con;
	}
	
	public static void desconectar(Connection con) throws SQLException{
		con.close();
	}
}