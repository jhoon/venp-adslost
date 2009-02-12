package venp.beans;

import java.util.HashSet;

public class VotantesXLocacionBean extends Bean {

	private int idLocacion;
	private HashSet<String> votantes;

	public VotantesXLocacionBean() {
		idLocacion = 0;
		votantes = new HashSet<String>();
	}

	public int getIdLocacion() {
		return idLocacion;
	}

	public void setIdLocacion(int idLocacion) {
		this.idLocacion = idLocacion;
	}

	public int getNroVotantes() {
		return votantes.size();
	}

	public void addVotante(String strDni) {
		votantes.add(strDni);
	}

	public void removeVotante(String strDni) {
		votantes.remove(strDni);
	}
	
	public boolean existeVotante(String strDNI){
		return votantes.contains(strDNI);
	}
}