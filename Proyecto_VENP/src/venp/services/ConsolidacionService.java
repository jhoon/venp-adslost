package venp.services;

import java.util.ArrayList;

import venp.beans.LocacionBean;
import venp.beans.PerfilBean;
import venp.dao.entities.ConsolidacionDAO;
import venp.dao.entities.EscrutinioDAO;
import venp.dao.entities.LocacionDAO;
import venp.dao.factory.DAOFactory;

public class ConsolidacionService {

	private DAOFactory factory = DAOFactory.getFactory(DAOFactory.DB_MY_SQL);
	private ConsolidacionDAO dao;

	public ConsolidacionService() {
		dao = factory.getConsolidacionDAO();
	}

	public ArrayList listarResultados() throws Exception {
		try {
			ArrayList lista = dao.listarResultados();

			return lista;
		} catch (Exception e) {
			e.printStackTrace();

			return null;
		}
	}
	
	public boolean procesoCerrado() throws Exception {
		try {
			boolean proceso=false;
			if(dao.procesoCerrado()){
				proceso = true;
			}

			return proceso;
		} catch (Exception e) {
			e.printStackTrace();

			return false;
		}
	}
	
	 
}