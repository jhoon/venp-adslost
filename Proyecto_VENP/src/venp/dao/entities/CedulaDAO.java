package venp.dao.entities;

import java.util.ArrayList;

import venp.beans.CedulaBean;

public interface CedulaDAO {
	
	public ArrayList listarCedulas() throws Exception;
	
	public ArrayList cargarProcesosElectorales() throws Exception;
	
	public CedulaBean cargarCedula(String codigo) throws Exception; 
	
	public int guardarCedula(CedulaBean cedula) throws Exception; 
	
	public int borrarCedula(String codigo) throws Exception; 
	
	public int publicarCedula(String codigo) throws Exception;

}
