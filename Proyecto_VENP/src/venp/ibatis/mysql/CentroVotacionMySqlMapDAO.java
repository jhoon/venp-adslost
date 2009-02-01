package venp.ibatis.mysql;

import java.util.ArrayList;
import java.util.HashMap;

import venp.beans.CentroVotacionBean;
import venp.beans.PaisBean;
import venp.beans.ZonaHorariaBean;
import venp.dao.entities.CentroVotacionDAO;

import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;

public class CentroVotacionMySqlMapDAO extends SqlMapDaoTemplate implements
		CentroVotacionDAO {

	public CentroVotacionMySqlMapDAO(DaoManager daoManager) {
		super(daoManager);
	}

	public void asignar(int procesoElectoral, int centroVotacion)
			throws Exception {
		HashMap map = new HashMap();

		map.put("v_procesoelectoral", procesoElectoral);
		map.put("v_centrovotacion", centroVotacion);

		this.update("CentroVotacion.asignar", map);
	}

	public void borrar(int codigo) throws Exception {
		this.update("CentroVotacion.borrar", codigo);
	}

	public void editar(CentroVotacionBean bean) throws Exception {
		HashMap map = new HashMap();
		PaisBean paisBean = bean.getPais();
		ZonaHorariaBean zhBean = bean.getZonaHoraria();

		map.put("v_codigo", bean.getCodigo());
		map.put("v_pais", paisBean.getCodigo());
		map.put("v_zonahoraria", zhBean.getCodigo());
		map.put("v_codigopostal", bean.getCodigoPostal());
		map.put("v_nombre", bean.getNombre());
		map.put("v_region", bean.getRegion());
		map.put("v_direccion", bean.getDireccion());

		this.update("CentroVotacion.editar", map);
	}

	public ArrayList findAll() throws Exception {
		return (ArrayList<CentroVotacionBean>) queryForList(
				"CentroVotacion.findAll", null);
	}

	public ArrayList findAllConLocacion(int procesoElectoral, int codigoPais)
			throws Exception {
		HashMap map = new HashMap();

		map.put("v_pe", procesoElectoral);
		map.put("v_pais", codigoPais);

		return (ArrayList<CentroVotacionBean>) queryForList(
				"CentroVotacion.findAll_conLocacion", map);
	}

	public ArrayList findAllConUsuario(int procesoElectoral, int codigoUser,
			int codigoPais) throws Exception {
		HashMap map = new HashMap();

		map.put("v_pe", procesoElectoral);
		map.put("v_user", codigoUser);
		map.put("v_pais", codigoPais);

		return (ArrayList<CentroVotacionBean>) queryForList(
				"CentroVotacion.findAll_conUsuario", map);
	}

	public ArrayList findAllSinLocacion(int procesoElectoral, int codigoPais)
			throws Exception {
		HashMap map = new HashMap();

		map.put("v_pe", procesoElectoral);
		map.put("v_pais", codigoPais);

		return (ArrayList<CentroVotacionBean>) queryForList(
				"CentroVotacion.findAll_sinLocacion", map);
	}

	public ArrayList findAllSinUsuario(int procesoElectoral, int codigoUser,
			int codigoPais) throws Exception {
		HashMap map = new HashMap();

		map.put("v_pe", procesoElectoral);
		map.put("v_user", codigoUser);
		map.put("v_pais", codigoPais);

		return (ArrayList<CentroVotacionBean>) queryForList(
				"CentroVotacion.findAll_sinUsuario", map);
	}

	public boolean findByName(String nombre, int codigoPais) throws Exception {
		HashMap map = new HashMap();

		map.put("v_Nombre", nombre);
		map.put("v_Pais", codigoPais);
		map.put("v_Total", -1);

		this.update("CentroVotacion.findByName", map);

		int intNroLocacion = ((Integer) map.get("v_Total")).intValue();

		if (intNroLocacion > 0)
			return true;

		return false;
	}

	public boolean findByName(String nombre, int codigoPais, int codigo)
			throws Exception {
		HashMap map = new HashMap();

		map.put("v_Nombre", nombre);
		map.put("v_Pais", codigoPais);
		map.put("v_Codigo", codigo);
		map.put("v_Total", -1);

		this.update("CentroVotacion.findByNameID", map);

		int intNroLocacion = ((Integer) map.get("v_Total")).intValue();

		if (intNroLocacion > 0)
			return true;

		return false;
	}

	public CentroVotacionBean findByPrimaryKey(int v_codigo) throws Exception {
		return (CentroVotacionBean) this.queryForObject(
				"CentroVotacion.findByPrimaryKey", v_codigo);
	}

	public void insertar(CentroVotacionBean bean) throws Exception {
		HashMap map = new HashMap();
		PaisBean paisBean = bean.getPais();
		ZonaHorariaBean zhBean = bean.getZonaHoraria();

		map.put("v_pais", paisBean.getCodigo());
		map.put("v_zonahoraria", zhBean.getCodigo());
		map.put("v_codigopostal", bean.getCodigoPostal());
		map.put("v_nombre", bean.getNombre());
		map.put("v_region", bean.getRegion());
		map.put("v_direccion", bean.getDireccion());

		this.update("CentroVotacion.insertar", map);
	}

	public void retirar(int procesoElectoral, int centroVotacion)
			throws Exception {
		HashMap map = new HashMap();

		map.put("v_procesoelectoral", procesoElectoral);
		map.put("v_centrovotacion", centroVotacion);

		this.update("CentroVotacion.retirar", map);
	}

}