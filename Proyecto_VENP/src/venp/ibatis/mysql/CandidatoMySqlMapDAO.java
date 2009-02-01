package venp.ibatis.mysql;

import java.util.ArrayList;
import java.util.HashMap;

import venp.beans.CandidatoBean;
import venp.dao.entities.CandidatoDAO;

import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;

public class CandidatoMySqlMapDAO extends SqlMapDaoTemplate implements
		CandidatoDAO {

	public CandidatoMySqlMapDAO(DaoManager daoManager) {
		super(daoManager);
	}

	public void asignar(int partidoPolitico, int candidato) throws Exception {
		HashMap map = new HashMap();
		map.put("v_partidopolitico", partidoPolitico);
		map.put("v_candidato", candidato);
		this.update("Candidato.asignar", map);
	}

	public void borrar(int codigo) throws Exception {
		this.update("Candidato.borrar", codigo);
	}

	public ArrayList listarTodos() throws Exception {
		return (ArrayList) queryForList("Candidato.findAll", null);
	}

	public ArrayList listarConPartidoPolitico(int partidoPoliticoId)
			throws Exception {
		return (ArrayList<CandidatoBean>) queryForList(
				"Candidato.findAll_conPP", partidoPoliticoId);
	}

	public ArrayList listarSinPartidoPolitico(int partidoPoliticoId)
			throws Exception {
		return (ArrayList<CandidatoBean>) queryForList(
				"Candidato.findAll_sinPP", partidoPoliticoId);
	}

	public CandidatoBean findByPrimaryKey(int codigo) throws Exception {
		return (CandidatoBean) this.queryForObject(
				"Candidato.findByPrimaryKey", codigo);
	}

	public String insertar(CandidatoBean bean) throws Exception {
		HashMap map = new HashMap();
		map.put("v_nombre", bean.getNombre());
		map.put("v_paterno", bean.getPaterno());
		map.put("v_materno", bean.getMaterno());
		map.put("v_dni", bean.getDni());
		map.put("v_foto", bean.getFoto());

		String strResult = (String) this.queryForObject("Candidato.insertar",
				map);

		return strResult;
	}

	public String editar(CandidatoBean bean) throws Exception {
		HashMap map = new HashMap();
		map.put("codigo", bean.getCodigo());
		map.put("v_nombre", bean.getNombre());
		map.put("v_paterno", bean.getPaterno());
		map.put("v_materno", bean.getMaterno());
		map.put("v_dni", bean.getDni());
		map.put("v_foto", bean.getFoto());

		String strResult = (String) this
				.queryForObject("Candidato.editar", map);

		return strResult;
	}

	public void retirar(int partidoPolitico, int candidato) throws Exception {
		HashMap map = new HashMap();
		map.put("v_partidopolitico", partidoPolitico);
		map.put("v_candidato", candidato);

		this.update("Candidato.retirar", map);
	}

}