package venp.ibatis.mysql;

import java.util.ArrayList;

import venp.beans.ConsolidacionBean;
import venp.dao.entities.ConsolidacionDAO;

import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;

public class ConsolidacionMySqlMapDAO extends SqlMapDaoTemplate implements
		ConsolidacionDAO {

	public ConsolidacionMySqlMapDAO(DaoManager daoManager) {
		super(daoManager);
	}

	private ArrayList obtenerResultados() {
		ArrayList lista = new ArrayList();
		lista = (ArrayList<ConsolidacionBean>) queryForList(
				"Consolidacion.listarResultados", null);
		return lista;
	}

	private ArrayList obtenerResultadosFinales() {
		ArrayList lista = new ArrayList();
		lista = (ArrayList<ConsolidacionBean>) queryForList(
				"Consolidacion.listarResultadosFinales", null);
		return lista;
	}

	public ArrayList listarResultados() throws Exception {
		ArrayList resultado = new ArrayList();
		resultado = obtenerResultados();
		return resultado;
	}

	public ArrayList listarResultadosFinales() throws Exception {
		ArrayList resultado = new ArrayList();
		resultado = obtenerResultadosFinales();
		return resultado;
	}
}