package venp.web.forms;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

public class PartidoPoliticoAsignarForm extends ActionForm {

	private String codigo;
	private String nombre;
	private ArrayList conCandidato;
	private ArrayList sinCandidato;
	private String cvOrigen;
	private String cvDestino;

	public void reset(ActionMapping mapping, HttpServletRequest request) {
		codigo = "";
		nombre = "";
		conCandidato = null;
		sinCandidato = null;
		cvOrigen = "";
		cvDestino = "";
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public ArrayList getConCandidato() {
		return conCandidato;
	}

	public void setConCandidato(ArrayList conCandidato) {
		this.conCandidato = conCandidato;
	}

	public ArrayList getSinCandidato() {
		return sinCandidato;
	}

	public void setSinCandidato(ArrayList sinCandidato) {
		this.sinCandidato = sinCandidato;
	}

	public String getCvOrigen() {
		return cvOrigen;
	}

	public void setCvOrigen(String cvOrigen) {
		this.cvOrigen = cvOrigen;
	}

	public String getCvDestino() {
		return cvDestino;
	}

	public void setCvDestino(String cvDestino) {
		this.cvDestino = cvDestino;
	}

}