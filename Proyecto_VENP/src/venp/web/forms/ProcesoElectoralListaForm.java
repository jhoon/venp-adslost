package venp.web.forms;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;

import venp.beans.ProcesoElectoralBean;

public class ProcesoElectoralListaForm extends ActionForm {

	private ArrayList lista = null;
	private ProcesoElectoralBean bean = null;

	public ArrayList getLista() {
		return lista;
	}

	public void setLista(ArrayList lista) {
		this.lista = lista;
	}

	public ProcesoElectoralBean getBean() {
		return bean;
	}

	public void setBean(ProcesoElectoralBean bean) {
		this.bean = bean;
	}

}