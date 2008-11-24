package venp.drivers.db;

import java.sql.*;

import venp.utils.Parametros;

public class GeneralConnection {

	protected static void registerDriver(String driverName) {
		try {
			Class.forName(driverName);
		} catch (Exception e) {
			System.out.println("Aplicacion: " + Parametros.NOMBRE_APP + "\n " +
					           "Clase: " + GeneralConnection.class.getName() + "\n " +
					           "Mensaje: " + e);
		}
	}

	protected Connection getConnection(String url, String userName, String password) {
		Connection connection = null;
		
		try {
			connection = DriverManager.getConnection(url, userName, password);
		} catch (Exception e) {
			System.out.println("Proyecto: " + Parametros.NOMBRE_APP + "\n " +
			                   "Clase: " + getClass().getName() + "\n " +
			                   "Mensaje: " + e);
		}
		
		return connection;
	}

}
