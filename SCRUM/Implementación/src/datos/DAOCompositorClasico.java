package datos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DAOCompositorClasico {
	
	public static ArrayList<String> listarNombresCompositores(Connection con){
		java.sql.Statement stmt = null;
		ArrayList<String> nombres = new ArrayList<String>();
		try
		{
			stmt=con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT nombre FROM CompositorClasico");
			while (rs.next())
			{
				String nombreDevuelto = rs.getString("nombre");
				nombres.add(nombreDevuelto);
			}
			rs.close();
			if (stmt!=null)
				stmt.close();
		} catch (Exception e) {System.out.println(e);}
		return nombres;
	}
	
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
	  
	  public static int save( String nombre, String lugarNacimiento, String movimiento, String obraRepresentativa){
		int status=-1;
		try{
			Connection con=getConnection();

			PreparedStatement ps=con.prepareStatement("insert into CompositorClasico (nombre, lugarNacimiento,movimiento,obraRepresentativa) values(?,?,?,?)");
			ps.setString(1,nombre);
			ps.setString(2,lugarNacimiento);
			ps.setString(3,movimiento);
			ps.setString(4,obraRepresentativa);
			status = ps.executeUpdate();

		}catch(Exception e){System.out.println(e);}

		return status;
	}
}
