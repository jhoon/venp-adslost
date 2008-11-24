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
import venp.beans.EscrutinioBean;
import venp.services.EscrutinioService;
import venp.web.forms.ListaEscrutinioForm;

public class ListaEscrutinioAction extends DispatchAction {

	public ActionForward listarEscrutinio(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ActionErrors errors = new ActionErrors();
		ListaEscrutinioForm frm = (ListaEscrutinioForm) form;
		ArrayList resultado = null;

		EscrutinioService service = new EscrutinioService();
		ArrayList lista = new ArrayList();

		lista = service.listarLocacionesCerradas();

		EscrutinioBean bean = null;
		DetalleEscrutinioBean beana = null;

		for (int i = 0; i < lista.size(); i++) {
			bean = (EscrutinioBean) lista.get(i);

			if (bean.getMensaje() != null) {
				if (bean.getMensaje().equals("escrutinio")
						&& bean.getLocacionCerrada() == false) {
					EscrutinioService services = new EscrutinioService();
					ArrayList listaDetalle = new ArrayList();

					listaDetalle = services.listarDetalleEscrutinio(bean
							.getPaisId());
					bean.setListaEscrutinioDetalle(listaDetalle);

					EscrutinioBean total = services.buscarTotales();
					bean.setTotalVotos(total.getTotalVotos());
					bean.setTotalVotosBlancos(total.getTotalVotosBlancos());
					bean.setTotalVotosValidos(total.getTotalVotosValidos());
				}
			}

		}
		frm.setListaEscrutinio(lista);
		return mapping.findForward("listarLocacion");
	}

	public ActionForward listarDetalleLocacion(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ListaEscrutinioForm frm = (ListaEscrutinioForm) form;

		String id = request.getParameter("keyValue");

		EscrutinioService service = new EscrutinioService();
		ArrayList listaDetalle = new ArrayList();

		listaDetalle = service.listarDetalleLocacion(id);

		ArrayList ls = frm.getListaEscrutinio();

		ArrayList resultado = buscarId(ls, id, listaDetalle);

		EscrutinioBean total = service.buscarTotales();

		ArrayList lista = totalVotos(resultado, id, total);

		frm.setListaEscrutinio(lista);

		// para saber si registra total de votos
		// lista lo que finalmente hay en la lista----solo para verificar---hay
		// que borrarlo
		/*
		 * EscrutinioBean bean= null; for (int i = 0; i < lista.size(); i++) {
		 * bean = (EscrutinioBean)resultado.get(i);
		 * System.out.println("ACUMULA TOTAL VOTOS FINAL "+
		 * bean.getTotalVotos());
		 * System.out.println("ACUMULA TOTAL Blanco FINAL "+
		 * bean.getTotalVotosBlancos());
		 * System.out.println("ACUMULA TOTAL validos FINAL "+
		 * bean.getTotalVotosValidos());
		 * 
		 * 
		 * }
		 */
		return mapping.findForward("detalleLocacion");

	}

	public ArrayList buscarId(ArrayList ls, String id, ArrayList detalle) {

		EscrutinioBean bean = null;
		for (int i = 0; i < ls.size(); i++) {
			bean = (EscrutinioBean) ls.get(i);
			if (bean.getPaisId().equals(id)) {
				bean.setListaEscrutinioDetalle(detalle);
				bean.setLocacionCerrada(false);
			}
		}
		return ls;
	}

	public ArrayList totalVotos(ArrayList ls, String id, EscrutinioBean detalle) {

		EscrutinioBean bean = null;
		for (int i = 0; i < ls.size(); i++) {
			bean = (EscrutinioBean) ls.get(i);
			if (bean.getPaisId().equals(id)) {
				bean.setTotalVotos(detalle.getTotalVotos());
				bean.setTotalVotosBlancos(detalle.getTotalVotosBlancos());
				bean.setTotalVotosValidos(detalle.getTotalVotosValidos());
			}
		}
		return ls;
	}

}