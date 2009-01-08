package venp.web.actions;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.Globals;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class LanguageAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String strLanguage = request.getParameter("lang");
		
		HttpSession sesion = request.getSession();
		sesion.setAttribute(Globals.LOCALE_KEY, new Locale(strLanguage));

		response.sendRedirect(request.getHeader("referer"));
		return null;
	}
}
