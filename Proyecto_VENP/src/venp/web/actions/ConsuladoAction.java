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

public class ConsuladoAction extends DispatchAction {

	protected ActionForward unspecified(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		if (!LoginAction.isValidSession(request))
			return mapping.findForward("login");
		ElectorForm frm = (ElectorForm) form;
		frm.reset();
		return mapping.findForward("busqueda");
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		if (!LoginAction.isValidSession(request))
			return mapping.findForward("login");
		// busca por el dni enviado
		ElectorForm frm = (ElectorForm) form;
		ElectorService service = new ElectorService();
		ElectorForm elector = service.validarDNI(frm.getDni());
		if (elector != null) {
			// validacion de proceso electoral activo
			int idProceso = service.getEmpadronamientoActivo();
			// Si esta en el rango, puede empadronarse
			if (idProceso != 0) {
				if (elector.getEstado().equals("A")
						|| elector.getEstado().equals("E")) { // L
					// session
					HttpSession s = request.getSession();
					s.setAttribute("idProceso", idProceso);
					// datos para la vista
					if (frm.getConsuladoList() == null)
						frm.setConsulados(service.getConsulados(idProceso));
					if (frm.getPaises() == null)
						frm.setPaises(service.getPaises(idProceso));
					// action
					frm.setId(elector.getId());
					frm.setNombre(elector.getNombre());
					frm.setPaterno(elector.getPaterno());
					frm.setMaterno(elector.getMaterno());
					frm.setLocationId(elector.getLocationId());
					frm.setPaisId(elector.getPaisId());
					frm.setDni(elector.getDni());
					frm.setEmail(elector.getEmail());
					return mapping.findForward("verificacion");
				} else {
					ActionErrors errors = new ActionErrors();
					errors.add("error", new ActionMessage(
							"elector.validaestado.error"));
					saveErrors(request, errors);
					frm.reset();
					return mapping.findForward("busqueda");
				}
			}
			ActionErrors errors = new ActionErrors();
			errors.add("error", new ActionMessage("emp.error.noexiste"));
			saveErrors(request, errors);
			return mapping.findForward("busqueda");
		}
		return empadronar(mapping, form, request, response);
	}

	public ActionForward empadronar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ElectorForm frm = (ElectorForm) form;
		// Instancia del servicio
		ElectorService service = new ElectorService();
		// validacion de proceso electoral activo
		int idProceso = service.getEmpadronamientoActivo();
		// Si esta en el rango, puede empadronarse
		if (idProceso != 0) {
			// session
			HttpSession s = request.getSession();
			s.setAttribute("idProceso", idProceso);
			// datos para la vista
			if (frm.getConsuladoList() == null)
				frm.setConsulados(service.getConsulados(idProceso));
			if (frm.getPaises() == null)
				frm.setPaises(service.getPaises(idProceso));
			// action
			return mapping.findForward("formulario");
		}
		ActionErrors errors = new ActionErrors();
		errors.add("error", new ActionMessage("emp.error.noexiste"));
		saveErrors(request, errors);
		return mapping.findForward("busqueda");
	}

	public ActionForward registrar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ElectorForm frm = (ElectorForm) form;
		// Intancia del servicio
		ElectorService service = new ElectorService();
		// se validan los datos del empadronado (no duplucidad del DNI)
		ElectorForm bean;
		if (frm.getId().equals("0"))
			bean = service.validarDNI(frm.getDni());
		else
			bean = null;
		if (bean == null) {
			// se graban los datos del empadronado.
			service.registrar(frm);
			// frm.reset();
			return mapping.findForward("verificacion");
		}
		// error, el dni ya estaba registrado
		ActionErrors errors = new ActionErrors();
		errors.add("error", new ActionMessage("emp.error.dniregistrado"));
		saveErrors(request, errors);
		// redireccion.
		return mapping.findForward("formulario");
	}

	public ActionForward pais(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return mapping.findForward("formulario");
	}

}
