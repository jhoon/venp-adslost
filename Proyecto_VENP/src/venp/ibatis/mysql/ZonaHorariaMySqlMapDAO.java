package venp.ibatis.mysql;

import java.util.ArrayList;

import venp.beans.ZonaHorariaBean;
import venp.dao.entities.ZonaHorariaDAO;

import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;

public class ZonaHorariaMySqlMapDAO extends SqlMapDaoTemplate implements
		ZonaHorariaDAO {

	public ZonaHorariaMySqlMapDAO(DaoManager daoManager) {
		super(daoManager);
	}

	public ArrayList findAll() throws Exception {
		return (ArrayList<ZonaHorariaBean>) queryForList("ZonaHoraria.findAll",
				null);
	}

}