package venp.ibatis.mysql;

import java.util.ArrayList;

import venp.beans.CedulaBean;
import venp.dao.entities.CedulaDAO;

import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;

public class CedulaMySqlMapDAO extends SqlMapDaoTemplate implements CedulaDAO {

	public CedulaMySqlMapDAO(DaoManager daoManager) {
		super(daoManager);
	}

	public int borrarCedula(String codigo) throws Exception {
		return 0;
	}

	public CedulaBean cargarCedula(String codigo) throws Exception {
		return null;
	}

	public int guardarCedula(CedulaBean cedula) throws Exception {
		return 0;
	}

	public ArrayList listarCedulas() throws Exception {
		return (ArrayList) this.queryForList("Cedula.listarCedulas", null);
	}

	public ArrayList cargarProcesosElectorales() throws Exception {
		return (ArrayList) this.queryForList(
				"Cedula.cargarProcesosElectorales", null);
	}

	public int publicarCedula(String codigo) throws Exception {
		return 0;
	}

}
