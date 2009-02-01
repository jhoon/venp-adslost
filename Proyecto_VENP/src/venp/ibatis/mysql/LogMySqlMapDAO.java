package venp.ibatis.mysql;

import java.util.HashMap;

import venp.dao.entities.LogDAO;

import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;

public class LogMySqlMapDAO extends SqlMapDaoTemplate implements LogDAO {

	public LogMySqlMapDAO(DaoManager daoManager) {
		super(daoManager);
	}

	public void insertarLog(String diccionario, String usuario)
			throws Exception {
		HashMap parameters = new HashMap();
		parameters.put("diccionario", diccionario);
		parameters.put("usuario", usuario);
		this.insert("Log.insertarLog", parameters);
	}

}
