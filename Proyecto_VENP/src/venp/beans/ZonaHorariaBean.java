package venp.beans;

public class ZonaHorariaBean extends Bean {
	
	private int codigo;
	private double tiempo;
	private String nombre;
	private String estado;
	
	public ZonaHorariaBean() {
		codigo = 0;
		tiempo = 0;
		nombre = "";
		estado = "";
	}

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public double getTiempo() {
		return tiempo;
	}

	public void setTiempo(double tiempo) {
		this.tiempo = tiempo;
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

}
