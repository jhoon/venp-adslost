package venp.web.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.actions.DispatchAction;

import venp.beans.PerfilBean;
import venp.beans.UsuarioBean;
import venp.services.LogService;
import venp.services.UsuarioService;
import venp.web.forms.LoginForm;

public class LoginAction extends DispatchAction {
	
	@Override
	protected ActionForward unspecified(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		LoginForm frm = (LoginForm) form;
		if(frm.getAcceso() == null)
			frm.setAcceso("admin");
		return mapping.findForward("inicio");
	}

	public ActionForward logueo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ActionErrors errors = new ActionErrors();
		
		LoginForm frm = (LoginForm) form;

		String usuario = frm.getUserName();
		String password = frm.getPassword();

		UsuarioService service = new UsuarioService();
		UsuarioBean bean = service.findByUsuario(usuario);

		// no existe el usuario
		if (bean == null) {
			frm.reset(mapping, request);
			errors.add("error", new ActionMessage("auth.error.baduser"));
		    saveErrors(request, errors);
		} 
		// usuario existente
		else {
			// password y estado OK
			if (password.equals(bean.getPassword()) && bean.getEstado().equals("A")) {
				// se obtiene el tipo de perfil del usuario
				PerfilBean perfil = bean.getPerfil();
				System.out.println("Perfil: " + perfil.getCodigo() + " | Acceso: " + frm.getAcceso());
				// se elimina cualquier session existente
				if (request.isRequestedSessionIdValid()) {
					HttpSession tempSession = request.getSession(false);
					if(tempSession != null) tempSession.invalidate();
				}
				// se hacen los forwards de acuerdo al tipo de usuario
				// Operador de Locacion (Modulo)
				if (perfil.getCodigo() == 3 && frm.getAcceso().equals("location")) {
					LogService serviceLog = new LogService();
					serviceLog.insertar("1", bean.getCodigo());
					
					HttpSession sesion = request.getSession(true);
					sesion.setAttribute("usuarioBean", bean);
					
					return mapping.findForward("locacion");
				}
				// Operador de Central
				if (perfil.getCodigo() == 1 && frm.getAcceso().equals("admin")) {
					LogService serviceLog = new LogService();
					serviceLog.insertar("1", bean.getCodigo());
					
					HttpSession sesion = request.getSession(true);
					sesion.setAttribute("usuarioBean", bean);
					
					return mapping.findForward("central");
				}
				// Operador de Consulado
				if (perfil.getCodigo() == 2 && frm.getAcceso().equals("printer")) {
					LogService serviceLog = new LogService();
					serviceLog.insertar("1", bean.getCodigo());
					
					HttpSession sesion = request.getSession(true);
					sesion.setAttribute("usuarioBean", bean);
					
					response.sendRedirect("consulado.do");
					return null;
				}
				// Usuario desconocido
				frm.setPassword("");
				errors.add("error", new ActionMessage("auth.error.baduser"));
			    saveErrors(request, errors);
			} 
			// ERROR de password o estado
			else {
				frm.setPassword("");
				errors.add("error", new ActionMessage("auth.error.badpass"));
			    saveErrors(request, errors);
			}
		}
		return mapping.findForward("inicio");
	}
	
	public ActionForward salir(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		if (request.isRequestedSessionIdValid()) {
			HttpSession tempSession = request.getSession(false);
			if(tempSession != null) tempSession.invalidate();
		}
		return mapping.findForward("home");
	}
	
	public static boolean isValidSession(HttpServletRequest request) {
		boolean response = false;
		if (request.isRequestedSessionIdValid()) {
			HttpSession tempSession = request.getSession(false);
			if(tempSession != null) {
				UsuarioBean user = (UsuarioBean)tempSession.getAttribute("usuarioBean");
				if (user != null) response = true;
			}
		}
		return response;
	}

}