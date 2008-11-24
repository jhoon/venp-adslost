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
import venp.web.forms.LocacionCerrarVotacionForm;
import venp.listener.SessionVotantesListener;

public class LocacionCerrarVotacionAction extends DispatchAction {

	public ActionForward listar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HttpSession session = request.getSession();
		UsuarioBean bean = (UsuarioBean) session.getAttribute("usuarioBean");
		LocacionCerrarVotacionForm frm = (LocacionCerrarVotacionForm) form;

		ArrayList lista = locaciones_Por_Usuario_CerrarVotacion(Integer.parseInt(bean.getCodigo()));
		frm.setLista(lista);
		
		frm.setUsuario(bean.getNombre() + " " + bean.getApePaterno() + " " + bean.getApeMaterno());

		return mapping.findForward("inicio");
	}
	
	public ActionForward cerrarVotacion(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HttpSession session = request.getSession();
		UsuarioBean usuarioBean = (UsuarioBean) session.getAttribute("usuarioBean");
		String codigoLocacion = request.getParameter("keyValue");
		LocacionBean locacionBean = locacion_Por_Usuario_CerrarVotacion(Integer.parseInt(usuarioBean.getCodigo()), Integer.parseInt(codigoLocacion));
		
		if (locacionBean == null) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage("locacion.cerrarVotacion.cerrado"));
			
			saveErrors(request, errors);
		} 
		else if (locacionBean.getDiferenciaFin() > 0) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage("locacion.cerrarVotacion.nopuedecerrar"));
			
			saveErrors(request, errors);
		} 
		else {
			if (SessionVotantesListener.hayVotantesActivos(locacionBean.getCodigo())) {
				if (cerrar_Votacion(Integer.parseInt(usuarioBean.getCodigo()), locacionBean.getCodigo())) {
					ActionMessages errors = new ActionMessages();
					errors.add("mensaje", new ActionMessage("locacion.cerrarVotacion.okCerrarVotacion"));
					
					saveErrors(request, errors);					
				}
				else {
					ActionMessages errors = new ActionMessages();
					errors.add("mensaje", new ActionMessage("locacion.cerrarVotacion.errorCerrarVotacion"));
					
					saveErrors(request, errors);
				}
			} 
			else {
				ActionMessages errors = new ActionMessages();
				errors.add("mensaje", new ActionMessage("locacion.cerrarVotacion.usuarioSesion"));
				
				saveErrors(request, errors);				
			}
		}
		
		return mapping.findForward("listado");
	}
	
	private ArrayList locaciones_Por_Usuario_CerrarVotacion(int usuario) throws Exception {
		LocacionService service = new LocacionService();
		ArrayList lista = null;
		
		lista = service.locaciones_Por_Usuario_CerrarVotacion(usuario);

		return lista;
	}

	private LocacionBean locacion_Por_Usuario_CerrarVotacion(int usuario, int locacion) throws Exception {
		LocacionService service = new LocacionService();
		
		return service.locacion_Por_Usuario_CerrarVotacion(usuario, locacion);
	}
	
	private boolean cerrar_Votacion (int usuario, int locacion) throws Exception {
		LocacionService service = new LocacionService();
		
		return service.cerrar_Votacion(usuario, locacion);
	}

}