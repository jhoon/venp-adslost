package venp.services;

import java.util.ArrayList;

import venp.beans.LocacionBean;
import venp.dao.entities.LocacionDAO;
import venp.dao.factory.DaoConfig;

import com.ibatis.dao.client.DaoManager;

public class LocacionService {

	//private DAOFactory factory = DAOFactory.getFactory(DAOFactory.DB_MY_SQL);
	private DaoManager manager = DaoConfig.getDaoManager();
	private LocacionDAO dao;
	/**
	 * Constructor de la clase
	 */
	public LocacionService() {
		//dao = factory.getLocacionDAO();
		dao = (LocacionDAO)manager.getDao(LocacionDAO.class);
	}

	/**
	 * Metodo para la puesta a cero
	 * @param intUsuario
	 * @return
	 * @throws Exception
	 */
	public ArrayList locacionesActivasPorUsuarioPuestaCero(int intUsuario) throws Exception {
		try {
			ArrayList lista = dao.locacionesActivasPorUsuarioPuestaCero(intUsuario);
			return lista;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * Metodo para puesta a cero
	 * @param intUsuario
	 * @param intLocacion
	 * @return
	 * @throws Exception
	 */
	public LocacionBean locacionActivaPorUsuarioPuestaCero(int intUsuario, int intLocacion) throws Exception {
		try {
			LocacionBean bean = dao.locacionActivaPorUsuarioPuestaCero(intUsuario, intLocacion);
			return bean;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * Metodo para la puesta a cero
	 * @param intUsuario
	 * @param intLocacion
	 * @return
	 * @throws Exception
	 */
	public boolean puestaCero(int intUsuario, int intLocacion) throws Exception {
		try {
			return dao.puestaCero(intUsuario, intLocacion);
		} 
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	/**
	 * Metodo para el cierre de votaci�n
	 * @param intUsuario
	 * @return
	 * @throws Exception
	 */
	public ArrayList locacionesPorUsuarioCerrarVotacion(int intUsuario) throws Exception {
		try {
			ArrayList lista = dao.locacionesPorUsuarioCerrarVotacion(intUsuario);
			return lista;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	} 
	/**
	 * Metodo para el cierre de votacion
	 * @param intUsuario
	 * @param intLocacion
	 * @return
	 * @throws Exception
	 */
	public LocacionBean locacionPorUsuarioCerrarVotacion(int intUsuario, int intLocacion) throws Exception {
		try {
			LocacionBean bean = dao.locacionPorUsuarioCerrarVotacion(intUsuario, intLocacion);
			return bean;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * Metodo para cierre de votaci�n
	 * @param intUsuario
	 * @param intLocacion
	 * @return
	 * @throws Exception
	 */
	public boolean cerrarVotacion(int intUsuario, int intLocacion) throws Exception {
		try {
			return dao.cerrarVotacion(intUsuario, intLocacion);
		} 
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	/**
	 * Metodo de monitoreo de transacciones
	 * @param intUsuario
	 * @return lista de locaciones a monitorear
	 * @throws Exception
	 */
	public ArrayList locacionesPorUsuarioMonitoreo (int intUsuario) throws Exception {
		try {
			ArrayList lista = dao.locacionesPorUsuarioMonitoreo(intUsuario);
			return lista;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
}