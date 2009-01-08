package venp.web.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.actions.DispatchAction;

import venp.beans.ProcesoElectoralBean;
import venp.beans.UsuarioBean;
import venp.services.ProcesoElectoralService;
import venp.web.forms.ProcesoElectoralDatosForm;

public class ProcesoElectoralDatosAction extends DispatchAction {

	public ActionForward cancelar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ProcesoElectoralDatosForm frm = (ProcesoElectoralDatosForm) form;
		frm.reset(mapping, request);

		return mapping.findForward("listado");
	}

	public ActionForward editar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String strId = request.getParameter("codigo");
		ProcesoElectoralBean bean = findByPrimaryKey(strId);

		if (bean.getEstado().equals("C")) {
			ProcesoElectoralDatosForm frm = (ProcesoElectoralDatosForm) form;

			frm.setNuevo(false);
			frm.setCodigo(bean.getCodigo() + "");
			frm.setNombre(bean.getDescripcion());
			frm.setFechaVotacion(bean.getFechaVotacion());
			if (Integer.parseInt(bean.getHoraInicial()) < 10) {
				frm.setHoraInicial("0" + bean.getHoraInicial());
			}
			else
				frm.setHoraInicial(bean.getHoraInicial());
			frm.setMinutoInicial(bean.getMinutoInicial());
			if (Integer.parseInt(bean.getHoraFinal()) < 10)
				frm.setHoraFinal("0" + bean.getHoraFinal());
			else
				frm.setHoraFinal(bean.getHoraFinal());
			frm.setMinutoFinal(bean.getMinutoFinal());
			frm.setFechaEmpInicio(bean.getFechaPadronInicial());
			frm.setFechaEmpFinal(bean.getFechaPadronFinal());
			frm.setTiempoSesion("0" + bean.getTiempoSesion());

			return mapping.findForward("inicio");

		} else {

			ActionMessages errors = new ActionMessages();
			errors.add("error", new ActionMessage(
					"procesoElectoral.error.procesoNoEditble"));
			saveErrors(request, errors);

			return mapping.findForward("listado");

		}
	}

	public ActionForward guardar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ProcesoElectoralDatosForm frm = (ProcesoElectoralDatosForm) form;
		HttpSession session = request.getSession();
		UsuarioBean usuario = (UsuarioBean) session.getAttribute("usuarioBean");
		ActionMessages errors = new ActionMessages();

		ProcesoElectoralBean bean = new ProcesoElectoralBean();

		bean.setUsuarioId(usuario.getCodigo());
		bean.setDescripcion(frm.getNombre());
		bean.setFechaVotacion(frm.getFechaVotacion());
		bean.setStartTime(frm.startTime());
		bean.setFinalTime(frm.finalTime());
		bean.setFechaPadronInicial(frm.getFechaEmpInicio());
		bean.setFechaPadronFinal(frm.getFechaEmpFinal());
		bean.setTiempoSesion(Integer.parseInt(frm.getTiempoSesion()));

		/* VALIDANDO LA INSERCION DE DATOS DE PROCESO ELECTORAL!!!! */

		if (bean.getDescripcion().equals("")
				|| bean.getFechaVotacion().equals("")
				|| bean.getFechaPadronInicial().equals("")
				|| bean.getFechaPadronFinal().equals("")) {

			errors.add("error", new ActionMessage(
					"procesoElectoral.error.procesoDataIncomplete"));
			saveErrors(request, errors);

			return mapping.findForward("inicio");
		} else {

			// VALIDANDO FECHAS
			int show_time = Integer.parseInt(bean.getFechaVotacion()
					.replaceAll("-", ""));
			int zero_emp = Integer.parseInt(bean.getFechaPadronInicial()
					.replaceAll("-", ""));
			int last_emp = Integer.parseInt(bean.getFechaPadronFinal()
					.replaceAll("-", ""));

			if (last_emp - zero_emp >= 1 && show_time - last_emp >= 0
					&& show_time - zero_emp >= 0) {
				if (frm.isNuevo()) {
					insertar(bean);
				} else {
					bean.setCodigo(Integer.parseInt(frm.getCodigo()));
					editar(bean);
				}
			} else {
				errors.add("error", new ActionMessage(
						"procesoElectoral.error.procesoInvalidDate"));
				saveErrors(request, errors);

				return mapping.findForward("inicio");
			}


			errors.add("error", new ActionMessage(
					"procesoElectoral.error.procesoSaved"));
			saveErrors(request, errors);

			frm.reset(mapping, request);

			return mapping.findForward("listado");
		}
	}

	public ActionForward nuevo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ProcesoElectoralDatosForm frm = (ProcesoElectoralDatosForm) form;

		frm.setNuevo(true);

		return mapping.findForward("inicio");
	}

	private void editar(ProcesoElectoralBean bean) throws Exception {
		ProcesoElectoralService service = new ProcesoElectoralService();
		service.editar(bean);
	}

	private ProcesoElectoralBean findByPrimaryKey(String codigo)
			throws Exception {

		ProcesoElectoralService service = new ProcesoElectoralService();
		ProcesoElectoralBean bean = service.findByPrimaryKey(Integer
				.parseInt(codigo));

		return bean;
	}

	private void insertar(ProcesoElectoralBean bean) throws Exception {
		ProcesoElectoralService service = new ProcesoElectoralService();

		service.insertar(bean);
	}

}