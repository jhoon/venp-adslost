package venp.web.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;
import org.apache.struts.actions.DispatchAction;

import venp.listener.SessionVotantesListener;
import venp.services.ElectorService;
import venp.web.forms.ElectorForm;

public class VotacionAction extends DispatchAction {

	@Override
	protected ActionForward unspecified(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return mapping.findForward("inicio");
	}
	
	public ActionForward cedula(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		DynaActionForm frm = (DynaActionForm)form;
		// session
		HttpSession s = request.getSession();
		Integer idProceso = (Integer)s.getAttribute("idProceso");
		// service
		ElectorService service = new ElectorService();
		frm.set("opciones", service.getCedulaOpciones(idProceso.intValue()));
		// vista
		return mapping.findForward("cedula");
	}

	public ActionForward votar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		DynaActionForm frm = (DynaActionForm)form;
		// session
		HttpSession s = request.getSession();
		ElectorForm bean = (ElectorForm)s.getAttribute("Elector");
		// service
		if(bean != null) {
			ElectorService service = new ElectorService();
			bean = service.votar((String)frm.get("voto"), bean);
			// destruimos al elector de la session
			s.removeAttribute("Elector");
			SessionVotantesListener.removerElector(Integer.parseInt(bean.getLocationId()));
			s.invalidate();
			// seteamos en el request al Elector para el reporte final
			request.setAttribute("Elector", bean);
			// mandamos al reporte
			return mapping.findForward("fin");
		}
		else {
			frm.set("voto", null);
			response.sendRedirect("votacion.do");
			return null;
		}		
	}
	
}
