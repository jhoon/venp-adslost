package venp.services;

import venp.dao.entities.LogDAO;
import venp.dao.factory.DaoConfig;

import com.ibatis.dao.client.DaoManager;

public class LogService {

	private DaoManager manager = DaoConfig.getDaoManager();
	private LogDAO dao;

	public LogService() {
		dao = (LogDAO) manager.getDao(LogDAO.class);
	}
	
	public void insertar(String diccionario , String usuario ) throws Exception {
		try {
			dao.insertarLog(diccionario, usuario);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}