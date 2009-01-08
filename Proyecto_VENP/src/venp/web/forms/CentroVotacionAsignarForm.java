package venp.web.forms;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import venp.beans.PaisBean;
import venp.beans.ProcesoElectoralBean;

public class CentroVotacionAsignarForm extends ActionForm {

	private ArrayList procesoElectoral;
	private String procesoElectoralId;
	private ArrayList pais;
	private String paisId;
	private ArrayList cvcLocacion;
	private ArrayList cvsLocacion;
	private String cvOrigen;
	private String cvDestino;
	private String selectedPaisId;
	private String nombrePais;
	private String nombrePE;
	private String selectedPEId;

	public void reset(ActionMapping mapping, HttpServletRequest request) {
		procesoElectoral = null;
		procesoElectoralId = "";
		pais = null;
		paisId = "";
		cvcLocacion = null;
		cvsLocacion = null;
		cvOrigen = "";
		cvDestino = "";
		selectedPaisId = "";
		nombrePais = "";
		nombrePE = "";
		selectedPEId = "";
	}

	public ArrayList getProcesoElectoral() {
		return procesoElectoral;
	}

	public void setProcesoElectoral(ArrayList procesoElectoral) {
		this.procesoElectoral = procesoElectoral;
	}

	public String getProcesoElectoralId() {
		return procesoElectoralId;
	}

	public void setProcesoElectoralId(String procesoElectoralId) {
		this.procesoElectoralId = procesoElectoralId;
	}
	
	public String getProcesoElectoralName(int codigo) {
		for(int intContador = 0; intContador <procesoElectoral.size(); intContador++) {
			ProcesoElectoralBean bean = (ProcesoElectoralBean)procesoElectoral.get(intContador);
			
			if (bean.getCodigo() == codigo)
				return bean.getDescripcion();
		}
		
		return "";		
	}

	public ArrayList getPais() {
		return pais;
	}

	public void setPais(ArrayList pais) {
		this.pais = pais;
	}

	public String getPaisId() {
		return paisId;
	}

	public void setPaisId(String paisId) {
		this.paisId = paisId;
	}
	
	public String getPaisName(int codigo) {
		for(int intContador=0; intContador<pais.size(); intContador++) {
			PaisBean bean = (PaisBean)pais.get(intContador);
			
			if (bean.getCodigo() == codigo)
				return bean.getNombre();
		}
		
		return "";		
	}

	public ArrayList getCvcLocacion() {
		return cvcLocacion;
	}

	public void setCvcLocacion(ArrayList cvcLocacion) {
		this.cvcLocacion = cvcLocacion;
	}

	public ArrayList getCvsLocacion() {
		return cvsLocacion;
	}

	public void setCvsLocacion(ArrayList cvsLocacion) {
		this.cvsLocacion = cvsLocacion;
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

	public String getSelectedPaisId() {
		return selectedPaisId;
	}

	public void setSelectedPaisId(String selectedPaisId) {
		this.selectedPaisId = selectedPaisId;
	}

	public String getNombrePais() {
		return nombrePais;
	}

	public void setNombrePais(String nombrePais) {
		this.nombrePais = nombrePais;
	}

	public String getNombrePE() {
		return nombrePE;
	}

	public void setNombrePE(String nombrePE) {
		this.nombrePE = nombrePE;
	}

	public String getSelectedPEId() {
		return selectedPEId;
	}

	public void setSelectedPEId(String selectedPEId) {
		this.selectedPEId = selectedPEId;
	}
}