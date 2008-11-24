package venp.services;

import java.util.ArrayList;

import venp.beans.PartidoPoliticoBean;
import venp.beans.PerfilBean;
import venp.dao.entities.PartidoPoliticoDAO;
import venp.dao.entities.PerfilDAO;
import venp.dao.factory.DAOFactory;

public class PartidoPoliticoService {

	private DAOFactory factory = DAOFactory.getFactory(DAOFactory.DB_MY_SQL);
	private PartidoPoliticoDAO dao;

	public PartidoPoliticoService() {
		dao = factory.getPartidoPoliticoDAO();
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
	
	public PartidoPoliticoBean findByPrimaryKey(int codigo) throws Exception {
		try {
			PartidoPoliticoBean bean = dao.findByPrimaryKey(codigo);

			return bean;
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
			String resultado = dao.insertar(bean);
			return resultado;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public String editar(PartidoPoliticoBean bean) throws Exception {
		try {
			String resultado = dao.editar(bean);
			return resultado;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
}