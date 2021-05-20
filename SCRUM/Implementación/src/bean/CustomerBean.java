package bean;

public class CustomerBean implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	private String nombreUsuario = "";
	private String plan;
	
	public String getNombreUsuario() {
		return nombreUsuario;
	}
	public void setNombreUsuario(String nombreUsuario) {
		this.nombreUsuario = nombreUsuario;
	}
	public String getPlan() {
		return plan;
	}
	public void setPlan(String plan) {
		this.plan = plan;
	}
}