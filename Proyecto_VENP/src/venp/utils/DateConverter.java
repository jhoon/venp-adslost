package venp.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateConverter {

	private static DateFormat showFormat = new SimpleDateFormat("dd/MM/yyyy");
	private static DateFormat savedFormat = new SimpleDateFormat("yyyy-MM-dd");
	private static DateFormat longShowFormat = new SimpleDateFormat(
			"dd/MM/yyyy hh:mm aa");

	public static String toShow(String fromSaved) {
		String fechaFormateada = "";
		try {
			fechaFormateada = showFormat.format(savedFormat.parse(fromSaved));
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return fechaFormateada;
	}

	public static String toSave(String fromShowed) {
		String fechaFormateada = "";
		try {
			fechaFormateada = savedFormat.format(showFormat.parse(fromShowed));
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return fechaFormateada;
	}

	public static String dateToStringShow(Date date) {
		String fechaFormateada = "";
		try {
			fechaFormateada = longShowFormat.format(date);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return fechaFormateada;
	}

	public static String dateToStringSave(Date date) {
		String fechaFormateada = "";
		try {
			fechaFormateada = savedFormat.format(date);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return fechaFormateada;
	}

}
