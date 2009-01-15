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

/**
 * Action de Monitorio de cada una de las locaciones
 * @author MCristobal
 *
 */
public class LocacionMonitoreoAction extends DispatchAction {

	
	public ActionForward listar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HttpSession session = request.getSession();
		UsuarioBean bean = (UsuarioBean) session.getAttribute("usuarioBean");
		LocacionMonitoreoForm frm = (LocacionMonitoreoForm) form;

		ArrayList lista = locacionesPorUsuarioMonitoreo(Integer.parseInt(bean.getCodigo()));
		frm.setLista(lista);
		
		frm.setUsuario(bean.getNombreCompleto());

		return mapping.findForward("inicio");
	}
	
	/**
	 * Monitoreo de transacciones
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private ArrayList locacionesPorUsuarioMonitoreo(int usuario) throws Exception {
		LocacionService service = new LocacionService();
		ArrayList lista = null;
		
		lista = service.locacionesPorUsuarioMonitoreo(usuario);

		return lista;
	}
	
}