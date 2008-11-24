package venp.drivers.db;

import java.sql.Connection;

public class MySQLConnection extends GeneralConnection implements DBConnection {

	static {
		registerDriver("org.gjt.mm.mysql.Driver");
	}

	public Connection getConnection() {
		String url = "jdbc:mysql://localhost:3306/votacion";
		String username = "root";
		String password = "";
		
		return super.getConnection(url, username, password);
	}

}