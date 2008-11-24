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
import venp.web.forms.CentroVotacionAsignarForm;

public class CentroVotacionAsignarAction extends DispatchAction {

	public ActionForward nuevo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		CentroVotacionAsignarForm frm = (CentroVotacionAsignarForm) form;
		
		frm.setPais(findAll_Pais());
		frm.setProcesoElectoral(findAll_PE());
		
		return mapping.findForward("inicio");
	}
	
	public ActionForward buscar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		CentroVotacionAsignarForm frm = (CentroVotacionAsignarForm) form;
		
		int procesoElectoral = Integer.parseInt(frm.getProcesoElectoral_id());
		int codigoPais = Integer.parseInt(frm.getPais_id());
		
		frm.setS_pais_id(codigoPais + "");
		frm.setS_pe_id(procesoElectoral + "");
		
		frm.setPais(findAll_Pais());
		frm.setProcesoElectoral(findAll_PE());
		frm.setCv_cLocacion(findAll_CV_cLocacion(procesoElectoral, codigoPais));
		frm.setCv_sLocacion(findAll_CV_sLocacion(procesoElectoral, codigoPais));

		frm.setNombre_pais(frm.getPais_Name(codigoPais));
		frm.setNombre_pe(frm.getProcesoElectoral_Name(procesoElectoral));

		return mapping.findForward("inicio");
	}
	
	public ActionForward asignar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		CentroVotacionAsignarForm frm = (CentroVotacionAsignarForm) form;

		int procesoElectoral = Integer.parseInt(frm.getS_pe_id());
		int codigoPais = Integer.parseInt(frm.getS_pais_id());
		int codigoCV = Integer.parseInt(frm.getCv_origen());
		
		asignar(procesoElectoral, codigoCV);
		
		frm.setS_pais_id(codigoPais + "");
		frm.setS_pe_id(procesoElectoral + "");
		
		frm.setPais(findAll_Pais());
		frm.setProcesoElectoral(findAll_PE());
		frm.setCv_cLocacion(findAll_CV_cLocacion(procesoElectoral, codigoPais));
		frm.setCv_sLocacion(findAll_CV_sLocacion(procesoElectoral, codigoPais));

		frm.setNombre_pais(frm.getPais_Name(codigoPais));
		frm.setNombre_pe(frm.getProcesoElectoral_Name(procesoElectoral));
		
		return mapping.findForward("inicio");
	}
	
	public ActionForward retirar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		CentroVotacionAsignarForm frm = (CentroVotacionAsignarForm) form;

		int procesoElectoral = Integer.parseInt(frm.getS_pe_id());
		int codigoPais = Integer.parseInt(frm.getS_pais_id());
		int codigoCV = Integer.parseInt(frm.getCv_destino());
		
		retirar(procesoElectoral, codigoCV);
		
		frm.setS_pais_id(codigoPais + "");
		frm.setS_pe_id(procesoElectoral + "");
		
		frm.setPais(findAll_Pais());
		frm.setProcesoElectoral(findAll_PE());
		frm.setCv_cLocacion(findAll_CV_cLocacion(procesoElectoral, codigoPais));
		frm.setCv_sLocacion(findAll_CV_sLocacion(procesoElectoral, codigoPais));

		frm.setNombre_pais(frm.getPais_Name(codigoPais));
		frm.setNombre_pe(frm.getProcesoElectoral_Name(procesoElectoral));
		
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

	private ArrayList findAll_Pais() throws Exception {
		PaisService service = new PaisService();
		
		return service.findAll();
	}

	private ArrayList findAll_CV_cLocacion(int procesoElectoral, int codigoPais) throws Exception {
		CentroVotacionService service = new CentroVotacionService();
		
		return service.findAll_conLocacion(procesoElectoral, codigoPais);
	}

	private ArrayList findAll_CV_sLocacion(int procesoElectoral, int codigoPais) throws Exception {
		CentroVotacionService service = new CentroVotacionService();
		
		return service.findAll_sinLocacion(procesoElectoral, codigoPais);
	}
	
	private void asignar(int procesoElectoral, int centroVotacion) throws Exception {
		CentroVotacionService service = new CentroVotacionService();
		
		service.asignar(procesoElectoral, centroVotacion);
	}
	
	private void retirar(int procesoElectoral, int centroVotacion) throws Exception {
		CentroVotacionService service = new CentroVotacionService();
		
		service.retirar(procesoElectoral, centroVotacion);
	}

}