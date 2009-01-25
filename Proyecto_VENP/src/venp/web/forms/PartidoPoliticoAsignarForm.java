package venp.web.forms;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import venp.beans.CandidatoBean;

public class PartidoPoliticoAsignarForm extends ActionForm {

	private String codigo;
	private String nombre;
	private String logo;
	private boolean asignado;
	private ArrayList conCandidato;
	private ArrayList sinCandidato;
	private CandidatoBean candidato;
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

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public boolean isAsignado() {
		return asignado;
	}

	public void setAsignado(boolean asignado) {
		this.asignado = asignado;
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

	public CandidatoBean getCandidato() {
		return candidato;
	}

	public void setCandidato(CandidatoBean candidato) {
		this.candidato = candidato;
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

/*

<html:select size="10" property="cvDestino" styleClass="empField" style="width: 250px; height: 200px;">
  <logic:notEmpty name="partidoPoliticoAsignarForm" property="conCandidato">
    <html:optionsCollection property="conCandidato" value="codigo" label="nombreCompleto" />
  </logic:notEmpty>
</html:select>

*/