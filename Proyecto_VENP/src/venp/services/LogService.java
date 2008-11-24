package venp.services;

import java.util.ArrayList;

import venp.beans.PerfilBean;
import venp.dao.entities.LogDAO;
import venp.dao.entities.PerfilDAO;
import venp.dao.factory.DAOFactory;

public class LogService {

	private DAOFactory factory = DAOFactory.getFactory(DAOFactory.DB_MY_SQL);
	private LogDAO dao;

	public LogService() {
		dao = factory.getLogDAO();
	}
	
	public void insertar(String diccionario , String usuario ) throws Exception {
		try {
			dao.insertarLog(diccionario, usuario);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}