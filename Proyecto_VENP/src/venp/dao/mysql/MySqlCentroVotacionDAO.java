package venp.dao.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import venp.beans.CentroVotacionBean;
import venp.beans.PaisBean;
import venp.beans.ZonaHorariaBean;
import venp.dao.entities.CentroVotacionDAO;

public class MySqlCentroVotacionDAO implements CentroVotacionDAO {

	private Connection conn;

	public MySqlCentroVotacionDAO(Connection c) {
		conn = c;
	}

	public void borrar(int codigo) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_centrovotacion_delete(?)}");
		sp.setInt(1, codigo);
		
		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_centrovotacion_delete(" + codigo + ") |||\n----------\n");
		
		rst.close();
		sp.close();
		conn.close();
	}

	public void editar(CentroVotacionBean bean) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_centrovotacion_edit(?, ?, ?, ?, ?, ?, ?)}");
		PaisBean paisBean = bean.getPais();
		ZonaHorariaBean zhBean = bean.getZonaHoraria();
		
		sp.setInt(1, bean.getCodigo());
		sp.setInt(2, paisBean.getCodigo());
		sp.setInt(3, zhBean.getCodigo());
		sp.setString(4, bean.getCodigoPostal());
		sp.setString(5, bean.getNombre());
		sp.setString(6, bean.getRegion());
		sp.setString(7, bean.getDireccion());
		
		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_centrovotacion_edit(" + bean.getCodigo() + ", " + paisBean.getCodigo() + ", " + zhBean.getCodigo() + ", " + bean.getCodigoPostal() + "," + bean.getNombre() + "," + bean.getRegion() + "," + bean.getDireccion() + ") |||\n----------\n");
		
		rst.close();
		sp.close();
		conn.close();
	}

	public ArrayList findAll() throws Exception {
		ArrayList lista = new ArrayList();
		
		CallableStatement sp = conn.prepareCall("{call pa_centrovotacion_findAll()}");    		
	    ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_centrovotacion_findAll() |||\n----------\n");

		rst.beforeFirst();
		while (rst.next()) {
			CentroVotacionBean bean = new CentroVotacionBean();
			
			bean = fillBean(bean, rst);
			lista.add(bean);
		}
		
		rst.close();
		sp.close();
		conn.close();
		
		return lista;
	}

	public ArrayList findAll_conLocacion(int procesoElectoral, int codigoPais) throws Exception {
		ArrayList lista = new ArrayList();
		
		CallableStatement sp = conn.prepareCall("{call pa_centrovotacion_conLocacion(?, ?)}");  
		sp.setInt(1, procesoElectoral);
		sp.setInt(2, codigoPais);
		
	    ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_centrovotacion_conLocacion(" + procesoElectoral + ", " + codigoPais + ") |||\n----------\n");

		rst.beforeFirst();
		while (rst.next()) {
			CentroVotacionBean bean = new CentroVotacionBean();
			
			bean = fillBean(bean, rst);
			lista.add(bean);
		}
		
		rst.close();
		sp.close();
		conn.close();
		
		return lista;
	}

	public ArrayList findAll_sinLocacion(int procesoElectoral, int codigoPais) throws Exception {
		ArrayList lista = new ArrayList();
		
		CallableStatement sp = conn.prepareCall("{call pa_centrovotacion_sinLocacion(?, ?)}");  
		sp.setInt(1, procesoElectoral);
		sp.setInt(2, codigoPais);
		
	    ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_centrovotacion_sinLocacion(" + procesoElectoral + ", " + codigoPais + ") |||\n----------\n");

		rst.beforeFirst();
		while (rst.next()) {
			CentroVotacionBean bean = new CentroVotacionBean();
			
			bean = fillBean(bean, rst);
			lista.add(bean);
		}
		
		rst.close();
		sp.close();
		conn.close();
		
		return lista;
	}

	public ArrayList findAll_conUsuario(int procesoElectoral, int codigoUser, int codigoPais) throws Exception {
		ArrayList lista = new ArrayList();
		
		CallableStatement sp = conn.prepareCall("{call pa_centrovotacion_conUsuario(?, ?, ?)}");  
		sp.setInt(1, procesoElectoral);
		sp.setInt(2, codigoUser);
		sp.setInt(3, codigoPais);
		
	    ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_centrovotacion_conUsuario(" + procesoElectoral + ", " + codigoUser + ", " + codigoPais + ") |||\n----------\n");

		rst.beforeFirst();
		while (rst.next()) {
			CentroVotacionBean bean = new CentroVotacionBean();
			
			bean = fillBean(bean, rst);
			lista.add(bean);
		}
		
		rst.close();
		sp.close();
		conn.close();
		
		return lista;
	}

	public ArrayList findAll_sinUsuario(int procesoElectoral, int codigoUser, int codigoPais) throws Exception {
		ArrayList lista = new ArrayList();
		
		CallableStatement sp = conn.prepareCall("{call pa_centrovotacion_sinUsuario(?, ?, ?)}");  
		sp.setInt(1, procesoElectoral);
		sp.setInt(2, codigoUser);
		sp.setInt(3, codigoPais);
		
	    ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_centrovotacion_sinUsuario(" + procesoElectoral + ", " + codigoUser + ", " + codigoPais + ") |||\n----------\n");

		rst.beforeFirst();
		while (rst.next()) {
			CentroVotacionBean bean = new CentroVotacionBean();
			
			bean = fillBean(bean, rst);
			lista.add(bean);
		}
		
		rst.close();
		sp.close();
		conn.close();
		
		return lista;
	}
	
	public CentroVotacionBean findByPrimaryKey(int codigo) throws Exception {
		CentroVotacionBean bean = null;
		
		CallableStatement sp = conn.prepareCall("{call pa_centrovotacion_findByPrimaryKey(?)}");
		sp.setInt(1, codigo);
	    ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_centrovotacion_findByPrimaryKey(" + codigo + ") |||\n----------\n");

		rst.beforeFirst();
		
		if (rst.next()) {
			bean = new CentroVotacionBean();
			bean = fillBean(bean, rst);	
		}
		
		rst.close();
		sp.close();
		conn.close();
		
		return bean;
	}
	
	public boolean findByName(String nombre, int codigoPais) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_centrovotacion_findByName(?, ?, ?)}");
		sp.setString(1, nombre);
		sp.setInt(2, codigoPais);
		sp.registerOutParameter(3, java.sql.Types.INTEGER);
		
	    ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_centrovotacion_findByName(" + nombre + "," + codigoPais + ") |||\n----------\n");

		int nroLocacion = sp.getInt(3);

		rst.close();
		sp.close();
		
		if (nroLocacion > 0)
			return true;
		
		return false;
	}
	
	public boolean findByName(String nombre, int codigoPais, int codigo) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_centrovotacion_findByName_ID(?, ?, ?, ?)}");
		sp.setString(1, nombre);
		sp.setInt(2, codigoPais);
		sp.setInt(3, codigo);
		sp.registerOutParameter(4, java.sql.Types.INTEGER);
		
	    ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_centrovotacion_findByName_ID(" + nombre + ", " + codigoPais + ", " + codigo + ") |||\n----------\n");

		int nroLocacion = sp.getInt(4);

		rst.close();
		sp.close();
		
		if (nroLocacion > 0)
			return true;
		
		return false;
	}

	public void insertar(CentroVotacionBean bean) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_centrovotacion_insert(?, ?, ?, ?, ?, ?)}");
		PaisBean paisBean = bean.getPais();
		ZonaHorariaBean zhBean = bean.getZonaHoraria();
		
		sp.setInt(1, paisBean.getCodigo());
		sp.setInt(2, zhBean.getCodigo());
		sp.setString(3, bean.getCodigoPostal());
		sp.setString(4, bean.getNombre());
		sp.setString(5, bean.getRegion());
		sp.setString(6, bean.getDireccion());
		
		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_centrovotacion_insert(" + paisBean.getCodigo() + ", " + zhBean.getCodigo() + ", " + bean.getCodigoPostal() + "," + bean.getNombre() + "," + bean.getRegion() + "," + bean.getDireccion() + ") |||\n----------\n");
		
		rst.close();
		sp.close();
		conn.close();
	}
	
	public void asignar(int procesoElectoral, int centroVotacion) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_centrovotacion_asignar(?, ?)}");
		
		sp.setInt(1, procesoElectoral);
		sp.setInt(2, centroVotacion);
		
		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_centrovotacion_asignar(" + procesoElectoral + ", " + centroVotacion + ") |||\n----------\n");
		
		rst.close();
		sp.close();
		conn.close();		
	}
	
	public void retirar(int procesoElectoral, int centroVotacion) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_centrovotacion_retirar(?, ?)}");
		
		sp.setInt(1, procesoElectoral);
		sp.setInt(2, centroVotacion);
		
		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_centrovotacion_retirar(" + procesoElectoral + ", " + centroVotacion + ") |||\n----------\n");
		
		rst.close();
		sp.close();
		conn.close();		
	}

	private CentroVotacionBean fillBean(CentroVotacionBean bean, ResultSet rst) {
		try {
			PaisBean paisBean = new PaisBean();
			ZonaHorariaBean zhBean = new ZonaHorariaBean();
			
			paisBean.setCodigo(rst.getInt("paisID"));
			paisBean.setNombre(rst.getString("paisNombre"));
			paisBean.setAbreviatura(rst.getString("paisAbreviatura"));
			paisBean.setEstado(rst.getString("paisEstado"));
			
			zhBean.setCodigo(rst.getInt("zhID"));
			zhBean.setTiempo(rst.getDouble("zhTiempo"));
			zhBean.setNombre(rst.getString("zhNombre"));
			zhBean.setEstado(rst.getString("zhEstado"));
			
			bean.setCodigo(rst.getInt("cvID"));
			bean.setPais(paisBean);
		    bean.setZonaHoraria(zhBean);
		    bean.setCodigoPostal(rst.getString("cvCP"));
			bean.setNombre(rst.getString("cvNombre"));
			bean.setRegion(rst.getString("cvRegion"));
			bean.setDireccion(rst.getString("cvDireccion"));
			bean.setEstado(rst.getString("cvEstado"));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bean;
	}

}