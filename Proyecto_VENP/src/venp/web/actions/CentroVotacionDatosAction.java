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

import venp.beans.CentroVotacionBean;
import venp.beans.PaisBean;
import venp.beans.ZonaHorariaBean;
import venp.services.CentroVotacionService;
import venp.services.PaisService;
import venp.services.PerfilService;
import venp.services.ZonaHorariaService;
import venp.web.forms.CentroVotacionDatosForm;

public class CentroVotacionDatosAction extends DispatchAction {

	public ActionForward cancelar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		return mapping.findForward("listado");
	}
	
	public ActionForward nuevo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		CentroVotacionDatosForm frm = (CentroVotacionDatosForm) form;

		frm.setNuevo(true);
		frm.setPais(findAll_Pais());
		frm.setZonaHoraria(findAll_ZonaHoraria());

		return mapping.findForward("inicio");
	}

	public ActionForward editar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String codigo = request.getParameter("codigo");

		CentroVotacionBean bean = findByPrimaryKey(codigo);
		PaisBean paisBean = bean.getPais();
		ZonaHorariaBean zhBean = bean.getZonaHoraria();

		CentroVotacionDatosForm frm = (CentroVotacionDatosForm) form;

		frm.setNuevo(false);
		frm.setPais(findAll_Pais());
		frm.setZonaHoraria(findAll_ZonaHoraria());
		
		frm.setCodigo(bean.getCodigo() + "");
		frm.setPaisId(paisBean.getCodigo() + "");
		frm.setZonaHorariaId(zhBean.getCodigo() + "");
		frm.setCodigoPostal(bean.getCodigoPostal());
		frm.setNombre(bean.getNombre());
		frm.setRegion(bean.getRegion());
		frm.setDireccion(bean.getDireccion());

		return mapping.findForward("inicio");
	}

	public ActionForward guardar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		CentroVotacionDatosForm frm = (CentroVotacionDatosForm) form;
	    
		CentroVotacionBean bean = new CentroVotacionBean();
		PaisBean paisBean = new PaisBean();
		ZonaHorariaBean zhBean = new ZonaHorariaBean(); 
	    
		paisBean.setCodigo(Integer.parseInt(frm.getPaisId()));
		zhBean.setCodigo(Integer.parseInt(frm.getZonaHorariaId()));
		
		bean.setPais(paisBean);
		bean.setZonaHoraria(zhBean);
		bean.setCodigoPostal(frm.getCodigoPostal());
	    bean.setNombre(frm.getNombre());
        bean.setRegion(frm.getRegion());
        bean.setDireccion(frm.getDireccion());
        
		frm.setPais(findAll_Pais());
		frm.setZonaHoraria(findAll_ZonaHoraria());
	    
        if (paisBean.getCodigo() == 0) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage("cv.pais.empty"));
			
			saveErrors(request, errors);
			return mapping.findForward("inicio");
		}
        if (zhBean.getCodigo() == 0) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage("cv.zh.empty"));
			
			saveErrors(request, errors);
			return mapping.findForward("inicio");
		}
		if (bean.getCodigoPostal().equals("")) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage("cv.cp.empty"));
			
			saveErrors(request, errors);
			return mapping.findForward("inicio");
		}
		if (bean.getNombre().equals("")) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage("cv.nombre.empty"));
			
			saveErrors(request, errors);
			return mapping.findForward("inicio");
		}
		if (bean.getRegion().equals("")) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage("cv.region.empty"));
			
			saveErrors(request, errors);
			return mapping.findForward("inicio");
		}
		if (bean.getDireccion().equals("")) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage("cv.direccion.empty"));
			
			saveErrors(request, errors);
			return mapping.findForward("inicio");
		}
		else {
			if (frm.isNuevo()) {
				if (findByName(bean.getNombre(), paisBean.getCodigo())) {
					ActionMessages errors = new ActionMessages();
					errors.add("mensaje", new ActionMessage("cv.nombre.existe"));
					
					saveErrors(request, errors);
					return mapping.findForward("inicio");
				}
				
			    insertar(bean);
			}
		    else {
		    	if (findByName(frm.getNombre(), paisBean.getCodigo(), Integer.parseInt(frm.getCodigo()))) {
					ActionMessages errors = new ActionMessages();
					errors.add("mensaje", new ActionMessage("cv.nombre.existe"));
					
					saveErrors(request, errors);
					return mapping.findForward("inicio");
				}
				
				bean.setCodigo(Integer.parseInt(frm.getCodigo()));
			    editar(bean);
				
		    }

			return mapping.findForward("listado");
		}
	}

	private void editar(CentroVotacionBean bean) throws Exception {
		CentroVotacionService service = new CentroVotacionService();
		service.editar(bean);
	}

	private CentroVotacionBean findByPrimaryKey(String codigo) throws Exception {
		CentroVotacionService service = new CentroVotacionService();
		CentroVotacionBean bean = service.findByPrimaryKey(Integer.parseInt(codigo));

		return bean;
	}

	private boolean findByName(String nombre, int codigoPais) throws Exception {
		CentroVotacionService service = new CentroVotacionService();
		
		return service.findByName(nombre, codigoPais);
	}

	private boolean findByName(String nombre, int codigoPais, int codigo) throws Exception {
		CentroVotacionService service = new CentroVotacionService();
		
		return service.findByName(nombre, codigoPais, codigo);
	}

	private void insertar(CentroVotacionBean bean) throws Exception {
		CentroVotacionService service = new CentroVotacionService();
		service.insertar(bean);
	}

	private ArrayList findAll_Pais() throws Exception {
		PaisService service = new PaisService();
		
		return service.findAll();
	}

	private ArrayList findAll_ZonaHoraria() throws Exception {
		ZonaHorariaService service = new ZonaHorariaService();
		
		return service.findAll();
	}

}