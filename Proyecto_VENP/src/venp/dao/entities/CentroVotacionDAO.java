package venp.dao.entities;

import java.util.ArrayList;

import venp.beans.CentroVotacionBean;

public interface CentroVotacionDAO {
	
	public void borrar(int codigo) throws Exception;

	public void editar(CentroVotacionBean bean) throws Exception;
	
	public ArrayList findAll() throws Exception;
	
	public ArrayList findAllConLocacion(int procesoElectoral, int codigoPais) throws Exception;
	
	public ArrayList findAllSinLocacion(int procesoElectoral, int codigoPais) throws Exception;
	
	public ArrayList findAllConUsuario(int procesoElectoral, int codigoUser, int codigoPais) throws Exception;
	
	public ArrayList findAllSinUsuario(int procesoElectoral, int codigoUser, int codigoPais) throws Exception;
	
	public CentroVotacionBean findByPrimaryKey(int codigo) throws Exception;
	
	public boolean findByName(String nombre, int codigoPais) throws Exception;
	
	public boolean findByName(String nombre, int codigoPais, int codigo) throws Exception;
	
	public void insertar(CentroVotacionBean bean) throws Exception;
	
	public void asignar(int procesoElectoral, int centroVotacion) throws Exception;
	
	public void retirar(int procesoElectoral, int centroVotacion) throws Exception;

}