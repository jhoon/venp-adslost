package venp.ibatis.mysql;

import java.util.ArrayList;
import java.util.HashMap;

import venp.beans.ProcesoElectoralBean;
import venp.dao.entities.ProcesoElectoralDAO;

import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;

public class ProcesoElectoralMySqlMapDAO extends SqlMapDaoTemplate implements
		ProcesoElectoralDAO {

	public ProcesoElectoralMySqlMapDAO(DaoManager daoManager) {
		super(daoManager);
	}

	public void activarProcesoElectoral(int id) throws Exception {
		this.update("ProcesoElectoral.ActivarProcesoElectoral", id);
	}

	public void anularProcesoElectoral(int id) throws Exception {
		this.update("ProcesoElectoral.AnularProcesoElectoral", id);
	}

	public void editar(ProcesoElectoralBean bean) throws Exception {
		HashMap map = new HashMap();

		map.put("codigo", bean.getCodigo());
		map.put("vusuario_id", Integer.parseInt(bean.getUsuarioId()));
		map.put("vdescripcion", bean.getDescripcion());
		map.put("vfecha_votacion", bean.getFechaVotacion());
		map.put("vhora_inicial", bean.getStartTime());
		map.put("vhora_final", bean.getFinalTime());
		map.put("vfecha_padron_inicial", bean.getFechaPadronInicial());
		map.put("vfecha_padron_final", bean.getFechaPadronFinal());
		map.put("vtiempo_sesion", bean.getTiempoSesion());

		this.update("ProcesoElectoral.editar", map);
	}

	public ArrayList findAll() throws Exception {
		return (ArrayList<ProcesoElectoralBean>) queryForList(
				"ProcesoElectoral.findAll", null);
	}

	public ArrayList findAllCreado() throws Exception {
		return (ArrayList<ProcesoElectoralBean>) queryForList(
				"ProcesoElectoral.findAll_Creado", null);
	}

	public ProcesoElectoralBean findByPrimaryKey(int id) throws Exception {
		return (ProcesoElectoralBean) this.queryForObject(
				"ProcesoElectoral.findByKey", id);
	}

	public void insertar(ProcesoElectoralBean bean) throws Exception {
		HashMap map = new HashMap();

		map.put("usuario", Integer.parseInt(bean.getUsuarioId()));
		map.put("descripcion", bean.getDescripcion());
		map.put("fecha_votacion", bean.getFechaVotacion());
		map.put("hora_inicial", bean.getStartTime());
		map.put("hora_final", bean.getFinalTime());
		map.put("fecha_padron_inicial", bean.getFechaPadronInicial());
		map.put("fecha_padron_final", bean.getFechaPadronFinal());
		map.put("tiempo_sesion", bean.getTiempoSesion());

		this.update("ProcesoElectoral.insertar", map);
	}

	/**
	 * Para conocer el estado del proceso
	 */
	public boolean estadoProceso() throws Exception {
		boolean bolResultado = false;

		ProcesoElectoralBean procElec = (ProcesoElectoralBean) queryForObject(
				"ProcesoElectoral.procesoCerrado", null);
		try {
			if (procElec.getEstado().equals("F")) {
				bolResultado = true;
			} else {
				bolResultado = false;
			}
		} catch (Exception ex) {
			ex.getMessage();
			bolResultado = false;
		}
		return bolResultado;
	}

	/**
	 * CIERRA POR COMPLETO EL PROCESO ELECTORAL
	 */
	public boolean cierraProcesoElectoral() {
		boolean bolResultado = false;
		int intEstado = this.update("ProcesoElectoral.cierraProcesoElectoral",
				null);
		if (intEstado == 1) {
			bolResultado = true;
		}
		return bolResultado;
	}

}