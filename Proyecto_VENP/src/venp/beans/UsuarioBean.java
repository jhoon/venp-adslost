package venp.beans;

/**
 * 
 * @author ADS Lost
 * @version 1.0 03/01/2009 La clase UsuarioBean se utliza para el manejo de
 *          usuarios a lo largo de la aplicación
 * 
 */
public class UsuarioBean extends Bean {

	private String codigo;
	private PerfilBean perfil;
	private String nombre;
	private String nombreCompleto;
	private String apePaterno;
	private String apeMaterno;
	private String dni;
	private String email;
	private String movil;
	private String userName;
	private String password;
	private String estado;

	public PerfilBean getPerfil() {
		return perfil;
	}

	public void setPerfil(PerfilBean perfil) {
		this.perfil = perfil;
	}

	/**
	 * 
	 * @return El nombre del usuario
	 */
	public String getNombre() {
		return nombre;
	}

	/**
	 *Permite establecer el nombre del usuario
	 * 
	 * @param nombre
	 * 
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	/**
	 * 
	 * @return El Apellido Paterno del usuario
	 */
	public String getApePaterno() {
		return apePaterno;
	}

	/**
	 * Permite establecer el apellido paterno del usuario
	 * 
	 * @param apePaterno
	 */
	public void setApePaterno(String apePaterno) {
		this.apePaterno = apePaterno;
	}

	/**
	 * 
	 * @return El Apellido materno del usuario
	 */
	public String getApeMaterno() {
		return apeMaterno;
	}

	/**
	 * Permite establecer el apellido materno del usuario
	 * 
	 * @param apeMaterno
	 */
	public void setApeMaterno(String apeMaterno) {
		this.apeMaterno = apeMaterno;
	}

	/**
	 * 
	 * @return El DNI del usuario
	 */
	public String getDni() {
		return dni;
	}

	/**
	 * Permite establecer el dni del usuario
	 * 
	 * @param dni
	 */
	public void setDni(String dni) {
		this.dni = dni;
	}

	/**
	 * 
	 * @return El email del usuario
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * Permite establecer el email del usuario
	 * 
	 * @param email
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * 
	 * @return El Nro de Celular del usuario
	 */
	public String getMovil() {
		return movil;
	}

	/**
	 * Permite establecer el nro de celular del usuario
	 * 
	 * @param movil
	 */
	public void setMovil(String movil) {
		this.movil = movil;
	}

	/**
	 * 
	 * @return El login para autenticarse
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * Permite establecer el login del usuario
	 * 
	 * @param userName
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * 
	 * @return La contraseña del usuario
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * Permite establecer la contraseña del usuario
	 * 
	 * @param password
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * 
	 * @return El estado del usuario
	 */
	public String getEstado() {
		return estado;
	}

	/**
	 * Permite establecer el estado del usuario
	 * 
	 * @param estado
	 */
	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getNombreCompleto() {
		StringBuffer sb = new StringBuffer();
		sb.append(nombre);
		sb.append(" ");
		sb.append(apePaterno);
		sb.append(" ");
		sb.append(apeMaterno);
		
		return sb.toString();
	}

	public void setNombreCompleto(String nombreCompleto) {
		this.nombreCompleto = nombreCompleto;
	}

}
