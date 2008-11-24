package venp.web.forms;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;

public class CandidatoListaForm extends ActionForm {

	private ArrayList lista = null;

	public ArrayList getLista() {
		return lista;
	}

	public void setLista(ArrayList lista) {
		this.lista = lista;
	}

}