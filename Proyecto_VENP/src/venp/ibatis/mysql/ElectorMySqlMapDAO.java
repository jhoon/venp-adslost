package venp.ibatis.mysql;

import java.util.ArrayList;
import java.util.HashMap;

import venp.dao.entities.ElectorDAO;
import venp.web.forms.ElectorForm;

import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;

public class ElectorMySqlMapDAO extends SqlMapDaoTemplate implements ElectorDAO{

	public ElectorMySqlMapDAO(DaoManager daoManager) {
		super(daoManager);
	}

	@Override
	public ArrayList getCedulaOpciones(int idProceso) throws Exception {
		HashMap params = new HashMap();
		params.put("idProceso", idProceso);
		return (ArrayList)queryForList("Elector.opcionesCedula", params);
	}

	@Override
	public ArrayList getConsulados(int idProceso) throws Exception {
		return (ArrayList)queryForList("Elector.getConsulados", idProceso);
	}

	@Override
	public int getEmpadronamientoActivo() throws Exception {
		return (Integer)queryForObject("Elector.getEmpadronamientoActivo", null);
	}

	@Override
	public ArrayList getPaises(int idProceso) throws Exception {
		return (ArrayList)queryForList("Elector.getPaises", idProceso);
	}

	@Override
	public int getProcesoActivo() throws Exception {
		return (Integer)queryForObject("Elector.procActivo", null);
	}

	@Override
	public boolean isValidPIN(String id, String pin) throws Exception {
		HashMap params = new HashMap();
		params.put("id", id);
		params.put("pin", pin);
		return ((Integer)queryForObject("Elector.validaPIN", params)==1) ? true : false;

	}

	@Override
	public boolean isVotoEnRango(int idProceso, int idElector) throws Exception {
		HashMap params = new HashMap();
		params.put("idProceso", idProceso);
		params.put("idElector", idElector);
		return ((Integer)queryForObject("Elector.votoEnRango", params)==1) ? true : false;
	}

	@Override
	public void registrarElector(ElectorForm elector) throws Exception {
		insert("Elector.registrarElector", elector);
	}

	@Override
	public ElectorForm validarDNI(String dni) throws Exception {
		return (ElectorForm)queryForObject("Elector.validarDNI", dni);
	}

	@Override
	public ElectorForm votar(String voto, ElectorForm elector) throws Exception {
		HashMap params = new HashMap();
		params.put("voto", voto);
		params.put("id", elector.getId());
		params.put("locationId", elector.getLocationId());
		
		ElectorForm electemp = (ElectorForm)queryForObject("Elector.votar", params);
		
		if(electemp != null){
			elector.setFechaSufragio(electemp.getFechaSufragio());
			elector.setHoraSufragio(electemp.getHoraSufragio());
			elector.setGmtSufragio(electemp.getGmtSufragio());
		}
		
		return elector;
	}

}
