package venp.services;

import java.util.ArrayList;

import venp.beans.CentroVotacionBean;
import venp.dao.entities.CentroVotacionDAO;
import venp.dao.factory.DAOFactory;

public class CentroVotacionService {

	private DAOFactory factory = DAOFactory.getFactory(DAOFactory.DB_MY_SQL);
	private CentroVotacionDAO dao;

	public CentroVotacionService() {
		dao = factory.getCentroVotacionDAO();
	}
	
	public void borrar(int codigo) throws Exception {
		try {
			dao.borrar(codigo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void editar(CentroVotacionBean bean) throws Exception {
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

	public ArrayList findAll_conLocacion(int procesoElectoral, int codigoPais) throws Exception {
		try {
			ArrayList lista = dao.findAll_conLocacion(procesoElectoral, codigoPais);

			return lista;
		} catch (Exception e) {
			e.printStackTrace();

			return null;
		}
	}

	public ArrayList findAll_sinLocacion(int procesoElectoral, int codigoPais) throws Exception {
		try {
			ArrayList lista = dao.findAll_sinLocacion(procesoElectoral, codigoPais);

			return lista;
		} catch (Exception e) {
			e.printStackTrace();

			return null;
		}
	}

	public ArrayList findAll_conUsuario(int procesoElectoral, int codigoUser, int codigoPais) throws Exception {
		try {
			ArrayList lista = dao.findAll_conUsuario(procesoElectoral, codigoUser, codigoPais);

			return lista;
		} catch (Exception e) {
			e.printStackTrace();

			return null;
		}
	}

	public ArrayList findAll_sinUsuario(int procesoElectoral, int codigoUser, int codigoPais) throws Exception {
		try {
			ArrayList lista = dao.findAll_sinUsuario(procesoElectoral, codigoUser, codigoPais);

			return lista;
		} catch (Exception e) {
			e.printStackTrace();

			return null;
		}
	}

	public CentroVotacionBean findByPrimaryKey(int codigo) throws Exception {
		try {
			CentroVotacionBean bean = dao.findByPrimaryKey(codigo);

			return bean;
		} catch (Exception e) {
			e.printStackTrace();

			return null;
		}
	}

	public boolean findByName(String nombre, int codigoPais) throws Exception {
		try {
			return dao.findByName(nombre, codigoPais);
		} catch (Exception e) {
			e.printStackTrace();

			return true;
		}
	}

	public boolean findByName(String nombre, int codigoPais, int codigo) throws Exception {
		try {
			return dao.findByName(nombre, codigoPais, codigo);
		} catch (Exception e) {
			e.printStackTrace();

			return true;
		}
	}
	
	public void insertar(CentroVotacionBean bean) throws Exception {
		try {
			dao.insertar(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void asignar(int procesoElectoral, int centroVotacion) throws Exception {
		try {
			dao.asignar(procesoElectoral, centroVotacion);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void retirar(int procesoElectoral, int centroVotacion) throws Exception {
		try {
			dao.retirar(procesoElectoral, centroVotacion);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}