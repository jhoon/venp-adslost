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

import venp.beans.CandidatoBean;
import venp.services.CandidatoService;
import venp.web.forms.CandidatoDatosForm;

public class CandidatoDatosAction extends DispatchAction {

	protected ActionForward unspecified(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return mapping.findForward("listado");
	}

	public ActionForward cancelar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return mapping.findForward("listado");
	}

	public ActionForward editar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String strCodigo = request.getParameter("codigo");

		CandidatoBean bean = findByPrimaryKey(strCodigo);

		CandidatoDatosForm frm = (CandidatoDatosForm) form;
		frm.setNuevo(false);
		frm.setCodigo(bean.getCodigo() + "");
		frm.setNombre(bean.getNombre());
		frm.setPaterno(bean.getPaterno());
		frm.setMaterno(bean.getMaterno());
		frm.setDni(bean.getDni());
		frm.setFoto(bean.getFoto());

		return mapping.findForward("inicio");
	}

	public ActionForward nuevo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CandidatoDatosForm frm = (CandidatoDatosForm) form;
		frm.setNuevo(true);
		frm.setCodigo("");
		frm.setNombre("");
		frm.setPaterno("");
		frm.setMaterno("");
		frm.setDni("");
		frm.setFoto("");

		return mapping.findForward("inicio");
	}

	public ActionForward guardar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CandidatoDatosForm frm = (CandidatoDatosForm) form;

		CandidatoBean bean = new CandidatoBean();
		bean.setNombre(frm.getNombre());
		bean.setPaterno(frm.getPaterno());
		bean.setMaterno(frm.getMaterno());
		bean.setDni(frm.getDni());

		if (bean.getNombre().equals("")) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage("candidato.nombre.empty"));
			saveErrors(request, errors);
			return mapping.findForward("inicio");
		} else if (bean.getPaterno().equals("")) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage("candidato.paterno.empty"));
			saveErrors(request, errors);
			return mapping.findForward("inicio");
		} else if (bean.getMaterno().equals("")) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage("candidato.materno.empty"));
			saveErrors(request, errors);
			return mapping.findForward("inicio");
		} else if (bean.getDni().equals("")) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage("candidato.dni.empty"));
			saveErrors(request, errors);
			return mapping.findForward("inicio");
		} else {
			FormFile file = frm.getTheFile();
			String strFileName = file.getFileName();
			if (frm.isNuevo()) {
				bean.setFoto(strFileName);
				if (bean.getFoto() == null) {
					ActionMessages errors = new ActionMessages();
					errors.add("mensaje", new ActionMessage(
							"candidato.foto.null"));
					saveErrors(request, errors);
					return mapping.findForward("inicio");
				} else if (bean.getFoto().equals("")) {
					ActionMessages errors = new ActionMessages();
					errors.add("mensaje", new ActionMessage(
							"candidato.foto.empty"));
					saveErrors(request, errors);
					return mapping.findForward("inicio");
				}
				grabar(bean, file, "insertar");
			} else {
				bean.setCodigo(Integer.parseInt(frm.getCodigo()));
				if (file.getFileSize() == 0) {
					bean.setFoto(frm.getFoto());
					editar(bean);
				} else {
					bean.setFoto(strFileName);
					grabar(bean, file, "update");
				}
			}
			return mapping.findForward("listado");
		}
	}

	private CandidatoBean findByPrimaryKey(String codigo) throws Exception {
		CandidatoService service = new CandidatoService();
		return service.findByPrimaryKey(Integer.parseInt(codigo));
	}

	private String insertar(CandidatoBean bean) throws Exception {
		CandidatoService service = new CandidatoService();
		return service.insertar(bean);
	}

	private String editar(CandidatoBean bean) throws Exception {
		CandidatoService service = new CandidatoService();
		return service.editar(bean);
	}

	private boolean grabar(CandidatoBean bean, FormFile myFile, String operacion) {
		try {
			String strResultado;
			if (operacion.equals("insertar")) {
				strResultado = insertar(bean);
			} else {
				strResultado = editar(bean);
			}

			if (!strResultado.equals("")) {
				InputStream is = myFile.getInputStream();
				String url = this.getServlet().getServletContext().getRealPath(File.separator + "files");

				FileOutputStream fos = new FileOutputStream(new File(url + File.separator + strResultado));

				int bytesRead = 0;
				byte[] buffer = new byte[8192];
				while ((bytesRead = is.read(buffer, 0, 8192)) != -1) {
					fos.write(buffer, 0, bytesRead);
				}
				fos.close();
				return true;
			}
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}