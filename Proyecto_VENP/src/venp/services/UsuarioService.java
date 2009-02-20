package venp.services;

import java.util.ArrayList;

import venp.beans.UsuarioBean;
import venp.dao.entities.UsuarioDAO;
import venp.dao.factory.DaoConfig;

import com.ibatis.dao.client.DaoManager;

public class UsuarioService {

	private UsuarioDAO dao;
	private DaoManager manager = DaoConfig.getDaoManager();

	public UsuarioService() {
		dao = (UsuarioDAO) manager.getDao(UsuarioDAO.class);
	}

	public UsuarioBean findByUsuario(String usuario) throws Exception {
		try {
			return dao.findByUsuario(usuario);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public void borrar(String codigo) throws Exception {
		try {
			dao.borrar(codigo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void editar(UsuarioBean bean) throws Exception {
		try {
			dao.editar(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList findAll() throws Exception {
		try {
			return dao.findAll();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public ArrayList findAllByLocacion() throws Exception {
		try {
			return dao.findAllByLocacion();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public UsuarioBean findByPrimaryKey(String codigo) throws Exception {
		try {
			return dao.findByPrimaryKey(codigo);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public boolean findByDNI(String dni) throws Exception {
		try {
			return dao.findByDNI(dni);
		} catch (Exception e) {
			e.printStackTrace();
			return true;
		}
	}

	public boolean findByDNI(String dni, String codigo) throws Exception {
		try {
			return dao.findByDNI(dni, codigo);
		} catch (Exception e) {
			e.printStackTrace();
			return true;
		}
	}

	public boolean findByUserName(String userName) throws Exception {
		try {
			return dao.findByUserName(userName);
		} catch (Exception e) {
			e.printStackTrace();
			return true;
		}
	}

	public boolean findByUserName(String userName, String codigo)
			throws Exception {
		try {
			return dao.findByUserName(userName, codigo);
		} catch (Exception e) {
			e.printStackTrace();
			return true;
		}
	}

	public void insertar(UsuarioBean bean) throws Exception {
		try {
			dao.insertar(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void asignar(int procesoElectoral, int codigoUsuario,
			int centroVotacion) throws Exception {
		try {
			dao.asignar(procesoElectoral, codigoUsuario, centroVotacion);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void retirar(int procesoElectoral, int codigoUsuario,
			int centroVotacion) throws Exception {
		try {
			dao.retirar(procesoElectoral, codigoUsuario, centroVotacion);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}