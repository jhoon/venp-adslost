package venp.services;

import java.util.ArrayList;

import com.ibatis.dao.client.DaoManager;

import venp.beans.PaisBean;
import venp.dao.entities.PaisDAO;
//import venp.dao.factory.DAOFactory;
import venp.dao.factory.DaoConfig;

public class PaisService {

	private DaoManager manager = DaoConfig.getDaoManager();
	private PaisDAO dao;

	public PaisService() {
		dao = (PaisDAO) manager.getDao(PaisDAO.class);
	}
	
	public void borrar(int codigo) throws Exception {
		try {
			dao.borrar(codigo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void editar(PaisBean bean) throws Exception {
		try {
			dao.editar(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
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

	public ArrayList findAllLocacion(int procesoElectoral) throws Exception {
		try {
			ArrayList lista = dao.findAllLocacion(procesoElectoral);

			return lista;
		} catch (Exception e) {
			e.printStackTrace();

			return null;
		}
	}

	public PaisBean findByPrimaryKey(int codigo) throws Exception {
		try {
			PaisBean bean = dao.findByPrimaryKey(codigo);

			return bean;
		} catch (Exception e) {
			e.printStackTrace();

			return null;
		}
	}

	public boolean findByName(String nombre) throws Exception {
		try {
			return dao.findByName(nombre);
		} catch (Exception e) {
			e.printStackTrace();

			return true;
		}
	}

	public boolean findByName(String nombre, int codigo) throws Exception {
		try {
			return dao.findByName(nombre, codigo);
		} catch (Exception e) {
			e.printStackTrace();

			return true;
		}
	}

	public boolean findByAbreviatura(String abreviatura) throws Exception {
		try {
			return dao.findByAbreviatura(abreviatura);
		} catch (Exception e) {
			e.printStackTrace();

			return true;
		}
	}

	public boolean findByAbreviatura(String abreviatura, int codigo) throws Exception {
		try {
			return dao.findByAbreviatura(abreviatura, codigo);
		} catch (Exception e) {
			e.printStackTrace();

			return true;
		}
	}
	
	public void insertar(PaisBean bean) throws Exception {
		try {
			dao.insertar(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}