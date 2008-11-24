package venp.dao.entities;

import java.util.ArrayList;

import venp.beans.ProcesoElectoralBean;

public interface ProcesoElectoralDAO {

	public ProcesoElectoralBean findByPrimaryKey(int id) throws Exception;

	public ArrayList findAll() throws Exception;
	
	public ArrayList findAll_Creado() throws Exception;

	public void ActivarProcesoElectoral(int id) throws Exception;
	
	public void AnularProcesoElectoral(int id) throws Exception;
	
	public void insertar(ProcesoElectoralBean bean) throws Exception;
	
	public void editar(ProcesoElectoralBean bean) throws Exception;
	
}