package venp.dao.entities;

import java.util.ArrayList;

import venp.beans.EscrutinioBean;
import venp.web.forms.ElectorForm;

public interface EscrutinioDAO  {
	
	public ArrayList listarLocacionesCerradas() throws Exception;
	
	public ArrayList listarDetalleLocacion(String id) throws Exception;
	
	public ArrayList listarDetalleEscrutinio(String id) throws Exception;
	
	public EscrutinioBean buscarTotales() throws Exception; 
}
