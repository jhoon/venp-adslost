package venp.beans;

public class PartidoPoliticoBean extends Bean {

	private int codigo;
	private String nombre;
	private String abreviatura;
	private String logo;
	private String estado;

	public PartidoPoliticoBean() {
		codigo = 0;
		nombre = "";
		abreviatura = "";
		logo = "";
		estado = "";
	}

	public PartidoPoliticoBean(int codigo, String nombre, String abreviatura,
			String logo, String estado) {
		this.codigo = codigo;
		this.nombre = nombre;
		this.abreviatura = abreviatura;
		this.logo = logo;
		this.estado = estado;
	}

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getAbreviatura() {
		return abreviatura;
	}

	public void setAbreviatura(String abreviatura) {
		this.abreviatura = abreviatura;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

}