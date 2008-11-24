package venp.dao.entities;

import java.util.ArrayList;

import venp.web.forms.ElectorForm;

public interface ElectorDAO {
	
	public ElectorForm validarDNI(String dni) throws Exception;
	public boolean isValidPIN(String id, String pin) throws Exception;
	public void registrarElector(ElectorForm elector) throws Exception;
	public ElectorForm votar(String voto, ElectorForm elector) throws Exception;
	public ArrayList getConsulados(int idProceso) throws Exception;
	public ArrayList getPaises(int idProceso) throws Exception;
	public ArrayList getCedulaOpciones(int idProceso) throws Exception;
	public int getEmpadronamientoActivo() throws Exception;
	public int getProcesoActivo() throws Exception;
	public boolean isVotoEnRango(int idProceso, int idElector) throws Exception;

}
