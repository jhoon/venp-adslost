package venp.dao.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import venp.beans.LocacionBean;
import venp.dao.entities.LocacionDAO;
import venp.listener.SessionVotantesListener;
import venp.utils.DateConverter;

public class MySqlLocacionDAO implements LocacionDAO {

	private Connection conn;

	public MySqlLocacionDAO(Connection c) {
		conn = c;
	}

	public ArrayList locaciones_Activas_Por_Usuario_PuestaCero(int usuario) throws Exception {
		ArrayList lista = new ArrayList();

		CallableStatement sp = conn.prepareCall("{call pa_Locaciones_Por_Usuario_PuestaCero(?)}");
		sp.setInt(1, usuario);

		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| locacionesActivasPor_Usuario_PuestaCero(" + usuario + ") |||\n----------\n");

		rst.beforeFirst();
		while (rst.next()) {
			LocacionBean bean = new LocacionBean();

			bean = fillBean(bean, rst, 0);
			lista.add(bean);
		}

		rst.close();
		sp.close();
		conn.close();

		return lista;
	}
	
	public LocacionBean locacion_Activa_Por_Usuario_PuestaCero(int usuario, int locacion) throws Exception {
		LocacionBean bean = null;
		
		CallableStatement sp = conn.prepareCall("{call pa_Locacion_Por_Usuario_PuestaCero(?, ?)}");
		
		sp.setInt(1, usuario);
		sp.setInt(2, locacion);
		
		ResultSet rst = sp.executeQuery();
		
		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_Locacion_Por_Usuario_PuestaCero(" + usuario + ", " + locacion + ") |||\n----------\n");
		
		rst.beforeFirst();
		while (rst.next()) {
			bean = new LocacionBean();
			
			bean = fillBean(bean, rst, 0);
		}
		
		rst.close();
		sp.close();
		conn.close();
		
		return bean;
	}
	
	public boolean puesta_Cero(int usuario, int locacion) throws Exception {
		if (eliminar_Votos(usuario, locacion) == 0)
			if (realizar_Puesta_Cero(usuario, locacion) == 0) {
				conn.close();
				return true;
			}
			else  {
				conn.close();
				return true;
			}
		else {
			conn.close();
			return false;
		}
	}

	public ArrayList locaciones_Por_Usuario_CerrarVotacion(int usuario) throws Exception {
		ArrayList lista = new ArrayList();

		CallableStatement sp = conn.prepareCall("{call pa_Locaciones_Por_Usuario_CerrarVotacion(?)}");
		sp.setInt(1, usuario);

		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_Locaciones_Por_Usuario_CerrarVotacion(" + usuario + ") |||\n----------\n");

		rst.beforeFirst();
		while (rst.next()) {
			LocacionBean bean = new LocacionBean();

			bean = fillBean(bean, rst, 1);
			lista.add(bean);
		}

		rst.close();
		sp.close();
		conn.close();

		return lista;
	}
	
	public LocacionBean locacion_Por_Usuario_CerrarVotacion(int usuario, int locacion) throws Exception {
		LocacionBean bean = null;
		
		CallableStatement sp = conn.prepareCall("{call pa_Locacion_Por_Usuario_CerrarVotacion(?, ?)}");
		
		sp.setInt(1, usuario);
		sp.setInt(2, locacion);
		
		ResultSet rst = sp.executeQuery();
		
		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_Locacion_Por_Usuario_CerrarVotacion(" + usuario + ", " + locacion + ") |||\n----------\n");
		
		rst.beforeFirst();
		while (rst.next()) {
			bean = new LocacionBean();
			
			bean = fillBean(bean, rst, 1);
		}
		
		rst.close();
		sp.close();
		conn.close();
		
		return bean;
	}
	
	public boolean cerrar_Votacion(int usuario, int locacion) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_Locacion_CerrarVotacion(?, ?, ?)}");
		
		sp.setInt(1, usuario);
		sp.setInt(2, locacion);
		
		sp.registerOutParameter(3, java.sql.Types.INTEGER );
		
		ResultSet rst = sp.executeQuery();
		
		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_Locacion_CerrarVotacion(" + usuario + ", " + locacion + ") |||\n----------\n");
		
		int locacionOK = sp.getInt(3);

		rst.close();
		sp.close();
		
		if (locacionOK == 1)
			return true;
		else
			return false;
	}

	public ArrayList locaciones_Por_Usuario_Monitoreo(int usuario) throws Exception {
		ArrayList lista = new ArrayList();

		CallableStatement sp = conn.prepareCall("{call pa_Locaciones_Por_Usuario_Monitoreo(?)}");
		sp.setInt(1, usuario);

		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_Locaciones_Por_Usuario_Monitoreo(" + usuario + ") |||\n----------\n");

		rst.beforeFirst();
		while (rst.next()) {
			LocacionBean bean = new LocacionBean();

			bean = fillBean(bean, rst, 2);
			bean = locacion_nroVotos(bean);
			lista.add(bean);
		}

		rst.close();
		sp.close();
		conn.close();

		return lista;
	}
	
	private int eliminar_Votos(int usuario, int locacion) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_Locacion_Eliminar_Votos(?, ?, ?)}");
		
		sp.setInt(1, usuario);
		sp.setInt(2, locacion);
		
		sp.registerOutParameter(3, java.sql.Types.INTEGER );
		
		ResultSet rst = sp.executeQuery();
		
		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_Locacion_Eliminar_Votos(" + usuario + ", " + locacion + ") |||\n----------\n");
		
		int nroVotos = sp.getInt(3);

		rst.close();
		sp.close();
		
		return nroVotos;
	}
	
	private int realizar_Puesta_Cero(int usuario, int locacion) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_Locacion_PuestaCero(?, ?, ?)}");
		sp.setInt(1, usuario);
		sp.setInt(2, locacion);
		sp.registerOutParameter(3, java.sql.Types.INTEGER);

		ResultSet rst = sp.executeQuery();
		
		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_Locacion_PuestaCero(" + usuario + ", " + locacion + ") |||\n----------\n");
		
		int nroLocacion = sp.getInt(3);

		rst.close();
		sp.close();
		
		return nroLocacion;
	}
	
	private LocacionBean locacion_nroVotos (LocacionBean bean) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_Locacion_Monitoreo(?, ?, ?)}");
		sp.setInt(1, bean.getCodigo());
		sp.registerOutParameter(2, java.sql.Types.INTEGER);
		sp.registerOutParameter(3, java.sql.Types.INTEGER);

		ResultSet rst = sp.executeQuery();
		
		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_Locacion_Escrutinio(" + bean.getCodigo() + ", ?, ?) |||\n----------\n");

		bean.setNroElectores(sp.getInt(2));
		bean.setNroVotos(sp.getInt(3));
		bean.setNroElectorSesion(SessionVotantesListener.totalVotantesActivos(bean.getCodigo()));

		rst.close();
		sp.close();
		
		return bean;
	}
	
	private LocacionBean fillBean(LocacionBean bean, ResultSet rst, int tipo) {
		try {
			if (tipo == 0) {
				bean.setCodigo(rst.getInt("codigo"));
				bean.setNombrePais(rst.getString("pais"));
				bean.setNombreCentroVotacion(rst.getString("centroVotacion"));;
				bean.setTiempoGMT(rst.getInt("tiempoGMT"));
				bean.setHoraLocal(rst.getTimestamp("fechaLocal"));
				bean.setHoraVotacionInicio(rst.getTimestamp("fechaVotacion"));
				bean.setDiferenciaInicio(rst.getInt("diferenciaInicio"));
				bean.setDiferenciaInicioFin(rst.getInt("diferenciaInicioFin"));
			}
			else if (tipo == 1) {
				bean.setCodigo(rst.getInt("codigo"));
				bean.setNombrePais(rst.getString("pais"));
				bean.setNombreCentroVotacion(rst.getString("centroVotacion"));;
				bean.setTiempoGMT(rst.getInt("tiempoGMT"));
				bean.setHoraLocal(rst.getTimestamp("fechaLocal"));
				bean.setHoraVotacionInicio(rst.getTimestamp("fechaVotacion"));
				bean.setDiferenciaFin(rst.getInt("diferenciaFin"));
			}
			else if (tipo == 2) {
				bean.setCodigo(rst.getInt("codigo"));
				bean.setNombrePais(rst.getString("pais"));
				bean.setNombreCentroVotacion(rst.getString("centroVotacion"));;
				bean.setTiempoGMT(rst.getInt("tiempoGMT"));
				bean.setHoraLocal(rst.getTimestamp("fechaLocal"));
				bean.setHoraVotacionInicio(rst.getTimestamp("inicioVotacion"));
				bean.setHoraVotacionFin(rst.getTimestamp("finVotacion"));
				bean.setPuestaCero(rst.getTimestamp("puestaCero"));
				bean.setCierreVotacion(rst.getTimestamp("cierre"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return bean;
	}

}