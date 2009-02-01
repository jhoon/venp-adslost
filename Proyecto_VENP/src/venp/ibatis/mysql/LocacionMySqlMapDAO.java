package venp.ibatis.mysql;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import venp.beans.EscrutinioBean;
import venp.beans.LocacionBean;
import venp.dao.entities.LocacionDAO;
import venp.listener.SessionVotantesListener;

import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;

public class LocacionMySqlMapDAO extends SqlMapDaoTemplate implements
		LocacionDAO {

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

	public LocacionBean locacionActivaPorUsuarioPuestaCero(int intUsuario,
			int intLocacion) throws Exception {
		HashMap map = new HashMap();
		map.put("usuario", new Integer(intUsuario));
		map.put("locacion", new Integer(intLocacion));
		LocacionBean bean = (LocacionBean) this.queryForObject(
				"Locacion.locacionPorUsuarioPuestaCero", map);
		return bean;
	}

	public LocacionBean locacionPorUsuarioCerrarVotacion(int intUsuario,
			int intLocacion) throws Exception {
		HashMap map = new HashMap();
		map.put("usuario", new Integer(intUsuario));
		map.put("locacion", new Integer(intLocacion));
		LocacionBean bean = (LocacionBean) this.queryForObject(
				"Locacion.locacionPorUsuarioCerrarVotacion", map);
		return bean;
	}

	public ArrayList locacionesActivasPorUsuarioPuestaCero(int intUsuario)
			throws Exception {
		HashMap map = new HashMap();
		map.put("usuario", new Integer(intUsuario));
		ArrayList lista = (ArrayList) this.queryForList(
				"Locacion.locacionesPorUsuarioPuestaCero", map);
		return lista;
	}

	public ArrayList locacionesPorUsuarioCerrarVotacion(int intUsuario)
			throws Exception {
		HashMap map = new HashMap();
		map.put("usuario", new Integer(intUsuario));
		ArrayList lista = (ArrayList) this.queryForList(
				"Locacion.locacionesPorUsuarioCerrarVotacion", map);
		return lista;
	}

	public ArrayList locacionesPorUsuarioMonitoreo(int intUsuario)
			throws Exception {
		HashMap map = new HashMap();
		map.put("usuario", new Integer(intUsuario));
		ArrayList lista = (ArrayList) this.queryForList(
				"Locacion.locacionesPorUsuarioMonitoreo", map);
		Iterator it = lista.iterator();
		while (it.hasNext()) {
			LocacionBean bean = (LocacionBean) it.next();
			bean = locacionNroVotos(bean);
		}
		return lista;
	}

	public boolean cerrarVotacion(int intUsuario, int intLocacion)
			throws Exception {
		HashMap map = new HashMap();
		map.put("usuario", new Integer(intUsuario));
		map.put("locacion", new Integer(intLocacion));
		map.put("salida", new Integer(-1));
		this.update("Locacion.locacionCerrarVotacion", map);
		int intLocacionOK = ((Integer) map.get("salida")).intValue();
		return (intLocacionOK == 1 ? true : false);
	}

	public ArrayList listarLocacionesCerradas() throws Exception {
		ArrayList lista = new ArrayList();

		lista = locacionesCerradas();

		ArrayList locacionHabiles;
		locacionHabiles = comprobarLocacionesCerradas(lista);
		ArrayList locacionEscrutinio;
		locacionEscrutinio = comprobarFaltaEscrutinio(locacionHabiles);

		return locacionEscrutinio;
	}

	public boolean locacionesAbiertas() throws Exception {
		boolean resultado = false;
		LocacionBean locacion = (LocacionBean) queryForObject(
				"Locacion.locacionesAbiertas", null);
		if (locacion.getLocacionesAbiertas() > 0) {
			resultado = true;
		} else {
			resultado = false;
		}
		return resultado;
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
		bean.setNroElectores(((Integer) map.get("nroElectores")).intValue());
		bean.setNroVotos(((Integer) map.get("nroVotos")).intValue());
		bean.setNroElectorSesion(SessionVotantesListener
				.totalVotantesActivos(bean.getCodigo()));
		return bean;
	}

	private int eliminarVotos(int intUsuario, int intLocacion) throws Exception {
		HashMap map = new HashMap();
		map.put("usuario", new Integer(intUsuario));
		map.put("locacion", new Integer(intLocacion));
		map.put("salida", new Integer(-1));
		this.update("Locacion.eliminarVotos", map);
		return ((Integer) map.get("salida")).intValue();
	}

	private int realizarPuestaCero(int intUsuario, int intLocacion)
			throws Exception {
		HashMap map = new HashMap();
		map.put("usuario", new Integer(intUsuario));
		map.put("locacion", new Integer(intLocacion));
		map.put("salida", new Integer(-1));
		this.update("Locacion.realizarPuestaCero", map);
		return ((Integer) map.get("salida")).intValue();
	}
	
	private ArrayList comprobarLocacionesCerradas(ArrayList locaciones) {
		LocacionBean bean;
		for (int i = 0; i < locaciones.size(); i++) {
			bean = (LocacionBean) locaciones.get(i);
			try {
				LocacionBean locacionBean = locacionCerradaPais(bean
						.getCodigo());
				if (locacionBean != null) {
					if (bean.getTotalLocaciones().equals(
							String
									.valueOf(locacionBean
											.getLocacionesCerradas()))) {
						bean.setLocacionesCerradas(locacionBean
								.getLocacionesCerradas());
						bean.setLocacionCerrada(true);
						bean.setMensaje("escrutinio");
					} else {
						bean.setLocacionCerrada(false);
						bean.setMensaje("faltaVotacion");
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return locaciones;
	}

	private ArrayList comprobarFaltaEscrutinio(ArrayList locacion) {
		LocacionBean bean;
		for (int i = 0; i < locacion.size(); i++) {
			bean = (LocacionBean) locacion.get(i);
			try {
				LocacionBean locacionBean = faltaEscrutinio(bean.getCodigo());
				BigInteger resultado = null;
				BigInteger comparar = new BigInteger("0");
				if (locacionBean != null) {
					resultado = new BigInteger(String.valueOf(locacionBean
							.getConEscrutinio()));
					if (resultado.compareTo(comparar) == 1
							&& bean.isLocacionCerrada() == true) {
						bean.setLocacionCerrada(false);
						bean.setMensaje("escrutinio");
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return locacion;
	}

	private ArrayList locacionesCerradas() throws Exception {
		return (ArrayList<EscrutinioBean>) queryForList(
				"Locacion.listarLocacionesCerradas", null);
	}

	private LocacionBean locacionCerradaPais(int intPaisId) throws Exception {
		HashMap mapPais = new HashMap();
		mapPais.put("paisId", new Integer(intPaisId));
		return (LocacionBean) this.queryForObject(
				"Locacion.comprobarLocacionesCerradas", mapPais);
	}

	private LocacionBean faltaEscrutinio(int intPaisId) throws Exception {
		HashMap mapPais = new HashMap();
		mapPais.put("faltaEscrutinio", new Integer(intPaisId));
		return (LocacionBean) this.queryForObject(
				"Locacion.comprobarFaltaEscrutinio", mapPais);
	}

}
