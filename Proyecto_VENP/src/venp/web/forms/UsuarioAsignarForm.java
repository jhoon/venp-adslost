package venp.web.forms;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import venp.beans.PaisBean;
import venp.beans.ProcesoElectoralBean;
import venp.beans.UsuarioBean;

public class UsuarioAsignarForm extends ActionForm {

	private ArrayList procesoElectoral;
	private ArrayList pais;
	private ArrayList usuario;
	private String procesoElectoralId;
	private String paisId;
	private String usuarioId;
	private String selectedPeId;
	private String selectedPeNombre;
	private String selectedUserId;
	private String selectedUserNombre;
	private ArrayList cvcLocacion;
	private ArrayList cvsLocacion;
	private String cvOrigen;
	private String cvDestino;

	public void reset(ActionMapping mapping, HttpServletRequest request) {
		procesoElectoral = null;
		pais = null;
		usuario = null;
		procesoElectoralId = "";
		paisId = "";
		usuarioId = "";
		selectedPeId = "";
		selectedPeNombre = "";
		selectedUserId = "";
		selectedUserNombre = "";
		cvcLocacion = null;
		cvsLocacion = null;
		cvOrigen = "";
		cvDestino = "";
	}

	public ArrayList getProcesoElectoral() {
		return procesoElectoral;
	}

	public void setProcesoElectoral(ArrayList procesoElectoral) {
		this.procesoElectoral = procesoElectoral;
	}
	
	public String getProcesoElectoralName(int codigo) {
		for(int intContador=0; intContador<procesoElectoral.size(); intContador++) {
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
	
	public String getPaisName(int codigo) {
		for(int intContador=0; intContador<pais.size(); intContador++) {
			PaisBean bean = (PaisBean) pais.get(intContador);
			
			if (bean.getCodigo() == codigo)
				return bean.getNombre();
		}
		
		return "";
	}

	public ArrayList getUsuario() {
		return usuario;
	}

	public void setUsuario(ArrayList usuario) {
		this.usuario = usuario;
	}
	
	public String getUsuarioName(int codigo) {
		for(int intContador=0; intContador<usuario.size(); intContador++) {
			UsuarioBean bean = (UsuarioBean) usuario.get(intContador);
			
			if (Integer.parseInt(bean.getCodigo()) == codigo)
				return bean.getNombre() + " " + bean.getApePaterno() + " " + bean.getApeMaterno();
		}
		
		return "";		
	}

	public String getProcesoElectoralId() {
		return procesoElectoralId;
	}

	public void setProcesoElectoralId(String procesoElectoralId) {
		this.procesoElectoralId = procesoElectoralId;
	}

	public String getPaisId() {
		return paisId;
	}

	public void setPaisId(String paisId) {
		this.paisId = paisId;
	}

	public String getUsuarioId() {
		return usuarioId;
	}

	public void setUsuarioId(String usuarioId) {
		this.usuarioId = usuarioId;
	}

	public String getSelectedPeId() {
		return selectedPeId;
	}

	public void setSelectedPeId(String selectedPeId) {
		this.selectedPeId = selectedPeId;
	}

	public String getSelectedPeNombre() {
		return selectedPeNombre;
	}

	public void setSelectedPeNombre(String selectedPeNombre) {
		this.selectedPeNombre = selectedPeNombre;
	}
	
	public String getSelectedUserId() {
		return selectedUserId;
	}

	public void setSelectedUserId(String selectedUserId) {
		this.selectedUserId = selectedUserId;
	}

	public String getSelectedUserNombre() {
		return selectedUserNombre;
	}

	public void setSelectedUserNombre(String selectedUserNombre) {
		this.selectedUserNombre = selectedUserNombre;
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

}