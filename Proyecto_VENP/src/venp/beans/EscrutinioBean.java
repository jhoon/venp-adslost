package venp.beans;

import java.util.ArrayList;

public class EscrutinioBean extends Bean {
	
	ArrayList listaEscrutinioDetalle;
	
	String paisId;
	String nombrePais;
	String totalLocaciones;
	boolean locacionCerrada;
	String locacionId;
	String nombreLocacion;
	String mensaje;
	int totalVotos;
	int totalVotosValidos;
	int totalVotosBlancos;	
	int locacionesCerradas;
	int conEscrutinio;
	
	public int getConEscrutinio() {
		return conEscrutinio;
	}
	public void setConEscrutinio(int conEscrutinio) {
		this.conEscrutinio = conEscrutinio;
	}
	public int getLocacionesCerradas() {
		return locacionesCerradas;
	}
	public void setLocacionesCerradas(int locacionesCerradas) {
		this.locacionesCerradas = locacionesCerradas;
	}
	public String getPaisId() {
		return paisId;
	}
	public void setPaisId(String paisId) {
		this.paisId = paisId;
	}
	public String getNombrePais() {
		return nombrePais;
	}
	public void setNombrePais(String nombrePais) {
		this.nombrePais = nombrePais;
	}
	public String getTotalLocaciones() {
		return totalLocaciones;
	}
	public void setTotalLocaciones(String totalLocaciones) {
		this.totalLocaciones = totalLocaciones;
	}
	public boolean getLocacionCerrada() {
		return locacionCerrada;
	}
	public void setLocacionCerrada(boolean locacionCerrada) {
		this.locacionCerrada = locacionCerrada;
	}

	public ArrayList getListaEscrutinioDetalle() {
		return listaEscrutinioDetalle;
	}
	public void setListaEscrutinioDetalle(ArrayList listaEscrutinioDetalle) {
		this.listaEscrutinioDetalle = listaEscrutinioDetalle;
	}
	public String getLocacionId() {
		return locacionId;
	}
	public void setLocacionId(String locacionId) {
		this.locacionId = locacionId;
	}
	public String getNombreLocacion() {
		return nombreLocacion;
	}
	public void setNombreLocacion(String nombreLocacion) {
		this.nombreLocacion = nombreLocacion;
	}
	public String getMensaje() {
		return mensaje;
	}
	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}
	public int getTotalVotos() {
		return totalVotos;
	}
	public void setTotalVotos(int totalVotos) {
		this.totalVotos = totalVotos;
	}
	public int getTotalVotosValidos() {
		return totalVotosValidos;
	}
	public void setTotalVotosValidos(int totalVotosValidos) {
		this.totalVotosValidos = totalVotosValidos;
	}
	public int getTotalVotosBlancos() {
		return totalVotosBlancos;
	}
	public void setTotalVotosBlancos(int totalVotosBlancos) {
		this.totalVotosBlancos = totalVotosBlancos;
	}
}
