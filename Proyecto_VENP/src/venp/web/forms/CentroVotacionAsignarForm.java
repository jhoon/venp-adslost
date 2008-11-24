package venp.web.forms;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import venp.beans.MyHelpBean;
import venp.beans.PaisBean;
import venp.beans.ProcesoElectoralBean;

public class CentroVotacionAsignarForm extends ActionForm {

	private ArrayList procesoElectoral;
	private String procesoElectoral_id;
	private ArrayList pais;
	private String pais_id;
	private ArrayList cv_cLocacion;
	private ArrayList cv_sLocacion;
	private String cv_origen;
	private String cv_destino;
	private String s_pais_id;
	private String nombre_pais;
	private String nombre_pe;
	private String s_pe_id;

	public void reset(ActionMapping mapping, HttpServletRequest request) {
		procesoElectoral = null;
		procesoElectoral_id = "";
		pais = null;
		pais_id = "";
		cv_cLocacion = null;
		cv_sLocacion = null;
		cv_origen = "";
		cv_destino = "";
		s_pais_id = "";
		nombre_pais = "";
		nombre_pe = "";
		s_pe_id = "";
	}
	
	public ArrayList getProcesoElectoral() {
		return procesoElectoral;
	}
	
	public void setProcesoElectoral(ArrayList procesoElectoral) {
		this.procesoElectoral = procesoElectoral;
	}
	
	public String getProcesoElectoral_id() {
		return procesoElectoral_id;
	}
	
	public void setProcesoElectoral_id(String procesoElectoral_id) {
		this.procesoElectoral_id = procesoElectoral_id;
	}
	
	public String getProcesoElectoral_Name(int codigo) {
		for(int i=0; i<procesoElectoral.size(); i++) {
			ProcesoElectoralBean bean = (ProcesoElectoralBean)procesoElectoral.get(i);
			
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
	
	public String getPais_id() {
		return pais_id;
	}
	
	public void setPais_id(String pais_id) {
		this.pais_id = pais_id;
	}
	
	public String getPais_Name(int codigo) {
		for(int i=0; i<pais.size(); i++) {
			PaisBean bean = (PaisBean)pais.get(i);
			
			if (bean.getCodigo() == codigo)
				return bean.getNombre();
		}
		
		return "";		
	}

	public ArrayList getCv_cLocacion() {
		return cv_cLocacion;
	}

	public void setCv_cLocacion(ArrayList cv_cLocacion) {
		this.cv_cLocacion = cv_cLocacion;
	}

	public ArrayList getCv_sLocacion() {
		return cv_sLocacion;
	}

	public void setCv_sLocacion(ArrayList cv_sLocacion) {
		this.cv_sLocacion = cv_sLocacion;
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
	
	public String getS_pais_id() {
		return s_pais_id;
	}

	public void setS_pais_id(String s_pais_id) {
		this.s_pais_id = s_pais_id;
	}

	public String getNombre_pais() {
		return nombre_pais;
	}

	public void setNombre_pais(String nombre_pais) {
		this.nombre_pais = nombre_pais;
	}

	public String getNombre_pe() {
		return nombre_pe;
	}

	public void setNombre_pe(String nombre_pe) {
		this.nombre_pe = nombre_pe;
	}

	public String getS_pe_id() {
		return s_pe_id;
	}

	public void setS_pe_id(String s_pe_id) {
		this.s_pe_id = s_pe_id;
	}
	
}