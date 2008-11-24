package venp.services;

import java.util.ArrayList;

import venp.dao.entities.ZonaHorariaDAO;
import venp.dao.factory.DAOFactory;

public class ZonaHorariaService {
	
	private DAOFactory factory = DAOFactory.getFactory(DAOFactory.DB_MY_SQL);
	private ZonaHorariaDAO dao;
	
	public ZonaHorariaService() {
		dao = factory.getZonaHorariaDAO();
	}

	public ArrayList findAll() throws Exception {
		try {
			ArrayList lista = dao.findAll();

			return lista;
		} catch (Exception e) {
			e.printStackTrace();

			return null;
		}
	}
	
}