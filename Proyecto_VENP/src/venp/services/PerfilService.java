package venp.services;

import java.util.ArrayList;

import venp.beans.PerfilBean;
import venp.dao.entities.PerfilDAO;
import venp.dao.factory.DaoConfig;

import com.ibatis.dao.client.DaoManager;

public class PerfilService {

	private DaoManager manager = DaoConfig.getDaoManager();
	private PerfilDAO dao;

	public PerfilService() {
		dao = (PerfilDAO) manager.getDao(PerfilDAO.class);
	}
	
	public void borrar(int codigo) throws Exception {
		try {
			dao.borrar(codigo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void editar(PerfilBean bean) throws Exception {
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

	public PerfilBean findByPrimaryKey(int codigo) throws Exception {
		try {
			PerfilBean bean = dao.findByPrimaryKey(codigo);

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
	
	public void insertar(PerfilBean bean) throws Exception {
		try {
			dao.insertar(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}