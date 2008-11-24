package venp.services;

import java.util.ArrayList;

import venp.dao.entities.ElectorDAO;
import venp.dao.factory.DaoConfig;
import venp.web.forms.ElectorForm;

import com.ibatis.dao.client.DaoManager;

public class ElectorService {

//	private DAOFactory factory = DAOFactory.getFactory(DAOFactory.DB_MY_SQL);
	private ElectorDAO dao;
	
	private DaoManager manager = DaoConfig.getDaoManager();

	public ElectorService() {
//		dao = factory.getElectorDAO();
		dao = (ElectorDAO)manager.getDao(ElectorDAO.class);
	}
	
	/*
	 * Retorna a un elector que este empadronado y no haya votado aun.
	 */
	public ElectorForm validarDNI(String dni) throws Exception {
		try {
			ElectorForm bean = dao.validarDNI(dni);
			return bean;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean isValidPIN(String id, String pin) {
		try {
			return dao.isValidPIN(id, pin);
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
	
	public ElectorForm votar(String voto, ElectorForm elector) throws Exception {
		try {
			return dao.votar(voto, elector);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public ArrayList getConsulados(int idProceso) {
		try {
			ArrayList lista = dao.getConsulados(idProceso);
			return lista;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public ArrayList getPaises(int idProceso) {
		try {
			ArrayList lista = dao.getPaises(idProceso);
			return lista;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public ArrayList getCedulaOpciones(int idProceso) {
		try {
			ArrayList lista = dao.getCedulaOpciones(idProceso);
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
	
	public int getProcesoActivo() {
		try {
			return dao.getProcesoActivo();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public boolean isVotoEnRango(int idProceso, int idElector) {
		try {
			return dao.isVotoEnRango(idProceso, idElector);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}