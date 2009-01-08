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
		
		frm.setUsuario(findAllUsuario());
		frm.setProcesoElectoral(findAllPE());
		
		return mapping.findForward("inicio");
	}
	
	public ActionForward buscar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		UsuarioAsignarForm frm = (UsuarioAsignarForm) form;
		
		int intProcesoElectoral = Integer.parseInt(frm.getProcesoElectoralId());
		int intCodigoUsuario = Integer.parseInt(frm.getUsuarioId());

		frm.setSelectedPeId(intProcesoElectoral + "");
		frm.setSelectedUserId(intCodigoUsuario + "");
		
		frm.setUsuario(findAllUsuario());
		frm.setProcesoElectoral(findAllPE());
		frm.setPais(findAllPais(intProcesoElectoral));

		frm.setSelectedPeNombre(frm.getProcesoElectoralName(intProcesoElectoral));
		frm.setSelectedUserNombre(frm.getUsuarioName(intCodigoUsuario));
		
		frm.setCvcLocacion(null);
		frm.setCvsLocacion(null);

		return mapping.findForward("inicio");
	}
	
	public ActionForward pais(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		UsuarioAsignarForm frm = (UsuarioAsignarForm) form;
		
		int intProcesoElectoral = Integer.parseInt(frm.getProcesoElectoralId());
		int intCodigoUsuario = Integer.parseInt(frm.getUsuarioId());
		int intCodigoPais = Integer.parseInt(frm.getPaisId());

		frm.setSelectedPeId(intProcesoElectoral + "");
		frm.setSelectedUserId(intCodigoUsuario + "");
		frm.setPaisId("0");
		
		frm.setUsuario(findAllUsuario());
		frm.setProcesoElectoral(findAllPE());
		frm.setPais(findAllPais(intProcesoElectoral));

		frm.setSelectedPeNombre(frm.getProcesoElectoralName(intProcesoElectoral));
		frm.setSelectedUserNombre(frm.getUsuarioName(intCodigoUsuario));
		
		frm.setCvcLocacion(findAllCVConLocacion(intProcesoElectoral, intCodigoUsuario, intCodigoPais));
		frm.setCvsLocacion(findAllCVSinLocacion(intProcesoElectoral, intCodigoUsuario, intCodigoPais));

		return mapping.findForward("inicio");
	}
	
	public ActionForward asignar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		UsuarioAsignarForm frm = (UsuarioAsignarForm) form;

		int intProcesoElectoral = Integer.parseInt(frm.getProcesoElectoralId());
		int intCodigoUsuario = Integer.parseInt(frm.getUsuarioId());
		int intCodigoPais = Integer.parseInt(frm.getPaisId());
		int intCodigoCV = Integer.parseInt(frm.getCvOrigen());

		asignar(intProcesoElectoral, intCodigoUsuario, intCodigoCV);
		
		frm.setSelectedPeId(intProcesoElectoral + "");
		frm.setSelectedUserId(intCodigoUsuario + "");
		frm.setPaisId(intCodigoPais + "");
		
		frm.setUsuario(findAllUsuario());
		frm.setProcesoElectoral(findAllPE());
		frm.setPais(findAllPais(intProcesoElectoral));

		frm.setSelectedPeNombre(frm.getProcesoElectoralName(intProcesoElectoral));
		frm.setSelectedUserNombre(frm.getUsuarioName(intCodigoUsuario));
		
		frm.setCvcLocacion(findAllCVConLocacion(intProcesoElectoral, intCodigoUsuario, intCodigoPais));
		frm.setCvsLocacion(findAllCVSinLocacion(intProcesoElectoral, intCodigoUsuario, intCodigoPais));
		

		return mapping.findForward("inicio");
	}

	public ActionForward retirar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		UsuarioAsignarForm frm = (UsuarioAsignarForm) form;
		
		int intProcesoElectoral = Integer.parseInt(frm.getProcesoElectoralId());
		int intCodigoUsuario = Integer.parseInt(frm.getUsuarioId());
		int intCodigoPais = Integer.parseInt(frm.getPaisId());
		int intCodigoCV = Integer.parseInt(frm.getCvDestino());

		retirar(intProcesoElectoral, intCodigoUsuario, intCodigoCV);
		
		frm.setSelectedPeId(intProcesoElectoral + "");
		frm.setSelectedUserId(intCodigoUsuario + "");
		frm.setPaisId(intCodigoPais + "");
		
		frm.setUsuario(findAllUsuario());
		frm.setProcesoElectoral(findAllPE());
		frm.setPais(findAllPais(intProcesoElectoral));

		frm.setSelectedPeNombre(frm.getProcesoElectoralName(intProcesoElectoral));
		frm.setSelectedUserNombre(frm.getUsuarioName(intCodigoUsuario));
		
		frm.setCvcLocacion(findAllCVConLocacion(intProcesoElectoral, intCodigoUsuario, intCodigoPais));
		frm.setCvsLocacion(findAllCVSinLocacion(intProcesoElectoral, intCodigoUsuario, intCodigoPais));

		return mapping.findForward("inicio");
	}
	
	public ActionForward cancelar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		return mapping.findForward("listado");
	}
	
	private ArrayList findAllPE() throws Exception {
		ProcesoElectoralService service = new ProcesoElectoralService();
		
		return service.findAllCreado();
	}

	private ArrayList findAllPais(int procesoElectoral) throws Exception {
		PaisService service = new PaisService();
		
		return service.findAllLocacion(procesoElectoral);
	}

	private ArrayList findAllUsuario() throws Exception {
		UsuarioService service = new UsuarioService();
		
		return service.findAllByLocacion();
	}
	
	private ArrayList findAllCVConLocacion(int procesoElectoral, int codigoUser, int codigoPais) throws Exception {
		CentroVotacionService service = new CentroVotacionService();
		
		return service.findAll_conUsuario(procesoElectoral, codigoUser, codigoPais);
	}

	private ArrayList findAllCVSinLocacion(int procesoElectoral, int codigoUser, int codigoPais) throws Exception {
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