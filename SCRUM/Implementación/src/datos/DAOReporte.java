package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.Reporte;

public class DAOReporte {
	public static void insertarReporte(Connection con,Reporte reporte){
		try
		{
			PreparedStatement ps=con.prepareStatement("INSERT INTO Reporte (idObra,denunciante,motivo) VALUES (?,?,?)");
			ps.setInt(1, reporte.getIdObra());
			ps.setString(2, reporte.getDenunciante());
			ps.setString(3, reporte.getMotivo());

			ps.executeUpdate();
		}
		catch (Exception e){System.out.println(e);}
	}
	
	public static ArrayList<Reporte> listarReportes(Connection con){
		java.sql.Statement stmt = null;
		ArrayList<Reporte> reportes = new ArrayList<Reporte>();
		try
		{
			stmt=con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM Reporte");
			while (rs.next())
			{
				Reporte reporteDevuelto=new Reporte();
				reporteDevuelto.setIdReporte(rs.getInt("idReporte"));
				reporteDevuelto.setDenunciante(rs.getString("denunciante"));
				reporteDevuelto.setIdObra(rs.getInt("idObra"));
				reporteDevuelto.setMotivo(rs.getString("motivo"));
				reportes.add(reporteDevuelto);
			}
			rs.close();
			if (stmt!=null)
				stmt.close();
		} catch (Exception e) {System.out.println(e);}
		return reportes;
	}
	
	public static void eliminarReporte(Connection con,int idReporte){
		try
		{
			PreparedStatement ps=con.prepareStatement("DELETE FROM Reporte WHERE idReporte=?");
			ps.setInt(1, idReporte);
			ps.executeUpdate();
		}
		catch (Exception e){System.out.println(e);}
	}
}
