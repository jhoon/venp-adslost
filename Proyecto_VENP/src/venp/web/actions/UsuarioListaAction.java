package venp.web.actions;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import venp.services.UsuarioService;
import venp.web.forms.UsuarioListaForm;

public class UsuarioListaAction extends DispatchAction {

	public ActionForward borrar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String strCodigo = request.getParameter("codigo");

		if (strCodigo != null) {
			borrar(strCodigo);

			return listar(mapping, form, request, response);
		} else {
			return mapping.findForward("inicio");
		}
	}

	public ActionForward listar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		UsuarioListaForm frm = (UsuarioListaForm) form;
		ArrayList lista = findAll();

		frm.setLista(lista);

		return mapping.findForward("inicio");
	}

	private void borrar(String codigo) throws Exception {
		UsuarioService service = new UsuarioService();

		service.borrar(codigo);
	}

	private ArrayList findAll() throws Exception {
		UsuarioService service = new UsuarioService();
		ArrayList lista = null;

		lista = service.findAll();

		return lista;
	}

}