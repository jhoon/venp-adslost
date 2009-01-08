package venp.web.actions;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.actions.DispatchAction;

import venp.services.PerfilService;
import venp.web.forms.PerfilListaForm;

public class PerfilListaAction extends DispatchAction {

	public ActionForward borrar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String codigo = request.getParameter("codigo");

		if (codigo != null) {
			if (codigo.equals("1") || codigo.equals("2") || codigo.equals("3")) {
				ActionMessages errors = new ActionMessages();
				errors.add("mensaje", new ActionMessage("perfil.noborrar"));
				
				saveErrors(request, errors);
				return mapping.findForward("inicio");
			}
			
			borrar(Integer.parseInt(codigo));

			return listar(mapping, form, request, response);
		} else {
			return mapping.findForward("inicio");
		}
	}

	public ActionForward listar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		PerfilListaForm frm = (PerfilListaForm) form;
		ArrayList lista = findAll();

		frm.setLista(lista);

		return mapping.findForward("inicio");
	}

	private void borrar(int codigo) throws Exception {
		PerfilService service = new PerfilService();

		service.borrar(codigo);
	}

	private ArrayList findAll() throws Exception {
		PerfilService service = new PerfilService();
		ArrayList lista = null;

		lista = service.findAll();

		return lista;
	}
	
}