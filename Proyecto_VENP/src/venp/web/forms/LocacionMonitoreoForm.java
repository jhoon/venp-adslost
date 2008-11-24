package venp.web.forms;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;

public class LocacionMonitoreoForm extends ActionForm {

	private ArrayList lista = null;
	String usuario;

	public ArrayList getLista() {
		return lista;
	}

	public void setLista(ArrayList lista) {
		this.lista = lista;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

}