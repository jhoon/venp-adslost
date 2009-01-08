package venp.beans;

public class OpcionBean extends Bean {
	
	private String id;
	private String nombre;
	private String abreviatura;
	private String logo;
	private String politico;
	private String foto;
	
	public OpcionBean() {
		super();
		this.id = "";
		this.nombre = "";
		this.abreviatura = "";
		this.logo = "";
		this.politico = "";
		this.foto = "";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
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

	public String getPolitico() {
		return politico;
	}

	public void setPolitico(String politico) {
		this.politico = politico;
	}

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

}
