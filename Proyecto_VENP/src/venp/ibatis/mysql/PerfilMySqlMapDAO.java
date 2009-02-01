package venp.ibatis.mysql;

import java.util.ArrayList;
import java.util.HashMap;

import venp.beans.PerfilBean;
import venp.dao.entities.PerfilDAO;

import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;

public class PerfilMySqlMapDAO extends SqlMapDaoTemplate implements PerfilDAO {

	public PerfilMySqlMapDAO(DaoManager daoManager) {
		super(daoManager);
	}

	public void borrar(int codigo) throws Exception {
		this.update("Perfil.borrar", codigo);
	}

	public void editar(PerfilBean bean) throws Exception {
		HashMap map = new HashMap();

		map.put("codigo", bean.getCodigo());
		map.put("v_nombre", bean.getNombre());
		map.put("v_descripcion", bean.getDescripcion());

		this.update("Perfil.editar", map);
	}

	public ArrayList findAll() throws Exception {
		return (ArrayList<PerfilBean>) queryForList("Perfil.findAll", null);
	}

	public boolean findByName(String nombre) throws Exception {
		HashMap map = new HashMap();

		map.put("v_Nombre", nombre);
		map.put("v_Total", -1);

		this.update("Perfil.findByName", map);

		int nroLocacion = ((Integer) map.get("v_Total")).intValue();

		if (nroLocacion > 0)
			return true;

		return false;
	}

	public boolean findByName(String nombre, int codigo) throws Exception {
		HashMap map = new HashMap();

		map.put("v_Nombre", nombre);
		map.put("v_Codigo", codigo);
		map.put("v_Total", -1);

		this.update("Perfil.findByNameID", map);

		int nroLocacion = ((Integer) map.get("v_Total")).intValue();

		if (nroLocacion > 0)
			return true;

		return false;
	}

	public PerfilBean findByPrimaryKey(int codigo) throws Exception {
		return (PerfilBean) this.queryForObject("Perfil.findByPrimaryKey",
				codigo);
	}

	public void insertar(PerfilBean bean) throws Exception {
		HashMap map = new HashMap();

		map.put("v_nombre", bean.getNombre());
		map.put("v_descripcion", bean.getDescripcion());

		this.update("Perfil.insertar", map);
	}

}
