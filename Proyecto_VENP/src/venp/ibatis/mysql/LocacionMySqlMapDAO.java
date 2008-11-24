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

	@Override
	public boolean puesta_Cero(int usuario, int locacion) throws Exception {
		System.out.println("\n==================\n SqlMap: puesta_Cero \n==================\n");		
		if (eliminar_Votos(usuario, locacion) == 0)
			if (realizar_Puesta_Cero(usuario, locacion) == 0) {
				return true;
			}
			else  {
				return true;
			}
		else {
			return false;
		}
	}

	@Override
	public LocacionBean locacion_Activa_Por_Usuario_PuestaCero(int usuario, int locacion) throws Exception {
		// Map
		HashMap map = new HashMap();
		map.put("usuario", new Integer(usuario));
		map.put("locacion", new Integer(locacion));
		// Query
		LocacionBean bean = (LocacionBean)this.queryForObject("Locacion.locacionPorUsuarioPuestaCero", map);
		
		System.out.println("\n==================\n SqlMap: locacion_Activa_Por_Usuario_PuestaCero \n==================\n");
		
		return bean;
	}

	@Override
	public LocacionBean locacion_Por_Usuario_CerrarVotacion(int usuario, int locacion) throws Exception {
		// Map
		HashMap map = new HashMap();
		map.put("usuario", new Integer(usuario));
		map.put("locacion", new Integer(locacion));
		// Query
		LocacionBean bean = (LocacionBean)this.queryForObject("Locacion.locacionPorUsuarioCerrarVotacion", map);
		
		System.out.println("\n==================\n SqlMap: locacion_Por_Usuario_CerrarVotacion \n==================\n");
		
		return bean;
	}

	@Override
	public ArrayList locaciones_Activas_Por_Usuario_PuestaCero(int usuario) throws Exception {
		// Map
		HashMap map = new HashMap();
		map.put("usuario", new Integer(usuario));
		// Query
		ArrayList lista = (ArrayList)this.queryForList("Locacion.locacionesPorUsuarioPuestaCero", map);
		
		System.out.println("\n==================\n SqlMap: locaciones_Activas_Por_Usuario_PuestaCero \n==================\n");
		
		return lista;
	}

	@Override
	public ArrayList locaciones_Por_Usuario_CerrarVotacion(int usuario) throws Exception {
		// Map
		HashMap map = new HashMap();
		map.put("usuario", new Integer(usuario));
		// Query
		ArrayList lista = (ArrayList)this.queryForList("Locacion.locacionesPorUsuarioCerrarVotacion", map);
		
		System.out.println(usuario);
		
		System.out.println("\n==================\n SqlMap: locaciones_Por_Usuario_CerrarVotacion \n==================\n");
		
		return lista;
	}

	@Override
	public ArrayList locaciones_Por_Usuario_Monitoreo(int usuario) throws Exception {
		// Map
		HashMap map = new HashMap();
		map.put("usuario", new Integer(usuario));
		// Query
		ArrayList lista = (ArrayList)this.queryForList("Locacion.locacionesPorUsuarioMonitoreo", map);
		// Procesamiento
		Iterator it = lista.iterator();
		while(it.hasNext()) {
			LocacionBean bean = (LocacionBean)it.next();
			bean = locacion_nroVotos(bean);
		}
		
		System.out.println("\n==================\n SqlMap: locaciones_Por_Usuario_Monitoreo \n==================\n");
		
		return lista;
	}

	@Override
	public boolean cerrar_Votacion(int usuario, int locacion) throws Exception {
		// Map
		HashMap map = new HashMap();
		map.put("usuario", new Integer(usuario));
		map.put("locacion", new Integer(locacion));
		map.put("salida", new Integer(-1));
		// Query
		this.update("Locacion.locacionCerrarVotacion", map);
		int locacionOK = ((Integer)map.get("salida")).intValue();
		
		System.out.println("\n==================\n SqlMap: cerrar_Votacion \n==================\n");
		
		if (locacionOK == 1)
			return true;
		else
			return false;
	}
	
	/*
	 * PRIVATE FUNCTIONS
	 */
	
	private LocacionBean locacion_nroVotos(LocacionBean bean) throws Exception {
		// Map
		HashMap map = new HashMap();
		map.put("codigo", new Integer(bean.getCodigo()));
		map.put("nroElectores", new Integer(-1));
		map.put("nroVotos", new Integer(-1));
		// Query
		this.update("Locacion.locacionMonitoreo", map);
		bean.setNroElectores(((Integer)map.get("nroElectores")).intValue());
		bean.setNroVotos(((Integer)map.get("nroVotos")).intValue());
		bean.setNroElectorSesion(SessionVotantesListener.totalVotantesActivos(bean.getCodigo()));
		
		System.out.println("\n==================\n SqlMap: locacion_nroVotos \n==================\n");
		
		return bean;
	}
	
	private int eliminar_Votos(int usuario, int locacion) throws Exception {
		// Map
		HashMap map = new HashMap();
		map.put("usuario", new Integer(usuario));
		map.put("locacion", new Integer(locacion));
		map.put("salida", new Integer(-1));
		// Query
		this.update("Locacion.eliminarVotos", map);
		int nroVotos = ((Integer)map.get("salida")).intValue();
		
		System.out.println("\n==================\n SqlMap: eliminar_Votos \n==================\n");

		return nroVotos;
	}
	
	private int realizar_Puesta_Cero(int usuario, int locacion) throws Exception {
		// Map
		HashMap map = new HashMap();
		map.put("usuario", new Integer(usuario));
		map.put("locacion", new Integer(locacion));
		map.put("salida", new Integer(-1));
		// Query
		this.update("Locacion.realizarPuestaCero", map);
		int nroLocacion = ((Integer)map.get("salida")).intValue();
		
		System.out.println("\n==================\n SqlMap: realizar_Puesta_Cero \n==================\n");

		return nroLocacion;
	}

}
