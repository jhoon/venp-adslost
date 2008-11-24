package venp.beans;

import java.io.Serializable;

public class Bean implements Serializable {

	public String getReferencia() {
		return getClass().getName();
	}

}