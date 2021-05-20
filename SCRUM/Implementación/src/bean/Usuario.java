package bean;

import java.text.SimpleDateFormat;
import java.sql.Date;

public class Usuario {
	private String nombreUsuario;
	private String contrasena;
	private String correo;
	private String nombre;
	private String apellidos;
	private Date fechaNacimiento;
	private String plan;
	private String nacionalidad;
	private int bloqueada;

	public Usuario() {
		super();
	}

	public Usuario(String nombreUsuario, String contrasena, String correo, String nombre, String apellidos,
			Date fechaNacimiento, String plan, String nacionalidad, int bloqueada) {
		super();
		this.nombreUsuario = nombreUsuario;
		this.contrasena = contrasena;
		this.correo = correo;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.fechaNacimiento = fechaNacimiento;
		this.plan = plan;
		this.nacionalidad = nacionalidad;
		this.bloqueada = bloqueada;
	}

	public String getNombreUsuario() {
		return nombreUsuario;
	}

	public void setNombreUsuario(String nombreUsuario) {
		this.nombreUsuario = nombreUsuario;
	}

	public String getContrasena() {
		return contrasena;
	}

	public void setContrasena(String contrasena) {
		this.contrasena = contrasena;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public Date getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public String getPlan() {
		return plan;
	}

	public void setPlan(String plan) {
		this.plan = plan;
	}

	public String getNacionalidad() {
		return nacionalidad;
	}

	public void setNacionalidad(String nacionalidad) {
		this.nacionalidad = nacionalidad;
	}

	public int getBloqueada() {
		return bloqueada;
	}

	public void setBloqueada(int bloqueada) {
		this.bloqueada = bloqueada;
	}

	@Override
	public String toString() {
		String fecha = "";
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		fecha = sdf.format(getFechaNacimiento());
		return "Contacto [nombreUsuario=" + nombreUsuario + ", contrasena=" + contrasena + ", correo=" + correo
				+ ", nombre=" + nombre + ", apellidos=" + apellidos + ", fechaNacimiento=" + fecha + ", plan=" + plan
				+ ", nacionalidad=" + nacionalidad + ", bloqueada=" + bloqueada + "]";
	}

}