package venp.web.actions;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.validator.DynaValidatorForm;

import venp.services.PartidoPoliticoService;
import venp.services.PerfilService; //import venp.web.forms.ClientePeruDataForm;
import venp.web.forms.PartidoPoliticoListaForm;
import venp.web.forms.PerfilListaForm;

public class PartidoPoliticoListaAction extends DispatchAction {

	public ActionForward borrar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String codigo = request.getParameter("codigo");

		if (codigo != null) {
			borrar(Integer.parseInt(codigo));

			return listar(mapping, form, request, response);
		} else {
			return mapping.findForward("inicio");
		}
	}

	/*
	 * public ActionForward editar(ActionMapping mapping, ActionForm form,
	 * HttpServletRequest request, HttpServletResponse response) throws
	 * Exception {
	 * 
	 * return mapping.findForward("inicio"); }
	 */
	public ActionForward listar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		PartidoPoliticoListaForm frm = (PartidoPoliticoListaForm) form;
		ArrayList lista = findAll();

		frm.setLista(lista);

		return mapping.findForward("inicio");
	}

	private void borrar(int codigo) throws Exception {
		PartidoPoliticoService service = new PartidoPoliticoService();

		service.borrar(codigo);
	}

	private ArrayList findAll() throws Exception {
		PartidoPoliticoService service = new PartidoPoliticoService();
		ArrayList lista = null;

		lista = service.findAll();

		return lista;
	}

	/*
	 * public ActionForward eliminar(ActionMapping mapping, ActionForm form,
	 * HttpServletRequest request, HttpServletResponse response) throws
	 * Exception {
	 * 
	 * String codigo = request.getParameter("keyValue");
	 * 
	 * if (codigo != null) { eliminar(codigo);
	 * 
	 * return inicio(mapping, form, request, response); } else { return
	 * mapping.findForward("inicio"); } }
	 */
	/*
	 * 
	 */
}