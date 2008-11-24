package venp.dao.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import venp.beans.PerfilBean;
import venp.dao.entities.LogDAO;

public class MySqlLogDAO implements LogDAO {

	private Connection conn;
 
	public MySqlLogDAO(Connection c) {
		conn = c;
	}

	public void insertarLog(String diccionario , String usuario) throws Exception {
		 
		 
		CallableStatement sp = conn.prepareCall("{call pa_log_insert(?, ?)}");
		sp.setInt(1, Integer.parseInt(diccionario));
		sp.setInt(2, Integer.parseInt(usuario));
		
		ResultSet rst = sp.executeQuery();

		System.out.println("\n----------\nQUERY: PROCEDIMIENTO ALMACENADO ||| pa_log_insert(" + diccionario + ", " + usuario +") |||\n----------\n");
		
		rst.close();
		sp.close();
		conn.close();
	}

	
}