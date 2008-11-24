package venp.beans;

import java.sql.Timestamp;

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

	public LocacionBean () {
		codigo = 0;
		nombrePais = "";
		nombreCentroVotacion = "";
		tiempoGMT = 0;
		horaLocal = null;
		horaVotacionInicio = null;
		horaVotacionFin = null;
		diferenciaInicio = 0;
		diferenciaInicioFin = 0;
		diferenciaFin = 0;
		puestaCero = null;
		cierreVotacion = null;
		nroElectores = 0;
		nroVotos = 0;
		nroVotosRestantes = 0;
		nroElectorSesion = 0;
		nroVotosPorcentaje = 0;
		nroVotosRestantesPorcentaje = 0;
		nroElectorSesionPorcentaje = 0;
	}
	
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
		}
		catch (Exception e) {
			return 0;
		}
	}

	public void setNroVotosPorcentaje(int nroVotosPorcentaje) {
		this.nroVotosPorcentaje = nroVotosPorcentaje;
	}

	public int getNroVotosRestantesPorcentaje() {
		try {
			return (100 * getNroVotosRestantes()) / nroElectores;
		}
		catch (Exception e) {
			return 0;
		}
	}

	public void setNroVotosRestantesPorcentaje(int nroVotosRestantesPorcentaje) {
		this.nroVotosRestantesPorcentaje = nroVotosRestantesPorcentaje;
	}

	public int getNroElectorSesionPorcentaje() {
		try {
			return (100 * nroElectorSesion) / nroElectores;
		}
		catch (Exception e) {
			return 0;
		}
	}

	public void setNroElectorSesionPorcentaje(int nroElectorSesionPorcentaje) {
		this.nroElectorSesionPorcentaje = nroElectorSesionPorcentaje;
	}
	
}