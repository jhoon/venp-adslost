package venp.web.forms;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

public class CentroVotacionDatosForm extends ActionForm {

	private boolean nuevo;
	private String codigo;
	private ArrayList pais;
	private String pais_id;
	private ArrayList zona_horaria;
	private String zonahoraria_id;
	private String codigopostal;
	private String nombre;
	private String region;
	private String direccion;

	public boolean isNuevo() {
		return nuevo;
	}

	public void setNuevo(boolean nuevo) {
		this.nuevo = nuevo;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
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

	public ArrayList getZona_horaria() {
		return zona_horaria;
	}

	public void setZona_horaria(ArrayList zona_horaria) {
		this.zona_horaria = zona_horaria;
	}

	public String getZonahoraria_id() {
		return zonahoraria_id;
	}

	public void setZonahoraria_id(String zonahoraria_id) {
		this.zonahoraria_id = zonahoraria_id;
	}

	public String getCodigopostal() {
		return codigopostal;
	}

	public void setCodigopostal(String codigopostal) {
		this.codigopostal = codigopostal;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public void reset(ActionMapping mapping, HttpServletRequest request) {
		codigo = "";
		pais = null;
		pais_id = "";
		zona_horaria = null;
		zonahoraria_id = "";
		codigopostal = "";
		nombre = "";
		region = "";
		direccion = "";
	}
	
}