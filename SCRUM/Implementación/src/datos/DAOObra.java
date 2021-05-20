package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

import bean.Obra;

public class DAOObra {
	public static void insertarObra(Connection con,Obra obra){
		try
		{
			PreparedStatement ps=con.prepareStatement("INSERT INTO Obra (propietario,compositor,nombre,duracion,reputacion,fechaSubida,instrumentos) VALUES (?,?,?,?,?,?,?)");
			ps.setString(1, obra.getPropietario());
			ps.setString(2, obra.getCompositor());
			ps.setString(3, obra.getNombre());
			ps.setString(4, obra.getDuracion());
			ps.setInt(5, 0);
			
	        Calendar fecha = new GregorianCalendar();                                                    
	        int año = fecha.get(Calendar.YEAR);
	        int mes = fecha.get(Calendar.MONTH);
	        int dia = fecha.get(Calendar.DAY_OF_MONTH);
	        int hora = fecha.get(Calendar.HOUR_OF_DAY);
	        int minuto = fecha.get(Calendar.MINUTE);
	        int segundo = fecha.get(Calendar.SECOND);
			
			ps.setString(6, dia + "/" + (mes+1) + "/" + año);
			ps.setString(7, obra.getInstrumentos());
			ps.executeUpdate();
		}
		catch (Exception e){System.out.println(e);}
	}
	
	public static void modificarObra(Connection con,int idObra,Obra nuevosDatos){
		try
		{
			PreparedStatement ps=con.prepareStatement("UPDATE Obra SET compositor=?,nombre=?,duracion=?,rutaPartitura=? WHERE idObra=?");
			ps.setString(1, nuevosDatos.getCompositor());
			ps.setString(2, nuevosDatos.getNombre());
			ps.setString(3, nuevosDatos.getDuracion());
			ps.setString(4, nuevosDatos.getRutaPartitura());
			ps.setInt(5, idObra);
			ps.executeUpdate();
		}
		catch (Exception e){System.out.println(e);}
	}
	
	public static ArrayList<Obra> ordenarObrasPorReputacion(Connection con){
		java.sql.Statement stmt = null;
		ArrayList<Obra> obras = new ArrayList<Obra>();
		try
		{
			stmt=con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM Obra ORDER BY reputacion DESC");
			while (rs.next())
			{
				Obra obraDevuelta=new Obra();
				obraDevuelta.setIdObra(rs.getInt("idObra"));
				obraDevuelta.setPropietario(rs.getString("propietario"));
				obraDevuelta.setCompositor(rs.getString("compositor"));
				obraDevuelta.setNombre(rs.getString("nombre"));
				obraDevuelta.setDuracion(rs.getString("duracion"));
				obraDevuelta.setReputacion(rs.getInt("reputacion"));
				obraDevuelta.setFechaSubida(rs.getString("fechaSubida"));
				obraDevuelta.setRutaPartitura(rs.getString("rutaPartitura"));
				obraDevuelta.setInstrumentos(rs.getString("instrumentos"));
				obras.add(obraDevuelta);
			}
			rs.close();
			if (stmt!=null)
				stmt.close();
		} catch (Exception e) {System.out.println(e);}
		return obras;
	}
	
	public static ArrayList<Obra> buscarObraPorDuracion(Connection con,String duracion){
		ArrayList<Obra> obras = new ArrayList<Obra>();
		try
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM Obra WHERE duracion=?");
			ps.setString(1, duracion);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				Obra obraDevuelta=new Obra();
				obraDevuelta.setIdObra(rs.getInt("idObra"));
				obraDevuelta.setPropietario(rs.getString("propietario"));
				obraDevuelta.setCompositor(rs.getString("compositor"));
				obraDevuelta.setNombre(rs.getString("nombre"));
				obraDevuelta.setDuracion(rs.getString("duracion"));
				obraDevuelta.setReputacion(rs.getInt("reputacion"));
				obraDevuelta.setFechaSubida(rs.getString("fechaSubida"));
				obraDevuelta.setRutaPartitura(rs.getString("rutaPartitura"));
				obraDevuelta.setInstrumentos(rs.getString("instrumentos"));
				obras.add(obraDevuelta);
			}
			rs.close();
		} catch (Exception e) {System.out.println(e);}
		return obras;
	}
	
	public static ArrayList<Obra> buscarObraPorTitulo(Connection con,String titulo){
		ArrayList<Obra> obras = new ArrayList<Obra>();
		try
		{
			PreparedStatement ps=con.prepareStatement(" SELECT * FROM Obra WHERE nombre LIKE '%' ? '%' ");
			ps.setString(1, titulo);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				Obra obraDevuelta=new Obra();
				obraDevuelta.setIdObra(rs.getInt("idObra"));
				obraDevuelta.setPropietario(rs.getString("propietario"));
				obraDevuelta.setCompositor(rs.getString("compositor"));
				obraDevuelta.setNombre(rs.getString("nombre"));
				obraDevuelta.setDuracion(rs.getString("duracion"));
				obraDevuelta.setReputacion(rs.getInt("reputacion"));
				obraDevuelta.setFechaSubida(rs.getString("fechaSubida"));
				obraDevuelta.setRutaPartitura(rs.getString("rutaPartitura"));
				obraDevuelta.setInstrumentos(rs.getString("instrumentos"));
				obras.add(obraDevuelta);
			}
			rs.close();
		} catch (Exception e) {System.out.println(e);}
		return obras;
	}
	
	public static ArrayList<Obra> buscarObraPorCompositor(Connection con,String compositor){
		ArrayList<Obra> obras = new ArrayList<Obra>();
		try
		{
			PreparedStatement ps=con.prepareStatement(" SELECT * FROM Obra WHERE compositor LIKE '%' ? '%' ");
			ps.setString(1, compositor);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				Obra obraDevuelta=new Obra();
				obraDevuelta.setIdObra(rs.getInt("idObra"));
				obraDevuelta.setPropietario(rs.getString("propietario"));
				obraDevuelta.setCompositor(rs.getString("compositor"));
				obraDevuelta.setNombre(rs.getString("nombre"));
				obraDevuelta.setDuracion(rs.getString("duracion"));
				obraDevuelta.setReputacion(rs.getInt("reputacion"));
				obraDevuelta.setFechaSubida(rs.getString("fechaSubida"));
				obraDevuelta.setRutaPartitura(rs.getString("rutaPartitura"));
				obraDevuelta.setInstrumentos(rs.getString("instrumentos"));
				obras.add(obraDevuelta);
			}
			rs.close();
		} catch (Exception e) {System.out.println(e);}
		return obras;
	}
	
	public static ArrayList<Obra> listarObras(Connection con){
		java.sql.Statement stmt = null;
		ArrayList<Obra> obras = new ArrayList<Obra>();
		try
		{
			stmt=con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM Obra");
			while (rs.next())
			{
				Obra obraDevuelta=new Obra();
				obraDevuelta.setIdObra(rs.getInt("idObra"));
				obraDevuelta.setPropietario(rs.getString("propietario"));
				obraDevuelta.setCompositor(rs.getString("compositor"));
				obraDevuelta.setNombre(rs.getString("nombre"));
				obraDevuelta.setDuracion(rs.getString("duracion"));
				obraDevuelta.setReputacion(rs.getInt("reputacion"));
				obraDevuelta.setFechaSubida(rs.getString("fechaSubida"));
				obraDevuelta.setRutaPartitura(rs.getString("rutaPartitura"));
				obraDevuelta.setInstrumentos(rs.getString("instrumentos"));
				obras.add(obraDevuelta);
			}
			rs.close();
			if (stmt!=null)
				stmt.close();
		} catch (Exception e) {System.out.println(e);}
		return obras;
	}
	
	public static void aumentarReputacion(Connection con,int nuevaReputacion,int idObra){
		try
		{		
			PreparedStatement ps=con.prepareStatement("UPDATE Obra SET reputacion=? WHERE idObra=?");
			ps.setInt(1, nuevaReputacion);
			ps.setInt(2, idObra);
			ps.executeUpdate();
		}
		catch (Exception e){System.out.println(e);}
	}
	
	public static Obra buscarObraPorId(Connection con,int idObra){
		Obra obraDevuelta=new Obra();
		try
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM Obra WHERE idObra=?");
			ps.setInt(1, idObra);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				obraDevuelta.setIdObra(rs.getInt("idObra"));
				obraDevuelta.setPropietario(rs.getString("propietario"));
				obraDevuelta.setCompositor(rs.getString("compositor"));
				obraDevuelta.setNombre(rs.getString("nombre"));
				obraDevuelta.setDuracion(rs.getString("duracion"));
				obraDevuelta.setReputacion(rs.getInt("reputacion"));
				obraDevuelta.setFechaSubida(rs.getString("fechaSubida"));
				obraDevuelta.setRutaPartitura(rs.getString("rutaPartitura"));
				obraDevuelta.setInstrumentos(rs.getString("instrumentos"));
			}
			rs.close();
		} catch (Exception e) {System.out.println(e);}
		return obraDevuelta;
	}
	
	public static int getUltimoId(Connection con){
		java.sql.Statement stmt = null;
		int resultado = 0;
		try
		{
			stmt=con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT MAX(idObra) FROM Obra");
			while (rs.next())
			{
				resultado=rs.getInt("max(idObra)");
			}
			
			rs.close();
			
			if (stmt!=null)
				stmt.close();
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		
		return resultado;
	}
	
	public static void modificarPartitura(Connection con,int idObra){
		try
		{
			PreparedStatement ps=con.prepareStatement("UPDATE Obra SET rutaPartitura=? WHERE idObra=?");
			ps.setString(1, "partituras/"+idObra+".pdf");
			ps.setInt(2, idObra);
			ps.executeUpdate();
		}
		catch (Exception e){System.out.println(e);}
	}
	
}
