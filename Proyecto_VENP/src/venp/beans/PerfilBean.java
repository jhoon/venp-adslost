package venp.beans;

import java.util.Date;

public class PerfilBean extends Bean {

	private int codigo;
	private String nombre;
	private String descripcion;
	private String estado;
	
	public PerfilBean() {
		codigo = 0;
		nombre = "";
		descripcion = "";
		estado = "";
	}
	
	public PerfilBean(int codigo, String nombre, String descripcion, String estado) {
		this.codigo = codigo;
		this.nombre = nombre;
		this.descripcion = descripcion;
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

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

}