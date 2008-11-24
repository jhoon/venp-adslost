package venp.web.actions;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import venp.beans.UsuarioBean;
import venp.services.LocacionService;
import venp.web.forms.LocacionMonitoreoForm;

public class LocacionMonitoreoAction extends DispatchAction {

	public ActionForward listar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HttpSession session = request.getSession();
		UsuarioBean bean = (UsuarioBean) session.getAttribute("usuarioBean");
		LocacionMonitoreoForm frm = (LocacionMonitoreoForm) form;

		ArrayList lista = locaciones_Por_Usuario_Monitoreo(Integer.parseInt(bean.getCodigo()));
		frm.setLista(lista);
		
		frm.setUsuario(bean.getNombre() + " " + bean.getApePaterno() + " " + bean.getApeMaterno());

		return mapping.findForward("inicio");
	}
	
	private ArrayList locaciones_Por_Usuario_Monitoreo(int usuario) throws Exception {
		LocacionService service = new LocacionService();
		ArrayList lista = null;
		
		lista = service.locaciones_Por_Usuario_Monitoreo(usuario);

		return lista;
	}
	
}