package venp.dao.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import venp.beans.PaisBean;
import venp.dao.entities.PaisDAO;

public class MySqlPaisDAO implements PaisDAO {

	private Connection conn;

	public MySqlPaisDAO(Connection c) {
		conn = c;
	}

	public void borrar(int codigo) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_pais_delete(?)}");
		sp.setInt(1, codigo);
		
		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_pais_delete(" + codigo + ") |||\n----------\n");
		
		rst.close();
		sp.close();
		conn.close();
	}

	public void editar(PaisBean bean) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_pais_edit(?, ?, ?)}");
		sp.setInt(1, bean.getCodigo());
		sp.setString(2, bean.getNombre());
		sp.setString(3, bean.getAbreviatura());
		
		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_pais_edit(" + bean.getCodigo() + ", " + bean.getNombre() + "," + bean.getAbreviatura() + ") |||\n----------\n");
		
		rst.close();
		sp.close();
		conn.close();
	}

	public ArrayList findAll() throws Exception {
		ArrayList lista = new ArrayList();
		
		CallableStatement sp = conn.prepareCall("{call pa_pais_findAll()}");    		
	    ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_pais_findAll() |||\n----------\n");

		rst.beforeFirst();
		while (rst.next()) {
			PaisBean bean = new PaisBean();
			
			bean = fillBean(bean, rst);
			lista.add(bean);
		}
		
		rst.close();
		sp.close();
		conn.close();
		
		return lista;
	}
	
	public ArrayList findAll_Locacion(int procesoElectoral) throws Exception {
		ArrayList lista = new ArrayList();
		
		CallableStatement sp = conn.prepareCall("{call pa_pais_findAll_Locacion(?)}");
		sp.setInt(1, procesoElectoral);
		
	    ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_pais_findAll_Locacion(" + procesoElectoral + ") |||\n----------\n");

		rst.beforeFirst();
		while (rst.next()) {
			PaisBean bean = new PaisBean();
			
			bean = fillBean(bean, rst);
			lista.add(bean);
		}
		
		rst.close();
		sp.close();
		conn.close();
		
		return lista;
	}
	
	public PaisBean findByPrimaryKey(int codigo) throws Exception {
		PaisBean bean = null;
		
		CallableStatement sp = conn.prepareCall("{call pa_pais_findByPrimaryKey(?)}");
		sp.setInt(1, codigo);
	    ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_pais_findByPrimaryKey(" + codigo + ") |||\n----------\n");

		rst.beforeFirst();
		
		if (rst.next()) {
			bean = new PaisBean();
			bean = fillBean(bean, rst);	
		}
		
		rst.close();
		sp.close();
		conn.close();
		
		return bean;
	}
	
	public boolean findByName(String nombre) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_pais_findByName(?, ?)}");
		sp.setString(1, nombre);
		sp.registerOutParameter(2, java.sql.Types.INTEGER);
		
	    ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_pais_findByName(" + nombre + ") |||\n----------\n");

		int nroLocacion = sp.getInt(2);

		rst.close();
		sp.close();
		
		if (nroLocacion > 0)
			return true;
		
		return false;
	}
	
	public boolean findByName(String nombre, int codigo) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_pais_findByName_ID(?, ?, ?)}");
		sp.setString(1, nombre);
		sp.setInt(2, codigo);
		sp.registerOutParameter(3, java.sql.Types.INTEGER);
		
	    ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_pais_findByName_ID(" + nombre + ", " + codigo + ") |||\n----------\n");

		int nroLocacion = sp.getInt(3);

		rst.close();
		sp.close();
		
		if (nroLocacion > 0)
			return true;
		
		return false;
	}
	
	public boolean findByAbreviatura(String abreviatura) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_pais_findByAbreviatura(?, ?)}");
		sp.setString(1, abreviatura);
		sp.registerOutParameter(2, java.sql.Types.INTEGER);
		
	    ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_pais_findByAbreviatura(" + abreviatura + ") |||\n----------\n");

		int nroLocacion = sp.getInt(2);

		rst.close();
		sp.close();
		
		if (nroLocacion > 0)
			return true;
		
		return false;
	}
	
	public boolean findByAbreviatura(String abreviatura, int codigo) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_pais_findByAbreviatura_ID(?, ?, ?)}");
		sp.setString(1, abreviatura);
		sp.setInt(2, codigo);
		sp.registerOutParameter(3, java.sql.Types.INTEGER);
		
	    ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_pais_findByAbreviatura_ID(" + abreviatura + ", " + codigo + ") |||\n----------\n");

		int nroLocacion = sp.getInt(3);

		rst.close();
		sp.close();
		
		if (nroLocacion > 0)
			return true;
		
		return false;
	}

	public void insertar(PaisBean bean) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_pais_insert(?, ?)}");
		sp.setString(1, bean.getNombre());
		sp.setString(2, bean.getAbreviatura());
		
		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_pais_insert(" + bean.getNombre() + "," + bean.getAbreviatura() + ") |||\n----------\n");
		
		rst.close();
		sp.close();
		conn.close();
	}

	private PaisBean fillBean(PaisBean bean, ResultSet rst) {
		try {
			bean.setCodigo(Integer.parseInt(rst.getString("id")));
			bean.setNombre(rst.getString("nombre"));
			bean.setAbreviatura(rst.getString("abreviatura"));
			bean.setEstado(rst.getString("estado"));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bean;
	}

}