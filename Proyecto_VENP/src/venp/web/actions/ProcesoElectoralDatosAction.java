package venp.web.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
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

		String id = request.getParameter("codigo");

		System.out.println("CODIGO!!!= " + id);

		ProcesoElectoralBean bean = findByPrimaryKey(id);

		if (bean.getEstado().equals("C")) {
			ProcesoElectoralDatosForm frm = (ProcesoElectoralDatosForm) form;

			frm.setNuevo(false);
			frm.setCodigo(bean.getCodigo() + "");
			frm.setNombre(bean.getDescripcion());
			frm.setFecha_votacion(bean.getFecha_votacion());
			if (Integer.parseInt(bean.getHora_inicial()) < 10)
				frm.setHora_inicial("0" + bean.getHora_inicial());
			else
				frm.setHora_inicial(bean.getHora_inicial());
			frm.setMinuto_inicial(bean.getMinuto_inicial());
			if (Integer.parseInt(bean.getHora_final()) < 10)
				frm.setHora_final("0" + bean.getHora_final());
			else
				frm.setHora_final(bean.getHora_final());
			frm.setMinuto_final(bean.getMinuto_final());
			frm.setFecha_emp_inicio(bean.getFecha_padron_inicial());
			frm.setFecha_emp_final(bean.getFecha_padron_final());
			frm.setTiempo_sesion("0" + bean.getTiempo_sesion());

			return mapping.findForward("inicio");

		} else {

			ActionErrors errors = new ActionErrors();
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
		ActionErrors errors = new ActionErrors();

		ProcesoElectoralBean bean = new ProcesoElectoralBean();

		bean.setUsuario_id(usuario.getCodigo());
		bean.setDescripcion(frm.getNombre());
		bean.setFecha_votacion(frm.getFecha_votacion());
		bean.setStart_time(frm.Start_time());
		bean.setFinal_time(frm.Final_time());
		bean.setFecha_padron_inicial(frm.getFecha_emp_inicio());
		bean.setFecha_padron_final(frm.getFecha_emp_final());
		bean.setTiempo_sesion(Integer.parseInt(frm.getTiempo_sesion()));

		/* VALIDANDO LA INSERCION DE DATOS DE PROCESO ELECTORAL!!!! */

		if (bean.getDescripcion().equals("")
				|| bean.getFecha_votacion().equals("")
				|| bean.getFecha_padron_inicial().equals("")
				|| bean.getFecha_padron_final().equals("")) {

			errors.add("error", new ActionMessage(
					"procesoElectoral.error.procesoDataIncomplete"));
			saveErrors(request, errors);

			return mapping.findForward("inicio");
		} else {

			// VALIDANDO FECHAS
			int show_time = Integer.parseInt(bean.getFecha_votacion()
					.replaceAll("-", ""));
			int zero_emp = Integer.parseInt(bean.getFecha_padron_inicial()
					.replaceAll("-", ""));
			int last_emp = Integer.parseInt(bean.getFecha_padron_final()
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

			// -----------------------------------------------------
			errors.add("error", new ActionMessage(
					"procesoElectoral.error.procesoSaved"));
			saveErrors(request, errors);
			// -----------------------------------------------------
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