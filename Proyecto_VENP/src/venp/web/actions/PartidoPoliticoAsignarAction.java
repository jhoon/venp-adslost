package venp.web.actions;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import venp.beans.PartidoPoliticoBean;
import venp.services.CandidatoService;
import venp.services.PartidoPoliticoService;
import venp.web.forms.PartidoPoliticoAsignarForm;

public class PartidoPoliticoAsignarAction extends DispatchAction {

	public ActionForward nuevo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		PartidoPoliticoAsignarForm frm = (PartidoPoliticoAsignarForm) form;
		
		PartidoPoliticoBean bean = findByPrimaryKey(frm.getCodigo());
		
		frm.setCodigo(bean.getCodigo() + "");
		frm.setNombre(bean.getNombre());
		frm.setConCandidato(findAll_conPP(bean.getCodigo()));
		frm.setSinCandidato(findAll_sinPP(bean.getCodigo()));
		
		return mapping.findForward("inicio");
	}
	
	public ActionForward asignar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		PartidoPoliticoAsignarForm frm = (PartidoPoliticoAsignarForm) form;
		int partidoPolitico = Integer.parseInt(frm.getCodigo());
		int candidato = Integer.parseInt(frm.getCv_origen());
		
		asignar(partidoPolitico, candidato);
		
		PartidoPoliticoBean bean = findByPrimaryKey(partidoPolitico + "");
		
		frm.setCodigo(bean.getCodigo() + "");
		frm.setNombre(bean.getNombre());
		frm.setConCandidato(findAll_conPP(partidoPolitico));
		frm.setSinCandidato(findAll_sinPP(partidoPolitico));
		
		return mapping.findForward("inicio");
	}

	public ActionForward retirar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		PartidoPoliticoAsignarForm frm = (PartidoPoliticoAsignarForm) form;
		int partidoPolitico = Integer.parseInt(frm.getCodigo());
		int candidato = Integer.parseInt(frm.getCv_destino());
		
		retirar(partidoPolitico, candidato);
		
		PartidoPoliticoBean bean = findByPrimaryKey(partidoPolitico + "");
		
		frm.setCodigo(bean.getCodigo() + "");
		frm.setNombre(bean.getNombre());
		frm.setConCandidato(findAll_conPP(partidoPolitico));
		frm.setSinCandidato(findAll_sinPP(partidoPolitico));
		
		return mapping.findForward("inicio");
	}
	
	public ActionForward cancelar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		return mapping.findForward("listado");
	}
	
	private PartidoPoliticoBean findByPrimaryKey(String codigo) throws Exception {
		PartidoPoliticoService service = new PartidoPoliticoService();
		
		return service.findByPrimaryKey(Integer.parseInt(codigo));
	}

	private ArrayList findAll_conPP(int partidoPolitico_ID) throws Exception {
		CandidatoService service = new CandidatoService();
		
		return service.findAll_conPP(partidoPolitico_ID);
	}

	private ArrayList findAll_sinPP(int partidoPolitico_ID) throws Exception {
		CandidatoService service = new CandidatoService();
		
		return service.findAll_sinPP(partidoPolitico_ID);
	}
	
	private void asignar(int partidoPolitico, int candidato) throws Exception {
		CandidatoService service = new CandidatoService();
		
		service.asignar(partidoPolitico, candidato);
	}
	
	private void retirar(int partidoPolitico, int candidato) throws Exception {
		CandidatoService service = new CandidatoService();
		
		service.retirar(partidoPolitico, candidato);
	}

}