package venp.dao.entities;

import java.util.ArrayList;

import venp.beans.PartidoPoliticoBean;

public interface PartidoPoliticoDAO {

	public ArrayList findAll() throws Exception;

	public PartidoPoliticoBean findByPrimaryKey(int codigo) throws Exception;

	public void borrar(int codigo) throws Exception;

	public String insertar(PartidoPoliticoBean bean) throws Exception;

	public String editar(PartidoPoliticoBean bean) throws Exception;
	
	public int totalCandidatosAsignados(int partidoPoliticoID) throws Exception;
	
}