package venp.beans;

import java.sql.Timestamp;
import java.util.ArrayList;

/**
 * Clase Locacion para manejar cada uno de los centros de votacion y su
 * respectivo tiempos GMT
 * 
 * @author MCristobal, Portoren
 * 
 */
public class LocacionBean extends Bean {

	private int codigo;
	private String nombrePais;
	private String nombreCentroVotacion;
	private int tiempoGMT;
	private Timestamp horaLocal;
	private Timestamp horaVotacionInicio;
	private Timestamp horaVotacionFin;
	private int diferenciaInicio;
	private int diferenciaInicioFin;
	private int diferenciaFin;
	private Timestamp puestaCero;
	private Timestamp cierreVotacion;
	private int nroElectores;
	private int nroVotos;
	private int nroVotosRestantes;
	private int nroElectorSesion;
	private int nroVotosPorcentaje;
	private int nroVotosRestantesPorcentaje;
	private int nroElectorSesionPorcentaje;
	private String totalLocaciones;
	private int locacionesCerradas;
	private boolean locacionCerrada;
	private String mensaje;
	private int conEscrutinio;
	private ArrayList listaEscrutinioDetalle;
	private int locacionesAbiertas;

	public int getNroElectores() {
		return nroElectores;
	}

	public void setNroElectores(int nroElectores) {
		this.nroElectores = nroElectores;
	}

	public int getNroVotos() {
		return nroVotos;
	}

	public void setNroVotos(int nroVotos) {
		this.nroVotos = nroVotos;
	}

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

	public String getNombreCentroVotacion() {
		return nombreCentroVotacion;
	}

	public void setNombreCentroVotacion(String nombreCentroVotacion) {
		this.nombreCentroVotacion = nombreCentroVotacion;
	}

	public int getTiempoGMT() {
		return tiempoGMT;
	}

	public void setTiempoGMT(int tiempoGMT) {
		this.tiempoGMT = tiempoGMT;
	}

	public Timestamp getHoraLocal() {
		return horaLocal;
	}

	public void setHoraLocal(Timestamp horaLocal) {
		this.horaLocal = horaLocal;
	}

	public Timestamp getHoraVotacionInicio() {
		return horaVotacionInicio;
	}

	public void setHoraVotacionInicio(Timestamp horaVotacionInicio) {
		this.horaVotacionInicio = horaVotacionInicio;
	}

	public int getDiferenciaInicio() {
		return diferenciaInicio;
	}

	public void setDiferenciaInicio(int diferenciaInicio) {
		this.diferenciaInicio = diferenciaInicio;
	}

	public int getDiferenciaInicioFin() {
		return diferenciaInicioFin;
	}

	public void setDiferenciaInicioFin(int diferenciaInicioFin) {
		this.diferenciaInicioFin = diferenciaInicioFin;
	}

	public int getDiferenciaFin() {
		return diferenciaFin;
	}

	public void setDiferenciaFin(int diferenciaFin) {
		this.diferenciaFin = diferenciaFin;
	}

	public Timestamp getHoraVotacionFin() {
		return horaVotacionFin;
	}

	public void setHoraVotacionFin(Timestamp horaVotacionFin) {
		this.horaVotacionFin = horaVotacionFin;
	}

	public Timestamp getPuestaCero() {
		return puestaCero;
	}

	public void setPuestaCero(Timestamp puestaCero) {
		this.puestaCero = puestaCero;
	}

	public Timestamp getCierreVotacion() {
		return cierreVotacion;
	}

	public void setCierreVotacion(Timestamp cierreVotacion) {
		this.cierreVotacion = cierreVotacion;
	}

	public int getNroVotosRestantes() {
		return nroElectores - nroVotos;
	}

	public void setNroVotosRestantes(int nroVotosRestantes) {
		this.nroVotosRestantes = nroVotosRestantes;
	}

	public int getNroElectorSesion() {
		return nroElectorSesion;
	}

	public void setNroElectorSesion(int nroElectorSesion) {
		this.nroElectorSesion = nroElectorSesion;
	}

	public int getNroVotosPorcentaje() {
		try {
			return (100 * nroVotos) / nroElectores;
		} catch (Exception e) {
			return 0;
		}
	}

	public void setNroVotosPorcentaje(int nroVotosPorcentaje) {
		this.nroVotosPorcentaje = nroVotosPorcentaje;
	}

	public int getNroVotosRestantesPorcentaje() {
		try {
			return (100 * getNroVotosRestantes()) / nroElectores;
		} catch (Exception e) {
			return 0;
		}
	}

	public void setNroVotosRestantesPorcentaje(int nroVotosRestantesPorcentaje) {
		this.nroVotosRestantesPorcentaje = nroVotosRestantesPorcentaje;
	}

	public int getNroElectorSesionPorcentaje() {
		try {
			return (100 * nroElectorSesion) / nroElectores;
		} catch (Exception e) {
			return 0;
		}
	}

	public void setNroElectorSesionPorcentaje(int nroElectorSesionPorcentaje) {
		this.nroElectorSesionPorcentaje = nroElectorSesionPorcentaje;
	}

	public String getTotalLocaciones() {
		return totalLocaciones;
	}

	public void setTotalLocaciones(String totalLocaciones) {
		this.totalLocaciones = totalLocaciones;
	}

	public int getLocacionesCerradas() {
		return locacionesCerradas;
	}

	public void setLocacionesCerradas(int locacionesCerradas) {
		this.locacionesCerradas = locacionesCerradas;
	}

	public boolean isLocacionCerrada() {
		return locacionCerrada;
	}

	public void setLocacionCerrada(boolean locacionCerrada) {
		this.locacionCerrada = locacionCerrada;
	}

	public String getMensaje() {
		return mensaje;
	}

	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}

	public int getConEscrutinio() {
		return conEscrutinio;
	}

	public void setConEscrutinio(int conEscrutinio) {
		this.conEscrutinio = conEscrutinio;
	}

	public ArrayList getListaEscrutinioDetalle() {
		return listaEscrutinioDetalle;
	}

	public void setListaEscrutinioDetalle(ArrayList listaEscrutinioDetalle) {
		this.listaEscrutinioDetalle = listaEscrutinioDetalle;
	}

	public int getLocacionesAbiertas() {
		return locacionesAbiertas;
	}

	public void setLocacionesAbiertas(int locacionesAbiertas) {
		this.locacionesAbiertas = locacionesAbiertas;
	}

}