package venp.web.forms;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import venp.beans.MyHelpBean;

public class ProcesoElectoralDatosForm extends ActionForm {

	private boolean nuevo = true;
	private String codigo;
	private String usuario;
	private String nombre;
	private String fechaVotacion;
	private String startTime;
	private String horaInicial;
	private String minutoInicial;
	private String finalTime;
	private String horaFinal;
	private String minutoFinal;
	private String fechaEmpInicio;
	private String fechaEmpFinal;
	private String tiempoSesion;

	private static ArrayList listaHoras;
	private static ArrayList listaMinutos;
	private static ArrayList listaTiempo;

	public ProcesoElectoralDatosForm() {
		if (listaHoras == null) {
			listaHoras = new ArrayList();
			for (int intContador = 0; intContador < 24; intContador++) {
				MyHelpBean hora = new MyHelpBean();
				String h = (intContador <= 9) ? "0" + intContador : "" + intContador;
				hora.setKey(h);
				hora.setValue(h);
				listaHoras.add(hora);
			}
		}

		if (listaMinutos == null) {
			int intNumero = 0;
			listaMinutos = new ArrayList();
			while (intNumero < 60) {
				MyHelpBean minuto = new MyHelpBean();
				String m = (intNumero == 0) ? "0" + intNumero : "" + intNumero;
				minuto.setKey(m);
				minuto.setValue(m);
				listaMinutos.add(minuto);
				intNumero = intNumero + 10;
			}
		}

		if (listaTiempo == null) {
			listaTiempo = new ArrayList();
			for (int intContador = 1; intContador < 6; intContador++) {
				MyHelpBean tiempo = new MyHelpBean();
				String strTime = "0" + intContador;
				tiempo.setKey(strTime);
				tiempo.setValue(strTime);
				listaTiempo.add(tiempo);
			}
		}
	}
	
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

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getFechaVotacion() {
		return fechaVotacion;
	}

	public void setFechaVotacion(String fechaVotacion) {
		this.fechaVotacion = fechaVotacion;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getHoraInicial() {
		return horaInicial;
	}

	public void setHoraInicial(String horaInicial) {
		this.horaInicial = horaInicial;
	}

	public String getMinutoInicial() {
		return minutoInicial;
	}

	public void setMinutoInicial(String minutoInicial) {
		this.minutoInicial = minutoInicial;
	}

	public String getFinalTime() {
		return finalTime;
	}

	public void setFinalTime(String finalTime) {
		this.finalTime = finalTime;
	}

	public String getHoraFinal() {
		return horaFinal;
	}

	public void setHoraFinal(String horaFinal) {
		this.horaFinal = horaFinal;
	}

	public String getMinutoFinal() {
		return minutoFinal;
	}

	public void setMinutoFinal(String minutoFinal) {
		this.minutoFinal = minutoFinal;
	}

	public String getFechaEmpInicio() {
		return fechaEmpInicio;
	}

	public void setFechaEmpInicio(String fechaEmpInicio) {
		this.fechaEmpInicio = fechaEmpInicio;
	}

	public String getFechaEmpFinal() {
		return fechaEmpFinal;
	}

	public void setFechaEmpFinal(String fechaEmpFinal) {
		this.fechaEmpFinal = fechaEmpFinal;
	}

	public String getTiempoSesion() {
		return tiempoSesion;
	}

	public void setTiempoSesion(String tiempoSesion) {
		this.tiempoSesion = tiempoSesion;
	}

	public ArrayList getListaHoras() {
		return listaHoras;
	}

	public ArrayList getListaMinutos() {
		return listaMinutos;
	}
	
	public ArrayList getListaTiempo() {
		return listaTiempo;
	}
	

	public String startTime() {
		startTime = horaInicial + ":" + minutoInicial + ":00";
		return startTime;
	}

	public String finalTime() {
		finalTime = horaFinal + ":" + minutoFinal + ":00";
		return finalTime;
	}
	
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		codigo = "-1";
		usuario = "-1";
		nombre = "";
		fechaVotacion = "";
		horaInicial = "";
		minutoInicial = "";
		horaFinal = "";
		minutoFinal = "";
		fechaEmpInicio = "";
		fechaEmpFinal = "";
		tiempoSesion = "";
	}

}