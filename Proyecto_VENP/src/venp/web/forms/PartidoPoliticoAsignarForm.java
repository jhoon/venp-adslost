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
	private String cv_origen;
	private String cv_destino;
	
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		codigo = "";
		nombre = "";
		conCandidato = null;
		sinCandidato = null;
		cv_origen = "";
		cv_destino = "";
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

	public String getCv_origen() {
		return cv_origen;
	}

	public void setCv_origen(String cv_origen) {
		this.cv_origen = cv_origen;
	}

	public String getCv_destino() {
		return cv_destino;
	}

	public void setCv_destino(String cv_destino) {
		this.cv_destino = cv_destino;
	}
	
}