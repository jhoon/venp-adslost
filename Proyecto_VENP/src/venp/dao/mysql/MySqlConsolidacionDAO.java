package venp.dao.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import venp.beans.ConsolidacionBean;
import venp.beans.EscrutinioBean;
import venp.beans.PerfilBean;
import venp.dao.entities.ConsolidacionDAO;

public class MySqlConsolidacionDAO implements ConsolidacionDAO {

	private Connection conn;
 
	public MySqlConsolidacionDAO(Connection c) {
		conn = c;
	}

	 
	public ArrayList listarResultados() throws Exception {
		ArrayList resultado=new ArrayList();
		CallableStatement sp = conn.prepareCall("{call pa_Consolidacion_Consolida_Voto()}");
		ConsolidacionBean bean;

		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_Consolidacion_Consolida_Voto() |||\n----------\n");
		
		 
		ArrayList lista = new ArrayList();
		rst.beforeFirst();

		while (rst.next()) {

			bean = new ConsolidacionBean();
			bean = fillConsolidacionVotacion(bean, rst);
			lista.add(bean);
		}
	 
	 
		rst.close();
		sp.close();
		conn.close();

		return lista;
		
	}
	

	private ConsolidacionBean fillConsolidacionVotacion(ConsolidacionBean bean, ResultSet rst) {
		try {
			bean.setNombreCandidato(rst.getString("nombre"));
			bean.setImagenCandidato(rst.getString("foto"));
			bean.setNombrePartidoPolitico(rst.getString("partido"));
			bean.setImagenPartidoPolitico(rst.getString("logo"));
			bean.setResultado(rst.getString("resultado"));
			bean.setFecha(rst.getString("fecha"));
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return bean;
	}


	 
	public boolean procesoCerrado() throws Exception {
		boolean proceso=false;
		int locaciones=0;
		CallableStatement spp = conn.prepareCall("{call pa_Consolidacion_Proceso_Electoral_Cerrado()}");
		 
		ResultSet rstt = spp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_Consolidacion_Proceso_Electoral_Cerrado()) |||\n----------\n");
	

		if (rstt.next()) {
			rstt.beforeFirst();
			proceso = true;
			 
		}
	
		if(proceso==true){
			
			
			CallableStatement sppp = conn.prepareCall("{call pa_Consolidacion_Contar_Locaciones_Abiertas()}");
			 
			ResultSet rsttt = sppp.executeQuery();

			System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_Consolidacion_Contar_Locaciones_Abiertas()) |||\n----------\n");
			rsttt.beforeFirst();
			if(rsttt.next()){
				
				locaciones = rsttt.getInt("total");
			 
			}
			
		}
		
		if(locaciones>0){
			proceso = true;
			
			 
		}else if(locaciones==0 && proceso==true){
			
			spp = conn.prepareCall("{call pa_Consolidacion_Cierra_Proceso_Electoral()}");
			 
			rstt = spp.executeQuery();

			System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_Consolidacion_Cierra_Proceso_Electoral()) |||\n----------\n");
			
			proceso = false;
			
		}
	 
		rstt.close();
		spp.close();
		conn.close();
		
		return proceso;
		
	}
	
	
}