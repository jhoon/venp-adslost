package venp.web.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.actions.DispatchAction;

import venp.beans.PaisBean;
import venp.services.PaisService;
import venp.web.forms.PaisDatosForm;

public class PaisDatosAction extends DispatchAction {

	public ActionForward cancelar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		return mapping.findForward("listado");
	}

	public ActionForward editar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String strCodigo = request.getParameter("codigo");

		PaisBean bean = findByPrimaryKey(strCodigo);

		PaisDatosForm frm = (PaisDatosForm) form;

		frm.setNuevo(false);
		frm.setCodigo(bean.getCodigo() + "");
		frm.setNombre(bean.getNombre());
		frm.setAbreviatura(bean.getAbreviatura());

		return mapping.findForward("inicio");
	}

	public ActionForward guardar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		PaisDatosForm frm = (PaisDatosForm) form;
	    
		PaisBean bean = new PaisBean();
	    
	    bean.setNombre(frm.getNombre());
	    bean.setAbreviatura(frm.getAbreviatura());
	    
		if (bean.getNombre().equals("")) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage("pais.nombre.empty"));
			
			saveErrors(request, errors);
			return mapping.findForward("inicio");
		}
		else if (bean.getAbreviatura().equals("")) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage("pais.abreviatura.empty"));
			
			saveErrors(request, errors);
			return mapping.findForward("inicio");
		}
		else {
			if (frm.isNuevo()) {
				if (findByName(frm.getNombre())) {
					ActionMessages errors = new ActionMessages();
					errors.add("mensaje", new ActionMessage("pais.nombre.existe"));
					
					saveErrors(request, errors);
					return mapping.findForward("inicio");
				}
				if (findByAbreviatura(frm.getAbreviatura())) {
					ActionMessages errors = new ActionMessages();
					errors.add("mensaje", new ActionMessage("pais.abreviatura.existe"));
					
					saveErrors(request, errors);
					return mapping.findForward("inicio");
				}
				
			    insertar(bean);
			}
		    else {
		    	if (findByName(frm.getNombre(), Integer.parseInt(frm.getCodigo()))) {
					ActionMessages errors = new ActionMessages();
					errors.add("mensaje", new ActionMessage("pais.nombre.existe"));
					
					saveErrors(request, errors);
					return mapping.findForward("inicio");
				}
		    	if (findByAbreviatura(frm.getAbreviatura(), Integer.parseInt(frm.getCodigo()))) {
					ActionMessages errors = new ActionMessages();
					errors.add("mensaje", new ActionMessage("pais.abreviatura.existe"));
					
					saveErrors(request, errors);
					return mapping.findForward("inicio");
				}
				
				bean.setCodigo(Integer.parseInt(frm.getCodigo()));
			    editar(bean);
		    }

			return mapping.findForward("listado");
		}
	}
	
	public ActionForward nuevo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		PaisDatosForm frm = (PaisDatosForm) form;

		frm.setNuevo(true);

		return mapping.findForward("inicio");
	}

	private void editar(PaisBean bean) throws Exception {
		PaisService service = new PaisService();
		service.editar(bean);
	}

	private PaisBean findByPrimaryKey(String codigo) throws Exception {
		PaisService service = new PaisService();
		PaisBean bean = service.findByPrimaryKey(Integer.parseInt(codigo));

		return bean;
	}

	private boolean findByName(String nombre) throws Exception {
		PaisService service = new PaisService();
		
		return service.findByName(nombre);
	}

	private boolean findByName(String nombre, int codigo) throws Exception {
		PaisService service = new PaisService();
		
		return service.findByName(nombre, codigo);
	}

	private boolean findByAbreviatura(String abreviatura) throws Exception {
		PaisService service = new PaisService();
		
		return service.findByAbreviatura(abreviatura);
	}

	private boolean findByAbreviatura(String abreviatura, int codigo) throws Exception {
		PaisService service = new PaisService();
		
		return service.findByAbreviatura(abreviatura, codigo);
	}

	private void insertar(PaisBean bean) throws Exception {
		PaisService service = new PaisService();
		service.insertar(bean);
	}

}