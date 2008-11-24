package venp.dao.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import venp.beans.MyHelpBean;
import venp.beans.OpcionBean;
import venp.dao.entities.ElectorDAO;
import venp.web.forms.ElectorForm;

public class MySqlElectorDAO implements ElectorDAO {
	
	private Connection conn;

	public MySqlElectorDAO(Connection c) {
		conn = c;
	}

	@Override
	public ElectorForm validarDNI(String dni) throws Exception {		
		CallableStatement sp = conn.prepareCall("{call pa_elector_validarDNI(?)}");
		sp.setString(1, dni);
		 
		ResultSet rst = sp.executeQuery();
		
		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_elector_validarDNI(" + dni + ") |||\n----------\n");
		
		rst.beforeFirst();

		ElectorForm bean = null;
		
		if (rst.next()) {
			bean = new ElectorForm();
			bean.setId("" + rst.getInt("id"));
			bean.setLocationId(rst.getString("Locacion_id"));
			bean.setPaisId(rst.getInt("pais_id"));
			bean.setNombre(rst.getString("nombre"));
			bean.setPaterno(rst.getString("paterno"));
			bean.setMaterno(rst.getString("materno"));
			bean.setDni(dni);
			bean.setEmail(rst.getString("email"));
			bean.setEstado(rst.getString("estado"));
		}		
		
		rst.close();
		sp.close();
		
		return bean;
	}
	
	@Override
	public boolean isValidPIN(String id, String pin) throws Exception {
		boolean response = false;
		
		CallableStatement sp = conn.prepareCall("{call pa_elector_validaPIN(?, ?)}");
		sp.setString(1, id);
		sp.setString(2, pin);
			
		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_elector_validaPIN(" + id + ", " + pin + ") |||\n----------\n");
		
		if(rst.next()) {
			if(rst.getInt(1) == 1) response = true;
		}
		
		rst.close();
		sp.close();
		
		return response;
	}

	@Override
	public void registrarElector(ElectorForm elector) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_elector_registrar(?, ?, ?, ?, ?, ?, ?)}");
		sp.setString(1, elector.getId());
		sp.setString(2, elector.getLocationId());
		sp.setString(3, elector.getNombre());
		sp.setString(4, elector.getPaterno());
		sp.setString(5, elector.getMaterno());
		sp.setString(6, elector.getDni());
		sp.setString(7, elector.getEmail());
			
		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_elector_registrar() |||\n----------\n");
		
		rst.close();
		sp.close();
	}

	@Override
	public ElectorForm votar(String voto, ElectorForm elector) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_elector_votar(?,?,?)}");
		sp.setString(1, voto);
		sp.setString(2, elector.getId());
		sp.setString(3, elector.getLocationId());
			
		ResultSet rst = sp.executeQuery();
		
		rst.beforeFirst();

		if (rst.next()) {
			elector.setFechaSufragio(rst.getString("fecha"));
			elector.setHoraSufragio(rst.getString("hora"));
			elector.setGmtSufragio(rst.getString("gmt"));
		}

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_elector_votar(?,?,?) |||\n----------\n");
		
		rst.close();
		sp.close();
		
		return elector;
	}
	
	@Override
	public ArrayList getCedulaOpciones(int idProceso) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_elector_getCedula(?)}");
		sp.setInt(1, idProceso);
		 
		ResultSet rst = sp.executeQuery();
		
		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_elector_getcedula(?) |||\n----------\n");
		
		rst.beforeFirst();

		ArrayList lista = new ArrayList();
		
		OpcionBean bean = null;
		while (rst.next()) {
			bean = new OpcionBean();
			bean.setId(rst.getString("id"));
			bean.setNombre(rst.getString("nombre"));
			bean.setAbreviatura(rst.getString("abreviatura"));
			bean.setLogo(rst.getString("logo"));
			bean.setPolitico(rst.getString("politico"));
			bean.setFoto(rst.getString("foto"));
			lista.add(bean);
		}		
		
		rst.close();
		sp.close();
		
		return lista;
	}

	@Override
	public ArrayList getConsulados(int idProceso) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_elector_consulados(?)}");
		sp.setInt(1, idProceso);
		 
		ResultSet rst = sp.executeQuery();
		
		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_elector_consulados() |||\n----------\n");
		
		rst.beforeFirst();

		ArrayList lista = new ArrayList();
		
		MyHelpBean bean = null;
		while (rst.next()) {
			bean = new MyHelpBean();
			bean.setKey(rst.getString("id"));
			bean.setValue(rst.getString("nombre"));
			bean.setPaisId(rst.getInt("pais"));
			lista.add(bean);
		}		
		
		rst.close();
		sp.close();
		
		return lista;
	}
	
	@Override
	public ArrayList getPaises(int idProceso) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_elector_paises(?)}");
		sp.setInt(1, idProceso);
		 
		ResultSet rst = sp.executeQuery();
		
		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_elector_paises() |||\n----------\n");
		
		rst.beforeFirst();

		ArrayList lista = new ArrayList();
		
		MyHelpBean bean = null;
		while (rst.next()) {
			bean = new MyHelpBean();
			bean.setKey(rst.getString("id"));
			bean.setValue(rst.getString("nombre"));
			lista.add(bean);
		}		
		
		rst.close();
		sp.close();
		
		return lista;
	}

	@Override
	public int getEmpadronamientoActivo() throws Exception {
		int idProceso = 0;
		
		CallableStatement sp = conn.prepareCall("{call pa_elector_empadronamientoActivo()}");
			
		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_elector_empadronamientoActivo() |||\n----------\n");
		
		if(rst.next()) {
			idProceso = rst.getInt(1);
		}
		
		rst.close();
		sp.close();
		
		return idProceso;
	}

	@Override
	public int getProcesoActivo() throws Exception {
		int idProceso = 0;
		
		CallableStatement sp = conn.prepareCall("{call pa_elector_getProcesoActivo()}");
			
		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_elector_getProcesoActivo() |||\n----------\n");
		
		if(rst.next()) {
			idProceso = rst.getInt(1);
		}
		
		rst.close();
		sp.close();
		
		return idProceso;
	}

	@Override
	public boolean isVotoEnRango(int idProceso, int idElector) throws Exception {
		boolean response = false;
		
		CallableStatement sp = conn.prepareCall("{call pa_elector_isVotoEnRango(?, ?)}");
		sp.setInt(1, idProceso);
		sp.setInt(2, idElector);
			
		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_elector_isVotoEnRango(" + idProceso + ", " + idElector + ") |||\n----------\n");
		
		if(rst.next()) {
			if(rst.getInt(1) == 1) response = true;
		}
		
		rst.close();
		sp.close();
		
		return response;
	}
	
}
