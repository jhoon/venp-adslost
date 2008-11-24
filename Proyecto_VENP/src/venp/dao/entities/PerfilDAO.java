package venp.dao.entities;

import java.util.ArrayList;

import venp.beans.PerfilBean;

public interface PerfilDAO {
	
	public void borrar(int codigo) throws Exception;

	public void editar(PerfilBean bean) throws Exception;
	
	public ArrayList findAll() throws Exception;
	
	public PerfilBean findByPrimaryKey(int codigo) throws Exception;
	
	public boolean findByName(String nombre) throws Exception;
	
	public boolean findByName(String nombre, int codigo) throws Exception;
	
	public void insertar(PerfilBean bean) throws Exception;

}