package venp.services;

import java.util.ArrayList;

import venp.beans.ProcesoElectoralBean;
import venp.dao.entities.ProcesoElectoralDAO;
import venp.dao.factory.DAOFactory;
import venp.utils.Parametros;

public class ProcesoElectoralService {
	private DAOFactory objDAOFactory = DAOFactory.getFactory(Parametros.ORIGEN);
	private ProcesoElectoralDAO objProcesoElectoralDAO = objDAOFactory
			.getProcesoElectoralDAO();
	private ArrayList lista;

	public ProcesoElectoralBean findByPrimaryKey(int id) throws Exception {
		ProcesoElectoralBean bean = objProcesoElectoralDAO.findByPrimaryKey(id);
		return bean;
	}

	public ArrayList buscarTodos() throws Exception {
		lista = objProcesoElectoralDAO.findAll();
		return lista;
	}

	public void activarProcesoElectoral(int id) throws Exception {
		objProcesoElectoralDAO.ActivarProcesoElectoral(id);
	}

	public void anularProcesoElectoral(int id) throws Exception {
		objProcesoElectoralDAO.AnularProcesoElectoral(id);
	}

	public void insertar(ProcesoElectoralBean bean) throws Exception {
		objProcesoElectoralDAO.insertar(bean);
	}

	public void editar(ProcesoElectoralBean bean) throws Exception {
		objProcesoElectoralDAO.editar(bean);
	}
	
	public ArrayList findAll_Creado() throws Exception {
		lista = objProcesoElectoralDAO.findAll_Creado();
		return lista;
	}

}