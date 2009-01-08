package venp.web.forms;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;

public class PartidoPoliticoDatosForm extends ActionForm {

	private boolean nuevo;
	private String codigo;
	private String nombre;
	private String abreviatura;
	private String logo;
	private String estado;

	private FormFile theFile;

	public boolean isNuevo() {
		return nuevo;
	}

	public void setNuevo(boolean nuevo) {
		this.nuevo = nuevo;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getAbreviatura() {
		return abreviatura;
	}

	public void setAbreviatura(String abreviatura) {
		this.abreviatura = abreviatura;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public FormFile getTheFile() {
		return theFile;
	}

	public void setTheFile(FormFile theFile) {
		this.theFile = theFile;
	}

}