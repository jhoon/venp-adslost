package venp.dao.entities;

import java.util.ArrayList;


public interface ConsolidacionDAO {	
	
	public ArrayList listarResultados() throws Exception;
	public boolean procesoCerrado () throws Exception;	

}