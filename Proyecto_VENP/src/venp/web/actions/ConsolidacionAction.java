package venp.web.actions;

import java.math.BigDecimal; 
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
import venp.services.ConsolidacionService; 
import venp.web.forms.ConsolidacionForm;
 

public class ConsolidacionAction extends DispatchAction {

		public ActionForward listarConsolidacion(ActionMapping mapping, ActionForm form,
				HttpServletRequest request, HttpServletResponse response)
				throws Exception {
			
				ActionErrors errors = new ActionErrors();
				ConsolidacionForm frm = (ConsolidacionForm) form;
				ArrayList resultado = null;
	
				ConsolidacionService service = new ConsolidacionService();
				boolean bolEstado = service.procesoCerrado();
			 
				/*Por estado false entiende que ya se cerro el proceso electoral*/
				
				if(bolEstado==false){
				
					ConsolidacionService services = new ConsolidacionService();
					ArrayList lista = new ArrayList(); 
					lista = services.listarResultados();
					
					if(lista.size()==0){
					 
						frm.setListaConsolidacion(lista);
						errors.add("errors", new ActionMessage("listaConsolidacion.nohaydatos"));
						saveErrors(request, errors);
					
					}else{
							ConsolidacionBean bean=null;
							BigDecimal BigTotal = new BigDecimal("0");
							for (int i = 0; i < lista.size(); i++) {
								BigDecimal BigDato = null;	
								bean = (ConsolidacionBean)lista.get(i);
								BigDato = new BigDecimal(bean.getResultadoOpcion());
								BigTotal =BigTotal.add(BigDato);
							}
						
							double dblResultados =0;
							for (int i = 0; i < lista.size(); i++) {
								bean = (ConsolidacionBean)lista.get(i);
								dblResultados = ((Double.parseDouble(bean.getResultadoOpcion())/Double.parseDouble(BigTotal.toString()))*100);							
					
									if(String.valueOf((dblResultados)).length()==3){
										bean.setPorcentajeObtenido(String.valueOf((dblResultados)).substring(0,3)+"%");
									}else if(String.valueOf((dblResultados)).length()==4){
										bean.setPorcentajeObtenido(String.valueOf((dblResultados)).substring(0,4)+"%");
									}else if(String.valueOf((dblResultados)).length()==5){
										bean.setPorcentajeObtenido(String.valueOf((dblResultados)).substring(0,5)+"%");
									}else{
										bean.setPorcentajeObtenido(String.valueOf((dblResultados)).substring(0,6)+"%");
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