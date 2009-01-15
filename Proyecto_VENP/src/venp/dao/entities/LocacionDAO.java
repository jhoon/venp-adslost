package venp.dao.entities;

import java.util.ArrayList;

import venp.beans.LocacionBean;
/**
 * Patron DAO para Puesta a cero y cierre de votación de locación
 * @author MCristobal
 *
 */
public interface LocacionDAO {
	
	// Metodos para PUESTA a CERO
	/**
	 * Metodo para puesta a cero
	 */
	public ArrayList locacionesActivasPorUsuarioPuestaCero(int usuario) throws Exception;
	/**
	 * Metodo para puesta a cero
	 */	
	public LocacionBean locacionActivaPorUsuarioPuestaCero(int usuario, int locacion) throws Exception;
	/**
	 * Metodo para puesta a cero
	 */
	public boolean puestaCero(int usuario, int locacion) throws Exception;

	// Metodos para CERRAR VOTACION
	
	/**
	 * Metodo para el cierre de votacion
	 */
	public ArrayList locacionesPorUsuarioCerrarVotacion(int usuario) throws Exception;
	/**
	 * Metodo para el cierre de votacion
	 */
	public LocacionBean locacionPorUsuarioCerrarVotacion(int usuario, int locacion) throws Exception;
	/**
	 * Metodo para el cierre de votacion
	 */
	public boolean cerrarVotacion(int usuario, int locacion) throws Exception;
	/**
	 * Metodo para el monitoreo
	 */
	public ArrayList locacionesPorUsuarioMonitoreo(int usuario) throws Exception;

}