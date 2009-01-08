package venp.beans;


public class ConsolidacionBean extends Bean {
	
	private String opcion;
	private String nombreCandidato;
	private String nombrePartidoPolitico;
	private String resultadoOpcion;	
	private String imagenPartidoPolitico;
	private String imagenCandidato;
	private String fechaComicios;
	private String porcentajeObtenido;	
	private String fechaConsolidacion;
	private String estadoProceso;	
	private String totalLocacionesAbiertas;
	
	
	public String getTotalLocacionesAbiertas() {
		return totalLocacionesAbiertas;
	}
	public void setTotalLocacionesAbiertas(String totalLocacionesAbiertas) {
		this.totalLocacionesAbiertas = totalLocacionesAbiertas;
	}
	public String getEstadoProceso() {
		return estadoProceso;
	}
	public void setEstadoProceso(String estadoProceso) {
		this.estadoProceso = estadoProceso;
	}
		 
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
	
	public String getFechaConsolidacion() {
		return fechaConsolidacion;
	}
	public void setFechaConsolidacion(String fechaConsolidacion) {
		this.fechaConsolidacion = fechaConsolidacion;
	}
 
	public String getResultadoOpcion() {
		return resultadoOpcion;
	}
	public void setResultadoOpcion(String resultadoOpcion) {
		this.resultadoOpcion = resultadoOpcion;
	}
	public String getPorcentajeObtenido() {
		return porcentajeObtenido;
	}
	public void setPorcentajeObtenido(String porcentajeObtenido) {
		this.porcentajeObtenido = porcentajeObtenido;
	}
		
}