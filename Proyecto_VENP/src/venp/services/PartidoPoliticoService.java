package venp.services;

import java.util.ArrayList;

import com.ibatis.dao.client.DaoManager;

import venp.beans.PartidoPoliticoBean;
import venp.dao.entities.PartidoPoliticoDAO;
//import venp.dao.factory.DAOFactory;
import venp.dao.factory.DaoConfig;

public class PartidoPoliticoService {

	private DaoManager manager;
	private PartidoPoliticoDAO dao;

	public PartidoPoliticoService() {
		manager = DaoConfig.getDaoManager();
		dao = (PartidoPoliticoDAO) manager.getDao(PartidoPoliticoDAO.class);
	}
	
	public ArrayList findAll() throws Exception {
		try {
			return dao.findAll();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public PartidoPoliticoBean findByPrimaryKey(int codigo) throws Exception {
		try {
			return dao.findByPrimaryKey(codigo);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public void borrar(int codigo) throws Exception {
		try {
			dao.borrar(codigo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String insertar(PartidoPoliticoBean bean) throws Exception {
		try {
			return dao.insertar(bean);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public String editar(PartidoPoliticoBean bean) throws Exception {
		try {
			return dao.editar(bean);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public int totalCandidatosAsignados(int partidoPoliticoID) throws Exception {
		try {
			return dao.totalCandidatosAsignados(partidoPoliticoID);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
}