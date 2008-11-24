package venp.dao.entities;

import venp.beans.UsuarioBean;

public interface LogDAO {

	public void insertarLog(String diccionario , String usuario) throws Exception;

}