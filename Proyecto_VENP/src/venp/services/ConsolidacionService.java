package venp.services;

import java.util.ArrayList;
import com.ibatis.dao.client.DaoManager; 
import venp.dao.entities.ConsolidacionDAO; 
import venp.dao.factory.DaoConfig;
public class ConsolidacionService {

	DaoManager manager=DaoConfig.getDaoManager();
	
	public ArrayList listarResultados() throws Exception {
		ConsolidacionDAO consolidaciondao = (ConsolidacionDAO)manager.getDao(ConsolidacionDAO.class);
		return consolidaciondao.listarResultados();		
	}
	
	public boolean procesoCerrado() throws Exception {
		
		ConsolidacionDAO consolidaciondao = (ConsolidacionDAO)manager.getDao(ConsolidacionDAO.class);
		return consolidaciondao.procesoCerrado();

	}	
}