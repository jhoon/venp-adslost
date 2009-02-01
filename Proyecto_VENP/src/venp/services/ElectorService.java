package venp.services;

import java.util.ArrayList;

import venp.dao.entities.ElectorDAO;
import venp.dao.factory.DaoConfig;
import venp.web.forms.ElectorForm;

import com.ibatis.dao.client.DaoManager;

public class ElectorService {

	private ElectorDAO dao;
	
	private DaoManager manager = DaoConfig.getDaoManager();

	public ElectorService() {
		dao = (ElectorDAO)manager.getDao(ElectorDAO.class);
	}
	
	/**
	 * si el DNI es v�lido, retornar� los datos, de lo contrario
	 * retornar� un null
	 * @param strDni <code>DNI</code> a validar
	 * @return datos del elector correspondientes al DNI ingresado
	 * @throws Exception
	 */
	public ElectorForm validarDNI(String strDni) throws Exception {
		try {
			ElectorForm bean = dao.validarDNI(strDni);
			return bean;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * verifica si el pin ingresado es v�lido
	 * @param strId <code>id</code> del elector que est� ingresando el PIN
	 * @param strPin <code>PIN</code> ingresado
	 * @return <code>true</code> si es v�lido<br><code>false</code>si no lo es
	 */
	public boolean isValidPIN(String strId, String strPin) {
		try {
			return dao.isValidPIN(strId, strPin);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public void registrar(ElectorForm elector) throws Exception {
		try {
			dao.registrarElector(elector);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * ejecuta el voto
	 * @param strVoto <code>id</code> de la opci�n escogida
	 * @param elector
	 * @return
	 * @throws Exception
	 */
	public ElectorForm votar(String strVoto, ElectorForm elector) throws Exception {
		try {
			return dao.votar(strVoto, elector);
		} catch (Exception e) {
			e.getMessage();
			//e.printStackTrace();
			return null;
		}
	}

	public ArrayList getConsulados(int intIdProceso) {
		try {
			ArrayList lista = dao.getConsulados(intIdProceso);
			return lista;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public ArrayList getPaises(int intIdProceso) {
		try {
			ArrayList lista = dao.getPaises(intIdProceso);
			return lista;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * obtiene los datos de la c�dula tales como la lista de candidatos
	 * y sus datos correspondientes
	 * @param intIdProceso <code>id</code> del proceso actual
	 * @return la lista de candidatos
	 */
	public ArrayList getCedulaOpciones(int intIdProceso) {
		try {
			ArrayList lista = dao.getCedulaOpciones(intIdProceso);
			return lista;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int getEmpadronamientoActivo() {
		try {
			return dao.getEmpadronamientoActivo();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	/**
	 * devuelve el Id del proceso activo, haciendo uso del dao correspondiente.
	 * @return el <code>id</code> del proceso activo actualmente
	 */
	public int getProcesoActivo() {
		try {
			return dao.getProcesoActivo();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	/**
	 * verifica si el elector est� intentando ingresar a la votaci�n dentro del 
	 * rango de tiempo establecido en su locaci�n.
	 * @param intIdProceso <code>id</code> del proceso activo actualmente
	 * @param intIdElector <code>id</code> del elector que quiere ingresar
	 * @return <code>true</code> si puede votar en ese momento<br>
	 * 		  <code>false</code> si a�n no abre o ya se cerr� la votaci�n
	 */
	public boolean isVotoEnRango(int intIdProceso, int intIdElector) {
		try {
			return dao.isVotoEnRango(intIdProceso, intIdElector);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}