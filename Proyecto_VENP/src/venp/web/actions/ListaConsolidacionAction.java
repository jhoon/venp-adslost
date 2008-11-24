package venp.web.actions;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
 
import org.apache.struts.actions.DispatchAction;
 
 
import venp.beans.ConsolidacionBean;
import venp.beans.DetalleEscrutinioBean;
import venp.beans.EscrutinioBean;
import venp.services.ConsolidacionService;
import venp.services.EscrutinioService; 
import venp.web.forms.ListaConsolidacionForm;
import venp.web.forms.ListaEscrutinioForm;
 
 

public class ListaConsolidacionAction extends DispatchAction {

	public ActionForward listarConsolidacion(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		ActionErrors errors = new ActionErrors();
		ListaConsolidacionForm frm = (ListaConsolidacionForm) form;
		ArrayList resultado = null;

		ConsolidacionService service = new ConsolidacionService();
		boolean estado = service.procesoCerrado();
		 
		//Por estado false entiende que ya se cerro el proceso electoral
		if(estado==false){
			
			ConsolidacionService services = new ConsolidacionService();
			ArrayList lista = new ArrayList(); 
			lista = services.listarResultados();
			 
			if(lista.size()==0){
				 
					frm.setListaConsolidacion(lista);
					errors.add("errors", new ActionMessage("listaConsolidacion.nohaydatos"));
				    saveErrors(request, errors);
				
			}else{
					ConsolidacionBean bean=null;
					BigDecimal total = new BigDecimal("0");
					for (int i = 0; i < lista.size(); i++) {
						BigDecimal dato = null;	
						bean = (ConsolidacionBean)lista.get(i);
						dato = new BigDecimal(bean.getResultado());
						total =total.add(dato);
					}
					
					double resultados =0;
					for (int i = 0; i < lista.size(); i++) {
						bean = (ConsolidacionBean)lista.get(i);
						resultados = ((Double.parseDouble(bean.getResultado())/Double.parseDouble(total.toString()))*100);
						
						if(String.valueOf((resultados)).length()==3){
							bean.setPorcentaje(String.valueOf((resultados)).substring(0,3)+"%");
						}else if(String.valueOf((resultados)).length()==4){
							bean.setPorcentaje(String.valueOf((resultados)).substring(0,4)+"%");
						}else if(String.valueOf((resultados)).length()==5){
							bean.setPorcentaje(String.valueOf((resultados)).substring(0,5)+"%");
						}else{
							bean.setPorcentaje(String.valueOf((resultados)).substring(0,6)+"%");
						}
					}
					
					frm.setListaConsolidacion(lista);
			}
			
			
		}else{
				ArrayList lista = new ArrayList(); 
				frm.setListaConsolidacion(lista);
				errors.add("errors", new ActionMessage("listaConsolidacion.error.procesoNoCerrado"));
			    saveErrors(request, errors);
		    
		}	
	
		 return mapping.findForward("inicio");
}
}