package venp.listener;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import venp.beans.VotantesXLocacionBean;
import venp.web.forms.ElectorForm;

public class SessionVotantesListener implements HttpSessionListener,
		HttpSessionAttributeListener {

	public static ArrayList votantesActivos;

	public SessionVotantesListener() {
		votantesActivos = new ArrayList();
	}
	
	public static boolean hayVotantesActivos (int idLocacion) {
		ArrayList<VotantesXLocacionBean> lista = (ArrayList<VotantesXLocacionBean>) votantesActivos;

		for (int i = 0; i < lista.size(); i++) {
			if (lista.get(i).getIdLocacion() == idLocacion) {
				if (lista.get(i).getNroVotantes() > 0)
					return false;
				else
					return true;
			}
		}
		
		return true;
	}
	
	public static int totalVotantesActivos (int idLocacion) {
		ArrayList<VotantesXLocacionBean> lista = (ArrayList<VotantesXLocacionBean>) votantesActivos;

		for (int i = 0; i < lista.size(); i++) {
			if (lista.get(i).getIdLocacion() == idLocacion) {
				return lista.get(i).getNroVotantes();
			}
		}
		
		return 0;
	}

	public void attributeAdded(HttpSessionBindingEvent se) {
		HttpSession session = se.getSession();

		ElectorForm bean = (ElectorForm) session.getAttribute("Elector");
		if (bean == null) {
			System.out.println("NO ES ELECTOR");
		} else {
			añadirElector(Integer.parseInt(bean.getLocationId()));
			System.out.println("AÑADIR ATRIBUTO: " + bean.getLocationId());
		}
	}

	public void attributeRemoved(HttpSessionBindingEvent se) {
		try {
			HttpSession session = se.getSession();

			ElectorForm bean = (ElectorForm) session.getAttribute("Elector");
			if (bean == null) {
				System.out.println("NO ES DE UN TIPO USUARIO");
			} else {
				removerElector(Integer.parseInt(bean.getLocationId()));
				System.out.println("REMOVER ATRIBUTO");
			}
		} catch (Exception e) {

		}
	}

	public void attributeReplaced(HttpSessionBindingEvent se) {

	}

	public void sessionCreated(HttpSessionEvent se) {

	}

	public void sessionDestroyed(HttpSessionEvent se) {
		HttpSession session = se.getSession();

		ElectorForm bean = (ElectorForm) session.getAttribute("Elector");
		if (bean == null) {
			System.out.println("NO ES DE UN TIPO USUARIO");
		} else {
			removerElector(Integer.parseInt(bean.getLocationId()));
			System.out.println("SESION REMOVIDA");
		}
	}

	private void añadirElector(int idLocacion) {
		ArrayList<VotantesXLocacionBean> lista = (ArrayList<VotantesXLocacionBean>) votantesActivos;
		boolean localizado = false;

		for (int i = 0; i < lista.size(); i++) {
			if (lista.get(i).getIdLocacion() == idLocacion) {
				System.out.println("VOTANTE ACUMULADO a la LOCACION: " + idLocacion);
				lista.get(i).setNroVotantes(lista.get(i).getNroVotantes() + 1);
				localizado = true;
				break;
			}
		}
		if (localizado == false) {
			VotantesXLocacionBean bean = new VotantesXLocacionBean();
			
			bean.setIdLocacion(idLocacion);
			bean.setNroVotantes(1);
			
			System.out.println("NUEVO VOTANTE a la LOCACION: " + idLocacion);
			votantesActivos.add(bean);
		}
	}

	public static void removerElector(int idLocacion) {
		ArrayList<VotantesXLocacionBean> lista = (ArrayList<VotantesXLocacionBean>) votantesActivos;

		for (int i = 0; i < lista.size(); i++) {
			if (lista.get(i).getIdLocacion() == idLocacion) {
				System.out.println("VOTANTE RETIRADO a la LOCACION: " + idLocacion);
				if (lista.get(i).getNroVotantes() > 0)
					lista.get(i).setNroVotantes(lista.get(i).getNroVotantes() - 1);
				else
					lista.get(i).setNroVotantes(0);
				
				break;
			}
		}
	}

}