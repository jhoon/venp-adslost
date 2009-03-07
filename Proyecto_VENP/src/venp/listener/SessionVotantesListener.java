package venp.listener;

import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import venp.beans.VotantesXLocacionBean;
import venp.web.forms.ElectorForm;

public class SessionVotantesListener implements HttpSessionListener,
		HttpSessionAttributeListener {

	public static ArrayList<VotantesXLocacionBean> votantesActivos;

	public SessionVotantesListener() {
		votantesActivos = new ArrayList<VotantesXLocacionBean>();
	}

	public static boolean hayVotantesActivos(int idLocacion) {
		if (votantesActivos != null) {
			Iterator<VotantesXLocacionBean> it = votantesActivos.iterator();
			VotantesXLocacionBean bean;
			while (it.hasNext()) {
				bean = it.next();
				if (bean.getIdLocacion() == idLocacion) {
					return (bean.getNroVotantes() > 0 ? false : true);
				}
			}
		}
		return true;
	}

	public static int totalVotantesActivos(int idLocacion) {
		if (votantesActivos != null) {
			Iterator<VotantesXLocacionBean> it = votantesActivos.iterator();
			VotantesXLocacionBean bean;
			while (it.hasNext()) {
				bean = it.next();
				if (bean.getIdLocacion() == idLocacion) {
					return bean.getNroVotantes();
				}
			}
		}
		return 0;
	}

    @Override
	public void attributeAdded(HttpSessionBindingEvent se) {
		try {
			HttpSession session = se.getSession();
			ElectorForm bean = (ElectorForm) session.getAttribute("Elector");
			if (bean != null) {
				añadirElector(bean);
			}
		} catch (Exception e) {
		}
	}

    @Override
	public void attributeRemoved(HttpSessionBindingEvent se) {
		try {
			HttpSession session = se.getSession();
			ElectorForm bean = (ElectorForm) session.getAttribute("Elector");
			if (bean != null) {
				removerElector(bean);
			}
		} catch (Exception e) {
		}
	}

    @Override
	public void sessionDestroyed(HttpSessionEvent se) {
		try {
			HttpSession session = se.getSession();
			ElectorForm bean = (ElectorForm) session.getAttribute("Elector");
			if (bean != null) {
				removerElector(bean);
			}
		} catch (Exception e) {
		}
	}

    @Override
	public void attributeReplaced(HttpSessionBindingEvent se) {
	}

    @Override
	public void sessionCreated(HttpSessionEvent se) {
	}

	private void añadirElector(ElectorForm elector) {
		boolean bolFounded = false;
		int intIdLocacion = Integer.parseInt(elector.getLocationId());
		Iterator<VotantesXLocacionBean> it = votantesActivos.iterator();
		VotantesXLocacionBean locacion;

		while (it.hasNext()) {
			locacion = it.next();
			if (locacion.getIdLocacion() == intIdLocacion) {
				locacion.addVotante(elector.getDni());
				bolFounded = true;
				break;
			}
		}

		if (bolFounded == false) {
			locacion = new VotantesXLocacionBean();
			locacion.setIdLocacion(intIdLocacion);
			locacion.addVotante(elector.getDni());
			votantesActivos.add(locacion);
		}
	}

	public static void removerElector(ElectorForm elector) {
		Iterator<VotantesXLocacionBean> it = votantesActivos.iterator();
		VotantesXLocacionBean locacion;
		int intIdLocacion = Integer.parseInt(elector.getLocationId());
		while (it.hasNext()) {
			locacion = it.next();
			if (locacion.getIdLocacion() == intIdLocacion) {
				locacion.removeVotante(elector.getDni());
				break;
			}
		}
	}

}