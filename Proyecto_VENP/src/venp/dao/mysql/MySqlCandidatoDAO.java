package venp.dao.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import venp.beans.CandidatoBean;
import venp.beans.PartidoPoliticoBean;
import venp.beans.PerfilBean;
import venp.dao.entities.CandidatoDAO;

public class MySqlCandidatoDAO implements CandidatoDAO {

	private Connection conn;

	public MySqlCandidatoDAO(Connection c) {
		conn = c;
	}
	 
	public ArrayList findAll() throws Exception {
		ArrayList lista = new ArrayList();
		
		CallableStatement sp = conn.prepareCall("{call pa_candidato_findAll()}");    		
	    ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_candidato_findAll() |||\n----------\n");

		rst.beforeFirst();
		while (rst.next()) {
			CandidatoBean bean = new CandidatoBean();
			
			bean = fillBean(bean, rst);
			lista.add(bean);
		}
		
		rst.close();
		sp.close();
		conn.close();
		
		return lista;
	}
	
	public ArrayList findAll_conPP(int partidoPolitico_ID) throws Exception {
		ArrayList lista = new ArrayList();
		
		CallableStatement sp = conn.prepareCall("{call pa_partidoPolitico_conCandidato(?)}");   
		sp.setInt(1, partidoPolitico_ID);
	    ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_partidoPolitico_conCandidato(" + partidoPolitico_ID + ") |||\n----------\n");

		rst.beforeFirst();
		while (rst.next()) {
			CandidatoBean bean = new CandidatoBean();
			
			bean = fillBean(bean, rst);
			lista.add(bean);
		}
		
		rst.close();
		sp.close();
		conn.close();
		
		return lista;
	}
	 
	public ArrayList findAll_sinPP(int partidoPolitico_ID) throws Exception {
		ArrayList lista = new ArrayList();
		
		CallableStatement sp = conn.prepareCall("{call pa_partidoPolitico_sinCandidato(?)}");
		sp.setInt(1, partidoPolitico_ID);
	    ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_partidoPolitico_sinCandidato(" + partidoPolitico_ID + ") |||\n----------\n");

		rst.beforeFirst();
		while (rst.next()) {
			CandidatoBean bean = new CandidatoBean();
			
			bean = fillBean(bean, rst);
			lista.add(bean);
		}
		
		rst.close();
		sp.close();
		conn.close();
		
		return lista;
	}

	public CandidatoBean findByPrimaryKey(int codigo) throws Exception {
		CandidatoBean bean = null;
		
		CallableStatement sp = conn.prepareCall("{call pa_candidato_findByPrimaryKey(?)}");
		sp.setInt(1, codigo);
	    ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_candidato_findByPrimaryKey(" + codigo + ") |||\n----------\n");

		rst.beforeFirst();
		
		if (rst.next()) {
			bean = new CandidatoBean();
			bean = fillBean(bean, rst);	
		}
		
		rst.close();
		sp.close();
		conn.close();
				
		return bean;
	}
	
	public void borrar(int codigo) throws Exception {
		ArrayList lista = new ArrayList();
		 
		CallableStatement sp = conn.prepareCall("{call pa_candidato_delete(?)}");
		sp.setInt(1, codigo);
		
		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_candidato_delete(" + codigo + ") |||\n----------\n");
		
		
		rst.close();
		sp.close();
		conn.close();
	}
	
	public String insertar(CandidatoBean bean) throws Exception {
		ArrayList lista = new ArrayList();
		String resultado = null; 
		CallableStatement sp = conn.prepareCall("{call pa_candidato_insert(?,?,?,?,?)}");
		sp.setString(1, bean.getNombre());
		sp.setString(2, bean.getPaterno());
		sp.setString(3, bean.getMaterno());
		sp.setString(4, bean.getDni());
		sp.setString(5, bean.getFoto());
		
		
		
		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_candidato_insert(" + bean.getNombre() + "," + bean.getPaterno() + ","+ bean.getMaterno()+ ","+ bean.getDni()+ ","+ bean.getFoto()+") |||\n----------\n");
		
		rst.beforeFirst();
		
		if (rst.next()) {
			resultado= rst.getString("nombre");
		
		}
		
		rst.close();
		sp.close();
		conn.close();
		
		return resultado;
	}
	
	public String editar(CandidatoBean bean) throws Exception {
		ArrayList lista = new ArrayList();
		String resultado = null;
		
		CallableStatement sp = conn.prepareCall("{call pa_candidato_edit(?, ?, ?, ?, ?, ?)}");
		sp.setInt(1, bean.getCodigo());
		sp.setString(2, bean.getNombre());
		sp.setString(3, bean.getPaterno());
		sp.setString(4, bean.getMaterno());
		sp.setString(5, bean.getDni());
		sp.setString(6, bean.getFoto());
		
		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_candidato_edit(" + bean.getCodigo() + ", " + bean.getNombre() + "," + bean.getPaterno() + "," + bean.getMaterno() +"," + bean.getDni() +"," + bean.getFoto() +") |||\n----------\n");
		
        rst.beforeFirst();
		
		if (rst.next()) {
			resultado= rst.getString("nombr");
		
		}
		 
		rst.close();
		sp.close();
		conn.close();
		return resultado;
	}
	
	public void asignar(int partidoPolitico, int candidato) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_candidato_asignar(?, ?)}");
		
		sp.setInt(1, partidoPolitico);
		sp.setInt(2, candidato);
		
		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_candidato_asignar(" + partidoPolitico + ", " + candidato + ") |||\n----------\n");
		
		rst.close();
		sp.close();
		conn.close();		
	}
	
	public void retirar(int partidoPolitico, int candidato) throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_candidato_retirar(?, ?)}");
		
		sp.setInt(1, partidoPolitico);
		sp.setInt(2, candidato);
		
		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_candidato_retirar(" + partidoPolitico + ", " + candidato + ") |||\n----------\n");
		
		rst.close();
		sp.close();
		conn.close();		
	}
	
	private CandidatoBean fillBean(CandidatoBean bean, ResultSet rst) {
		try {
			bean.setCodigo(Integer.parseInt(rst.getString("id")));
			bean.setNombre(rst.getString("nombre"));
			bean.setPaterno(rst.getString("paterno"));
			bean.setMaterno(rst.getString("materno"));
			bean.setDni(rst.getString("dni"));
			bean.setFoto(rst.getString("foto"));
			bean.setEstado(rst.getString("estado"));
			

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bean;
	}

}