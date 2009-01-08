package venp.beans;

public class CandidatoBean extends Bean {

	private int codigo;
	private String nombre;
	private String paterno;
	private String materno;
	private String nombreCompleto;
	private String dni;
	private String foto;
	private String estado;

	public CandidatoBean() {
		codigo = 0;
		nombre = "";
		paterno = "";
		materno = "";
		nombreCompleto = "";
		dni = "";
		foto = "";
		estado = "";
	}

	public CandidatoBean(int codigo, String nombre, String paterno,
			String materno, String dni, String foto, String estado) {

		this.codigo = codigo;
		this.nombre = nombre;
		this.paterno = paterno;
		this.materno = materno;
		this.nombreCompleto = nombre + " " + paterno + " " + materno;
		this.dni = dni;
		this.foto = foto;
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
		nombreCompleto = nombre + " " + paterno + " " + materno;
		this.nombre = nombre;
	}

	public String getPaterno() {
		return paterno;
	}

	public void setPaterno(String paterno) {
		nombreCompleto = nombre + " " + paterno + " " + materno;
		this.paterno = paterno;
	}

	public String getMaterno() {
		return materno;
	}

	public void setMaterno(String materno) {
		nombreCompleto = nombre + " " + paterno + " " + materno;
		this.materno = materno;
	}

	public String getNombreCompleto() {
		return nombreCompleto;
	}

	public void setNombreCompleto(String nombreCompleto) {
		this.nombreCompleto = nombreCompleto;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

}