package venp.services;

import java.util.ArrayList;

import venp.dao.entities.ConsolidacionDAO;
import venp.dao.factory.DaoConfig;

import com.ibatis.dao.client.DaoManager;


public class ConsolidacionService {

	DaoManager manager = DaoConfig.getDaoManager();

	public ArrayList listarResultados() throws Exception {
		ConsolidacionDAO consolidaciondao = (ConsolidacionDAO) manager
				.getDao(ConsolidacionDAO.class);
		return consolidaciondao.listarResultados();
	}

	public ArrayList listarResultadosFinales() throws Exception {
		ConsolidacionDAO consolidaciondao = (ConsolidacionDAO) manager
				.getDao(ConsolidacionDAO.class);
		return consolidaciondao.listarResultadosFinales();
	}

}