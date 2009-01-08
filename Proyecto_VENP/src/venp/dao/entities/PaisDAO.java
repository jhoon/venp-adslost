package venp.dao.entities;

import java.util.ArrayList;

import venp.beans.PaisBean;

public interface PaisDAO {
	
	public void borrar(int codigo) throws Exception;

	public void editar(PaisBean bean) throws Exception;
	
	public ArrayList findAll() throws Exception;
	
	public ArrayList findAllLocacion(int procesoElectoral) throws Exception;
	
	public PaisBean findByPrimaryKey(int codigo) throws Exception;
	
	public boolean findByName(String nombre) throws Exception;
	
	public boolean findByName(String nombre, int codigo) throws Exception;
	
	public boolean findByAbreviatura(String abreviatura) throws Exception;
	
	public boolean findByAbreviatura(String abreviatura, int codigo) throws Exception;
	
	public void insertar(PaisBean bean) throws Exception;

}