package venp.dao.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import venp.beans.PerfilBean;
import venp.dao.entities.PerfilDAO;

public class MySqlPerfilDAO implements PerfilDAO {

	private Connection conn;

	public MySqlPerfilDAO(Connection c) {
		conn = c;
	}

	public void borrar(int codigo) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_perfil_delete(?)}");
		sp.setInt(1, codigo);
		
		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_perfil_delete(" + codigo + ") |||\n----------\n");
		
		rst.close();
		sp.close();
		conn.close();
	}

	public void editar(PerfilBean bean) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_perfil_edit(?, ?, ?)}");
		sp.setInt(1, bean.getCodigo());
		sp.setString(2, bean.getNombre());
		sp.setString(3, bean.getDescripcion());
		
		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_perfil_edit(" + bean.getCodigo() + ", " + bean.getNombre() + "," + bean.getDescripcion() + ") |||\n----------\n");
		
		rst.close();
		sp.close();
		conn.close();
	}

	public ArrayList findAll() throws Exception {
		ArrayList lista = new ArrayList();
		
		CallableStatement sp = conn.prepareCall("{call pa_perfil_findAll()}");    		
	    ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_perfil_findAll() |||\n----------\n");

		rst.beforeFirst();
		while (rst.next()) {
			PerfilBean bean = new PerfilBean();
			
			bean = fillBean(bean, rst);
			lista.add(bean);
		}
		
		rst.close();
		sp.close();
		conn.close();
		
		return lista;
	}
	
	public PerfilBean findByPrimaryKey(int codigo) throws Exception {
		PerfilBean bean = null;
		
		CallableStatement sp = conn.prepareCall("{call pa_perfil_findByPrimaryKey(?)}");
		sp.setInt(1, codigo);
	    ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_perfil_findByPrimaryKey(" + codigo + ") |||\n----------\n");

		rst.beforeFirst();
		
		if (rst.next()) {
			bean = new PerfilBean();
			bean = fillBean(bean, rst);	
		}
		
		rst.close();
		sp.close();
		conn.close();
		
		return bean;
	}
	
	public boolean findByName(String nombre) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_perfil_findByName(?, ?)}");
		sp.setString(1, nombre);
		sp.registerOutParameter(2, java.sql.Types.INTEGER);
		
	    ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_perfil_findByName(" + nombre + ") |||\n----------\n");

		int nroLocacion = sp.getInt(2);

		rst.close();
		sp.close();
		
		if (nroLocacion > 0)
			return true;
		
		return false;
	}
	
	public boolean findByName(String nombre, int codigo) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_perfil_findByName_ID(?, ?, ?)}");
		sp.setString(1, nombre);
		sp.setInt(2, codigo);
		sp.registerOutParameter(3, java.sql.Types.INTEGER);
		
	    ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_perfil_findByName_ID(" + nombre + ", " + codigo + ") |||\n----------\n");

		int nroLocacion = sp.getInt(3);

		rst.close();
		sp.close();
		
		if (nroLocacion > 0)
			return true;
		
		return false;
	}

	public void insertar(PerfilBean bean) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_perfil_insert(?, ?)}");
		sp.setString(1, bean.getNombre());
		sp.setString(2, bean.getDescripcion());
		
		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_perfil_insert(" + bean.getNombre() + "," + bean.getDescripcion() + ") |||\n----------\n");
		
		rst.close();
		sp.close();
		conn.close();
	}

	private PerfilBean fillBean(PerfilBean bean, ResultSet rst) {
		try {
			bean.setCodigo(Integer.parseInt(rst.getString("id")));
			bean.setNombre(rst.getString("nombre"));
			bean.setDescripcion(rst.getString("descripcion"));
			bean.setEstado(rst.getString("estado"));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bean;
	}

}