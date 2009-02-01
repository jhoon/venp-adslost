package venp.dao.entities;

import java.util.ArrayList;

import venp.beans.EscrutinioBean;

public interface EscrutinioDAO  {
	
	 
	public ArrayList listarDetalleLocacion(String id) throws Exception;  
	public ArrayList listarDetalleEscrutinio(String id) throws Exception;  
	 
}
