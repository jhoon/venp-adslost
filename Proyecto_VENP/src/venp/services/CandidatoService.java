package venp.services;

import java.util.ArrayList;

import com.ibatis.dao.client.DaoManager;

import venp.beans.CandidatoBean;
import venp.dao.entities.CandidatoDAO;
//import venp.dao.factory.DAOFactory;
import venp.dao.factory.DaoConfig;

public class CandidatoService {

	private DaoManager manager;
	private CandidatoDAO dao;

	public CandidatoService() {
		manager = DaoConfig.getDaoManager();
		dao = (CandidatoDAO) manager.getDao(CandidatoDAO.class);
	}
	
	public ArrayList listarTodos() throws Exception {
		try {
			return dao.listarTodos();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public ArrayList listarConPartidoPolitico(int partidoPoliticoId) throws Exception {
		try {
			return dao.listarConPartidoPolitico(partidoPoliticoId);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public ArrayList listarSinPartidoPolitico(int partidoPoliticoId) throws Exception {
		try {
			return dao.listarSinPartidoPolitico(partidoPoliticoId);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public CandidatoBean findByPrimaryKey(int codigo) throws Exception {
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
	
	public String insertar(CandidatoBean bean) throws Exception {
		try {
			return dao.insertar(bean);
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	
	public String editar(CandidatoBean bean) throws Exception {
		try {
			return dao.editar(bean);
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	
	public void asignar(int partidoPolitico, int candidato) throws Exception {
		try {
			dao.asignar(partidoPolitico, candidato);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void retirar(int partidoPolitico, int candidato) throws Exception {
		try {
			dao.retirar(partidoPolitico, candidato);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	 
}