package venp.ibatis.mysql;

 
import java.util.ArrayList;
import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;
import venp.beans.ConsolidacionBean; 
import venp.dao.entities.ConsolidacionDAO;
 

public class ConsolidacionMySqlMapDAO extends SqlMapDaoTemplate implements ConsolidacionDAO {
	
 
	public ConsolidacionMySqlMapDAO(DaoManager daoManager) {
		super(daoManager);		
	}
	
	private ArrayList obtenerResultados(){
		
		 ArrayList lista = new ArrayList();		 
		 lista =  (ArrayList<ConsolidacionBean>)queryForList("Consolidacion.listarResultados",null);
		 return lista;
     }

	public ArrayList procCerrado() throws Exception{	 		 
		  
		 return  (ArrayList<ConsolidacionBean>)queryForList("Consolidacion.procesoCerrado",null);
		 	 
	}
 
	public ArrayList locacionesAbiertas(){	 
		 		  
		  return  (ArrayList<ConsolidacionBean>)queryForList("Consolidacion.locacionesAbiertas",null);
	}
	
	private void cierraProcesoElectoral(){
		
		 this.update("Consolidacion.cierraProcesoElectoral",null);		 
	}
	
	public ArrayList listarResultados() throws Exception {
		
		ArrayList resultado=new ArrayList();
		resultado = obtenerResultados();
		return resultado;
		
	}	

	 
	public boolean procesoCerrado() throws Exception {
		boolean bolProceso=false;
		int intLocaciones=0;	
	
		ArrayList procesoAbierto = new ArrayList();
		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_Consolidacion_Proceso_Electoral_Cerrado()) |||\n----------\n");
		procesoAbierto=procCerrado();
		System.out.println("PROCESP ABIERTO " + procesoAbierto.size());
	 
		ArrayList locacionesAbiertas = new ArrayList();
		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_Consolidacion_Contar_Locaciones_Abiertas()) |||\n----------\n");
		locacionesAbiertas=locacionesAbiertas();	
		
		if(locacionesAbiertas.size()>0){
			ConsolidacionBean bean= (ConsolidacionBean)locacionesAbiertas.get(0);
			intLocaciones = Integer.parseInt(bean.getTotalLocacionesAbiertas());			 
		}		
		
		if(intLocaciones>0){
			bolProceso = true;
			
		}else{
			if(procesoAbierto.size()>0){
				System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_Consolidacion_Cierra_Proceso_Electoral()) |||\n----------\n");				
				cierraProcesoElectoral();
				bolProceso = false;
			}
		}  
		return bolProceso;
	}	
}