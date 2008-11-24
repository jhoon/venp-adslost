package venp.services;

import java.util.ArrayList;

import venp.beans.CandidatoBean;
import venp.beans.PartidoPoliticoBean;
import venp.beans.PerfilBean;
import venp.dao.entities.CandidatoDAO;
import venp.dao.entities.PartidoPoliticoDAO;
import venp.dao.entities.PerfilDAO;
import venp.dao.factory.DAOFactory;

public class CandidatoService {

	private DAOFactory factory = DAOFactory.getFactory(DAOFactory.DB_MY_SQL);
	private CandidatoDAO dao;

	public CandidatoService() {
		dao = factory.getCandidatoDAO();
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
	
	public ArrayList findAll_conPP(int partidoPolitico_ID) throws Exception {
		try {
			ArrayList lista = dao.findAll_conPP(partidoPolitico_ID);

			return lista;
		} catch (Exception e) {
			e.printStackTrace();

			return null;
		}
	}
	
	public ArrayList findAll_sinPP(int partidoPolitico_ID) throws Exception {
		try {
			ArrayList lista = dao.findAll_sinPP(partidoPolitico_ID);

			return lista;
		} catch (Exception e) {
			e.printStackTrace();

			return null;
		}
	}
	
	public CandidatoBean findByPrimaryKey(int codigo) throws Exception {
		try {
			CandidatoBean bean = dao.findByPrimaryKey(codigo);

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
	
	public String insertar(CandidatoBean bean) throws Exception {
		try {
			String resultado = dao.insertar(bean);
			return resultado;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	public String editar(CandidatoBean bean) throws Exception {
		try {
			String resultado = dao.editar(bean);
			return resultado;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
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