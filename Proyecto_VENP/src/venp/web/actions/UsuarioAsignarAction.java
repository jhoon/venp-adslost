package venp.web.actions;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import venp.services.CentroVotacionService;
import venp.services.PaisService;
import venp.services.ProcesoElectoralService;
import venp.services.UsuarioService;
import venp.web.forms.UsuarioAsignarForm;

public class UsuarioAsignarAction extends DispatchAction {

	public ActionForward nuevo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		UsuarioAsignarForm frm = (UsuarioAsignarForm) form;
		
		frm.setUsuario(findAll_Usuario());
		frm.setProcesoElectoral(findAll_PE());
		
		return mapping.findForward("inicio");
	}
	
	public ActionForward buscar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		UsuarioAsignarForm frm = (UsuarioAsignarForm) form;
		
		int procesoElectoral = Integer.parseInt(frm.getProcesoElectoral_id());
		int codigoUsuario = Integer.parseInt(frm.getUsuario_id());

		frm.setS_pe_id(procesoElectoral + "");
		frm.setS_user_id(codigoUsuario + "");
		
		frm.setUsuario(findAll_Usuario());
		frm.setProcesoElectoral(findAll_PE());
		frm.setPais(findAll_Pais(procesoElectoral));

		frm.setS_pe_nombre(frm.getProcesoElectoral_Name(procesoElectoral));
		frm.setS_user_nombre(frm.getUsuario_Name(codigoUsuario));
		
		frm.setCv_cLocacion(null);
		frm.setCv_sLocacion(null);

		return mapping.findForward("inicio");
	}
	
	public ActionForward pais(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		UsuarioAsignarForm frm = (UsuarioAsignarForm) form;
		
		int procesoElectoral = Integer.parseInt(frm.getS_pe_id());
		int codigoUsuario = Integer.parseInt(frm.getS_user_id());
		int codigoPais = Integer.parseInt(frm.getPais_id());

		frm.setS_pe_id(procesoElectoral + "");
		frm.setS_user_id(codigoUsuario + "");
		frm.setPais_id("0");
		
		frm.setUsuario(findAll_Usuario());
		frm.setProcesoElectoral(findAll_PE());
		frm.setPais(findAll_Pais(procesoElectoral));

		frm.setS_pe_nombre(frm.getProcesoElectoral_Name(procesoElectoral));
		frm.setS_user_nombre(frm.getUsuario_Name(codigoUsuario));
		
		frm.setCv_cLocacion(findAll_CV_cLocacion(procesoElectoral, codigoUsuario, codigoPais));
		frm.setCv_sLocacion(findAll_CV_sLocacion(procesoElectoral, codigoUsuario, codigoPais));

		return mapping.findForward("inicio");
	}
	
	public ActionForward asignar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		UsuarioAsignarForm frm = (UsuarioAsignarForm) form;
		
		int procesoElectoral = Integer.parseInt(frm.getS_pe_id());
		int codigoUsuario = Integer.parseInt(frm.getS_user_id());
		int codigoPais = Integer.parseInt(frm.getPais_id());
		int codigoCV = Integer.parseInt(frm.getCv_origen());

		asignar(procesoElectoral, codigoUsuario, codigoCV);
		
		frm.setS_pe_id(procesoElectoral + "");
		frm.setS_user_id(codigoUsuario + "");
		frm.setPais_id(codigoPais + "");
		
		frm.setUsuario(findAll_Usuario());
		frm.setProcesoElectoral(findAll_PE());
		frm.setPais(findAll_Pais(procesoElectoral));

		frm.setS_pe_nombre(frm.getProcesoElectoral_Name(procesoElectoral));
		frm.setS_user_nombre(frm.getUsuario_Name(codigoUsuario));
		
		frm.setCv_cLocacion(findAll_CV_cLocacion(procesoElectoral, codigoUsuario, codigoPais));
		frm.setCv_sLocacion(findAll_CV_sLocacion(procesoElectoral, codigoUsuario, codigoPais));

		return mapping.findForward("inicio");
	}

	public ActionForward retirar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		UsuarioAsignarForm frm = (UsuarioAsignarForm) form;
		
		int procesoElectoral = Integer.parseInt(frm.getS_pe_id());
		int codigoUsuario = Integer.parseInt(frm.getS_user_id());
		int codigoPais = Integer.parseInt(frm.getPais_id());
		int codigoCV = Integer.parseInt(frm.getCv_destino());

		retirar(procesoElectoral, codigoUsuario, codigoCV);
		
		frm.setS_pe_id(procesoElectoral + "");
		frm.setS_user_id(codigoUsuario + "");
		frm.setPais_id(codigoPais + "");
		
		frm.setUsuario(findAll_Usuario());
		frm.setProcesoElectoral(findAll_PE());
		frm.setPais(findAll_Pais(procesoElectoral));

		frm.setS_pe_nombre(frm.getProcesoElectoral_Name(procesoElectoral));
		frm.setS_user_nombre(frm.getUsuario_Name(codigoUsuario));
		
		frm.setCv_cLocacion(findAll_CV_cLocacion(procesoElectoral, codigoUsuario, codigoPais));
		frm.setCv_sLocacion(findAll_CV_sLocacion(procesoElectoral, codigoUsuario, codigoPais));

		return mapping.findForward("inicio");
	}
	
	public ActionForward cancelar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		return mapping.findForward("listado");
	}
	
	private ArrayList findAll_PE() throws Exception {
		ProcesoElectoralService service = new ProcesoElectoralService();
		
		return service.findAll_Creado();
	}

	private ArrayList findAll_Pais(int procesoElectoral) throws Exception {
		PaisService service = new PaisService();
		
		return service.findAll_Locacion(procesoElectoral);
	}

	private ArrayList findAll_Usuario() throws Exception {
		UsuarioService service = new UsuarioService();
		
		return service.findAll_Locacion();
	}
	
	private ArrayList findAll_CV_cLocacion(int procesoElectoral, int codigoUser, int codigoPais) throws Exception {
		CentroVotacionService service = new CentroVotacionService();
		
		return service.findAll_conUsuario(procesoElectoral, codigoUser, codigoPais);
	}

	private ArrayList findAll_CV_sLocacion(int procesoElectoral, int codigoUser, int codigoPais) throws Exception {
		CentroVotacionService service = new CentroVotacionService();
		
		return service.findAll_sinUsuario(procesoElectoral, codigoUser, codigoPais);
	}
	
	private void asignar(int procesoElectoral, int codigoUsuario, int centroVotacion) throws Exception {
		UsuarioService service = new UsuarioService();
		
		service.asignar(procesoElectoral, codigoUsuario, centroVotacion);
	}
	
	private void retirar(int procesoElectoral, int codigoUsuario, int centroVotacion) throws Exception {
		UsuarioService service = new UsuarioService();
		
		service.retirar(procesoElectoral, codigoUsuario, centroVotacion);
	}

}