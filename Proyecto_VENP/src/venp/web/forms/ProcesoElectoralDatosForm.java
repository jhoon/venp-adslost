package venp.web.forms;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import venp.beans.MyHelpBean;

@SuppressWarnings("serial")
public class ProcesoElectoralDatosForm extends ActionForm {

	private boolean nuevo = true;
	private String codigo;
	private String usuario;
	private String nombre;
	// --------------------------------
	private String fecha_votacion;

	private String start_t;
	private String hora_inicial;
	private String minuto_inicial;

	private String final_t;
	private String hora_final;
	private String minuto_final;
	// --------------------------------
	private String fecha_emp_inicio;
	private String fecha_emp_final;
	// --------------------------------
	private String tiempo_sesion;
	// --------------------------------
	private static ArrayList listaHoras;
	private static ArrayList listaMinutos;
	private static ArrayList listaTiempo;

	public ProcesoElectoralDatosForm() {
		// llenar lista de horas
		if (listaHoras == null) {
			listaHoras = new ArrayList();
			for (int i = 0; i < 24; i++) {
				MyHelpBean hora = new MyHelpBean();
				String h = (i <= 9) ? "0" + i : "" + i;
				hora.setKey(h);
				hora.setValue(h);
				listaHoras.add(hora);
			}
		}
		// Llenar lista minutos
		if (listaMinutos == null) {
			int j = 0;
			listaMinutos = new ArrayList();
			while (j < 60) {
				MyHelpBean minuto = new MyHelpBean();
				String m = (j == 0) ? "0" + j : "" + j;
				minuto.setKey(m);
				minuto.setValue(m);
				listaMinutos.add(minuto);
				j = j + 10;
			}
		}
		// Llenar lista tiempo sesion
		if (listaTiempo == null) {
			listaTiempo = new ArrayList();
			for (int i = 1; i < 6; i++) {
				MyHelpBean tiempo = new MyHelpBean();
				String t = "0" + i;
				tiempo.setKey(t);
				tiempo.setValue(t);
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

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getFecha_votacion() {
		return fecha_votacion;
	}

	public void setFecha_votacion(String fecha_votacion) {
		this.fecha_votacion = fecha_votacion;
	}

	public String getHora_inicial() {
		return hora_inicial;
	}

	public void setHora_inicial(String hora_inicial) {
		this.hora_inicial = hora_inicial;
	}

	public String getHora_final() {
		return hora_final;
	}

	public void setHora_final(String hora_final) {
		this.hora_final = hora_final;
	}

	public String getMinuto_inicial() {
		return minuto_inicial;
	}

	public void setMinuto_inicial(String minuto_inicial) {
		this.minuto_inicial = minuto_inicial;
	}

	public String getMinuto_final() {
		return minuto_final;
	}

	public void setMinuto_final(String minuto_final) {
		this.minuto_final = minuto_final;
	}

	public String getFecha_emp_inicio() {
		return fecha_emp_inicio;
	}

	public void setFecha_emp_inicio(String fecha_emp_inicio) {
		this.fecha_emp_inicio = fecha_emp_inicio;
	}

	public String getFecha_emp_final() {
		return fecha_emp_final;
	}

	public void setFecha_emp_final(String fecha_emp_final) {
		this.fecha_emp_final = fecha_emp_final;
	}

	public String getTiempo_sesion() {
		return tiempo_sesion;
	}

	public void setTiempo_sesion(String tiempo_sesion) {
		this.tiempo_sesion = tiempo_sesion;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
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

	public String Start_time() {
		start_t = hora_inicial + ":" + minuto_inicial + ":00";
		return start_t;
	}

	public String Final_time() {
		final_t = hora_final + ":" + minuto_final + ":00";
		return final_t;
	}
	
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		codigo = "-1";
		usuario = "-1";
		nombre = "";
		fecha_votacion = "";
		hora_inicial = "";
		minuto_inicial = "";
		hora_final = "";
		minuto_final = "";
		fecha_emp_inicio = "";
		fecha_emp_final = "";
		tiempo_sesion = "";
	}

}