package venp.services;

import java.util.ArrayList;

import venp.dao.entities.EscrutinioDAO;
import venp.dao.factory.DaoConfig;

import com.ibatis.dao.client.DaoManager;

public class EscrutinioService {
	
	
	DaoManager manager=DaoConfig.getDaoManager();
	 
	public ArrayList listarDetalleEscrutinio(String strId) throws Exception{
		  EscrutinioDAO escrutiniodao = (EscrutinioDAO)manager.getDao(EscrutinioDAO.class);
		  return escrutiniodao.listarDetalleEscrutinio(strId);
	}
	
	public ArrayList listarDetalleLocacion(String strId) throws Exception {
		  EscrutinioDAO escrutiniodao = (EscrutinioDAO)manager.getDao(EscrutinioDAO.class);
		  return escrutiniodao.listarDetalleLocacion(strId);		
	}
	 
}