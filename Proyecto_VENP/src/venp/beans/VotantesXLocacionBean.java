package venp.beans;

public class VotantesXLocacionBean extends Bean {

	private int idLocacion;
	private int nroVotantes;

	public VotantesXLocacionBean() {
		idLocacion = 0;
		nroVotantes = 0;
	}

	public int getIdLocacion() {
		return idLocacion;
	}

	public void setIdLocacion(int idLocacion) {
		this.idLocacion = idLocacion;
	}

	public int getNroVotantes() {
		return nroVotantes;
	}

	public void setNroVotantes(int nroVotantes) {
		this.nroVotantes = nroVotantes;
	}
}