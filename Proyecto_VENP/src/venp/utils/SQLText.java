package venp.utils;

import java.text.*;

public class SQLText {

	private static final String SELECT_SYNTAX = "select {0} from {1} where {2} order by {3}";
	private static final String INSERT_SYNTAX = "insert into {0} values ( {1} )";
	private static final String UPDATE_SYNTAX = "update {0} set {1} where {2}";
	private static final String DELETE_SYNTAX = "delete from {0} where {1}";

	public static String select(String tableName, String listFields,
			                    String whereClause, String orderFields) {
		return MessageFormat.format(SELECT_SYNTAX, new Object[] { listFields, tableName, whereClause, orderFields });
	}

	public static String insert(String tableName, String listValues) {
		return MessageFormat.format(INSERT_SYNTAX, new Object[] { tableName, listValues });
	}

	public static String update(String tableName, String setValues, 
			                    String whereClause) {
		return MessageFormat.format(UPDATE_SYNTAX, new Object[] { tableName,
				setValues, whereClause });
	}

	public static String delete(String tableName, String whereClause) {
		return MessageFormat.format(DELETE_SYNTAX, new Object[] { tableName, whereClause });
	}

}