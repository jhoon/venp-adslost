package venp.web.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.actions.DispatchAction;

import venp.beans.PerfilBean;
import venp.services.PerfilService;
import venp.web.forms.PerfilDatosForm;

public class PerfilDatosAction extends DispatchAction {

	public ActionForward cancelar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		return mapping.findForward("listado");
	}

	public ActionForward editar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String codigo = request.getParameter("codigo");
		
		if (codigo != null) {
			if (codigo.equals("1") || codigo.equals("2") || codigo.equals("3")) {
				ActionMessages errors = new ActionMessages();
				errors.add("mensaje", new ActionMessage("perfil.noeditar"));
				
				saveErrors(request, errors);
				return mapping.findForward("listado");
			}
			
			PerfilBean bean = findByPrimaryKey(codigo);
	
			PerfilDatosForm frm = (PerfilDatosForm) form;
	
			frm.setNuevo(false);
			frm.setCodigo(bean.getCodigo() + "");
			frm.setNombre(bean.getNombre());
			frm.setDescripcion(bean.getDescripcion());
			

			return mapping.findForward("inicio");
		}
		
		return mapping.findForward("listado");
	}

	public ActionForward guardar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		PerfilDatosForm frm = (PerfilDatosForm) form;
	    
	    PerfilBean bean = new PerfilBean();
	    
	    bean.setNombre(frm.getNombre());
	    bean.setDescripcion(frm.getDescripcion());
	    
		if (bean.getNombre().equals("")) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage("perfil.nombre.empty"));
			
			saveErrors(request, errors);
			return mapping.findForward("inicio");
		}
		else if (bean.getDescripcion().equals("")) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage("perfil.descripcion.empty"));
			
			saveErrors(request, errors);
			return mapping.findForward("inicio");
		}
		else {
			if (frm.isNuevo()) {
				if (findByName(frm.getNombre())) {
					ActionMessages errors = new ActionMessages();
					errors.add("mensaje", new ActionMessage("perfil.nombre.existe"));
					
					saveErrors(request, errors);
					return mapping.findForward("inicio");
				}
				else {
			    	insertar(bean);
				}	
			}
		    else {
		    	if (findByName(frm.getNombre(), Integer.parseInt(frm.getCodigo()))) {
					ActionMessages errors = new ActionMessages();
					errors.add("mensaje", new ActionMessage("perfil.nombre.existe"));
					
					saveErrors(request, errors);
					return mapping.findForward("inicio");
				}
				else {
					bean.setCodigo(Integer.parseInt(frm.getCodigo()));
				    editar(bean);
				}
		    }

			return mapping.findForward("listado");
		}
	}
	
	public ActionForward nuevo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		PerfilDatosForm frm = (PerfilDatosForm) form;

		frm.setNuevo(true);

		return mapping.findForward("inicio");
	}

	private void editar(PerfilBean bean) throws Exception {
		PerfilService service = new PerfilService();
		service.editar(bean);
	}

	private PerfilBean findByPrimaryKey(String codigo) throws Exception {
		PerfilService service = new PerfilService();
		PerfilBean bean = service.findByPrimaryKey(Integer.parseInt(codigo));

		return bean;
	}

	private boolean findByName(String nombre) throws Exception {
		PerfilService service = new PerfilService();
		
		return service.findByName(nombre);
	}

	private boolean findByName(String nombre, int codigo) throws Exception {
		PerfilService service = new PerfilService();
		
		return service.findByName(nombre, codigo);
	}

	private void insertar(PerfilBean bean) throws Exception {
		PerfilService service = new PerfilService();
		service.insertar(bean);
	}

}