package venp.beans;

import java.util.ArrayList;

public class CedulaBean extends Bean {
	
	private boolean nueva;

	private String codigo;
	private String tipo;
	private String estado;
	private ArrayList listaOpciones;

	private String procesoId;
	private String procesoNombre;

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public void setListaOpciones(ArrayList listaOpciones) {
		this.listaOpciones = listaOpciones;
	}

	public ArrayList getListaOpciones() {
		return listaOpciones;
	}

	public String getProcesoId() {
		return procesoId;
	}

	public void setProcesoId(String procesoId) {
		this.procesoId = procesoId;
	}

	public String getProcesoNombre() {
		return procesoNombre;
	}

	public void setProcesoNombre(String procesoNombre) {
		this.procesoNombre = procesoNombre;
	}

	public void setNueva(boolean nueva) {
		this.nueva = nueva;
	}

	public boolean isNueva() {
		return nueva;
	}

}
