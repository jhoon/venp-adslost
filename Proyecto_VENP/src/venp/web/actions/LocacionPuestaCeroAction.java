package venp.web.actions;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.actions.DispatchAction;

import venp.beans.LocacionBean;
import venp.beans.UsuarioBean;
import venp.services.LocacionService;
import venp.web.forms.LocacionPuestaCeroForm;

public class LocacionPuestaCeroAction extends DispatchAction {

	public ActionForward listar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HttpSession session = request.getSession();
		UsuarioBean bean = (UsuarioBean) session.getAttribute("usuarioBean");
		LocacionPuestaCeroForm frm = (LocacionPuestaCeroForm) form;
		
		frm.setOk("");
		ArrayList lista = locaciones_Activas_Por_Usuario_PuestaCero(Integer.parseInt(bean.getCodigo()));
		frm.setListaLocaciones(lista);
		
		frm.setUsuario(bean.getNombre() + " " + bean.getApePaterno() + " " + bean.getApeMaterno());

		return mapping.findForward("inicio");
	}
	
	public ActionForward puestaCero(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HttpSession session = request.getSession();
		UsuarioBean usuarioBean = (UsuarioBean) session.getAttribute("usuarioBean");
		String codigoLocacion = request.getParameter("keyValue");
		LocacionBean locacionBean = locacion_Activa_Por_Usuario_PuestaCero(Integer.parseInt(usuarioBean.getCodigo()), Integer.parseInt(codigoLocacion));
		LocacionPuestaCeroForm frm = (LocacionPuestaCeroForm) form;
		
		frm.setOk("");
		if (locacionBean == null) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage("locacion.puestaCero.apertura"));
			
			saveErrors(request, errors);
		} 
		else if (locacionBean.getDiferenciaInicio() > 0) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage("locacion.puestaCero.nopuedeempezar"));
			
			saveErrors(request, errors);
		}
		else if (locacionBean.getDiferenciaInicioFin() < 0) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage("locacion.puestaCero.excesotiempo"));
			
			saveErrors(request, errors);
		}
		else {
			if (puesta_Cero(Integer.parseInt(usuarioBean.getCodigo()), Integer.parseInt(codigoLocacion))) {
				ActionMessages errors = new ActionMessages();
				errors.add("mensaje", new ActionMessage("locacion.puestaCero.okPuestaCero"));
				
				saveErrors(request, errors);
				
				frm.setOk("ok");
				frm.setNombreLocacion(locacionBean.getNombreCentroVotacion());
				System.out.println("JAJAJAJJAJA");
			}
			else {
				ActionMessages errors = new ActionMessages();
				errors.add("mensaje", new ActionMessage("locacion.puestaCero.errorPuestaCero"));
				
				saveErrors(request, errors);
			}
		}

		frm.setListaLocaciones(locaciones_Activas_Por_Usuario_PuestaCero(Integer.parseInt(usuarioBean.getCodigo())));
		
		return mapping.findForward("inicio");
	}
	
	private ArrayList locaciones_Activas_Por_Usuario_PuestaCero(int usuario) throws Exception {
		LocacionService service = new LocacionService();
		ArrayList lista = null;

		lista = service.locaciones_Activas_Por_Usuario_PuestaCero(usuario);

		return lista;
	}
	
	private LocacionBean locacion_Activa_Por_Usuario_PuestaCero(int usuario, int locacion) throws Exception {
		LocacionService service = new LocacionService();

		LocacionBean bean = service.locacion_Activa_Por_Usuario_PuestaCero(usuario, locacion);

		return bean;
	}
	
	private boolean puesta_Cero(int usuario, int locacion) throws Exception {
		LocacionService service = new LocacionService();
		
		return service.puesta_Cero(usuario, locacion);
	}

}