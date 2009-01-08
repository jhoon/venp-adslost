package venp.services;

import java.util.ArrayList;
import com.ibatis.dao.client.DaoManager; 
import venp.beans.EscrutinioBean;
import venp.dao.entities.EscrutinioDAO;
import venp.dao.factory.DaoConfig;

public class EscrutinioService {
	
	
	DaoManager manager=DaoConfig.getDaoManager();
	
	public ArrayList listarLocacionesCerradas() throws Exception{
		  EscrutinioDAO escrutinodao =(EscrutinioDAO)manager.getDao(EscrutinioDAO.class);
		  return escrutinodao.listarLocacionesCerradas();
	} 
	
	public ArrayList listarDetalleEscrutinio(String strId) throws Exception{
		  EscrutinioDAO escrutiniodao = (EscrutinioDAO)manager.getDao(EscrutinioDAO.class);
		  return escrutiniodao.listarDetalleEscrutinio(strId);
	}
	
	public ArrayList listarDetalleLocacion(String strId) throws Exception {
		  EscrutinioDAO escrutiniodao = (EscrutinioDAO)manager.getDao(EscrutinioDAO.class);
		  return escrutiniodao.listarDetalleLocacion(strId);		
	}
	
	/*devuelve los votos totalizados por locacion*/
	public EscrutinioBean buscarTotales() throws Exception{
		  EscrutinioBean resultado = new EscrutinioBean();
		  EscrutinioDAO escrutinio = (EscrutinioDAO)manager.getDao(EscrutinioDAO.class);
		  resultado = escrutinio.buscarTotales(); 
	      return resultado;
	} 
}