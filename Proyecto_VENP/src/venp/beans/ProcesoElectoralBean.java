package venp.beans;

public class ProcesoElectoralBean extends Bean {

	private int codigo;
	private String usuario_id;
	private String descripcion;
	private String fecha_votacion;
	private String start_time;
	private String hora_inicial;
	private String minuto_inicial;
	private String final_time;
	private String hora_final;
	private String minuto_final;
	private String fecha_padron_inicial;
	private String fecha_padron_final;
	private int tiempo_sesion;
	private String estado;

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int id) {
		this.codigo = id;
	}

	public String getUsuario_id() {
		return usuario_id;
	}

	public void setUsuario_id(String id) {
		this.usuario_id = id;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getFecha_votacion() {
		return fecha_votacion;
	}

	public void setFecha_votacion(String fecha_votacion) {
		this.fecha_votacion = fecha_votacion;
	}

	public String getHora_inicial() {
		return hora_inicial;
	}

	public void setHora_inicial(String hora_inicial) {
		this.hora_inicial = hora_inicial;
	}

	public String getHora_final() {
		return hora_final;
	}

	public void setHora_final(String hora_final) {
		this.hora_final = hora_final;
	}

	public String getFecha_padron_inicial() {
		return fecha_padron_inicial;
	}

	public void setFecha_padron_inicial(String fecha_padron_inicial) {
		this.fecha_padron_inicial = fecha_padron_inicial;
	}

	public String getFecha_padron_final() {
		return fecha_padron_final;
	}

	public void setFecha_padron_final(String fecha_padron_final) {
		this.fecha_padron_final = fecha_padron_final;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public int getTiempo_sesion() {
		return tiempo_sesion;
	}

	public void setTiempo_sesion(int tiempo_sesion) {
		this.tiempo_sesion = tiempo_sesion;
	}

	public String getMinuto_inicial() {
		return minuto_inicial;
	}

	public void setMinuto_inicial(String minuto_inicial) {
		this.minuto_inicial = minuto_inicial;
	}

	public String getMinuto_final() {
		return minuto_final;
	}

	public void setMinuto_final(String minuto_final) {
		this.minuto_final = minuto_final;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getFinal_time() {
		return final_time;
	}

	public void setFinal_time(String final_time) {
		this.final_time = final_time;
	}
}