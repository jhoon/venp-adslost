package venp.web.actions;

import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.util.MessageResources;

import venp.listener.SessionVotantesListener;
import venp.services.ElectorService;
import venp.utils.VenpMail;
import venp.web.forms.ElectorForm;

public class VotacionAction extends DispatchAction {

	/**
	 * envía todos los request no especificados a votacionBuscarDni.jsp
	 * mediante su alias
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	protected ActionForward unspecified(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return mapping.findForward("inicio");
	}
	
	/**
	 * obtiene los parámetros de la cédula tales como los candidatos
	 * y sus datos correspondientes
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return envía a votacionCedula.jsp
	 * @throws Exception
	 */
	public ActionForward cedula(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		DynaActionForm frm = (DynaActionForm)form;
		HttpSession session = request.getSession();
		Integer intIdProceso = (Integer)session.getAttribute("intIdProceso");
		ElectorService service = new ElectorService();
		frm.set("opciones", service.getCedulaOpciones(intIdProceso.intValue()));
		return mapping.findForward("cedula");
	}

	/**
	 * hace efectivo el voto realizado en votacionCedula.jsp
	 * se elimina la sesión para evitar que los datos del elector se
	 * mantengan en la máquina, pero se envían en el request para 
	 * poder elabrorar la vonstancia de voto realizado
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward votar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		DynaActionForm frm = (DynaActionForm)form;
		HttpSession session = request.getSession();
		ElectorForm bean = (ElectorForm)session.getAttribute("Elector");
		if(bean != null) {
			ElectorService service = new ElectorService();
			bean = service.votar((String)frm.get("voto"), bean);
			session.removeAttribute("Elector");
			SessionVotantesListener.removerElector(Integer.parseInt(bean.getLocationId()));
			request.setAttribute("Elector", bean);
			return mapping.findForward("fin");
		}
		else {
			frm.set("voto", null);
			response.sendRedirect("votacion.do");
			return null;
		}		
	}
	
	/**
	 * evalúa el tipo de constancia, si se enviará o solamente se imprimirá
	 * (posteriormente se contempla la generación de un archivo pdf)
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward confirm(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ElectorService service = new ElectorService();
		ElectorForm bean = service.validarDNI((String)request.getParameter("elector"));
		String strMode = request.getParameter("mode");
		bean.setFechaSufragio((String)request.getParameter("fecha"));
		bean.setHoraSufragio((String)request.getParameter("hora"));
		bean.setGmtSufragio((String)request.getParameter("gmt"));
		if(strMode.equals("mail")){			
			// obtener el texto a enviar
			String strHtml = "";
			
			strHtml = "asdasd";
			
			VenpMail mailClient = new VenpMail(bean.getEmail(),strHtml);
			mailClient.sendMail();
			response.sendRedirect("votacion.do");
			return null;
		}
		request.setAttribute("Elector", bean);
		return mapping.findForward("confirm");
	}
}