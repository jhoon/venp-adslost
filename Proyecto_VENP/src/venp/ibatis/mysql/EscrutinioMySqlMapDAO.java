package venp.ibatis.mysql;

import java.math.BigInteger;  
import java.util.ArrayList;
import java.util.HashMap; 
import venp.beans.DetalleEscrutinioBean;
import venp.beans.EscrutinioBean; 
import venp.dao.entities.EscrutinioDAO;
import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;
 
 
public class EscrutinioMySqlMapDAO extends SqlMapDaoTemplate implements EscrutinioDAO{

	public EscrutinioMySqlMapDAO(DaoManager daoManager) {
		super(daoManager);
	}
	
	int intAcumulaTotalVotos;
	int intAcumulaVotosValidos;
	int intAcumulaVotosBlanco;
	
	EscrutinioBean beanTotal =new EscrutinioBean();
	ArrayList resultado=new ArrayList();
		

	/*devuelve todos los paises que tienen locaciones participantes*/
	
	public ArrayList listarLocacionesCerradas() throws Exception {
		ArrayList lista = new ArrayList();			 
		
		lista = locacionesCerradas();		
		EscrutinioBean bean;
		
		for(int i=0; i<lista.size();i++){
			bean = (EscrutinioBean)lista.get(i);			
		}
		
		ArrayList locacionHabiles;
		locacionHabiles = comprobarLocacionesCerradas(lista);
		ArrayList locacionEscrutinio;
		locacionEscrutinio = comprobarFaltaEscrutinio(locacionHabiles);
		
		return locacionEscrutinio;	 
	}

	/*devuelve las locaciones que si han cerrado su participacion*/
	
	private ArrayList comprobarLocacionesCerradas(ArrayList locaciones){
		
		EscrutinioBean bean;
		for(int i=0; i<locaciones.size();i++){
				bean = (EscrutinioBean)locaciones.get(i);
			try {
				
				System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_Escrutinio_Listar_Locaciones_Cerradas("+bean.getNombrePais()+")) |||\n----------\n");
				
				EscrutinioBean escrutinioBean = locacionCerradaPais(bean.getPaisId());			
			
				if (escrutinioBean!=null) { 
					if(bean.getTotalLocaciones().equals(String.valueOf(escrutinioBean.getLocacionesCerradas()))){
					   bean.setLocacionesCerradas(escrutinioBean.getLocacionesCerradas());
					   bean.setLocacionCerrada(true);
					   bean.setMensaje("escrutinio");					   
					}else{
						bean.setLocacionCerrada(false);
						bean.setMensaje("faltaVotacion");
					}
				}
						
			} catch (Exception e) {
				
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
			 
				System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_Escrutinio_Listar_Locaciones_Escrutinio("+bean.getNombrePais()+")) |||\n----------\n");
				
				EscrutinioBean escrutinioBean = faltaEscrutinio(bean.getPaisId());							
			 
				BigInteger resultado = null;
				BigInteger comparar = new BigInteger ("0");
				
				if (escrutinioBean!=null) { 
					resultado = new BigInteger(String.valueOf(escrutinioBean.getConEscrutinio()));														 
					if(resultado.compareTo(comparar)==1 && bean.getLocacionCerrada()==true){  
					   bean.setLocacionCerrada(false);
					   bean.setMensaje("escrutinio");					  
				}
				}
						
			} catch (Exception e) {
				 
				e.printStackTrace();
			}			
		}					
		return locacion;	
	}
	

	
	public ArrayList listarDetalleEscrutinio(String strId) throws Exception {
		 resultado=new ArrayList();
		 ArrayList totalDatos=null;
		 String strOperacion="";  
		 ArrayList lista = new ArrayList(); 
		 lista = detalleEscrutinio(strId);	 
		  
		 	ArrayList listaa =null;
			for(int i=0;i<lista.size();i++){
				listaa = new ArrayList();
				EscrutinioBean beanDetalle = null;
				beanDetalle = (EscrutinioBean)lista.get(i);
	
				ArrayList<DetalleEscrutinioBean> resultados = new ArrayList<DetalleEscrutinioBean>();
				resultados = listarVotoPaisLocacion(strId,beanDetalle.getLocacionId());			     

				System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_Escrutinio_Listar_Escrutinio_Pais_Locacion("+strId+" + "+beanDetalle.getLocacionId()+")) |||\n----------\n");
	
				contadorVotos(resultados,strOperacion);			
			}
			
			beanTotal.setTotalVotos(intAcumulaTotalVotos);		 
			beanTotal.setTotalVotosValidos(intAcumulaVotosValidos);
			beanTotal.setTotalVotosBlancos(intAcumulaVotosBlanco);
			strOperacion = null;
		 
		 return resultado;
		 
	}
	
	public ArrayList listarDetalleLocacion(String strId) throws Exception {
		 
		String strOperacion ="insertar";
		ArrayList totalDatos=null;	 
		
		ArrayList list = new ArrayList();		 
		list = detalleEscrutinio(strId);

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_Escrutinio_Listar_Voto_Pais("+strId+")) |||\n----------\n");
			
		ArrayList listaa =null;
		for(int i=0;i<list.size();i++){
			listaa = new ArrayList();
			EscrutinioBean beanDetalle = null;
			beanDetalle = (EscrutinioBean)list.get(i);			
			System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_Escrutinio_Listar_Voto_Pais_Locacion("+strId+" + "+beanDetalle.getLocacionId()+")) |||\n----------\n");
			
			listaa=listarVotoPorLocacion(strId,beanDetalle.getLocacionId());				 
			contadorVotos(listaa,strOperacion);
			
		}           	
			beanTotal.setTotalVotos(intAcumulaTotalVotos);
			beanTotal.setTotalVotosValidos(intAcumulaVotosValidos);
			beanTotal.setTotalVotosBlancos(intAcumulaVotosBlanco);
			strOperacion =" ";
			
		return resultado;
	}

	private void contadorVotos(ArrayList lista,String strInsertar){
		
	    int intTotalVotos=0;
		int intVotosBlanco=0;
		int intVotosValidos =0;		
	
		ArrayList listaDetalle = new ArrayList();
		DetalleEscrutinioBean beanResultadoDetalle = null;
		 
		
		for(int a=0;a<lista.size();a++){
			beanResultadoDetalle = (DetalleEscrutinioBean)lista.get(a);
			
			intTotalVotos= intTotalVotos + Integer.parseInt(beanResultadoDetalle.getVotos());				 		
					
			if(beanResultadoDetalle.getIdVotoBlanco().equals("0")){
				 intVotosBlanco = Integer.parseInt(beanResultadoDetalle.getVotos());
				 if(strInsertar.equals("insertar")){
					 insertaVotosEscrutinio(beanResultadoDetalle.getOpcion(),beanResultadoDetalle.getLocacionId(),intVotosBlanco);
				 }
				 intVotosValidos= intTotalVotos - intVotosBlanco;
				 beanResultadoDetalle.setVotosValidos(String.valueOf(intVotosValidos));
				 beanResultadoDetalle.setTotalVotos(String.valueOf(intTotalVotos));
				 beanResultadoDetalle.setVotosBlanco(String.valueOf(intVotosBlanco));
				 
			}else{
				
				intVotosValidos= intTotalVotos - intVotosBlanco;
				beanResultadoDetalle.setVotosValidos(String.valueOf(intVotosValidos));
				beanResultadoDetalle.setTotalVotos(String.valueOf(intTotalVotos));
				beanResultadoDetalle.setVotosBlanco(String.valueOf(intVotosBlanco));
				
				
				if(strInsertar.equals("insertar")){					
						insertaVotosEscrutinio(beanResultadoDetalle.getOpcion(),beanResultadoDetalle.getLocacionId(),Integer.parseInt(beanResultadoDetalle.getVotos()));						 
				}
				
			}
		}
		 
		intAcumulaVotosBlanco = intAcumulaVotosBlanco + intVotosBlanco;
		intAcumulaTotalVotos = intAcumulaTotalVotos + intTotalVotos;
		intAcumulaVotosValidos = intAcumulaVotosValidos +intVotosValidos;
		resultado.add(beanResultadoDetalle);
 }
	
	 private void insertaVotosEscrutinio (String strOpcion, String strIdLocacion,int intVotos) {
						
			try {				 
				insertaVoto(strOpcion,strIdLocacion,intVotos);			 
				System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_Escrutinio_Insertar_Voto_Escrutinio("+strOpcion+ " + " +strIdLocacion+ " + "+intVotos+")) |||\n----------\n");			 
			} catch (NumberFormatException e) {				 
				e.printStackTrace();
			} catch (Exception e) {				 
				e.printStackTrace();
			}				
		}
	 
	 /*devuelve los votos totalizados por locacion*/
	public EscrutinioBean buscarTotales() throws Exception {
		
		intAcumulaTotalVotos=0;
		intAcumulaVotosValidos=0;
		intAcumulaVotosBlanco=0;
		return beanTotal;		 
	}
 
	 
	private ArrayList listarVotoPorLocacion(String strId, String strLocacion){
		 HashMap mapPais = new HashMap();
		 mapPais.put("paisId",new Integer(strId));
		 mapPais.put("locacionId",new Integer(strLocacion));
		 
		 ArrayList lista = new ArrayList();		 
		 lista =  (ArrayList<DetalleEscrutinioBean>)queryForList("Escrutinio.listarVotoPaisLocacion",mapPais);		 
		 return lista;
	}
	 
	
	private ArrayList listarVotoPaisLocacion(String strId, String strLocacion){
		 HashMap mapPais = new HashMap();
		 mapPais.put("paisId",new Integer(strId));
		 mapPais.put("locacionId",new Integer(strLocacion));
		 
		 ArrayList listax = new ArrayList();		 
		 listax =  (ArrayList<DetalleEscrutinioBean>)queryForList("Escrutinio.listarEscrutinioPaisLocacion",mapPais); 
		 return listax;
	}
	 

	public ArrayList locacionesCerradas() throws Exception {	
		 
		return (ArrayList<EscrutinioBean>)queryForList("Escrutinio.listarLocacionesCerradas",null);
		
	}
	
	private ArrayList detalleEscrutinio(String strId){
		
		 HashMap map = new HashMap();
		 map.put("id",strId);	 		 
		 ArrayList lista = new ArrayList();		 
		 lista =  (ArrayList<EscrutinioBean>)queryForList("Escrutinio.listarDetalleEscrutinio",map);
		 return lista;
	}
	
	public EscrutinioBean locacionCerradaPais(String strPaisId) throws Exception {
		
		HashMap mapPais = new HashMap();
		mapPais.put("paisId",new Integer(strPaisId));		 
		return (EscrutinioBean)this.queryForObject("Escrutinio.comprobarLocacionesCerradas", mapPais);
		
	}
	
	public EscrutinioBean faltaEscrutinio(String strPaisId) throws Exception {
		HashMap mapPais = new HashMap();
		 mapPais.put("faltaEscrutinio",new Integer(strPaisId));
		 
		return (EscrutinioBean)this.queryForObject("Escrutinio.comprobarFaltaEscrutinio", mapPais);
		
	}
	  
	 private void insertaVoto(String strOpcion, String strLocacion, int intVotos){
		 
		 	HashMap mapVotos = new HashMap(); 
		 	mapVotos.put("opcion",new Integer(strOpcion));
		 	mapVotos.put("locacion",new Integer(strLocacion));
		 	mapVotos.put("votos",new Integer(intVotos));
		 
		 	this.insert("Escrutinio.insertaVotos",mapVotos);
	 }
} 