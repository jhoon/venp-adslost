package venp.web.actions;

import java.math.BigDecimal;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.actions.DispatchAction;

import venp.beans.ConsolidacionBean;
import venp.services.ConsolidacionService;
import venp.services.LocacionService;
import venp.services.ProcesoElectoralService;
import venp.web.forms.ConsolidacionForm;

public class ConsolidacionAction extends DispatchAction {

	public ActionForward listarConsolidacion(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ActionErrors errors = new ActionErrors();
		ConsolidacionForm frm = (ConsolidacionForm) form;
		ArrayList resultado = null;

		LocacionService servLocacion = new LocacionService();
		boolean boolLocacionesAbiertas = servLocacion.locacionesAbiertas();

		/*
		 * true = existen locaciones abiertas
		 */
		if (boolLocacionesAbiertas) {
			ArrayList lista = new ArrayList();
			frm.setListaConsolidacion(lista);
			errors.add("errors", new ActionMessage(
					"listaConsolidacion.error.locacionesAbiertas"));
			saveErrors(request, errors);
		} else {
			ProcesoElectoralService servProc = new ProcesoElectoralService();
			/*
			 * Si el resultado es "F finalizo el procesoElectoral" esta cerrado
			 * entonces = true.
			 */
			boolean bolEstadoProceso = servProc.estadoProceso();
			/*
			 * bolProcCerrado si es true se cerro el proceso satisfactoriamente
			 */
			boolean bolProcCerrado = false;

			if (bolEstadoProceso) {
				bolProcCerrado = true; // solo cierra el proceso una sola vez
			}

			ConsolidacionService services = new ConsolidacionService();
			ArrayList lista = new ArrayList();
			lista = services.listarResultados();

			if (!bolEstadoProceso) {

				if (lista.size() == 0) {

					frm.setListaConsolidacion(lista);
					errors.add("errors", new ActionMessage(
							"listaConsolidacion.nohaydatos"));
					saveErrors(request, errors);
				} else {
					/*
					 * metodo que ejecutara el cierre del proceso electoral
					 */
					bolProcCerrado = servProc.cierraProcesoElectoral();
					if (!bolProcCerrado) {
						ArrayList list = new ArrayList();
						frm.setListaConsolidacion(list);
						errors
								.add(
										"errors",
										new ActionMessage(
												"listaConsolidacion.errorCerrarProcesoElectoral"));
						saveErrors(request, errors);
					}
				}
			}

			if (bolProcCerrado) {

				ArrayList listt = new ArrayList();
				listt = services.listarResultadosFinales();

				if (listt.size() == 0) {
					/*
					 * Para el caso que no se hayan grabado los datos en
					 * escrutinio
					 */
					frm.setListaConsolidacion(listt);
					errors.add("errors", new ActionMessage(
							"listaConsolidacion.nohaydatos"));
					saveErrors(request, errors);
				} else {

					ConsolidacionBean bean = null;
					BigDecimal BigTotal = new BigDecimal("0");
					for (int i = 0; i < listt.size(); i++) {
						BigDecimal BigDato = null;
						bean = (ConsolidacionBean) listt.get(i);
						BigDato = new BigDecimal(bean.getResultadoOpcion());
						BigTotal = BigTotal.add(BigDato);
					}

					double dblResultados = 0;
					for (int i = 0; i < listt.size(); i++) {
						bean = (ConsolidacionBean) listt.get(i);
						dblResultados = ((Double.parseDouble(bean
								.getResultadoOpcion()) / Double
								.parseDouble(BigTotal.toString())) * 100);
						bean.setPorcentajeObtenido(String.valueOf(redondear(
								dblResultados, 2))
								+ "%");
					}

					frm.setListaConsolidacion(listt);
				}

			}
		}

		return mapping.findForward("inicio");
	}

	public double redondear(double numero, int decimales) {
		return Math.round(numero * Math.pow(10, decimales))
				/ Math.pow(10, decimales);
	}

}