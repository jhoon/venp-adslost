package venp.web.actions;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import venp.services.PartidoPoliticoService;
import venp.web.forms.PartidoPoliticoListaForm;

public class PartidoPoliticoListaAction extends DispatchAction {

	public ActionForward borrar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String strCodigo = request.getParameter("codigo");

		if (strCodigo != null) {
			borrar(Integer.parseInt(strCodigo));
			return listar(mapping, form, request, response);
		} else {
			return mapping.findForward("inicio");
		}
	}

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
		return service.findAll();
	}

}