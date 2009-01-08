package venp.beans;

public class ProcesoElectoralBean extends Bean {

	private int codigo;
	private String usuarioId;
	private String descripcion;
	private String fechaVotacion;
	private String startTime;
	private String horaInicial;
	private String minutoInicial;
	private String finalTime;
	private String horaFinal;
	private String minutoFinal;
	private String fechaPadronInicial;
	private String fechaPadronFinal;
	private int tiempoSesion;
	private String estado;

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getUsuarioId() {
		return usuarioId;
	}

	public void setUsuarioId(String usuarioId) {
		this.usuarioId = usuarioId;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getFechaVotacion() {
		return fechaVotacion;
	}

	public void setFechaVotacion(String fechaVotacion) {
		this.fechaVotacion = fechaVotacion;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getHoraInicial() {
		return horaInicial;
	}

	public void setHoraInicial(String horaInicial) {
		this.horaInicial = horaInicial;
	}

	public String getMinutoInicial() {
		return minutoInicial;
	}

	public void setMinutoInicial(String minutoInicial) {
		this.minutoInicial = minutoInicial;
	}

	public String getFinalTime() {
		return finalTime;
	}

	public void setFinalTime(String finalTime) {
		this.finalTime = finalTime;
	}

	public String getHoraFinal() {
		return horaFinal;
	}

	public void setHoraFinal(String horaFinal) {
		this.horaFinal = horaFinal;
	}

	public String getMinutoFinal() {
		return minutoFinal;
	}

	public void setMinutoFinal(String minutoFinal) {
		this.minutoFinal = minutoFinal;
	}

	public String getFechaPadronInicial() {
		return fechaPadronInicial;
	}

	public void setFechaPadronInicial(String fechaPadronInicial) {
		this.fechaPadronInicial = fechaPadronInicial;
	}

	public String getFechaPadronFinal() {
		return fechaPadronFinal;
	}

	public void setFechaPadronFinal(String fechaPadronFinal) {
		this.fechaPadronFinal = fechaPadronFinal;
	}

	public int getTiempoSesion() {
		return tiempoSesion;
	}

	public void setTiempoSesion(int tiempoSesion) {
		this.tiempoSesion = tiempoSesion;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

}