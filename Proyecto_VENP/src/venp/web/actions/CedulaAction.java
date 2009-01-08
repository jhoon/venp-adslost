package venp.web.actions;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import venp.services.CedulaService;

public class CedulaAction extends DispatchAction {

	protected ActionForward unspecified(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return listar(mapping, form, request, response);
	}
	
	public ActionForward listar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CedulaService service = new CedulaService();
		ArrayList cedulas = service.listarCedulas();
		request.setAttribute("listaCedulas", cedulas);
		return mapping.findForward("lista");
	}
	
	public ActionForward editar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return mapping.findForward("datos");
	}
	
	public ActionForward mostrar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return listar(mapping, form, request, response);
	}
	
	public ActionForward borrar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return listar(mapping, form, request, response);
	}
	
	public ActionForward crear(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return mapping.findForward("datos");
	}
	
	public ActionForward guardar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return listar(mapping, form, request, response);
	}

}
