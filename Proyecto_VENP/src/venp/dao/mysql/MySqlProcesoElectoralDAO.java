package venp.dao.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import venp.beans.ProcesoElectoralBean;
import venp.dao.entities.ProcesoElectoralDAO;

public class MySqlProcesoElectoralDAO implements ProcesoElectoralDAO {
	private Connection conn;

	public MySqlProcesoElectoralDAO(Connection c) {
		conn = c;
	}

	public ProcesoElectoralBean findByPrimaryKey(int id) throws SQLException {
		ProcesoElectoralBean bean = null;

		CallableStatement sp = conn
				.prepareCall("{call pa_proceso_electoral_findByKey(?)}");
		sp.setInt(1, id);
		ResultSet rst = sp.executeQuery();
		System.out
				.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_proceso_electoral_findByPrimaryKey("
						+ id + ") |||\n----------\n");

		// Llenando El bean Proceso electoral
		rst.beforeFirst();
		if (rst.next()) {
			bean = new ProcesoElectoralBean();
			bean = fillData(bean, rst);
		}

		rst.close();
		sp.close();
		conn.close();
		System.out.println("bean: " + bean.getDescripcion());
		return bean;
	}

	public ArrayList findAll() throws Exception {
		ArrayList lista = new ArrayList();
		System.out.println("xxxxxxxxxxxxx");
		CallableStatement sp = conn
				.prepareCall("{call pa_proceso_electoral_select()}");
		ResultSet rst = sp.executeQuery();

		rst.beforeFirst();
		while (rst.next()) {
			ProcesoElectoralBean bean = new ProcesoElectoralBean();
			bean = fillData(bean, rst);
			lista.add(bean);
		}
		rst.close();
		sp.close();
		conn.close();

		return lista;
	}
	
	public ArrayList findAll_Creado() throws Exception {
		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_proceso_electoral_findAll_Creado() |||\n----------\n");
		
		ArrayList lista = new ArrayList();
		CallableStatement sp = conn.prepareCall("{call pa_proceso_electoral_findAll_Creado()}");
		ResultSet rst = sp.executeQuery();

		rst.beforeFirst();
		while (rst.next()) {
			ProcesoElectoralBean bean = new ProcesoElectoralBean();
			bean = fillData(bean, rst);
			lista.add(bean);
		}
		
		rst.close();
		sp.close();
		conn.close();

		return lista;
	}

	public void ActivarProcesoElectoral(int id) throws Exception {

		CallableStatement sp = conn
				.prepareCall("{call pa_proceso_electoral_activar(?)}");
		sp.setInt(1, id);

		ResultSet rst = sp.executeQuery();

		System.out
				.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_proceso_electoral_activar("
						+ id + ") |||\n----------\n");

		rst.close();
		sp.close();

		conn.close();
	}

	public ProcesoElectoralBean fillData(ProcesoElectoralBean bean,
			ResultSet rst) {
		try {
			bean.setCodigo(rst.getInt("id"));
			bean.setUsuario_id(rst.getString("usuario_id"));
			bean.setDescripcion(rst.getString("descripcion"));
			bean.setFecha_votacion(rst.getString("fecha_votacion"));
			bean.setFecha_padron_inicial(rst.getString("fecha_padron_inicial"));
			bean.setFecha_padron_final(rst.getString("fecha_padron_final"));
			bean.setTiempo_sesion(rst.getInt("tiempo_sesion"));
			bean.setEstado(rst.getString("estado"));
			bean.setStart_time(rst.getString("hora_inicial"));
			bean.setFinal_time(rst.getString("hora_final"));
			bean.setHora_inicial(rst.getString("h_i"));
			bean.setMinuto_inicial(rst.getString("m_i"));
			bean.setHora_final(rst.getString("h_f"));
			bean.setMinuto_final(rst.getString("m_f"));

		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	public void AnularProcesoElectoral(int id) throws Exception {
		CallableStatement sp = conn
				.prepareCall("{call pa_proceso_electoral_anular(?)}");
		sp.setInt(1, id);

		ResultSet rst = sp.executeQuery();

		System.out
				.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_proceso_electoral_anular("
						+ id + ") |||\n----------\n");

		rst.close();
		sp.close();

		conn.close();

	}

	public void editar(ProcesoElectoralBean bean) throws Exception {
		CallableStatement sp = conn
				.prepareCall("{call pa_proceso_electoral_editar(?, ?, ?, ?, ?, ?, ?, ?, ?)}");

		sp.setInt(1, bean.getCodigo());
		sp.setInt(2, Integer.parseInt(bean.getUsuario_id()));
		sp.setString(3, bean.getDescripcion());
		sp.setString(4, bean.getFecha_votacion());
		sp.setString(5, bean.getStart_time());
		sp.setString(6, bean.getFinal_time());
		sp.setString(7, bean.getFecha_padron_inicial());
		sp.setString(8, bean.getFecha_padron_final());
		sp.setInt(9, bean.getTiempo_sesion());

		ResultSet rst = sp.executeQuery();

		System.out
				.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_proceso_electoral_editar("
						+ bean.getDescripcion()
						+ ","
						+ bean.getFecha_votacion() + ") |||\n----------\n");

		rst.close();
		sp.close();
		conn.close();

	}

	public void insertar(ProcesoElectoralBean bean) throws Exception {

		CallableStatement sp = conn
				.prepareCall("{call pa_proceso_electoral_insertar(?, ?, ?, ?, ?, ?, ?, ?)}");

		sp.setInt(1, Integer.parseInt(bean.getUsuario_id()));
		sp.setString(2, bean.getDescripcion());
		sp.setString(3, bean.getFecha_votacion());
		sp.setString(4, bean.getStart_time());
		sp.setString(5, bean.getFinal_time());
		sp.setString(6, bean.getFecha_padron_inicial());
		sp.setString(7, bean.getFecha_padron_final());
		sp.setInt(8, bean.getTiempo_sesion());

		ResultSet rst = sp.executeQuery();

		System.out
				.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_proceso_electoral_insertar("
						+ bean.getDescripcion()
						+ ","
						+ bean.getFecha_votacion() + ") |||\n----------\n");

		rst.close();
		sp.close();
		conn.close();

	}

}