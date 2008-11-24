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

	public LocacionService() {
		//dao = factory.getLocacionDAO();
		dao = (LocacionDAO)manager.getDao(LocacionDAO.class);
	}

	public ArrayList locaciones_Activas_Por_Usuario_PuestaCero(int usuario) throws Exception {
		try {
			ArrayList lista = dao.locaciones_Activas_Por_Usuario_PuestaCero(usuario);
			return lista;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public LocacionBean locacion_Activa_Por_Usuario_PuestaCero(int usuario, int locacion) throws Exception {
		try {
			LocacionBean bean = dao.locacion_Activa_Por_Usuario_PuestaCero(usuario, locacion);
			return bean;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean puesta_Cero(int usuario, int locacion) throws Exception {
		try {
			return dao.puesta_Cero(usuario, locacion);
		} 
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public ArrayList locaciones_Por_Usuario_CerrarVotacion(int usuario) throws Exception {
		try {
			ArrayList lista = dao.locaciones_Por_Usuario_CerrarVotacion(usuario);
			return lista;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	} 
	
	public LocacionBean locacion_Por_Usuario_CerrarVotacion(int usuario, int locacion) throws Exception {
		try {
			LocacionBean bean = dao.locacion_Por_Usuario_CerrarVotacion(usuario, locacion);
			return bean;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean cerrar_Votacion(int usuario, int locacion) throws Exception {
		try {
			return dao.cerrar_Votacion(usuario, locacion);
		} 
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public ArrayList locaciones_Por_Usuario_Monitoreo (int usuario) throws Exception {
		try {
			ArrayList lista = dao.locaciones_Por_Usuario_Monitoreo(usuario);
			return lista;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
}