package venp.filters;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import venp.beans.UsuarioBean;

public class SessionFilter implements Filter {

	private FilterConfig filterConfig;

	public void destroy() {
		this.filterConfig = null;
	}

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) req;
		HttpSession se = request.getSession();
		UsuarioBean bean = (UsuarioBean) se.getAttribute("usuarioBean");
		
		if (bean != null) {
			chain.doFilter(req, res);
		} else {
			HttpServletResponse response = (HttpServletResponse) res;
			response.sendRedirect("login.jsp");
		}
	}

	public void init(FilterConfig filterconfig) throws ServletException {
		this.filterConfig = filterconfig;
	}

}