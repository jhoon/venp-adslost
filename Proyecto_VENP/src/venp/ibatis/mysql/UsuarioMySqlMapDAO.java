package venp.ibatis.mysql;

import java.util.ArrayList;

import venp.beans.UsuarioBean;
import venp.dao.entities.UsuarioDAO;

import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;

public class UsuarioMySqlMapDAO extends SqlMapDaoTemplate implements UsuarioDAO {

	public UsuarioMySqlMapDAO(DaoManager daoManager) {
		super(daoManager);
	}

	@Override
	public void asignar(int procesoElectoral, int codigoUsuario,
			int centroVotacion) throws Exception {
		
	}

	@Override
	public void borrar(String codigo) throws Exception {
		
	}

	@Override
	public void editar(UsuarioBean bean) throws Exception {
		
	}

	@Override
	public ArrayList findAll() throws Exception {
		return null;
	}

	@Override
	public ArrayList findAll_Locacion() throws Exception {
		return null;
	}

	@Override
	public boolean findByDNI(String dni) throws Exception {
		return false;
	}

	@Override
	public boolean findByDNI(String dni, String codigo) throws Exception {
		return false;
	}

	@Override
	public UsuarioBean findByPrimaryKey(String codigo) throws Exception {
		return null;
	}

	@Override
	public boolean findByUserName(String userName) throws Exception {
		return false;
	}

	@Override
	public boolean findByUserName(String userName, String codigo)
			throws Exception {
		return false;
	}

	@Override
	public UsuarioBean findByUsuario(String usuario) throws Exception {
		return (UsuarioBean)this.queryForObject("Usuario.findByUsuario", usuario);
	}

	@Override
	public void insertar(UsuarioBean bean) throws Exception {
		
	}

	@Override
	public void retirar(int procesoElectoral, int codigoUsuario,
			int centroVotacion) throws Exception {
		
	}

}
