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
	private String procesoElectoral_id;
	private String pais_id;
	private String usuario_id;
	private String s_pe_id;
	private String s_pe_nombre;
	private String s_user_id;
	private String s_user_nombre;
	private ArrayList cv_cLocacion;
	private ArrayList cv_sLocacion;
	private String cv_origen;
	private String cv_destino;
	
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		procesoElectoral = null;
		pais = null;
		usuario = null;
		procesoElectoral_id = "";
		pais_id = "";
		usuario_id = "";
		s_pe_id = "";
		s_pe_nombre = "";
		s_user_id = "";
		s_user_nombre = "";
		cv_cLocacion = null;
		cv_sLocacion = null;
		cv_origen = "";
		cv_destino = "";
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
			PaisBean bean = (PaisBean) pais.get(i);
			
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

	public String getUsuario_id() {
		return usuario_id;
	}

	public void setUsuario_id(String usuario_id) {
		this.usuario_id = usuario_id;
	}
	
	public String getUsuario_Name(int codigo) {
		for(int i=0; i<usuario.size(); i++) {
			UsuarioBean bean = (UsuarioBean) usuario.get(i);
			
			if (Integer.parseInt(bean.getCodigo()) == codigo)
				return bean.getNombre() + " " + bean.getApePaterno() + " " + bean.getApeMaterno();
		}
		
		return "";		
	}

	public String getS_pe_id() {
		return s_pe_id;
	}

	public void setS_pe_id(String s_pe_id) {
		this.s_pe_id = s_pe_id;
	}

	public String getS_pe_nombre() {
		return s_pe_nombre;
	}

	public void setS_pe_nombre(String s_pe_nombre) {
		this.s_pe_nombre = s_pe_nombre;
	}

	public String getS_user_id() {
		return s_user_id;
	}

	public void setS_user_id(String s_user_id) {
		this.s_user_id = s_user_id;
	}

	public String getS_user_nombre() {
		return s_user_nombre;
	}

	public void setS_user_nombre(String s_user_nombre) {
		this.s_user_nombre = s_user_nombre;
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
	
}