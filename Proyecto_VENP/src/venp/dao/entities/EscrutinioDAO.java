package venp.dao.entities;

import java.util.ArrayList;

import venp.beans.EscrutinioBean;

public interface EscrutinioDAO  {
	
	public ArrayList listarLocacionesCerradas() throws Exception;	
	public EscrutinioBean locacionCerradaPais(String paisId) throws Exception;
	public ArrayList listarDetalleLocacion(String id) throws Exception;
	public ArrayList listarDetalleEscrutinio(String id) throws Exception;
	/*devuelve los votos totalizados por locacion*/
	public EscrutinioBean buscarTotales() throws Exception; 
}
