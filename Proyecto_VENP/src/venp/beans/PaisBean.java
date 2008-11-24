package venp.beans;

public class PaisBean extends Bean {

	private int codigo;
	private String nombre;
	private String abreviatura;
	private String estado;
	
	public PaisBean() {
		codigo = 0;
		nombre = "";
		abreviatura = "";
		estado = "";
	}
	
	public PaisBean(int codigo, String nombre, String abreviatura, String estado) {
		this.codigo = codigo;
		this.nombre = nombre;
		this.abreviatura = abreviatura;
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

	public String getAbreviatura() {
		return abreviatura;
	}

	public void setAbreviatura(String abreviatura) {
		this.abreviatura = abreviatura;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

}