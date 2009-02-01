package venp.ibatis.mysql;

import java.util.ArrayList;
import java.util.HashMap;

import venp.beans.PaisBean;
import venp.dao.entities.PaisDAO;

import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;

public class PaisMySqlMapDAO extends SqlMapDaoTemplate implements PaisDAO {

	public PaisMySqlMapDAO(DaoManager daoManager) {
		super(daoManager);
	}

	public void borrar(int codigo) throws Exception {
		this.update("Pais.borrar", codigo);
	}

	public void editar(PaisBean bean) throws Exception {
		HashMap map = new HashMap();

		map.put("v_codigo", bean.getCodigo());
		map.put("v_nombre", bean.getNombre());
		map.put("v_abreviatura", bean.getAbreviatura());

		this.update("Pais.editar", map);
	}

	public ArrayList findAll() throws Exception {
		return (ArrayList<PaisBean>) queryForList("Pais.findAll", null);
	}

	public ArrayList findAllLocacion(int procesoElectoral) throws Exception {
		return (ArrayList<PaisBean>) queryForList("Pais.findAll_Locacion",
				procesoElectoral);
	}

	public boolean findByAbreviatura(String abreviatura) throws Exception {
		HashMap map = new HashMap();

		map.put("v_abreviatura", abreviatura);
		map.put("v_Total", -1);

		this.update("Pais.findByAbreviatura", map);

		int intNroLocacion = ((Integer) map.get("v_Total")).intValue();

		if (intNroLocacion > 0)
			return true;

		return false;
	}

	public boolean findByAbreviatura(String abreviatura, int codigo)
			throws Exception {
		HashMap map = new HashMap();

		map.put("v_abreviatura", abreviatura);
		map.put("v_Codigo", codigo);
		map.put("v_Total", -1);

		this.update("Pais.findByAbreviaturaID", map);

		int intNroLocacion = ((Integer) map.get("v_Total")).intValue();

		if (intNroLocacion > 0)
			return true;

		return false;
	}

	public boolean findByName(String nombre) throws Exception {
		HashMap map = new HashMap();

		map.put("v_Nombre", nombre);
		map.put("v_Total", -1);

		this.update("Pais.findByName", map);

		int intNroLocacion = ((Integer) map.get("v_Total")).intValue();

		if (intNroLocacion > 0)
			return true;

		return false;
	}

	public boolean findByName(String nombre, int codigo) throws Exception {
		HashMap map = new HashMap();

		map.put("v_Nombre", nombre);
		map.put("v_Codigo", codigo);
		map.put("v_Total", -1);

		this.update("Pais.findByNameID", map);

		int intNroLocacion = ((Integer) map.get("v_Total")).intValue();

		if (intNroLocacion > 0)
			return true;

		return false;
	}

	public PaisBean findByPrimaryKey(int codigo) throws Exception {
		return (PaisBean) this.queryForObject("Pais.findByPrimaryKey", codigo);
	}

	public void insertar(PaisBean bean) throws Exception {
		HashMap map = new HashMap();

		map.put("v_nombre", bean.getNombre());
		map.put("v_abreviatura", bean.getAbreviatura());

		this.update("Pais.insertar", map);
	}

}