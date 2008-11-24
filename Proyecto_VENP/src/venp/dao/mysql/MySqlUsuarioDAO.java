package venp.dao.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import venp.beans.PerfilBean;
import venp.beans.UsuarioBean;
import venp.dao.entities.UsuarioDAO;

public class MySqlUsuarioDAO implements UsuarioDAO {

	private Connection conn;

	public MySqlUsuarioDAO(Connection c) {
		conn = c;
	}

	public UsuarioBean findByUsuario(String usuario) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_usuario_findByUser (?)}");
		sp.setString(1, usuario);
		 
		ResultSet rst = sp.executeQuery();
		
		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_usuario_findByUser(" + usuario + ") |||\n----------\n");
		
		rst.beforeFirst();

		UsuarioBean bean = null;
		
		while (rst.next()) {
			bean = new UsuarioBean();
			bean = fillBean(bean, rst);
		}		
		
		rst.close();
		sp.close();
		conn.close();
		
		return bean;
	}

	public void borrar(String codigo) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_usuario_delete(?)}");
		sp.setInt(1, Integer.parseInt(codigo));
		
		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_usuario_delete(" + codigo + ") |||\n----------\n");
		
		rst.close();
		sp.close();
		conn.close();
	}

	public void editar(UsuarioBean bean) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_usuario_edit(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
		PerfilBean perfilBean = bean.getPerfil();
		
		sp.setInt(1, Integer.parseInt(bean.getCodigo()));
		sp.setInt(2, perfilBean.getCodigo());
		sp.setString(3, bean.getNombre());
		sp.setString(4, bean.getApePaterno());
		sp.setString(5, bean.getApeMaterno());
		sp.setString(6, bean.getDni());
		sp.setString(7, bean.getEmail());
		sp.setString(8, bean.getMovil());
		sp.setString(9, bean.getUserName());
		sp.setString(10, bean.getPassword());
		
		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_usuario_edit(" + bean.getCodigo() + ", " + perfilBean.getCodigo() + "," + bean.getNombre() + "," + bean.getApePaterno() + "," + bean.getApeMaterno() + "," + bean.getDni() + "," + bean.getEmail() + "," + bean.getMovil() + "," + bean.getUserName() + "," + bean.getPassword() + ") |||\n----------\n");
		
		rst.close();
		sp.close();
		conn.close();
	}

	public ArrayList findAll() throws Exception {
		ArrayList lista = new ArrayList();
		
		CallableStatement sp = conn.prepareCall("{call pa_usuario_findAll()}");    		
	    ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_pais_findAll() |||\n----------\n");

		rst.beforeFirst();
		while (rst.next()) {
			UsuarioBean bean = new UsuarioBean();
			
			bean = fillBean(bean, rst);
			lista.add(bean);
		}
		
		rst.close();
		sp.close();
		conn.close();
		
		return lista;
	}
	
	public ArrayList findAll_Locacion() throws Exception {
		ArrayList lista = new ArrayList();
		
		CallableStatement sp = conn.prepareCall("{call pa_usuario_findAll_Locacion()}");    		
	    ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_usuario_findAll_Locacion() |||\n----------\n");

		rst.beforeFirst();
		while (rst.next()) {
			UsuarioBean bean = new UsuarioBean();
			
			bean = fillBean(bean, rst);
			lista.add(bean);
		}
		
		rst.close();
		sp.close();
		conn.close();
		
		return lista;
	}

	public UsuarioBean findByPrimaryKey(String codigo) throws Exception {
		UsuarioBean bean = null;
		
		CallableStatement sp = conn.prepareCall("{call pa_usuario_findByPrimaryKey(?)}");
		sp.setInt(1, Integer.parseInt(codigo));
	    ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_usuario_findByPrimaryKey(" + codigo + ") |||\n----------\n");

		rst.beforeFirst();
		
		if (rst.next()) {
			bean = new UsuarioBean();
			bean = fillBean(bean, rst);	
		}
		
		rst.close();
		sp.close();
		conn.close();
		
		return bean;
	}

	public boolean findByDNI(String dni) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_usuario_findByDNI(?, ?)}");
		sp.setString(1, dni);
		sp.registerOutParameter(2, java.sql.Types.INTEGER);
		
	    ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_usuario_findByDNI(" + dni + ") |||\n----------\n");

		int nroLocacion = sp.getInt(2);

		rst.close();
		sp.close();
		
		if (nroLocacion > 0)
			return true;
		
		return false;
	}

	public boolean findByDNI(String dni, String codigo) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_usuario_findByDNI_ID(?, ?, ?)}");
		sp.setString(1, dni);
		sp.setInt(2, Integer.parseInt(codigo));
		sp.registerOutParameter(3, java.sql.Types.INTEGER);
		
	    ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_usuario_findByDNI_ID(" + dni + ", " + codigo + ") |||\n----------\n");

		int nroLocacion = sp.getInt(3);

		rst.close();
		sp.close();
		
		if (nroLocacion > 0)
			return true;
		
		return false;
	}

	public boolean findByUserName(String userName) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_usuario_findByUserName(?, ?)}");
		sp.setString(1, userName);
		sp.registerOutParameter(2, java.sql.Types.INTEGER);
		
	    ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_usuario_findByUserName(" + userName + ") |||\n----------\n");

		int nroLocacion = sp.getInt(2);

		rst.close();
		sp.close();
		
		if (nroLocacion > 0)
			return true;
		
		return false;
	}

	public boolean findByUserName(String userName, String codigo) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_usuario_findByUserName_ID(?, ?, ?)}");
		sp.setString(1, userName);
		sp.setInt(2, Integer.parseInt(codigo));
		sp.registerOutParameter(3, java.sql.Types.INTEGER);
		
	    ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_usuario_findByUserName_ID(" + userName + ", " + codigo + ") |||\n----------\n");

		int nroLocacion = sp.getInt(3);

		rst.close();
		sp.close();
		
		if (nroLocacion > 0)
			return true;
		
		return false;
	}

	public void insertar(UsuarioBean bean) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_usuario_insert(?, ?, ?, ?, ?, ?, ?, ?, ?)}");
        PerfilBean perfilBean = bean.getPerfil();
		
		sp.setInt(1, perfilBean.getCodigo());
		sp.setString(2, bean.getNombre());
		sp.setString(3, bean.getApePaterno());
		sp.setString(4, bean.getApeMaterno());
		sp.setString(5, bean.getDni());
		sp.setString(6, bean.getEmail());
		sp.setString(7, bean.getMovil());
		sp.setString(8, bean.getUserName());
		sp.setString(9, bean.getPassword());
		
		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_usuario_insert(" + perfilBean.getCodigo() + "," + bean.getNombre() + "," + bean.getApePaterno() + "," + bean.getApeMaterno() + "," + bean.getDni() + "," + bean.getEmail() + "," + bean.getMovil() + "," + bean.getUserName() + "," + bean.getPassword() + ") |||\n----------\n");
		
		rst.close();
		sp.close();
		conn.close();
	}
	
    public void asignar(int procesoElectoral, int codigoUsuario, int centroVotacion) throws Exception {
    	System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_usuario_asignar(" + procesoElectoral + "," + codigoUsuario + "," + centroVotacion + ") |||\n----------\n");
    	
		CallableStatement sp = conn.prepareCall("{call pa_usuario_asignar(?, ?, ?)}");
		
		sp.setInt(1, procesoElectoral);
		sp.setInt(2, codigoUsuario);
		sp.setInt(3, centroVotacion);
		
		ResultSet rst = sp.executeQuery();
		
		rst.close();
		sp.close();
		conn.close();    	
    }
	
	public void retirar(int procesoElectoral, int codigoUsuario, int centroVotacion) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_usuario_retirar(?, ?, ?)}");
		
		sp.setInt(1, procesoElectoral);
		sp.setInt(2, codigoUsuario);
		sp.setInt(3, centroVotacion);
		
		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_usuario_retirar(" + procesoElectoral + "," + codigoUsuario + "," + centroVotacion + ") |||\n----------\n");
		
		rst.close();
		sp.close();
		conn.close();  
	}

	private UsuarioBean fillBean(UsuarioBean bean, ResultSet rst) {
		try {
			PerfilBean perfilBean = new PerfilBean();
			perfilBean.setCodigo(rst.getInt("perfilID"));
			perfilBean.setNombre(rst.getString("perfilNombre"));
			perfilBean.setDescripcion(rst.getString("descripcion"));
			perfilBean.setEstado(rst.getString("perfilEstado"));
			
			bean.setCodigo("" + rst.getInt("usuarioID"));
			bean.setPerfil(perfilBean);
			bean.setNombre(rst.getString("usuarioNombre"));
			bean.setApePaterno(rst.getString("paterno"));
			bean.setApeMaterno(rst.getString("materno"));
			bean.setDni(rst.getString("dni"));
			bean.setEmail(rst.getString("email"));
			bean.setMovil(rst.getString("movil"));
			bean.setUserName(rst.getString("username"));
			bean.setPassword(rst.getString("passwd"));
			bean.setEstado(rst.getString("usuarioEstado"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

}