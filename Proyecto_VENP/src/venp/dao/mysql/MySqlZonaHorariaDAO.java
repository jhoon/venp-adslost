package venp.dao.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import venp.beans.ZonaHorariaBean;
import venp.dao.entities.ZonaHorariaDAO;

public class MySqlZonaHorariaDAO implements ZonaHorariaDAO {

	private Connection conn;

	public MySqlZonaHorariaDAO(Connection c) {
		conn = c;
	}

	public ArrayList findAll() throws Exception {
		ArrayList lista = new ArrayList();
		
		CallableStatement sp = conn.prepareCall("{call pa_zonahoraria_findAll()}");    		
	    ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_zonahoraria_findAll() |||\n----------\n");

		rst.beforeFirst();
		while (rst.next()) {
			ZonaHorariaBean bean = new ZonaHorariaBean();
			
			bean = fillBean(bean, rst);
			lista.add(bean);
		}
		
		rst.close();
		sp.close();
		conn.close();
		
		return lista;
	}

	private ZonaHorariaBean fillBean(ZonaHorariaBean bean, ResultSet rst) {
		try {
			bean.setCodigo(rst.getInt("id"));
			bean.setTiempo(rst.getDouble("tiempo"));
			bean.setNombre(rst.getString("nombre"));
			bean.setEstado(rst.getString("estado"));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bean;
	}

}