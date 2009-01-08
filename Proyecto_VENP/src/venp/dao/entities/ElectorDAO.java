package venp.dao.entities;

import java.util.ArrayList;

import venp.web.forms.ElectorForm;

public interface ElectorDAO {
	/**
	 * obtiene los datos de una persona según su DNI
	 * 
	 * @param strDni
	 *            el <code>DNI</code> del cual se están buscando los datos
	 * @return los datos correspondientes al DNI ingresado
	 * @throws Exception
	 */
	public ElectorForm validarDNI(String strDni) throws Exception;

	/**
	 * consulta si el PIN ingresado por el votante es válido
	 * 
	 * @param strId
	 *            es el <code>id</code> correspondiente al elector
	 * @param strPin
	 *            el <code>PIN</code> ingresado
	 * @return <code>true</code> si es válido<br>
	 *         <code>false</code> si no lo es
	 * @throws Exception
	 */
	public boolean isValidPIN(String strId, String strPin) throws Exception;

	public void registrarElector(ElectorForm elector) throws Exception;

	/**
	 * añade un voto a la selección correspondiente y actualiza el estado del
	 * elector para próximas validaciones
	 * 
	 * @param strVoto
	 *            <code>id</code> correspondiente a la opción seleccionada
	 * @param elector
	 *            datos del elector
	 * @return el bean del elector con el estado actualizado
	 * @throws Exception
	 */
	public ElectorForm votar(String strVoto, ElectorForm elector)
			throws Exception;

	public ArrayList getConsulados(int intIdProceso) throws Exception;

	public ArrayList getPaises(int intIdProceso) throws Exception;

	/**
	 * obtiene los datos correspondientes a la cédula
	 * 
	 * @param intIdProceso
	 *            <code>id</code> del proceso
	 * @return arreglo con los candidatos y sus datos
	 * @throws Exception
	 */
	public ArrayList getCedulaOpciones(int idProceso) throws Exception;

	public int getEmpadronamientoActivo() throws Exception;

	/**
	 * obtiene el código del proceso activo
	 * 
	 * @return el <code>id</code> del proceso activo
	 * @throws Exception
	 */
	public int getProcesoActivo() throws Exception;

	/**
	 * Verifica si el elector está ingresando a votar dentro del rango de horas
	 * establecidas para la votación.
	 * 
	 * @param intIdProceso
	 *            id del proceso
	 * @param intIdElector
	 *            id del elector
	 * @return <code>true</code> si el voto está dentro del rango.<br>
	 *         <code>false</code> si no lo está
	 * @throws Exception
	 */
	public boolean isVotoEnRango(int intIdProceso, int intIdElector)
			throws Exception;
}
