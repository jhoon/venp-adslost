package venp.services;

import java.util.ArrayList;

import venp.beans.EscrutinioBean;
import venp.beans.LocacionBean;
import venp.beans.PerfilBean;
import venp.dao.entities.EscrutinioDAO;
import venp.dao.entities.LocacionDAO;
import venp.dao.factory.DAOFactory;

public class EscrutinioService {

	private DAOFactory factory = DAOFactory.getFactory(DAOFactory.DB_MY_SQL);
	private EscrutinioDAO dao;

	public EscrutinioService() {
		dao = factory.getEscrutinioDAO();
	}

	public ArrayList listarLocacionesCerradas() throws Exception {
		try {
			ArrayList lista = dao.listarLocacionesCerradas();

			return lista;
		} catch (Exception e) {
			e.printStackTrace();

			return null;
		}
	}
	
	public ArrayList listarDetalleLocacion(String id) throws Exception {
		try {
			ArrayList lista = dao.listarDetalleLocacion(id);

			return lista;
		} catch (Exception e) {
			e.printStackTrace();

			return null;
		}
	}

	public ArrayList listarDetalleEscrutinio(String id) throws Exception {
		try {
			ArrayList lista = dao.listarDetalleEscrutinio(id);

			return lista;
		} catch (Exception e) {
			e.printStackTrace();

			return null;
		}
	}
	
	public EscrutinioBean buscarTotales() throws Exception{
		try {
			EscrutinioBean bean = dao.buscarTotales();

			return bean;
		} catch (Exception e) {
			e.printStackTrace();

			return null;
		}
		
	}
}