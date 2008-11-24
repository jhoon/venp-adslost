package venp.dao.entities;

import java.util.ArrayList;

import venp.beans.LocacionBean;

public interface LocacionDAO {
	
	// Metodos para PUESTA a CERO
	public ArrayList locaciones_Activas_Por_Usuario_PuestaCero(int usuario) throws Exception;
	
	public LocacionBean locacion_Activa_Por_Usuario_PuestaCero(int usuario, int locacion) throws Exception;
	
	public boolean puesta_Cero(int usuario, int locacion) throws Exception;

	// Metodos para CERRAR VOTACION
	public ArrayList locaciones_Por_Usuario_CerrarVotacion(int usuario) throws Exception;
	
	public LocacionBean locacion_Por_Usuario_CerrarVotacion(int usuario, int locacion) throws Exception;
	
	public boolean cerrar_Votacion(int usuario, int locacion) throws Exception;
	
	public ArrayList locaciones_Por_Usuario_Monitoreo(int usuario) throws Exception;

}