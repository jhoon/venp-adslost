package venp.web.forms;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;

public class EscrutinioForm extends ActionForm{
	
	ArrayList listaEscrutinio;
	ArrayList listaEscrutinioDetalle;

	int  codigo;  
	String nombrePais;
	String totalLocaciones;
	boolean locacionCerrada;
	String locacionId;
	String nombreLocacion;
	String totalVotos;
	String votos;
	String votosValidos;
	String votosBlanco;
	String opcion;
	String IdVotoBlanco; 
	
	
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
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
	
	public ArrayList getListaEscrutinio() {
		return listaEscrutinio;
	}

	public void setListaEscrutinio(ArrayList listaEscrutinio) {
		this.listaEscrutinio = listaEscrutinio;
	}
	public String getNombreLocacion() {
		return nombreLocacion;
	}
	public void setNombreLocacion(String nombreLocacion) {
		this.nombreLocacion = nombreLocacion;
	}
	public String getTotalVotos() {
		return totalVotos;
	}
	public void setTotalVotos(String totalVotos) {
		this.totalVotos = totalVotos;
	}
	public String getVotosValidos() {
		return votosValidos;
	}
	public void setVotosValidos(String votosValidos) {
		this.votosValidos = votosValidos;
	}
	public String getVotosBlanco() {
		return votosBlanco;
	}
	public void setVotosBlanco(String votosBlanco) {
		this.votosBlanco = votosBlanco;
	}
	public String getLocacionId() {
		return locacionId;
	}
	public void setLocacionId(String locacionId) {
		this.locacionId = locacionId;
	}
	public String getOpcion() {
		return opcion;
	}
	public void setOpcion(String opcion) {
		this.opcion = opcion;
	}
	public String getIdVotoBlanco() {
		return IdVotoBlanco;
	}
	public void setIdVotoBlanco(String idVotoBlanco) {
		IdVotoBlanco = idVotoBlanco;
	}
	public String getVotos() {
		return votos;
	}
	public void setVotos(String votos) {
		this.votos = votos;
	}
	public ArrayList getListaEscrutinioDetalle() {
		return listaEscrutinioDetalle;
	}
	public void setListaEscrutinioDetalle(ArrayList listaEscrutinioDetalle) {
		this.listaEscrutinioDetalle = listaEscrutinioDetalle;
	}

}
