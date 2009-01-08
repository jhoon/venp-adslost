package venp.web.actions;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.actions.DispatchAction;

import venp.beans.PerfilBean;
import venp.beans.UsuarioBean;
import venp.services.PerfilService;
import venp.services.UsuarioService;
import venp.web.forms.UsuarioDatosForm;

public class UsuarioDatosAction extends DispatchAction {

	public ActionForward cancelar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		return mapping.findForward("listado");
	}
	
	public ActionForward nuevo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		UsuarioDatosForm frm = (UsuarioDatosForm) form;

		frm.setNuevo(true);
		frm.setPerfil(findAllPerfil());

		return mapping.findForward("inicio");
	}

	public ActionForward editar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String strCodigo = request.getParameter("codigo");
        
		UsuarioBean bean = findByPrimaryKey(strCodigo);
		
		PerfilBean perfilBean = bean.getPerfil();

		UsuarioDatosForm frm = (UsuarioDatosForm) form;

		frm.setNuevo(false);
		frm.setPerfil(findAllPerfil());
		
		frm.setCodigo(bean.getCodigo() + "");
		frm.setPerfilId(perfilBean.getCodigo() + "");
		frm.setNombre(bean.getNombre());
		frm.setPaterno(bean.getApePaterno());
		frm.setMaterno(bean.getApeMaterno());
		frm.setDni(bean.getDni());
		frm.setEmail(bean.getEmail());
		frm.setMovil(bean.getMovil());
		frm.setUsername(bean.getUserName());
		frm.setPassword(bean.getPassword());
		frm.setRepassword(bean.getPassword());

		return mapping.findForward("inicio");
	}

	public ActionForward guardar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		UsuarioDatosForm frm = (UsuarioDatosForm) form;
	    
		UsuarioBean bean = new UsuarioBean();
		PerfilBean perfilBean = new PerfilBean();
		
	    perfilBean.setCodigo(Integer.parseInt(frm.getPerfilId()));
		bean.setPerfil(perfilBean);
	    bean.setNombre(frm.getNombre());
	    bean.setApePaterno(frm.getPaterno());
	    bean.setApeMaterno(frm.getMaterno());
	    bean.setDni(frm.getDni());
	    bean.setEmail(frm.getEmail());
	    bean.setMovil(frm.getMovil());
	    bean.setUserName(frm.getUsername());
	    bean.setPassword(frm.getPassword());
	    
	    frm.setPerfil(findAllPerfil());
	    
	    if (perfilBean.getCodigo() == 0) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage("usuario.perfil.noseleccionado"));
			
			saveErrors(request, errors);
			return mapping.findForward("inicio");
		}
		if (bean.getNombre().equals("")) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage("usuario.nombre.empty"));
			
			saveErrors(request, errors);
			return mapping.findForward("inicio");
		}
		if (bean.getApePaterno().equals("")) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage("usuario.paterno.empty"));
			
			saveErrors(request, errors);
			return mapping.findForward("inicio");
		}
		if (bean.getDni().equals("")) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage("usuario.dni.empty"));
			
			saveErrors(request, errors);
			return mapping.findForward("inicio");
		}
		if (bean.getEmail().equals("")) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage("usuario.email.empty"));
			
			saveErrors(request, errors);
			return mapping.findForward("inicio");
		}
		if (bean.getMovil().equals("")) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage("usuario.movil.empty"));
			
			saveErrors(request, errors);
			return mapping.findForward("inicio");
		}
		if (bean.getUserName().equals("")) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage("usuario.username.empty"));
			
			saveErrors(request, errors);
			return mapping.findForward("inicio");
		}
		if (bean.getPassword().equals("")) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage("usuario.password.empty"));
			
			saveErrors(request, errors);
			return mapping.findForward("inicio");
		}
		if (!(bean.getPassword().equals(frm.getRepassword()))) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage("usuario.password.noigual"));
			
			saveErrors(request, errors);
			return mapping.findForward("inicio");
		}
		if (frm.isNuevo()) {
			if (findByDNI(frm.getDni())) {
				ActionMessages errors = new ActionMessages();
				errors.add("mensaje", new ActionMessage("usuario.dni.existe"));
				
				saveErrors(request, errors);
				return mapping.findForward("inicio");
			}
			if (findByUserName(frm.getUsername())) {
				ActionMessages errors = new ActionMessages();
				errors.add("mensaje", new ActionMessage("usuario.username.existe"));
				
				saveErrors(request, errors);
				return mapping.findForward("inicio");
			}
				
			insertar(bean);			
		}
	    else {
	    	if (findByDNI(frm.getDni(), frm.getCodigo())) {
				ActionMessages errors = new ActionMessages();
				errors.add("mensaje", new ActionMessage("usuario.dni.existe"));
				
				saveErrors(request, errors);
				return mapping.findForward("inicio");
			}
	    	if (findByUserName(frm.getUsername(), frm.getCodigo())) {
				ActionMessages errors = new ActionMessages();
				errors.add("mensaje", new ActionMessage("usuario.username.existe"));
				
				saveErrors(request, errors);
				return mapping.findForward("inicio");
			}
			
			bean.setCodigo(frm.getCodigo());
		    editar(bean);
	    }

		return mapping.findForward("listado");
	}

	private void editar(UsuarioBean bean) throws Exception {
		UsuarioService service = new UsuarioService();
		service.editar(bean);
	}

	private UsuarioBean findByPrimaryKey(String codigo) throws Exception {
		UsuarioService service = new UsuarioService();
		UsuarioBean bean = service.findByPrimaryKey(codigo);

		return bean;
	}

	private boolean findByDNI(String dni) throws Exception {
		UsuarioService service = new UsuarioService();
		
		return service.findByDNI(dni);
	}

	private boolean findByDNI(String dni, String codigo) throws Exception {
		UsuarioService service = new UsuarioService();
		
		return service.findByDNI(dni, codigo);
	}

	private boolean findByUserName(String userName) throws Exception {
		UsuarioService service = new UsuarioService();
		
		return service.findByUserName(userName);
	}

	private boolean findByUserName(String userName, String codigo) throws Exception {
		UsuarioService service = new UsuarioService();
		
		return service.findByUserName(userName, codigo);
	}

	private void insertar(UsuarioBean bean) throws Exception {
		UsuarioService service = new UsuarioService();
		service.insertar(bean);
	}

	private ArrayList findAllPerfil() throws Exception {
		PerfilService service = new PerfilService();
		
		return service.findAll();
	}

}