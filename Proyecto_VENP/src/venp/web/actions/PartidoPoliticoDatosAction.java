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
import venp.beans.PartidoPoliticoBean;
import venp.beans.PerfilBean;
import venp.services.PartidoPoliticoService;
import venp.services.PerfilService;
import venp.web.forms.PartidoPoliticoAsignarForm;
import venp.web.forms.PartidoPoliticoDatosForm;
import venp.web.forms.PerfilDatosForm;

public class PartidoPoliticoDatosAction extends DispatchAction {
	
	public ActionForward cancelar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		return mapping.findForward("listado");
	}
 
	public ActionForward editar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String codigo = request.getParameter("codigo");

		PartidoPoliticoBean bean = findByPrimaryKey(codigo);

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
	
	private PartidoPoliticoBean findByPrimaryKey(String codigo) throws Exception {
		PartidoPoliticoService service = new PartidoPoliticoService();
		PartidoPoliticoBean bean = service.findByPrimaryKey(Integer.parseInt(codigo));

		return bean;
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
			errors.add("mensaje", new ActionMessage("partidoPolitico.nombre.empty"));
			
			saveErrors(request, errors);
			return mapping.findForward("inicio");
		}
		else if (bean.getAbreviatura().equals("")) {
			ActionMessages errors = new ActionMessages();
			errors.add("mensaje", new ActionMessage("partidoPolitico.abreviatura.empty"));
			
			saveErrors(request, errors);
			return mapping.findForward("inicio");
		}
		
		else {
			if (frm.isNuevo()) {
				
				 
				FormFile myFile = frm.getTheFile();
			    String fileName    = myFile.getFileName();
			    
			    String ext= extension(fileName);
			    bean.setLogo(ext);
			    
			    if (bean.getLogo()==null ) {
					ActionMessages errors = new ActionMessages();
					errors.add("mensaje", new ActionMessage("partidoPolitico.foto.null"));
					
					saveErrors(request, errors);
					return mapping.findForward("inicio");
				}
			    
			    else if (bean.getLogo().equals("")) {
					ActionMessages errors = new ActionMessages();
					errors.add("mensaje", new ActionMessage("partidoPolitico.logo.empty"));
					
					saveErrors(request, errors);
					return mapping.findForward("inicio");
				}
			    grabar(bean,myFile,"insertar");
		    	 
			}
		    else {
		    	 
		    	bean.setCodigo(Integer.parseInt(frm.getCodigo()));
		    	int tamano= frm.getTheFile().getFileSize();
		    	
		    	if (tamano==0){
		    		 
	  		         bean.setLogo("");
	  		         editar(bean);
		    	}else{
		    		FormFile myFile = frm.getTheFile();
				    String fileName    = myFile.getFileName();
				    
				    String ext= extension(fileName);
				    bean.setLogo(ext);
				    editar(bean);
				    grabar(bean,myFile,"update");
		    	}
		    	 
		    }

			 return mapping.findForward("listado");
		}
		 
	   
	}
	
	private String extension(String fileName){
		String resultado ="";
		
		for(int i=fileName.length()-1;i>0;i--){
			  String a = String.valueOf(fileName.charAt(i));
			    if(!a.equals(".")){
			    	resultado = a+resultado;
			    }else{
			    	return resultado;
			    }
			
		}
		
		return null;
		
	}
	
private void grabar(PartidoPoliticoBean bean,FormFile myFile,String operacion){
		
		String resultado;
		try {
			if(operacion.equals("insertar")){
				resultado = insertar(bean);
				 
			}else{
				resultado = editar(bean);
			 
			}
			
		if(!resultado.equals("")){
			
		
			 
	    	InputStream is = myFile.getInputStream();
	
	 	    String url = this.getServlet().getServletContext().getRealPath("/files");
	
	 	    System.out.println("\n\n#######\n" + url + "\n#######\n\n");
	
	 	    FileOutputStream os = new FileOutputStream(new File(url+"/"+resultado));	    
	 	    
	 	    int bytesRead = 0;
	 	    byte[] buffer = new byte[8192];
	 	    while ((bytesRead = is.read(buffer, 0, 8192)) != -1) {
	 	          os.write(buffer, 0, bytesRead);
	 	    }
	 	    os.close();
		}
		} catch (Exception e) {
			 
			e.printStackTrace();
		}	
	}

	private String  insertar(PartidoPoliticoBean bean) throws Exception {
		String resultado=null;
		PartidoPoliticoService service = new PartidoPoliticoService();
		resultado =service.insertar(bean);
		return resultado;
	}
	
	private String  editar(PartidoPoliticoBean bean) throws Exception {
		String resultado = null;
		PartidoPoliticoService service = new PartidoPoliticoService();
		resultado =service.editar(bean);
		return resultado;
	}
	 
 
}