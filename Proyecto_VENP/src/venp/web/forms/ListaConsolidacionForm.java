package venp.web.forms;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;

public class ListaConsolidacionForm extends ActionForm{
	
	ArrayList listaConsolidacion;
	 
	private String nombreCandidato;
	private String nombrePartidoPolitico;
	private String resultado;
	private String imagenPartidoPolitico;
	private String imagenCandidato;
	private String fechaComicio;
	
	public ArrayList getListaConsolidacion() {
		return listaConsolidacion;
	}
	public void setListaConsolidacion(ArrayList listaConsolidacion) {
		this.listaConsolidacion = listaConsolidacion;
	}
	public String getNombreCandidato() {
		return nombreCandidato;
	}
	public void setNombreCandidato(String nombreCandidato) {
		this.nombreCandidato = nombreCandidato;
	}
	public String getNombrePartidoPolitico() {
		return nombrePartidoPolitico;
	}
	public void setNombrePartidoPolitico(String nombrePartidoPolitico) {
		this.nombrePartidoPolitico = nombrePartidoPolitico;
	}
	public String getResultado() {
		return resultado;
	}
	public void setResultado(String resultado) {
		this.resultado = resultado;
	}
	public String getImagenPartidoPolitico() {
		return imagenPartidoPolitico;
	}
	public void setImagenPartidoPolitico(String imagenPartidoPolitico) {
		this.imagenPartidoPolitico = imagenPartidoPolitico;
	}
	public String getImagenCandidato() {
		return imagenCandidato;
	}
	public void setImagenCandidato(String imagenCandidato) {
		this.imagenCandidato = imagenCandidato;
	}
	public String getFechaComicio() {
		return fechaComicio;
	}
	public void setFechaComicio(String fechaComicio) {
		this.fechaComicio = fechaComicio;
	}
}
