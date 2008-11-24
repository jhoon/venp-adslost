package venp.web.actions;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.validator.DynaValidatorForm;

import venp.services.CandidatoService;
import venp.services.PartidoPoliticoService;
import venp.services.PerfilService; //import venp.web.forms.ClientePeruDataForm;
import venp.web.forms.CandidatoListaForm;
import venp.web.forms.PartidoPoliticoListaForm;
import venp.web.forms.PerfilListaForm;

public class CandidatoListaAction extends DispatchAction {

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

	 
	public ActionForward listar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		CandidatoListaForm frm = (CandidatoListaForm) form;
		ArrayList lista = findAll();

		frm.setLista(lista);

		return mapping.findForward("inicio");
	}

	private void borrar(int codigo) throws Exception {
		CandidatoService service = new CandidatoService();

		service.borrar(codigo);
	}

	private ArrayList findAll() throws Exception {
		CandidatoService service = new CandidatoService();
		ArrayList lista = null;

		lista = service.findAll();

		return lista;
	}

}