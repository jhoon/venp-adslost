package venp.dao.entities;

import java.util.ArrayList;

import venp.beans.LocacionBean;
/**
 * Patron DAO para Locación
 * @author MCristobal, Portoren
 *
 */
public interface LocacionDAO {
	
	// Metodos para PUESTA a CERO
	public ArrayList locacionesActivasPorUsuarioPuestaCero(int usuario) throws Exception;

	public LocacionBean locacionActivaPorUsuarioPuestaCero(int usuario, int locacion) throws Exception;

	public boolean puestaCero(int usuario, int locacion) throws Exception;

	// Metodos para CERRAR VOTACION
	public ArrayList locacionesPorUsuarioCerrarVotacion(int usuario) throws Exception;

	public LocacionBean locacionPorUsuarioCerrarVotacion(int usuario, int locacion) throws Exception;

	public boolean cerrarVotacion(int usuario, int locacion) throws Exception;

	// Metodos para MONITOREO DE TRANSACCIONES
	public ArrayList locacionesPorUsuarioMonitoreo(int usuario) throws Exception;

	// Metodos para ESCRUTION y CONSOLIDACION
	public ArrayList listarLocacionesCerradas() throws Exception;
	
	public boolean locacionesAbiertas() throws Exception;
}