package venp.beans;

import java.sql.Timestamp;
import java.util.Date;

public class ConsolidacionBean extends Bean {
	
	private String opcion;
	private String nombreCandidato;
	private String nombrePartidoPolitico;
	private String resultado;
	private String imagenPartidoPolitico;
	private String imagenCandidato;
	private String fechaComicios;
	private String porcentaje;
	private String fecha;
	
	public String getNombreCandidato() {
		return nombreCandidato;
	}
	public void setNombreCandidato(String nombreCandidato) {
		this.nombreCandidato = nombreCandidato;
	}
	public String getNombrePartidoPolitico() {
		return nombrePartidoPolitico;
	}
	public void setNombrePartidoPolitico(String nombrePartidoPolitico) {
		this.nombrePartidoPolitico = nombrePartidoPolitico;
	}
	public String getResultado() {
		return resultado;
	}
	public void setResultado(String resultado) {
		this.resultado = resultado;
	}
	public String getImagenPartidoPolitico() {
		return imagenPartidoPolitico;
	}
	public void setImagenPartidoPolitico(String imagenPartidoPolitico) {
		this.imagenPartidoPolitico = imagenPartidoPolitico;
	}
	public String getImagenCandidato() {
		return imagenCandidato;
	}
	public void setImagenCandidato(String imagenCandidato) {
		this.imagenCandidato = imagenCandidato;
	}
	public String getFechaComicios() {
		return fechaComicios;
	}
	public void setFechaComicios(String fechaComicios) {
		this.fechaComicios = fechaComicios;
	}
	public String getOpcion() {
		return opcion;
	}
	public void setOpcion(String opcion) {
		this.opcion = opcion;
	}
	public String getPorcentaje() {
		return porcentaje;
	}
	public void setPorcentaje(String porcentaje) {
		this.porcentaje = porcentaje;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

		
}