package venp.web.forms;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;

import venp.beans.MyHelpBean;

public class ElectorForm extends ActionForm {
	
	private String id;
	private String locationId;
	private String nombre;
	private String paterno; 
	private String materno;
	private String dni;
	private String pin;
	private String email;
	private String estado;
	private String fechaSufragio;
	private String horaSufragio;
	private String gmtSufragio;
	private int paisId;
	private static ArrayList consulados;
	private static ArrayList paises;

	public ElectorForm() {
		reset();
	}
	
	public ArrayList getConsulados() {
		ArrayList lista = new ArrayList();
		for(int i=0; i<consulados.size(); i++) {
			MyHelpBean loc = (MyHelpBean)consulados.get(i);
			if(loc.getPaisId() == paisId)
				lista.add(loc);
		}
		return lista;
	}
	
	public ArrayList getConsuladoList() {
		return consulados;
	}

	public void setConsulados(ArrayList consulados) {
		this.consulados = consulados;
	}

	public ArrayList getPaises() {
		return paises;
	}

	public void setPaises(ArrayList paises) {
		this.paises = paises;
	}

	public int getPaisId() {
		return paisId;
	}

	public void setPaisId(int paisId) {
		this.paisId = paisId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLocationId() {
		return locationId;
	}

	public void setLocationId(String locationId) {
		this.locationId = locationId;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getPaterno() {
		return paterno;
	}

	public void setPaterno(String paterno) {
		this.paterno = paterno;
	}

	public String getMaterno() {
		return materno;
	}

	public void setMaterno(String materno) {
		this.materno = materno;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String mail) {
		this.email = mail;
	}
	
	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getPin() {
		return pin;
	}

	public void setPin(String pin) {
		this.pin = pin;
	}

	public String getFechaSufragio() {
		return fechaSufragio;
	}

	public void setFechaSufragio(String fechaSufragio) {
		this.fechaSufragio = fechaSufragio;
	}

	public String getHoraSufragio() {
		return horaSufragio;
	}

	public void setHoraSufragio(String horaSufragio) {
		this.horaSufragio = horaSufragio;
	}

	public String getGmtSufragio() {
		return gmtSufragio;
	}

	public void setGmtSufragio(String gmtSufragio) {
		this.gmtSufragio = gmtSufragio;
	}

	public void reset() {
		id = "0";
		locationId = "";
		nombre = "";
		paterno = "";
		materno = "";
		dni = "";
		email = "";
		estado = "";
		pin = "";
		fechaSufragio = "";
		horaSufragio = "";
		gmtSufragio = "";
		paisId = 0;
	}
	
}
