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
	public boolean puestaCero(int intUsuario, int intLocacion) throws Exception {
		System.out.println("\n==================\n SqlMap: puesta_Cero \n==================\n");		
		if (eliminarVotos(intUsuario, intLocacion) == 0){
			/*if (realizar_Puesta_Cero(iUsuario, iLocacion) == 0) {
				return true;
			}
			else  {
				return true;
			}*/
			realizarPuestaCero(intUsuario, intLocacion);
			return true;
		}else {
			return false;
		}
	}

	@Override
	public LocacionBean locacionActivaPorUsuarioPuestaCero(int intUsuario, int intLocacion) throws Exception {
		// Map
		HashMap map = new HashMap();
		map.put("usuario", new Integer(intUsuario));
		map.put("locacion", new Integer(intLocacion));
		// Query
		LocacionBean bean = (LocacionBean)this.queryForObject("Locacion.locacionPorUsuarioPuestaCero", map);
		
		System.out.println("\n==================\n SqlMap: locacion_Activa_Por_Usuario_PuestaCero \n==================\n");
		
		return bean;
	}

	@Override
	public LocacionBean locacionPorUsuarioCerrarVotacion(int intUsuario, int intLocacion) throws Exception {
		// Map
		HashMap map = new HashMap();
		map.put("usuario", new Integer(intUsuario));
		map.put("locacion", new Integer(intLocacion));
		// Query
		LocacionBean bean = (LocacionBean)this.queryForObject("Locacion.locacionPorUsuarioCerrarVotacion", map);
		
		System.out.println("\n==================\n SqlMap: locacion_Por_Usuario_CerrarVotacion \n==================\n");
		
		return bean;
	}

	@Override
	public ArrayList locacionesActivasPorUsuarioPuestaCero(int intUsuario) throws Exception {
		// Map
		HashMap map = new HashMap();
		map.put("usuario", new Integer(intUsuario));
		// Query
		ArrayList lista = (ArrayList)this.queryForList("Locacion.locacionesPorUsuarioPuestaCero", map);
		
		System.out.println("\n==================\n SqlMap: locaciones_Activas_Por_Usuario_PuestaCero \n==================\n");
		
		return lista;
	}

	@Override
	public ArrayList locacionesPorUsuarioCerrarVotacion(int intUsuario) throws Exception {
		// Map
		HashMap map = new HashMap();
		map.put("usuario", new Integer(intUsuario));
		// Query
		ArrayList lista = (ArrayList)this.queryForList("Locacion.locacionesPorUsuarioCerrarVotacion", map);
		
		System.out.println(intUsuario);
		
		System.out.println("\n==================\n SqlMap: locaciones_Por_Usuario_CerrarVotacion \n==================\n");
		
		return lista;
	}

	@Override
	public ArrayList locacionesPorUsuarioMonitoreo(int intUsuario) throws Exception {
		// Map
		HashMap map = new HashMap();
		map.put("usuario", new Integer(intUsuario));
		// Query
		ArrayList lista = (ArrayList)this.queryForList("Locacion.locacionesPorUsuarioMonitoreo", map);
		// Procesamiento
		Iterator it = lista.iterator();
		while(it.hasNext()) {
			LocacionBean bean = (LocacionBean)it.next();
			bean = locacionNroVotos(bean);
		}
		
		System.out.println("\n==================\n SqlMap: locaciones_Por_Usuario_Monitoreo \n==================\n");
		
		return lista;
	}

	@Override
	public boolean cerrarVotacion(int intUsuario, int intLocacion) throws Exception {
		// Map
		HashMap map = new HashMap();
		map.put("usuario", new Integer(intUsuario));
		map.put("locacion", new Integer(intLocacion));
		map.put("salida", new Integer(-1));
		// Query
		this.update("Locacion.locacionCerrarVotacion", map);
		int iLocacionOK = ((Integer)map.get("salida")).intValue();
		
		System.out.println("\n==================\n SqlMap: cerrar_Votacion \n==================\n");
		
		if (iLocacionOK == 1)
			return true;
		else
			return false;
	}
	
	/*
	 * PRIVATE FUNCTIONS
	 */
	
	private LocacionBean locacionNroVotos(LocacionBean bean) throws Exception {
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
	
	private int eliminarVotos(int intUsuario, int intLocacion) throws Exception {
		// Map
		HashMap map = new HashMap();
		map.put("usuario", new Integer(intUsuario));
		map.put("locacion", new Integer(intLocacion));
		map.put("salida", new Integer(-1));
		// Query
		this.update("Locacion.eliminarVotos", map);
		int iNroVotos = ((Integer)map.get("salida")).intValue();
		
		System.out.println("\n==================\n SqlMap: eliminar_Votos \n==================\n");

		return iNroVotos;
	}
	
	private int realizarPuestaCero(int intUsuario, int intLocacion) throws Exception {
		// Map
		HashMap map = new HashMap();
		map.put("usuario", new Integer(intUsuario));
		map.put("locacion", new Integer(intLocacion));
		map.put("salida", new Integer(-1));
		// Query
		this.update("Locacion.realizarPuestaCero", map);
		int iNroLocacion = ((Integer)map.get("salida")).intValue();
		
		System.out.println("\n==================\n SqlMap: realizar_Puesta_Cero \n==================\n");

		return iNroLocacion;
	}

}
