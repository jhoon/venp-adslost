package venp.services;

import java.util.ArrayList;

import venp.beans.ProcesoElectoralBean;
import venp.dao.entities.ProcesoElectoralDAO;
import venp.dao.factory.DaoConfig;

import com.ibatis.dao.client.DaoManager;

public class ProcesoElectoralService {

	private DaoManager manager = DaoConfig.getDaoManager();
	private ProcesoElectoralDAO dao;

	public ProcesoElectoralService() {
		dao = (ProcesoElectoralDAO) manager.getDao(ProcesoElectoralDAO.class);
	}

	public ProcesoElectoralBean findByPrimaryKey(int id) throws Exception {
		return dao.findByPrimaryKey(id);
	}

	public ArrayList buscarTodos() throws Exception {
		return dao.findAll();
	}

	public void activarProcesoElectoral(int id) throws Exception {
		dao.activarProcesoElectoral(id);
	}

	public void anularProcesoElectoral(int id) throws Exception {
		dao.anularProcesoElectoral(id);
	}

	public void insertar(ProcesoElectoralBean bean) throws Exception {
		dao.insertar(bean);
	}

	public void editar(ProcesoElectoralBean bean) throws Exception {
		dao.editar(bean);
	}

	public ArrayList findAllCreado() throws Exception {
		return dao.findAllCreado();
	}

	/**
	 * Para conocer el estado del procesoElectoral
	 */
	public boolean estadoProceso() throws Exception {
		return dao.estadoProceso();
	}

	public boolean cierraProcesoElectoral() throws Exception {
		return dao.cierraProcesoElectoral();
	}

}