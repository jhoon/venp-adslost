package venp.services;

import java.util.ArrayList;

import venp.beans.CedulaBean;
import venp.dao.entities.CedulaDAO;
import venp.dao.factory.DaoConfig;

import com.ibatis.dao.client.DaoManager;

public class CedulaService {

	private DaoManager manager;
	private CedulaDAO dao;

	public CedulaService() {
		manager = DaoConfig.getDaoManager();
		dao = (CedulaDAO) manager.getDao(CedulaDAO.class);
	}

	public int borrarCedula(String codigo) throws Exception {
		return 0;
	}

	public CedulaBean cargarCedula(String codigo) throws Exception {
		return null;
	}

	public int guardarCedula(CedulaBean cedula) throws Exception {
		return 0;
	}

	public ArrayList listarCedulas() throws Exception {
		return dao.listarCedulas();
	}
	
	public ArrayList cargarProcesosElectorales() throws Exception {
		return dao.cargarProcesosElectorales();
	}

	public int publicarCedula(String codigo) throws Exception {
		return 0;
	}

}