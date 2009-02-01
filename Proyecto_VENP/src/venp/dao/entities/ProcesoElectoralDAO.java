package venp.dao.entities;

import java.util.ArrayList;

import venp.beans.ProcesoElectoralBean;

public interface ProcesoElectoralDAO {

	public ProcesoElectoralBean findByPrimaryKey(int id) throws Exception;

	public ArrayList findAll() throws Exception;

	public ArrayList findAllCreado() throws Exception;

	public void activarProcesoElectoral(int id) throws Exception;

	public void anularProcesoElectoral(int id) throws Exception;

	public void insertar(ProcesoElectoralBean bean) throws Exception;

	public void editar(ProcesoElectoralBean bean) throws Exception;

	public boolean estadoProceso() throws Exception;

	public boolean cierraProcesoElectoral() throws Exception;

}