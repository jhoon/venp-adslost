package venp.web.forms;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

public class CentroVotacionDatosForm extends ActionForm {

	private boolean nuevo;
	private String codigo;
	private ArrayList pais;
	private String paisId;
	private ArrayList zonaHoraria;
	private String zonaHorariaId;
	private String codigoPostal;
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

	public String getPaisId() {
		return paisId;
	}

	public void setPaisId(String paisId) {
		this.paisId = paisId;
	}

	public ArrayList getZonaHoraria() {
		return zonaHoraria;
	}

	public void setZonaHoraria(ArrayList zonaHoraria) {
		this.zonaHoraria = zonaHoraria;
	}

	public String getZonaHorariaId() {
		return zonaHorariaId;
	}

	public void setZonaHorariaId(String zonaHorariaId) {
		this.zonaHorariaId = zonaHorariaId;
	}

	public String getCodigoPostal() {
		return codigoPostal;
	}

	public void setCodigoPostal(String codigopostal) {
		this.codigoPostal = codigopostal;
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
		paisId = "";
		zonaHoraria = null;
		zonaHorariaId = "";
		codigoPostal = "";
		nombre = "";
		region = "";
		direccion = "";
	}
	
}