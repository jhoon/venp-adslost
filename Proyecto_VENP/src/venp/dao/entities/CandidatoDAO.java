package venp.dao.entities;

import java.util.ArrayList;

import venp.beans.CandidatoBean;
import venp.beans.PartidoPoliticoBean;
import venp.beans.PerfilBean;

public interface CandidatoDAO {
	 
	public ArrayList findAll() throws Exception;
	
	public ArrayList findAll_conPP(int partidoPolitico_ID) throws Exception;
	public ArrayList findAll_sinPP(int partidoPolitico_ID) throws Exception;
	
	public CandidatoBean findByPrimaryKey(int codigo) throws Exception;
	public void borrar(int codigo) throws Exception;
	public String insertar(CandidatoBean bean) throws Exception;
	public String editar(CandidatoBean bean) throws Exception;
	
	public void asignar(int partidoPolitico, int candidato) throws Exception; 
	public void retirar(int partidoPolitico, int candidato) throws Exception;
	 
}