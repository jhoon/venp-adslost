package venp.ibatis.mysql;

import java.util.ArrayList;
import java.util.HashMap;

import venp.beans.PerfilBean;
import venp.beans.UsuarioBean;
import venp.dao.entities.UsuarioDAO;

import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;

public class UsuarioMySqlMapDAO extends SqlMapDaoTemplate implements UsuarioDAO {

	public UsuarioMySqlMapDAO(DaoManager daoManager) {
		super(daoManager);
	}

	public void asignar(int procesoElectoral, int codigoUsuario,
			int centroVotacion) throws Exception {
		HashMap map = new HashMap();

		map.put("v_procesoelectoral", procesoElectoral);
		map.put("v_user", codigoUsuario);
		map.put("v_centrovotacion", centroVotacion);

		this.update("Usuario.asignar", map);
	}

	public void borrar(String codigo) throws Exception {
		this.update("Usuario.borrar", Integer.parseInt(codigo));
	}

	public void editar(UsuarioBean bean) throws Exception {
		HashMap map = new HashMap();
		PerfilBean perfilBean = bean.getPerfil();

		map.put("v_codigo", Integer.parseInt(bean.getCodigo()));
		map.put("v_perfil", perfilBean.getCodigo());
		map.put("v_nombre", bean.getNombre());
		map.put("v_paterno", bean.getApePaterno());
		map.put("v_materno", bean.getApeMaterno());
		map.put("v_dni", bean.getDni());
		map.put("v_email", bean.getEmail());
		map.put("v_movil", bean.getMovil());
		map.put("v_username", bean.getUserName());
		map.put("v_password", bean.getPassword());

		this.update("Usuario.editar", map);
	}

	public ArrayList findAll() throws Exception {
		return (ArrayList<UsuarioBean>) queryForList("Usuario.findAll", null);
	}

	public ArrayList findAllByLocacion() throws Exception {
		return (ArrayList<UsuarioBean>) queryForList(
				"Usuario.findAll_Locacion", null);
	}

	public boolean findByDNI(String dni) throws Exception {
		HashMap map = new HashMap();

		map.put("v_DNI", dni);
		map.put("v_Total", -1);

		this.update("Usuario.findByDNI", map);

		int intNroLocacion = ((Integer) map.get("v_Total")).intValue();

		if (intNroLocacion > 0)
			return true;

		return false;
	}

	public boolean findByDNI(String dni, String codigo) throws Exception {
		HashMap map = new HashMap();

		map.put("v_DNI", dni);
		map.put("v_Codigo", Integer.parseInt(codigo));
		map.put("v_Total", -1);

		this.update("Usuario.findByDNI_ID", map);

		int intNroLocacion = ((Integer) map.get("v_Total")).intValue();

		if (intNroLocacion > 0)
			return true;

		return false;
	}

	public UsuarioBean findByPrimaryKey(String codigo) throws Exception {
		return (UsuarioBean) this.queryForObject("Usuario.findByPrimaryKey",
				Integer.parseInt(codigo));
	}

	public boolean findByUserName(String userName) throws Exception {
		HashMap map = new HashMap();

		map.put("v_DNI", userName);
		map.put("v_Total", -1);

		this.update("Usuario.findByUserName", map);

		int intNroLocacion = ((Integer) map.get("v_Total")).intValue();

		if (intNroLocacion > 0)
			return true;

		return false;
	}

	public boolean findByUserName(String userName, String codigo)
			throws Exception {
		HashMap map = new HashMap();

		map.put("v_DNI", userName);
		map.put("v_Codigo", Integer.parseInt(codigo));
		map.put("v_Total", -1);

		this.update("Usuario.findByUserNameID", map);

		int intNroLocacion = ((Integer) map.get("v_Total")).intValue();

		if (intNroLocacion > 0)
			return true;

		return false;
	}

	public UsuarioBean findByUsuario(String usuario) throws Exception {
		return (UsuarioBean) this.queryForObject("Usuario.findByUsuario",
				usuario);
	}

	public void insertar(UsuarioBean bean) throws Exception {
		HashMap map = new HashMap();
		PerfilBean perfilBean = bean.getPerfil();

		map.put("v_perfil", perfilBean.getCodigo());
		map.put("v_nombre", bean.getNombre());
		map.put("v_paterno", bean.getApePaterno());
		map.put("v_materno", bean.getApeMaterno());
		map.put("v_dni", bean.getDni());
		map.put("v_email", bean.getEmail());
		map.put("v_movil", bean.getMovil());
		map.put("v_username", bean.getUserName());
		map.put("v_password", bean.getPassword());

		this.update("Usuario.insertar", map);
	}

	public void retirar(int procesoElectoral, int codigoUsuario,
			int centroVotacion) throws Exception {
		HashMap map = new HashMap();

		map.put("v_procesoelectoral", procesoElectoral);
		map.put("v_user", codigoUsuario);
		map.put("v_centrovotacion", centroVotacion);

		this.update("Usuario.retirar", map);
	}

}
