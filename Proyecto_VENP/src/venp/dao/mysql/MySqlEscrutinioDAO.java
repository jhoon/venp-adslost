package venp.dao.mysql;

import java.math.BigInteger;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import venp.beans.DetalleEscrutinioBean;
import venp.beans.EscrutinioBean;
import venp.dao.entities.EscrutinioDAO;

public class MySqlEscrutinioDAO implements EscrutinioDAO {

	private Connection conn;
	ArrayList resultado=new ArrayList();
	int acumulaTotalVotos;
	int acumulaVotosValidos;
	int acumulaVotosBlanco;
	EscrutinioBean beanTotal =new EscrutinioBean(); 
	
	public MySqlEscrutinioDAO(Connection c) {
		conn = c;
	}

	 
	public ArrayList listarLocacionesCerradas() throws Exception {
		CallableStatement sp = conn.prepareCall("{call pa_Escrutinio_Listar_Locaciones()}");
		 

		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_Escrutinio_Listar_Locaciones()) |||\n----------\n");
		
		EscrutinioBean bean = null;
		ArrayList lista = new ArrayList();
		rst.beforeFirst();

		while (rst.next()) {

			bean = new EscrutinioBean();
			bean = fillBean(bean, rst);
			lista.add(bean);
		}

		ArrayList locacionHabiles;
		locacionHabiles = comprobarLocacionesCerradas(lista);
		ArrayList locacionEscrutinio;
		locacionEscrutinio = comprobarFaltaEscrutinio(locacionHabiles);
		
		rst.close();
		sp.close();
		conn.close();

		return locacionEscrutinio;
	}

	private ArrayList comprobarLocacionesCerradas(ArrayList locaciones){
		EscrutinioBean bean;
		for(int i=0; i<locaciones.size();i++){
				bean = (EscrutinioBean)locaciones.get(i);
			try {
				CallableStatement sp = conn.prepareCall("{call pa_Escrutinio_Listar_Locaciones_Cerradas(?)}");
				sp.setInt(1, Integer.parseInt(bean.getPaisId()));
						
				ResultSet rst = sp.executeQuery();

				System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_Escrutinio_Listar_Locaciones_Cerradas("+bean.getNombrePais()+")) |||\n----------\n");
				rst.beforeFirst();
				
				if (rst.next()) {
					String dato = String.valueOf(rst.getInt("locaciones_cerradas"));
					if(bean.getTotalLocaciones().equals(dato)){
					   bean.setLocacionCerrada(true);
					   bean.setMensaje("escrutinio");					   
					}else{
						bean.setLocacionCerrada(false);
						bean.setMensaje("faltaVotacion");
					}
					  
				}
							
			} catch (SQLException e) {
				 
				e.printStackTrace();
			}
			
		}
			
		
		return locaciones;
	}
	
	private ArrayList comprobarFaltaEscrutinio(ArrayList locacion){
		
		EscrutinioBean bean;
		for(int i=0; i<locacion.size();i++){
				bean = (EscrutinioBean)locacion.get(i);
			try {
				CallableStatement sp = conn.prepareCall("{call pa_Escrutinio_Listar_Locaciones_Escrutinio(?)}");
				sp.setInt(1, Integer.parseInt(bean.getPaisId()));
						
				ResultSet rst = sp.executeQuery();

				System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_Escrutinio_Listar_Locaciones_Escrutinio("+bean.getNombrePais()+")) |||\n----------\n");
				rst.beforeFirst();
				BigInteger resultado = null;
				BigInteger comparar = new BigInteger ("0");
				if (rst.next()) {
					String dato = rst.getString("conEscrutinio");
					resultado = new BigInteger(dato);
									 
					if(resultado.compareTo(comparar)==1 && bean.getLocacionCerrada()==true){  
					   bean.setLocacionCerrada(false);
					   bean.setMensaje("escrutinio");
					  
				}
				}			
			} catch (SQLException e) {
				 
				e.printStackTrace();
			}
			
		}
			
		
		return locacion;
		
	}
	
	//para saber que pais con su locaciones en tabla escrutinio tiene votos
	
	public ArrayList listarDetalleEscrutinio(String id) throws Exception {
		ArrayList totalDatos=null;
		String operacion="";
		
		CallableStatement sp = conn.prepareCall("{call pa_Escrutinio_Listar_Voto_Pais(?)}");
		sp.setInt(1, Integer.parseInt(id));
				
		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_Escrutinio_Listar_Voto_Pais("+id+")) |||\n----------\n");
		ArrayList lista = new ArrayList();
		EscrutinioBean bean = null;
		rst.beforeFirst();
		
		while (rst.next()) {

			bean = new EscrutinioBean();
			bean = fillBeanVotacion(bean, rst);
			lista.add(bean);
		}
			
		ArrayList listaa =null;
		for(int i=0;i<lista.size();i++){
			listaa = new ArrayList();
			EscrutinioBean beanDetalle = null;
			beanDetalle = (EscrutinioBean)lista.get(i);
			
			CallableStatement spp = conn.prepareCall("{call pa_Escrutinio_Listar_Escrutinio_Pais_Locacion(?,?)}");
			spp.setInt(1, Integer.parseInt(id));
			spp.setInt(2, Integer.parseInt(beanDetalle.getLocacionId()));
					
			ResultSet rstt = spp.executeQuery();

			System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_Escrutinio_Listar_Escrutinio_Pais_Locacion("+id+" + "+beanDetalle.getLocacionId()+")) |||\n----------\n");

			
			DetalleEscrutinioBean beana = null;
			rstt.beforeFirst();
			
			while (rstt.next()) {

				beana = new DetalleEscrutinioBean();
				beana = fillDetalleVotacion(beana, rstt);
				listaa.add(beana);
			 
			}
				
			contadorVotos(listaa,operacion);			
		}
		
		beanTotal.setTotalVotos(acumulaTotalVotos);		 
		beanTotal.setTotalVotosValidos(acumulaVotosValidos);
		beanTotal.setTotalVotosBlancos(acumulaVotosBlanco);
		
		rst.close();
		sp.close();
		conn.close();
		
		return resultado;
	}
	

	public ArrayList listarDetalleLocacion(String id) throws Exception {
		 
		String operacion ="insertar";
		ArrayList totalDatos=null;
		CallableStatement sp = conn.prepareCall("{call pa_Escrutinio_Listar_Voto_Pais(?)}");
		sp.setInt(1, Integer.parseInt(id));
				
		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_Escrutinio_Listar_Voto_Pais("+id+")) |||\n----------\n");
		ArrayList lista = new ArrayList();
		EscrutinioBean bean = null;
		rst.beforeFirst();
		
		while (rst.next()) {

			bean = new EscrutinioBean();
			bean = fillBeanVotacion(bean, rst);
			lista.add(bean);
		}
		
		
		ArrayList listaa =null;
		for(int i=0;i<lista.size();i++){
			listaa = new ArrayList();
			EscrutinioBean beanDetalle = null;
			beanDetalle = (EscrutinioBean)lista.get(i);
			
			CallableStatement spp = conn.prepareCall("{call pa_Escrutinio_Listar_Voto_Pais_Locacion(?,?)}");
			spp.setInt(1, Integer.parseInt(id));
			spp.setInt(2, Integer.parseInt(beanDetalle.getLocacionId()));
					
			ResultSet rstt = spp.executeQuery();

			System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_Escrutinio_Listar_Voto_Pais_Locacion("+id+" + "+beanDetalle.getLocacionId()+")) |||\n----------\n");

			
			DetalleEscrutinioBean beana = null;
			rstt.beforeFirst();
			
			while (rstt.next()) {

				beana = new DetalleEscrutinioBean();
				beana = fillDetalleVotacion(beana, rstt);
				listaa.add(beana);
			 
			}
				
			contadorVotos(listaa,operacion);
			
			
		}
           	
			beanTotal.setTotalVotos(acumulaTotalVotos);
			beanTotal.setTotalVotosValidos(acumulaVotosValidos);
			beanTotal.setTotalVotosBlancos(acumulaVotosBlanco);
			
		rst.close();
		sp.close();
		conn.close();
		
				
		return resultado;
	}
	
	 private void contadorVotos(ArrayList lista,String insertar){
		   
		    int totalVotos=0;
			int votosBlanco=0;
			int votosValidos =0;
			
			
			ArrayList listaDetalle = new ArrayList();
			DetalleEscrutinioBean beanResultadoDetalle = null;
			 
			
			for(int a=0;a<lista.size();a++){
				beanResultadoDetalle = (DetalleEscrutinioBean)lista.get(a);
				
				totalVotos= totalVotos + Integer.parseInt(beanResultadoDetalle.getVotos());				 		
						
				if(beanResultadoDetalle.getIdVotoBlanco().equals("0")){
					 votosBlanco = Integer.parseInt(beanResultadoDetalle.getVotos());
					 if(insertar.equals("insertar")){
						 insertaVotosEscrutinio(beanResultadoDetalle.getOpcion(),beanResultadoDetalle.getLocacionId(),votosBlanco);
					 }
					 votosValidos= totalVotos - votosBlanco;
					 beanResultadoDetalle.setVotosValidos(String.valueOf(votosValidos));
					 beanResultadoDetalle.setTotalVotos(String.valueOf(totalVotos));
					 beanResultadoDetalle.setVotosBlanco(String.valueOf(votosBlanco));
					 
				}else{
					
					votosValidos= totalVotos - votosBlanco;
					beanResultadoDetalle.setVotosValidos(String.valueOf(votosValidos));
					beanResultadoDetalle.setTotalVotos(String.valueOf(totalVotos));
					beanResultadoDetalle.setVotosBlanco(String.valueOf(votosBlanco));
					
					
					if(insertar.equals("insertar")){					
							insertaVotosEscrutinio(beanResultadoDetalle.getOpcion(),beanResultadoDetalle.getLocacionId(),Integer.parseInt(beanResultadoDetalle.getVotos()));
							//votosValidos =0;
					}
					
				}
				
			 
			}
			
			acumulaVotosBlanco = acumulaVotosBlanco + votosBlanco;
			acumulaTotalVotos = acumulaTotalVotos + totalVotos;
			acumulaVotosValidos = acumulaVotosValidos +votosValidos;		
		 
			resultado.add(beanResultadoDetalle);
	 }

	 
	 private void insertaVotosEscrutinio (String opcion, String idLocacion,int votos) {
			
			
			try {
				CallableStatement sp = conn.prepareCall("{call pa_Escrutinio_Insertar_Voto_Escrutinio(?,?,?)}");
				
				sp.setInt(1, Integer.parseInt(opcion));
				sp.setInt(2, Integer.parseInt(idLocacion));
				sp.setInt(3, votos);
				System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_Escrutinio_Insertar_Voto_Escrutinio("+opcion+ " + " +idLocacion+ " + "+votos+")) |||\n----------\n");
				ResultSet rst = sp.executeQuery();
			} catch (NumberFormatException e) {
				 
				e.printStackTrace();
			} catch (SQLException e) {
				 
				e.printStackTrace();
			}
				
		}
		
	private EscrutinioBean fillBean(EscrutinioBean bean, ResultSet rst) {
		try {
			bean.setPaisId(rst.getString("id"));
			bean.setNombrePais(rst.getString("nombre"));
			bean.setTotalLocaciones(rst.getString("locaciones_aperturadas"));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return bean;
	}
	
	private EscrutinioBean fillBeanVotacion(EscrutinioBean bean, ResultSet rst) {
		try {
			
			bean.setNombrePais(rst.getString("pais"));
			bean.setNombreLocacion(rst.getString("nombre"));
			bean.setLocacionId(String.valueOf(rst.getInt("locacion_id")));
			 
		} catch (Exception e) {
			e.printStackTrace();
		}

		return bean;
	}

	private DetalleEscrutinioBean fillDetalleVotacion(DetalleEscrutinioBean bean, ResultSet rst) {
		try {
			 
			bean.setNombreLocacion(rst.getString("nombre"));
			bean.setLocacionId(String.valueOf(rst.getInt("locacion_id")));
			bean.setOpcion(String.valueOf(rst.getString("opcion_id")));
			bean.setVotos(String.valueOf(rst.getString("votos")));
			bean.setIdVotoBlanco(String.valueOf(rst.getString("blanco")));
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return bean;
	}


 
	public EscrutinioBean buscarTotales() throws Exception {
		
		
		acumulaTotalVotos=0;
		acumulaVotosValidos=0;
		acumulaVotosBlanco=0;
		
		System.out.println("En EL PROPIO TOTAL BEAN "+beanTotal.getTotalVotos());
		return beanTotal;
	}

	
 


}