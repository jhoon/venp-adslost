package venp.beans;

public class CentroVotacionBean extends Bean {

	private int codigo;
	private PaisBean pais;
	private ZonaHorariaBean zonaHoraria;
	private String codigoPostal;
	private String nombre;
	private String region;
	private String direccion;
	private String estado;

	public CentroVotacionBean() {
		codigo = 0;
		pais = null;
		zonaHoraria = null;
		codigoPostal = "";
		nombre = "";
		region = "";
		direccion = "";
		estado = "";
	}

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public PaisBean getPais() {
		return pais;
	}

	public void setPais(PaisBean pais) {
		this.pais = pais;
	}

	public ZonaHorariaBean getZonaHoraria() {
		return zonaHoraria;
	}

	public void setZonaHoraria(ZonaHorariaBean zonaHoraria) {
		this.zonaHoraria = zonaHoraria;
	}

	public String getCodigoPostal() {
		return codigoPostal;
	}

	public void setCodigoPostal(String codigoPostal) {
		this.codigoPostal = codigoPostal;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

}