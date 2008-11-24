package venp.web.forms;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;

public class LocacionPuestaCeroForm extends ActionForm {

	ArrayList listaLocaciones;
	String usuario;
	String ok;
	String nombreLocacion;

	public ArrayList getListaLocaciones() {
		return listaLocaciones;
	}

	public void setListaLocaciones(ArrayList listaLocaciones) {
		this.listaLocaciones = listaLocaciones;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getOk() {
		return ok;
	}

	public void setOk(String ok) {
		this.ok = ok;
	}

	public String getNombreLocacion() {
		return nombreLocacion;
	}

	public void setNombreLocacion(String nombreLocacion) {
		this.nombreLocacion = nombreLocacion;
	}
	
}