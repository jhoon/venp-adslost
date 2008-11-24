package venp.web.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.actions.DispatchAction;

import venp.services.ElectorService;
import venp.web.forms.ElectorForm;

public class ElectorAction extends DispatchAction {

	@Override
	protected ActionForward unspecified(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ElectorForm frm = (ElectorForm)form;
		frm.reset();
		// service
		ElectorService service = new ElectorService();
		// valida si hay proceso electoral activo
		int idProceso = service.getProcesoActivo();
		if(idProceso == 0) {
			ActionErrors errors = new ActionErrors();
			errors.add("error", new ActionMessage("elector.error.noproceso"));
		    saveErrors(request, errors);
		    frm.reset();
		    return mapping.findForward("errores");
		}
		else {
			// session
			HttpSession s = request.getSession();
			s.setAttribute("idProceso", idProceso);
		}
		return mapping.findForward("buscar_dni");
	}
	
	public ActionForward buscar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// form
		ElectorForm frm = (ElectorForm)form;
		// service
		ElectorService service = new ElectorService();
		// validacion de dni
		ElectorForm bean = service.validarDNI(frm.getDni());
		if(bean == null) {
			ActionErrors errors = new ActionErrors();
			errors.add("dni", new ActionMessage("elector.validadni.error"));
		    saveErrors(request, errors);
		    frm.reset();
		    return mapping.findForward("buscar_dni");
		}
		else {
			// puede votar aun
			if(bean.getEstado().equals("A") || bean.getEstado().equals("L")) {
				HttpSession s = request.getSession();
				int idProceso = ((Integer)s.getAttribute("idProceso")).intValue();
				// valida que este en el rango de horas adecuado
				if(service.isVotoEnRango(idProceso, Integer.parseInt(bean.getId()))) {
					// guarda los datos del elector
					s.setAttribute("Elector", bean);
					// action forward
					return mapping.findForward("validar_pin");
				}
				else {
					ActionErrors errors = new ActionErrors();
					errors.add("error", new ActionMessage("elector.error.hora"));
				    saveErrors(request, errors);
				    return mapping.findForward("errores");
				}
			}
			// ya ha votado
			else {
				ActionErrors errors = new ActionErrors();
				errors.add("dni", new ActionMessage("elector.validaestado.error"));
			    saveErrors(request, errors);
			    frm.reset();
			    return mapping.findForward("buscar_dni");
			}
		}
	}

	public ActionForward validar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// form
		ElectorForm frm = (ElectorForm)form;
		// service
		ElectorService service = new ElectorService();
		// session
		HttpSession s = request.getSession();
		ElectorForm bean = (ElectorForm)s.getAttribute("Elector");
		if(service.isValidPIN(bean.getId(), frm.getPin().trim())) {
			//return mapping.findForward("votar");
			response.sendRedirect("votacion.do?cmd=cedula");
			return null;
		}
		else {
			ActionErrors errors = new ActionErrors();
			errors.add("pin", new ActionMessage("elector.validapin.error"));
		    saveErrors(request, errors);
		    frm.reset();
			return mapping.findForward("validar_pin");
		}
	}
	
}
