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
import venp.services.ProcesoElectoralService;
import venp.web.forms.ElectorForm;

public class ElectorAction extends DispatchAction {

	/**
	 * corresponde a votacionBuscarDni.jsp. Sirve para validar si 
	 * existe algún proceso electoral activo, de existir, carga el 
	 * Id del proceso en la sesión. De lo contrario, se mostrará 
	 * un mensaje de error en el jsp.
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return redirecciona hacia votacionBuscarDni.jsp(buscar_dni), para validarlo.
	 * @throws Exception
	 */
	protected ActionForward unspecified(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ElectorForm frm = (ElectorForm)form;
		frm.reset();
		ElectorService service = new ElectorService();
		int intIdProceso = service.getProcesoActivo();
		if(intIdProceso == 0) {
			ActionErrors errors = new ActionErrors();
			errors.add("error", new ActionMessage("elector.error.noproceso"));
		    saveErrors(request, errors);
		    frm.reset();
		    return mapping.findForward("errores");
		}
		else {
			HttpSession session = request.getSession();
			session.setAttribute("intIdProceso", intIdProceso);
		}
		return mapping.findForward("buscar_dni");
	}
	
	/**
	 * corresponde a la validación del DNI ingresado en votacionBuscarDni.jsp,
	 * valida si puede votar. De poder, guardará sus datos en la sesión y lo 
	 * enviará a la siguiente pantalla (votacionValidarPin.jsp).
	 * Las razones por las cuales no podrá votar pueden tener relación al horario
	 * o a la previa realización del voto.
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return envía al usuario a la página para el ingreso del PIN
	 * @throws Exception
	 */
	public ActionForward buscar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ElectorForm frm = (ElectorForm)form;
		ElectorService service = new ElectorService();
		ElectorForm bean = service.validarDNI(frm.getDni());
		if(bean == null) {
			ActionErrors errors = new ActionErrors();
			errors.add("dni", new ActionMessage("elector.validadni.error"));
		    saveErrors(request, errors);
		    frm.reset();
		    return mapping.findForward("buscar_dni");
		}
		else {
			if(bean.getEstado().equals("A") || bean.getEstado().equals("L")) {
				HttpSession session = request.getSession();
				int intIdProceso = ((Integer)session.getAttribute("intIdProceso")).intValue();
				if(service.isVotoEnRango(intIdProceso, Integer.parseInt(bean.getId()))) {
					session.setAttribute("Elector", bean);
					return mapping.findForward("validar_pin");
				}
				else {
					ActionErrors errors = new ActionErrors();
					errors.add("error", new ActionMessage("elector.error.hora"));
				    saveErrors(request, errors);
				    return mapping.findForward("errores");
				}
			}
			else {
				ActionErrors errors = new ActionErrors();
				errors.add("dni", new ActionMessage("elector.validaestado.error"));
			    saveErrors(request, errors);
			    frm.reset();
			    return mapping.findForward("buscar_dni");
			}
		}
	}

	/**
	 * corresponde a la validación del Pin (votacionValidarPin.jsp)
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward validar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// form
		ElectorForm frm = (ElectorForm)form;
		// service
		ElectorService service = new ElectorService();
		// session
		HttpSession session = request.getSession();
		ElectorForm bean = (ElectorForm)session.getAttribute("Elector");
		
		if(service.isValidPIN(bean.getId(), frm.getPin().trim())) {
			int intIdProceso = ((Integer)session.getAttribute("intIdProceso")).intValue();
			ProcesoElectoralService service2 = new ProcesoElectoralService();
			int intTiempoSession = service2.findByPrimaryKey(intIdProceso).getTiempoSesion();
			session.setMaxInactiveInterval(intTiempoSession * 60);
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