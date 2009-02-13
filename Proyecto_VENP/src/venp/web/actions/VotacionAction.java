package venp.web.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.DynaActionForm;
import org.apache.struts.actions.DispatchAction;

import venp.listener.SessionVotantesListener;
import venp.services.ElectorService;
import venp.utils.CreaPDF;
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
			try {
				bean = service.votar((String)frm.get("voto"), bean);
				session.removeAttribute("Elector");
				SessionVotantesListener.removerElector(bean);
				request.setAttribute("Elector", bean);
				return mapping.findForward("fin");
			} catch (Exception e) {
				ActionErrors errors = new ActionErrors();
				errors.add("error", new ActionMessage("elector.validaestado.error"));
			    saveErrors(request, errors);
			    frm.set("voto", null);
			    return mapping.findForward("errores");
			}
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
			VenpMail mailClient = new VenpMail(bean,request);
			(new Thread(mailClient)).start();
			request.setAttribute("Elector", bean);
			ActionErrors errors = new ActionErrors();
			errors.add("sent", new ActionMessage("elector.confirm.mail",bean.getEmail()));
		    saveErrors(request, errors);
			return mapping.findForward("fin");
		}else if(strMode.equals("pdf")){
			CreaPDF pdf = new CreaPDF(bean, request, response);
			pdf.generatePDF();
			return null;
		}
		request.setAttribute("Elector", bean);
		return mapping.findForward("confirm");
	}
}