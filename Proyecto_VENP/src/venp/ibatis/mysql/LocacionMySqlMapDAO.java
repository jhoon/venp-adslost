package venp.ibatis.mysql;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import venp.beans.LocacionBean;
import venp.dao.entities.LocacionDAO;
import venp.listener.SessionVotantesListener;

import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;

public class LocacionMySqlMapDAO extends SqlMapDaoTemplate implements LocacionDAO {

	public LocacionMySqlMapDAO(DaoManager daoManager) {
		super(daoManager);
	}

	public boolean puestaCero(int intUsuario, int intLocacion) throws Exception {		
		if (eliminarVotos(intUsuario, intLocacion) == 0) {
			realizarPuestaCero(intUsuario, intLocacion);
			return true;
		} else {
			return false;
		}
	}

	public LocacionBean locacionActivaPorUsuarioPuestaCero(int intUsuario, int intLocacion) throws Exception {
		HashMap map = new HashMap();
		map.put("usuario", new Integer(intUsuario));
		map.put("locacion", new Integer(intLocacion));
		LocacionBean bean = (LocacionBean)this.queryForObject("Locacion.locacionPorUsuarioPuestaCero", map);
		return bean;
	}

	public LocacionBean locacionPorUsuarioCerrarVotacion(int intUsuario, int intLocacion) throws Exception {
		HashMap map = new HashMap();
		map.put("usuario", new Integer(intUsuario));
		map.put("locacion", new Integer(intLocacion));
		LocacionBean bean = (LocacionBean)this.queryForObject("Locacion.locacionPorUsuarioCerrarVotacion", map);
		return bean;
	}

	public ArrayList locacionesActivasPorUsuarioPuestaCero(int intUsuario) throws Exception {
		HashMap map = new HashMap();
		map.put("usuario", new Integer(intUsuario));
		ArrayList lista = (ArrayList)this.queryForList("Locacion.locacionesPorUsuarioPuestaCero", map);
		return lista;
	}

	public ArrayList locacionesPorUsuarioCerrarVotacion(int intUsuario) throws Exception {
		HashMap map = new HashMap();
		map.put("usuario", new Integer(intUsuario));
		ArrayList lista = (ArrayList)this.queryForList("Locacion.locacionesPorUsuarioCerrarVotacion", map);
		return lista;
	}

	public ArrayList locacionesPorUsuarioMonitoreo(int intUsuario) throws Exception {
		HashMap map = new HashMap();
		map.put("usuario", new Integer(intUsuario));
		ArrayList lista = (ArrayList)this.queryForList("Locacion.locacionesPorUsuarioMonitoreo", map);
		Iterator it = lista.iterator();
		while(it.hasNext()) {
			LocacionBean bean = (LocacionBean)it.next();
			bean = locacionNroVotos(bean);
		}
		return lista;
	}

	public boolean cerrarVotacion(int intUsuario, int intLocacion) throws Exception {
		HashMap map = new HashMap();
		map.put("usuario", new Integer(intUsuario));
		map.put("locacion", new Integer(intLocacion));
		map.put("salida", new Integer(-1));
		this.update("Locacion.locacionCerrarVotacion", map);
		int intLocacionOK = ((Integer)map.get("salida")).intValue();
		return (intLocacionOK == 1 ? true : false);
	}
	
	/*
	 * PRIVATE FUNCTIONS
	 */
	
	private LocacionBean locacionNroVotos(LocacionBean bean) throws Exception {
		HashMap map = new HashMap();
		map.put("codigo", new Integer(bean.getCodigo()));
		map.put("nroElectores", new Integer(-1));
		map.put("nroVotos", new Integer(-1));
		this.update("Locacion.locacionMonitoreo", map);
		bean.setNroElectores(((Integer)map.get("nroElectores")).intValue());
		bean.setNroVotos(((Integer)map.get("nroVotos")).intValue());
		bean.setNroElectorSesion(SessionVotantesListener.totalVotantesActivos(bean.getCodigo()));
		return bean;
	}
	
	private int eliminarVotos(int intUsuario, int intLocacion) throws Exception {
		HashMap map = new HashMap();
		map.put("usuario", new Integer(intUsuario));
		map.put("locacion", new Integer(intLocacion));
		map.put("salida", new Integer(-1));
		this.update("Locacion.eliminarVotos", map);
		return ((Integer)map.get("salida")).intValue();
	}
	
	private int realizarPuestaCero(int intUsuario, int intLocacion) throws Exception {
		HashMap map = new HashMap();
		map.put("usuario", new Integer(intUsuario));
		map.put("locacion", new Integer(intLocacion));
		map.put("salida", new Integer(-1));
		this.update("Locacion.realizarPuestaCero", map);
		return((Integer)map.get("salida")).intValue();
	}

}
