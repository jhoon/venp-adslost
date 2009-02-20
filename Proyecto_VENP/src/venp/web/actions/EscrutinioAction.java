package venp.web.actions;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import venp.beans.DetalleEscrutinioBean;
import venp.beans.LocacionBean;
import venp.services.EscrutinioService;
import venp.services.LocacionService;
import venp.web.forms.EscrutinioForm;

public class EscrutinioAction extends DispatchAction {

	public ActionForward listarEscrutinio(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ActionErrors errors = new ActionErrors();
		EscrutinioForm frm = (EscrutinioForm) form;
		ArrayList resultado = null;

		EscrutinioService servEscrutinio = new EscrutinioService();
		LocacionService service = new LocacionService();
		ArrayList lista = new ArrayList();

		lista = service.listarLocacionesCerradas();

		LocacionBean bean = null;
		DetalleEscrutinioBean beana = null;

		for (int i = 0; i < lista.size(); i++) {
			bean = (LocacionBean) lista.get(i);

			if (bean.getMensaje() != null) {
				if (bean.getMensaje().equals("escrutinio")
						&& bean.isLocacionCerrada() == false) {

					ArrayList listaDetalle = new ArrayList();

					listaDetalle = servEscrutinio
							.listarDetalleEscrutinio(String.valueOf(bean
									.getCodigo()));

					bean.setListaEscrutinioDetalle(listaDetalle);

				}
			}
		}

		frm.setListaEscrutinio(lista);
		return mapping.findForward("listarLocacion");
	}

	public ActionForward listarDetalleLocacion(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		EscrutinioForm frm = (EscrutinioForm) form;

		String id = request.getParameter("keyValue");

		EscrutinioService service = new EscrutinioService();
		ArrayList listaDetalle = new ArrayList();

		listaDetalle = service.listarDetalleLocacion(id);

		ArrayList ls = frm.getListaEscrutinio();

		ArrayList resultado = buscarId(ls, id, listaDetalle);

		LocacionBean bean = new LocacionBean();

		for (int i = 0; i < resultado.size(); i++) {
			bean = (LocacionBean) resultado.get(i);

			DetalleEscrutinioBean deta = new DetalleEscrutinioBean();

			for (int a = 0; a < bean.getListaEscrutinioDetalle().size(); a++) {
				deta = (DetalleEscrutinioBean) bean.getListaEscrutinioDetalle()
						.get(a);
			}
		}

		frm.setListaEscrutinio(resultado);

		return mapping.findForward("detalleLocacion");
	}

	public ArrayList buscarId(ArrayList ls, String strId, ArrayList detalle) {
		LocacionBean bean = null;
		for (int i = 0; i < ls.size(); i++) {
			bean = (LocacionBean) ls.get(i);
			if (bean.getCodigo() == Integer.parseInt(strId)) {
				bean.setListaEscrutinioDetalle(detalle);
				bean.setLocacionCerrada(false);
			}
		}
		return ls;
	}
}