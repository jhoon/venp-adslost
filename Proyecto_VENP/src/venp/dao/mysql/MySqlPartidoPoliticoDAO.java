package venp.dao.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import venp.beans.PartidoPoliticoBean;
import venp.beans.PerfilBean;
import venp.dao.entities.PartidoPoliticoDAO;

public class MySqlPartidoPoliticoDAO implements PartidoPoliticoDAO {

	private Connection conn;

	public MySqlPartidoPoliticoDAO(Connection c) {
		conn = c;
	}
	
	public ArrayList findAll() throws Exception {
		ArrayList lista = new ArrayList();
		
		CallableStatement sp = conn.prepareCall("{call pa_partidoPolitico_findAll()}");    		
	    ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_partidoPolitico_findAll() |||\n----------\n");

		rst.beforeFirst();
		while (rst.next()) {
			PartidoPoliticoBean bean = new PartidoPoliticoBean();
			
			bean = fillBean(bean, rst);
			lista.add(bean);
		}
		
		rst.close();
		sp.close();
		conn.close();
		
		return lista;
	}
	
	

	public PartidoPoliticoBean findByPrimaryKey(int codigo) throws Exception {
		PartidoPoliticoBean bean = null;
		
		CallableStatement sp = conn.prepareCall("{call pa_partidoPolitico_findByPrimaryKey(?)}");
		sp.setInt(1, codigo);
	    ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_partidoPolitico_findByPrimaryKey(" + codigo + ") |||\n----------\n");

		rst.beforeFirst();
		
		if (rst.next()) {
			bean = new PartidoPoliticoBean();
			bean = fillBean(bean, rst);	
		}
		
		rst.close();
		sp.close();
		conn.close();
				
		return bean;
	}
	
	public void borrar(int codigo) throws Exception {
		ArrayList lista = new ArrayList();
		 
		CallableStatement sp = conn.prepareCall("{call pa_partidoPolitico_delete(?)}");
		sp.setInt(1, codigo);
		
		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_partidoPolitico_delete(" + codigo + ") |||\n----------\n");
		
		rst.close();
		sp.close();
		conn.close();
	}
	
	public String insertar(PartidoPoliticoBean bean) throws Exception {
		ArrayList lista = new ArrayList();
		String resultado = null;
		
		CallableStatement sp = conn.prepareCall("{call pa_partidoPolitico_insert(?,?,?)}");
		sp.setString(1, bean.getNombre());
		sp.setString(2, bean.getAbreviatura());
		sp.setString(3, bean.getLogo());
		
		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_partidoPolitico_insert(" + bean.getNombre() + "," + bean.getAbreviatura() + ","+ bean.getLogo()+") |||\n----------\n");
		
		rst.beforeFirst();
		
		if (rst.next()) {
			resultado= rst.getString("nombre");
		
		}
		
		rst.close();
		sp.close();
		conn.close();
		return resultado;
		
	}
	
	public String editar(PartidoPoliticoBean bean) throws Exception {
		ArrayList lista = new ArrayList();
		String resultado = null;
		
		CallableStatement sp = conn.prepareCall("{call pa_partidoPolitico_edit(?, ?, ?, ?)}");
		sp.setInt(1, bean.getCodigo());
		sp.setString(2, bean.getNombre());
		sp.setString(3, bean.getAbreviatura());
		sp.setString(4, bean.getLogo());
		
		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_partidoPolitico_edit(" + bean.getCodigo() + ", " + bean.getNombre() + "," + bean.getAbreviatura() + "," + bean.getLogo() +") |||\n----------\n");
		
		 rst.beforeFirst();
			
			if (rst.next()) {
				resultado= rst.getString("nombr");
			
			}
			
		rst.close();
		sp.close();
		conn.close();
		
		return resultado;
	}
	
	
	private PartidoPoliticoBean fillBean(PartidoPoliticoBean bean, ResultSet rst) {
		try {
			bean.setCodigo(Integer.parseInt(rst.getString("id")));
			bean.setNombre(rst.getString("nombre"));
			bean.setAbreviatura(rst.getString("abreviatura"));
			bean.setLogo(rst.getString("logo"));
			bean.setEstado(rst.getString("estado"));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bean;
	}

	 
	
}