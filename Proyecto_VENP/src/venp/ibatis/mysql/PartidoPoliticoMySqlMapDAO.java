package venp.ibatis.mysql;

import java.util.ArrayList;
import java.util.HashMap;

import venp.beans.PartidoPoliticoBean;
import venp.dao.entities.PartidoPoliticoDAO;

import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;

public class PartidoPoliticoMySqlMapDAO extends SqlMapDaoTemplate implements
		PartidoPoliticoDAO {

	public PartidoPoliticoMySqlMapDAO(DaoManager daoManager) {
		super(daoManager);
	}

	public void borrar(int codigo) throws Exception {
		HashMap map = new HashMap();
		map.put("codigo", codigo);

		this.update("PartidoPolitico.borrar", map);
	}

	public String editar(PartidoPoliticoBean bean) throws Exception {
		HashMap map = new HashMap();
		map.put("codigo", bean.getCodigo());
		map.put("v_nombre", bean.getNombre());
		map.put("v_abreviatura", bean.getAbreviatura());
		map.put("v_logo", bean.getLogo());

		return (String) this.queryForObject("PartidoPolitico.editar", map);
	}

	public ArrayList findAll() throws Exception {
		return (ArrayList) this.queryForList("PartidoPolitico.findAll", null);
	}

	public PartidoPoliticoBean findByPrimaryKey(int codigo) throws Exception {
		HashMap map = new HashMap();
		map.put("codigo", codigo);

		return (PartidoPoliticoBean) this.queryForObject(
				"PartidoPolitico.findByPrimaryKey", map);
	}

	public String insertar(PartidoPoliticoBean bean) throws Exception {
		HashMap map = new HashMap();
		map.put("v_nombre", bean.getNombre());
		map.put("v_abreviatura", bean.getAbreviatura());
		map.put("v_logo", bean.getLogo());

		return (String) this.queryForObject("PartidoPolitico.insertar", map);
	}

	public int totalCandidatosAsignados(int partidoPoliticoID) throws Exception {
		int intResultado;

		try {
			intResultado = (Integer) this.queryForObject(
					"PartidoPolitico.candidatosAsignados", partidoPoliticoID);
		} catch (Exception e) {
			intResultado = 0;
		}

		return intResultado;
	}

}