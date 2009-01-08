package venp.web.actions;

import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.actions.DispatchAction;

import venp.beans.ProcesoElectoralBean;
import venp.services.ProcesoElectoralService;
import venp.web.forms.ProcesoElectoralListaForm;

public class ProcesoElectoralListaAction extends DispatchAction {
		
	public ActionForward listar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ProcesoElectoralListaForm frm = (ProcesoElectoralListaForm) form;
		ActionMessages errors = new ActionMessages();
		ArrayList lista = listarTodos();
		if (lista.size()==0){
			errors.add("error", new ActionMessage("procesoElectoral.error.noProcesos"));
		    saveErrors(request, errors);
		}
		else{
			frm.setLista(lista);
		}
		
		return mapping.findForward("inicio");
	}

	public ActionForward activar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String strId = request.getParameter("keyValue");
		ProcesoElectoralBean bean = new ProcesoElectoralBean();
		bean = buscarId(strId);
		
		ActionMessages errors = new ActionMessages();

		ArrayList lista = new ArrayList();
		lista = listarTodos();

		Iterator list = lista.listIterator();

		/* VALIDANDO QUE NO HAYA NI UNO ACTIVO */
		while (list.hasNext()) {
			ProcesoElectoralBean aux = (ProcesoElectoralBean) list.next();
			if (aux.getEstado().equals("A")) {
				
				errors.add("error", new ActionMessage("procesoElectoral.error.procesoStillActivated"));
			    saveErrors(request, errors);
			    
				return mapping.findForward("inicio");
			}
		}

		/* VALIDANDO QUE NO SEA UN PROCESO ELECTORAL ACTIVO */
		if (bean.getEstado().equals("C")) {
			if (strId != null) {
				activarId(strId);
				
				errors.add("error", new ActionMessage("procesoElectoral.error.procesoActivated"));
			    saveErrors(request, errors);
				
				return listar(mapping, form, request, response);
			} else {
				return mapping.findForward("inicio");
			}
		} else {
			errors.add("error", new ActionMessage("procesoElectoral.error.procesoNotActivated"));
		    saveErrors(request, errors);
						
			return mapping.findForward("inicio");
		}
	}
	
	public ActionForward anular(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String strId = request.getParameter("keyValue");
		ProcesoElectoralBean bean = new ProcesoElectoralBean();
		bean = buscarId(strId);
		
		ActionMessages errors = new ActionMessages();

		/* VALIDANDO QUE NO SEA UN PROCESO ELECTORAL ACTIVO */
		if (bean.getEstado().equals("A")) {
			if (strId != null) {
				anularId(strId);
				errors.add("error", new ActionMessage("procesoElectoral.error.procesoCanceled"));
			    saveErrors(request, errors);				
				return listar(mapping, form, request, response);
			} else {
				return mapping.findForward("inicio");
			}
		} else {
			errors.add("error", new ActionMessage("procesoElectoral.error.procesoNotCanceled"));
		    saveErrors(request, errors);
			return mapping.findForward("inicio");
		}
	}

	private ArrayList listarTodos() throws Exception {
		ProcesoElectoralService service = new ProcesoElectoralService();

		ArrayList lista = null;

		lista = service.buscarTodos();

		return lista;
	}

	private void activarId(String codigo) throws Exception {
		ProcesoElectoralService service = new ProcesoElectoralService();

		service.activarProcesoElectoral(Integer.parseInt(codigo));

	}

	private void anularId(String codigo) throws Exception {
		ProcesoElectoralService service = new ProcesoElectoralService();

		service.anularProcesoElectoral(Integer.parseInt(codigo));

	}

	private ProcesoElectoralBean buscarId(String codigo) throws Exception {
		ProcesoElectoralService service = new ProcesoElectoralService();

		return service.findByPrimaryKey(Integer.parseInt(codigo));
	}

}