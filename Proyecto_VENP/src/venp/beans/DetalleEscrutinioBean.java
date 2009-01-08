package venp.beans;

import java.util.ArrayList;

public class DetalleEscrutinioBean extends Bean { 
	
	String locacionId;
	String nombreLocacion;
	String totalVotos;
	String votos;
	String votosValidos;
	String votosBlanco;
	String opcion;
	String IdVotoBlanco; 
	
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
	public String getNombreLocacion() {
		return nombreLocacion;
	}
	public void setNombreLocacion(String nombreLocacion) {
		this.nombreLocacion = nombreLocacion;
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
}
