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

public class EmpadronamientoAction extends DispatchAction {

	protected ActionForward unspecified(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ElectorForm frm = (ElectorForm) form;
		frm.reset();
		// Instancia del servicio
		ElectorService service = new ElectorService();
		// validacion de proceso electoral activo
		int intProcesoId = service.getEmpadronamientoActivo();
		// Si esta en el rango, puede empadronarse
		if (intProcesoId != 0) {
			// session
			HttpSession s = request.getSession();
			s.setAttribute("idProceso", intProcesoId);
			// datos para la vista
			if (frm.getConsuladoList() == null)
				frm.setConsulados(service.getConsulados(intProcesoId));
			if (frm.getPaises() == null)
				frm.setPaises(service.getPaises(intProcesoId));
			// action
			return mapping.findForward("inicio");
		}
		ActionErrors errors = new ActionErrors();
		errors.add("error", new ActionMessage("emp.error.noexiste"));
		saveErrors(request, errors);
		return mapping.findForward("menu");
	}

	public ActionForward menu(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return mapping.findForward("menu");
	}

	public ActionForward registrar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ElectorForm frm = (ElectorForm) form;
		// Intancia del servicio
		ElectorService service = new ElectorService();
		// se validan los datos del empadronado (no duplucidad del DNI)
		ElectorForm bean = service.validarDNI(frm.getDni());
		if (bean == null) {
			// se graban los datos del empadronado.
			service.registrar(frm);
			frm.reset();
			return mapping.findForward("fin");
		}
		// error, el dni ya estaba registrado
		ActionErrors errors = new ActionErrors();
		errors.add("error", new ActionMessage("emp.error.dniregistrado"));
		saveErrors(request, errors);
		// redireccion.
		return mapping.findForward("inicio");
	}

	public ActionForward pais(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return mapping.findForward("inicio");
	}

}
