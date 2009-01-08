package venp.dao.entities;

import java.util.ArrayList;

import venp.beans.UsuarioBean;

public interface UsuarioDAO {

	public UsuarioBean findByUsuario(String usuario) throws Exception;
	
	public void borrar(String codigo) throws Exception;

	public void editar(UsuarioBean bean) throws Exception;
	
	public ArrayList findAll() throws Exception;
	
	public ArrayList findAllByLocacion() throws Exception;
	
	public UsuarioBean findByPrimaryKey(String codigo) throws Exception;
	
	public boolean findByDNI(String dni) throws Exception;
	
	public boolean findByDNI(String dni, String codigo) throws Exception;
	
	public boolean findByUserName(String userName) throws Exception;
	
	public boolean findByUserName(String userName, String codigo) throws Exception;
	
	public void insertar(UsuarioBean bean) throws Exception;
	
	public void asignar(int procesoElectoral, int codigoUsuario, int centroVotacion) throws Exception;
	
	public void retirar(int procesoElectoral, int codigoUsuario, int centroVotacion) throws Exception;

}