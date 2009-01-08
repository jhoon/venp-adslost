package venp.dao.entities;

import java.util.ArrayList;

import venp.web.forms.ElectorForm;

public interface ElectorDAO {
	/**
	 * obtiene los datos de una persona seg�n su DNI
	 * 
	 * @param strDni
	 *            el <code>DNI</code> del cual se est�n buscando los datos
	 * @return los datos correspondientes al DNI ingresado
	 * @throws Exception
	 */
	public ElectorForm validarDNI(String strDni) throws Exception;

	/**
	 * consulta si el PIN ingresado por el votante es v�lido
	 * 
	 * @param strId
	 *            es el <code>id</code> correspondiente al elector
	 * @param strPin
	 *            el <code>PIN</code> ingresado
	 * @return <code>true</code> si es v�lido<br>
	 *         <code>false</code> si no lo es
	 * @throws Exception
	 */
	public boolean isValidPIN(String strId, String strPin) throws Exception;

	public void registrarElector(ElectorForm elector) throws Exception;

	/**
	 * a�ade un voto a la selecci�n correspondiente y actualiza el estado del
	 * elector para pr�ximas validaciones
	 * 
	 * @param strVoto
	 *            <code>id</code> correspondiente a la opci�n seleccionada
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
	 * obtiene los datos correspondientes a la c�dula
	 * 
	 * @param intIdProceso
	 *            <code>id</code> del proceso
	 * @return arreglo con los candidatos y sus datos
	 * @throws Exception
	 */
	public ArrayList getCedulaOpciones(int idProceso) throws Exception;

	public int getEmpadronamientoActivo() throws Exception;

	/**
	 * obtiene el c�digo del proceso activo
	 * 
	 * @return el <code>id</code> del proceso activo
	 * @throws Exception
	 */
	public int getProcesoActivo() throws Exception;

	/**
	 * Verifica si el elector est� ingresando a votar dentro del rango de horas
	 * establecidas para la votaci�n.
	 * 
	 * @param intIdProceso
	 *            id del proceso
	 * @param intIdElector
	 *            id del elector
	 * @return <code>true</code> si el voto est� dentro del rango.<br>
	 *         <code>false</code> si no lo est�
	 * @throws Exception
	 */
	public boolean isVotoEnRango(int intIdProceso, int intIdElector)
			throws Exception;
}
