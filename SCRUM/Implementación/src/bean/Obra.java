package bean;

public class Obra {
	private int idObra_;
	private String propietario_;
	private String compositor_;
	private String nombre_;
	private String duracion_;
	private int reputacion_;
	private String fechaSubida_;
	private String rutaPartitura_;
	private String instrumentos_;
	
	public Obra(){}
	
	public Obra(String propietario,String compositor,String nombre,String duracion,int reputacion,String fechaSubida,String rutaPartitura){
		propietario_ = propietario;
		compositor_ = compositor;
		nombre_ = nombre;
		duracion_ = duracion;
		reputacion_ = reputacion;
		fechaSubida_ = fechaSubida;
		rutaPartitura_ = rutaPartitura;
	}
	
	public int getIdObra() {
		return idObra_;
	}
	public void setIdObra(int idObra) {
		this.idObra_ = idObra;
	}
	public String getPropietario() {
		return propietario_;
	}
	public void setPropietario(String propietario) {
		this.propietario_ = propietario;
	}
	public String getCompositor() {
		return compositor_;
	}
	public void setCompositor(String compositor) {
		this.compositor_ = compositor;
	}
	public String getNombre() {
		return nombre_;
	}
	public void setNombre(String nombre) {
		this.nombre_ = nombre;
	}
	public String getDuracion() {
		return duracion_;
	}
	public void setDuracion(String duracion) {
		this.duracion_ = duracion;
	}
	public int getReputacion() {
		return reputacion_;
	}
	public void setReputacion(int reputacion) {
		this.reputacion_ = reputacion;
	}
	public String getFechaSubida() {
		return fechaSubida_;
	}
	public void setFechaSubida(String fechaSubida) {
		this.fechaSubida_ = fechaSubida;
	}
	public String getRutaPartitura() {
		return rutaPartitura_;
	}
	public void setRutaPartitura(String rutaPartitura) {
		this.rutaPartitura_ = rutaPartitura;
	}
	public String getInstrumentos() {
		return instrumentos_;
	}
	public void setInstrumentos(String instrumentos) {
		this.instrumentos_ = instrumentos;
	}
}