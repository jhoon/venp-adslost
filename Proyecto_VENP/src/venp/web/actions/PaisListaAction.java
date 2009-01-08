package venp.web.actions;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import venp.services.PaisService;
import venp.web.forms.PaisListaForm;

public class PaisListaAction extends DispatchAction {

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

		PaisListaForm frm = (PaisListaForm) form;
		ArrayList lista = findAll();

		frm.setLista(lista);

		return mapping.findForward("inicio");
	}

	private void borrar(int codigo) throws Exception {
		PaisService service = new PaisService();

		service.borrar(codigo);
	}

	private ArrayList findAll() throws Exception {
		PaisService service = new PaisService();
		ArrayList lista = null;

		lista = service.findAll();

		return lista;
	}

}