package venp.web.actions;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.upload.FormFile;

import venp.beans.PartidoPoliticoBean;
import venp.services.PartidoPoliticoService;
import venp.web.forms.PartidoPoliticoDatosForm;

public class PartidoPoliticoDatosAction extends DispatchAction {

	public ActionForward cancelar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return mapping.findForward("listado");
	}

	public ActionForward editar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String strCodigo = request.getParameter("codigo");

		PartidoPoliticoBean bean = findByPrimaryKey(strCodigo);

		PartidoPoliticoDatosForm frm = (PartidoPoliticoDatosForm) form;
		frm.setNuevo(false);
		frm.setCodigo(bean.getCodigo() + "");
		frm.setNombre(bean.getNombre());
		frm.setAbreviatura(bean.getAbreviatura());
		frm.setLogo(bean.getLogo());

		return mapping.findForward("inicio");
	}

	public ActionForward nuevo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		PartidoPoliticoDatosForm frm = (PartidoPoliticoDatosForm) form;
		frm.setNuevo(true);
		frm.setAbreviatura("");
		frm.setLogo("");
		frm.setNombre("");

		return mapping.findForward("inicio");
	}

	private PartidoPoliticoBean findByPrimaryKey(String codigo)
			throws Exception {
		PartidoPoliticoService service = new PartidoPoliticoService();
		return service.findByPrimaryKey(Integer.parseInt(codigo));
	}

	public ActionForward guardar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		PartidoPoliticoDatosForm frm = (PartidoPoliticoDatosForm) form;

		PartidoPoliticoBean bean = new PartidoPoliticoBean();
		bean.setNombre(frm.getNombre());
		bean.setAbreviatura(frm.getAbreviatura());

		if (bean.getNombre().equals("")) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage(
					"partidoPolitico.nombre.empty"));
			saveErrors(request, errors);
			return mapping.findForward("inicio");
		} else if (bean.getAbreviatura().equals("")) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage(
					"partidoPolitico.abreviatura.empty"));
			saveErrors(request, errors);
			return mapping.findForward("inicio");
		} else {
			FormFile file = frm.getTheFile();
			String strFileName = file.getFileName();

			if (frm.isNuevo()) {
				String strExtension = getFileExtension(strFileName);
				bean.setLogo(strExtension);

				if (bean.getLogo() == null) {
					ActionMessages errors = new ActionMessages();
					errors.add("mensaje", new ActionMessage(
							"partidoPolitico.foto.null"));
					saveErrors(request, errors);
					return mapping.findForward("inicio");
				} else if (bean.getLogo().equals("")) {
					ActionMessages errors = new ActionMessages();
					errors.add("mensaje", new ActionMessage(
							"partidoPolitico.logo.empty"));
					saveErrors(request, errors);
					return mapping.findForward("inicio");
				}
				grabar(bean, file, "insertar");
			} else {
				bean.setCodigo(Integer.parseInt(frm.getCodigo()));
				if (file.getFileSize() == 0) {
					bean.setLogo("");
					editar(bean);
				} else {
					bean.setLogo(getFileExtension(strFileName));
					grabar(bean, file, "update");
				}
			}
			return mapping.findForward("listado");
		}
	}

	private String getFileExtension(String fileName) {
		String strResultado = "";
		for (int i = fileName.length() - 1; i > 0; i--) {
			String c = String.valueOf(fileName.charAt(i));
			if (!c.equals(".")) {
				strResultado = c + strResultado;
			} else {
				return strResultado;
			}
		}
		return null;
	}

	private void grabar(PartidoPoliticoBean bean, FormFile myFile,
			String operacion) {
		try {
			String strResultado;
			if (operacion.equals("insertar")) {
				strResultado = insertar(bean);
			} else {
				strResultado = editar(bean);
			}

			if (!strResultado.equals("")) {
				InputStream is = myFile.getInputStream();

				String url = this.getServlet().getServletContext().getRealPath(
						File.separator + "files");

				FileOutputStream fos = new FileOutputStream(new File(url
						+ File.separator + strResultado));

				int bytesRead = 0;
				byte[] buffer = new byte[8192];
				while ((bytesRead = is.read(buffer, 0, 8192)) != -1) {
					fos.write(buffer, 0, bytesRead);
				}
				fos.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private String insertar(PartidoPoliticoBean bean) throws Exception {
		PartidoPoliticoService service = new PartidoPoliticoService();
		return service.insertar(bean);
	}

	private String editar(PartidoPoliticoBean bean) throws Exception {
		PartidoPoliticoService service = new PartidoPoliticoService();
		return service.editar(bean);
	}

}