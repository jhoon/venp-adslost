package venp.web.forms;

import java.util.ArrayList;
import org.apache.struts.action.ActionForm;


public class ConsolidacionForm extends ActionForm{
	
	ArrayList listaConsolidacion;
	
	public ArrayList getListaConsolidacion() {
		return listaConsolidacion;
	}
	public void setListaConsolidacion(ArrayList listaConsolidacion) {
		this.listaConsolidacion = listaConsolidacion;
	}
	
}
