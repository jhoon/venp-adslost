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

/**
 * Action que permite establecer cierre de votacion por cada uno de las locaciones
 * @author MCristobal
 *
 */
public class LocacionCerrarVotacionAction extends DispatchAction {

	public ActionForward listar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HttpSession session = request.getSession();
		UsuarioBean bean = (UsuarioBean) session.getAttribute("usuarioBean");
		LocacionCerrarVotacionForm frm = (LocacionCerrarVotacionForm) form;

		ArrayList lista = locacionesPorUsuarioCerrarVotacion(Integer.parseInt(bean.getCodigo()));
		frm.setLista(lista);
				
		frm.setUsuario(bean.getNombreCompleto());

		return mapping.findForward("inicio");
	}

	/**
	 * Cierre de votación
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward cerrarVotacion(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HttpSession session = request.getSession();
		UsuarioBean usuarioBean = (UsuarioBean) session.getAttribute("usuarioBean");
		String codigoLocacion = request.getParameter("keyValue");
		LocacionBean locacionBean = locacionPorUsuarioCerrarVotacion(Integer.parseInt(usuarioBean.getCodigo()), Integer.parseInt(codigoLocacion));
		
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
				if (cerrarVotacionLoc(Integer.parseInt(usuarioBean.getCodigo()), locacionBean.getCodigo())) {
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
	
	/**
	 * Cierra la votacion de una determinada locacion
	 * @param intUsuario
	 * @return
	 * @throws Exception
	 */
	private ArrayList locacionesPorUsuarioCerrarVotacion(int intUsuario) throws Exception {
		LocacionService service = new LocacionService();
		ArrayList lista = null;
		
		lista = service.locacionesPorUsuarioCerrarVotacion(intUsuario);

		return lista;
	}

	/**
	 * Cierra la votacion de una determinada locacion
	 * @param intUsuario
	 * @param intLocacion
	 * @return
	 * @throws Exception
	 */
	private LocacionBean locacionPorUsuarioCerrarVotacion(int intUsuario, int intLocacion) throws Exception {
		LocacionService service = new LocacionService();
		
		return service.locacionPorUsuarioCerrarVotacion(intUsuario, intLocacion);
	}
	
	/**
	 * Cierra la votacion de una determinada locacion
	 * @param intUsuario
	 * @param intLocacion
	 * @return retorna true si se pudo cerrar dicha locacion
	 * @throws Exception
	 */
	private boolean cerrarVotacionLoc (int intUsuario, int intLocacion) throws Exception {
		LocacionService service = new LocacionService();
		
		return service.cerrarVotacion(intUsuario, intLocacion);
	}

}